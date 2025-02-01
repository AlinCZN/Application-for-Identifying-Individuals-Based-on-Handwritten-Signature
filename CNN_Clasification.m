clc
close all
clearvars

cale_baza_date='path to database';
imagini=imageDatastore(cale_baza_date,'IncludeSubfolders',true,'LabelSource','foldernames');
[img_antr,img_test,img_val]=splitEachLabel(imagini,0.7,0.15,'randomized');
augmentare = imageDataAugmenter('RandXTranslation', [-2, 2],'RandYTranslation', [-2, 2],'RandRotation', [-15, 15]);        
resizeimg_antr = augmentedImageDatastore([30, 30, 1], img_antr,'DataAugmentation', augmentare);
resizeimg_test = augmentedImageDatastore([30, 30, 1], img_test);
resizeimg_val = augmentedImageDatastore([30, 30, 1], img_val);
%CNN

straturi=[
          imageInputLayer([30,30,1],"Name",'Input');

          convolution2dLayer(3,16,'Padding','same','Name','Conv_1');
          batchNormalizationLayer('Name','BN_1');
          reluLayer('Name','Relu_1');
          maxPooling2dLayer(2,'Stride',2,'Name','MaxPool_1');
    
          convolution2dLayer(3,32,'Padding','same','Name','Conv_2');
          batchNormalizationLayer('Name','BN_2');
          reluLayer('Name','Relu_2');
          maxPooling2dLayer(2,'Stride',2,'Name','MaxPool_2');

          convolution2dLayer(3,64,'Padding','same','Name','Conv_3');
          batchNormalizationLayer('Name','BN_3');
          reluLayer('Name','Relu_3');
         
          convolution2dLayer(3,64,'Padding','same','Name','Conv_3.2');
          batchNormalizationLayer('Name','BN_3.2');
          reluLayer('Name','Relu_3.2');
          maxPooling2dLayer(2,'Stride',2,'Name','MaxPool_3');


          convolution2dLayer(3,128,'Padding','same','Name','Conv_4');
          batchNormalizationLayer('Name','BN_4');
          reluLayer('Name','Relu_4');
        

          convolution2dLayer(3,128,'Padding','same','Name','Conv_4.2');
          batchNormalizationLayer('Name','BN_4.2');
          reluLayer('Name','Relu_4.2');
          maxPooling2dLayer(2,'Stride',2,'Name','MaxPool_4');


          fullyConnectedLayer(34,'Name','FC1');
          reluLayer("Name",'Relu_7');
          dropoutLayer(0.4,'Name','DropoutLayer1');

          fullyConnectedLayer(34,'Name','FC3');
          softmaxLayer("Name",'SoftLayer')
          classificationLayer('Name','Output Classification');
      
];
lgraph=layerGraph(straturi);

optiuni=trainingOptions('sgdm','InitialLearnRate',0.01,'MaxEpochs',90,'Shuffle','every-epoch','LearnRateDropFactor',0.1,'L2Regularization',0.0001,'LearnRateDropPeriod',5,'validationData',resizeimg_val,'ValidationFrequency',30,'Verbose',false,'Plots','training-progress');
net_litere=trainNetwork(resizeimg_antr,straturi,optiuni);
etichete_prezise=classify(net_litere,resizeimg_test);
etichete_adevarate=img_test.Labels;
acuratete=sum(pred==validare)/numel(validare);
save("CNN_litere","net_litere")
%%
subfoldere=dir(cale_baza_date)
nr_clase=numel(subfoldere);
etichete_existente=[];
for i=3:nr_clase
    eticheta=subfoldere(i).name;
    etichete_existente=[etichete_existente,{eticheta}];
end
confusionMat = confusionmat(etichete_prezise,etichete_adevarate,'order',etichete_existente);
disp(confusionMat);

figure;
confusionchart(etichete_prezise,etichete_adevarate)

nr_clase=numel(etichete_existente);
precizie=zeros(nr_clase,1);
sensibilitate=zeros(nr_clase,1);
scor_f1=zeros(nr_clase,1);
for i=1:nr_clase
    TP=confusionMat(i,i);
    FP=sum(confusionMat(:,i))-TP;
    FN=sum(confusionMat(i,:))-TP;
    precizie(i)=TP/(TP+FP);
    sensibilitate(i)=TP/(TP+FN);
    scor_f1(i)=2*(precizie(i)*sensibilitate(i))/(precizie(i)+sensibilitate(i));
end
precizie_medie=mean(precizie);
sensibilitate_medie=mean(sensibilitate);
scor_f1_mediu=2*(precizie_medie*sensibilitate_medie)/(precizie_medie+sensibilitate_medie);
%save('HOG_SVM.mat','svmClassifier')

tabel = table( etichete_existente',precizie, sensibilitate, scor_f1, ...
              'VariableNames', {'Clase','precizie', 'sensibilitate', 'Scor f1'});

% Afișarea tabelului
disp(tabel);