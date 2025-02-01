clc
close all
clearvars
cale_folder='path to database';


ZoningFeatures=[];
etichete=[];

subfoldere=dir(cale_folder)

for i=3:numel(subfoldere)
    subfolder=subfoldere(i).name
    cale_subfolder=fullfile(cale_folder,subfolder);
    imagini=dir(fullfile(cale_subfolder,'*.png'));
    nr_imag=length(imagini);
    imag_antrenament=round(0.8*nr_imag);
    for j=1:imag_antrenament
        cale_imagine=fullfile(cale_subfolder,imagini(j).name);
        imagine=imread(cale_imagine);
        
        imagine=incadrare_caracter(imagine);
        imagine=imresize(imagine,[60,60]);
      
        ZF=Zoning_feature_extraction(imagine);
        
        ZoningFeatures=[ZoningFeatures;ZF];
        etichete=[etichete,{subfolder}];
    end
   
end

svmClassifier_ZONING = fitcecoc(ZoningFeatures, etichete, 'Learners', 'svm', 'Coding', 'onevsone');


etichete_prezise=[];
etichete_adevarate=[];
for i=3:length(subfoldere)
    subfolder=subfoldere(i).name
    cale_subfolder=fullfile(cale_folder,subfolder);
    imagini=dir(fullfile(cale_subfolder,'*.png'));
    nr_imag=length(imagini);
    imag_antrenament=round(0.8*nr_imag);
    for j=imag_antrenament+1:nr_imag
        cale_imagine=fullfile(cale_subfolder,imagini(j).name);
        imagine=imread(cale_imagine);
        
        imagine=incadrare_caracter(imagine);
        imagine=imresize(imagine,[60,60]);
        ZF=Zoning_feature_extraction(imagine);
        et_prezisa=predict(svmClassifier_ZONING,ZF );
        etichete_prezise=[etichete_prezise,et_prezisa];
        etichete_adevarate=[etichete_adevarate,{subfolder}];
    end
end

%%
nr=0;
for i=1:length(etichete_adevarate)
    if(isequal(etichete_prezise{i},etichete_adevarate{i}))
        nr=nr+1;
    end
end
accuracy = nr / length(etichete_adevarate);
disp(['Acuratețea clasificării: ', num2str(accuracy)]);

% Construirea matricei de confuzie
confusionMat = confusionmat(etichete_prezise,etichete_adevarate);
disp('Matricea de confuzie:');
disp(confusionMat);

% Vizualizarea matricei de confuzie
figure;
confusionchart(confusionMat)

save('svmClassifierZONING_83%.mat','svmClassifier_ZONING')


