clc
close all
clearvars
cale_folder='path to database';

hogFeatures_test=[];
hogFeatures_antr=[];
etichete=[];

subfoldere=dir(cale_folder)

for i=3:numel(subfoldere)
    subfolder=subfoldere(i).name
    cale_subfolder=fullfile(cale_folder,subfolder);
    imagini=dir(fullfile(cale_subfolder,'*.jpg'));
    nr_imag=length(imagini);
   
   
    imag_antrenament=round(0.8*nr_imag);
    for j=1:imag_antrenament
        
        cale_imagine=fullfile(cale_subfolder,imagini(j).name);

        imagine=imread(cale_imagine);
        imagine=imresize(imagine,[32,64]);
       
        hogF=Functie_HOG(imagine,16);
        hogFeatures_antr=[hogFeatures_antr;hogF];
        etichete=[etichete,{subfolder}];
    end
   
end

% tableData=table(hogFeatures,etichete');
svmClassifier = fitcecoc(hogFeatures_antr, etichete);

etichete_prezise=[];
etichete_adevarate=[];
for i=3:numel(subfoldere)
    subfolder=subfoldere(i).name
    cale_subfolder=fullfile(cale_folder,subfolder);
        imagini=dir(fullfile(cale_subfolder,'*.jpg'));
    nr_imag=length(imagini);
    imag_antrenament=round(0.8*nr_imag);
    for j=imag_antrenament+1:nr_imag
        cale_imagine=fullfile(cale_subfolder,imagini(j).name);
        imagine=imread(cale_imagine);
        
        imagine=imresize(imagine,[32,64]);
       
        hogF=Functie_HOG(imagine,16);
        et_prezisa=predict(svmClassifier,hogF );
        etichete_prezise=[etichete_prezise,et_prezisa];
        etichete_adevarate=[etichete_adevarate,{subfolder}];
    end
end

nr=0;
for i=1:length(etichete_adevarate)
    if(isequal(etichete_prezise{i},etichete_adevarate{i}))
        nr=nr+1;
    end
end
accuracy = nr / length(etichete_adevarate);

nr_clase=numel(subfoldere);
etichete_existente=[];
for i=3:nr_clase
    eticheta=subfoldere(i).name;
    etichete_existente=[etichete_existente,{eticheta}];
end
%%
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
