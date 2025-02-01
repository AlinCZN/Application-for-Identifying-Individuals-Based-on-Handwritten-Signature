
clc
close all
clearvars

imagine=imread("path to image");
randuri=Segmentare_randuri(imagine,0.7,2);

%% %% Row segmentation
clc
close all
clearvars
folder="Path to database with handwritten";
folder_destinatie='path to destination folder with row segmentation';
imagini=dir(fullfile(folder));
cuvinte={};
for j=3:length(imagini)
    cale_imagine=fullfile(folder,imagini(j).name);
    imagine=imread(cale_imagine);
    cuv=Segmentare_randuri(imagine,0.7,2);
    cuvinte=[cuvinte,cuv];
end
for i=1:length(cuvinte)
    cuvant=cuvinte{i};
    nume_fisier = sprintf('imagine_%s_%d.jpg', datestr(now, 'HHMMSS'), i);
    cale_fisier = fullfile(folder_destinatie, nume_fisier);
    imwrite(cuvant,cale_fisier,'bmp')
end

%% save wtih a specific name
folder="'path to destination folder with row segmentation'";

for i=1:length(randuri)
    
    imagine=randuri{i};
 
    nume_fisier = sprintf('imagine_%s_%d.jpg', datestr(now, 'HHMMSS'), i);
    cale_fisier = fullfile(folder, nume_fisier);
    imwrite(imagine, cale_fisier);
end

%% Word segmentation
clc
close all
clearvars
folder="'path to folder with row segmentation'";
folder_destinatie="path to destination folder with word segmentation";
imagini=dir(fullfile(folder));
cuvinte={};
for j=3:length(imagini)
    cale_imagine=fullfile(folder,imagini(j).name);
    imagine=imread(cale_imagine);
    cuv=Segmentare_cuvinte(imagine,2);
    cuvinte=[cuvinte,cuv];
end
for i=1:length(cuvinte)
    cuvant=cuvinte{i};
    nume_fisier = sprintf('imagine_%s_%d.jpg', datestr(now, 'HHMMSS'), i);
    cale_fisier = fullfile(folder_destinatie, nume_fisier);
    imwrite(cuvant,cale_fisier,'bmp')
end

%% Segmentation on letter level
clc
close all
clearvars
folder="path to folder with word segmentation";
folder_destinatie="path to destination folder with letter segmentation";
imagini=dir(fullfile(folder));
litere1={};
for j=153:length(imagini)
    cale_imagine=fullfile(folder,imagini(j).name);
    imagine=imread(cale_imagine);
    
    lit=Segmentare_litere(imagine,0.7,1);
    litere1=[litere1,lit];
end
for i=1:length(litere1)
    litera=litere1{i};
    nume_fisier = sprintf('imagine_%s_%d.jpg', datestr(now, 'HHMMSS'), i);
    cale_fisier = fullfile(folder_destinatie, nume_fisier);
    imwrite(litera,cale_fisier,'bmp');
end
litere2={};
for j=3:length(imagini)
    cale_imagine=fullfile(folder,imagini(j).name);
    
    imagine=imread(cale_imagine);
    lit=Segmentare_litere(imagine,0.7,1.1);
    litere2=[litere2,lit];
end
for i=1:length(litere2)
    litera=litere2{i};
    nume_fisier = sprintf('imagine_%s_%d.jpg', datestr(now, 'HHMMSS'), i);
    cale_fisier = fullfile(folder_destinatie, nume_fisier);
    imwrite(litera,cale_fisier,'bmp');
end
litere3={};
for j=3:length(imagini)
    cale_imagine=fullfile(folder,imagini(j).name);

    imagine=imread(cale_imagine);
    lit=Segmentare_litere(imagine,0.7,1.2);
    litere3=[litere3,lit];
end
for i=1:length(litere3)
    litera=litere3{i};
    nume_fisier = sprintf('imagine_%s_%d.jpg', datestr(now, 'HHMMSS'), i);
    cale_fisier = fullfile(folder_destinatie, nume_fisier);
    imwrite(litera,cale_fisier,'bmp');
end

litere4={};
for j=3:length(imagini)
    cale_imagine=fullfile(folder,imagini(j).name);
    
    imagine=imread(cale_imagine);
    lit=Segmentare_litere(imagine,0.7,1.3);
    litere4=[litere4,lit];
end
for i=1:length(litere4)
    litera=litere4{i};
    nume_fisier = sprintf('imagine_%s_%d.jpg', datestr(now, 'HHMMSS'), i);
    cale_fisier = fullfile(folder_destinatie, nume_fisier);
    imwrite(litera,cale_fisier,'bmp');
end

litere5={};
for j=3:length(imagini)
    cale_imagine=fullfile(folder,imagini(j).name);
    
    imagine=imread(cale_imagine);
    lit=Segmentare_litere(imagine,0.7,1.4);
    litere5=[litere5,lit];
end
for i=1:length(litere5)
    litera=litere5{i};
    nume_fisier = sprintf('imagine_%s_%d.jpg', datestr(now, 'HHMMSS'), i);
    cale_fisier = fullfile(folder_destinatie, nume_fisier);
    imwrite(litera,cale_fisier,'bmp');
end

litere6={};
for j=1016:length(imagini)
    cale_imagine=fullfile(folder,imagini(j).name);
    
    imagine=imread(cale_imagine);
    lit=Segmentare_litere(imagine,0.7,1.5);
    litere6=[litere6,lit];
end
for i=1:length(litere6)
    litera=litere6{i};
    nume_fisier = sprintf('imagine_%s_%d.jpg', datestr(now, 'HHMMSS'), i);
    cale_fisier = fullfile(folder_destinatie, nume_fisier);
    imwrite(litera,cale_fisier,'bmp');
end
litere7={};
for j=3:length(imagini)
    cale_imagine=fullfile(folder,imagini(j).name);
    
    imagine=imread(cale_imagine);
    lit=Segmentare_litere(imagine,0.7,1.6);
    litere7=[litere7,lit];
end
for i=1:length(litere7)
    litera=litere7{i};
    nume_fisier = sprintf('imagine_%s_%d.jpg', datestr(now, 'HHMMSS'), i);
    cale_fisier = fullfile(folder_destinatie, nume_fisier);
    imwrite(litera,cale_fisier,'bmp');
end
litere8={};
for j=3:length(imagini)
    cale_imagine=fullfile(folder,imagini(j).name);
    
    imagine=imread(cale_imagine);
    lit=Segmentare_litere(imagine,0.7,1.7);
    litere8=[litere8,lit];
end
for i=1:length(litere8)
    litera=litere8{i};
    nume_fisier = sprintf('imagine_%s_%d.jpg', datestr(now, 'HHMMSS'), i);
    cale_fisier = fullfile(folder_destinatie, nume_fisier);
    imwrite(litera,cale_fisier,'bmp');
end
litere9={};
for j=3:length(imagini)
    cale_imagine=fullfile(folder,imagini(j).name);
    
    imagine=imread(cale_imagine);
    lit=Segmentare_litere(imagine,0.7,1.8);
    litere9=[litere9,lit];
end
for i=1:length(litere9)
    litera=litere9{i};
    nume_fisier = sprintf('imagine_%s_%d.jpg', datestr(now, 'HHMMSS'), i);
    cale_fisier = fullfile(folder_destinatie, nume_fisier);
    imwrite(litera,cale_fisier,'bmp');
end
litere10={};
for j=3:length(imagini)
    cale_imagine=fullfile(folder,imagini(j).name);
    
    imagine=imread(cale_imagine);
    lit=Segmentare_litere(imagine,0.7,1.9);
    litere10=[litere10,lit];
end
for i=1:length(litere10)
    litera=litere10{i};
    nume_fisier = sprintf('imagine_%s_%d.jpg', datestr(now, 'HHMMSS'), i);
    cale_fisier = fullfile(folder_destinatie, nume_fisier);
    imwrite(litera,cale_fisier,'bmp');
end
litere11={};
for j=3:length(imagini)
    cale_imagine=fullfile(folder,imagini(j).name);
    
    imagine=imread(cale_imagine);
    lit=Segmentare_litere(imagine,0.7,2);
    litere11=[litere11,lit];
end
for i=1:length(litere11)
    litera=litere11{i};
    nume_fisier = sprintf('imagine_%s_%d.jpg', datestr(now, 'HHMMSS'), i);
    cale_fisier = fullfile(folder_destinatie, nume_fisier);
    imwrite(litera,cale_fisier,'bmp');
end
litere12={};
for j=3:length(imagini)
    cale_imagine=fullfile(folder,imagini(j).name);
    
    imagine=imread(cale_imagine);
    lit=Segmentare_litere_2(imagine,4);
    litere12=[litere12,lit];
end
for i=1:length(litere12)
    litera=litere12{i};
    nume_fisier = sprintf('imagine_%s_%d.jpg', datestr(now, 'HHMMSS'), i);
    cale_fisier = fullfile(folder_destinatie, nume_fisier);
    imwrite(litera,cale_fisier,'bmp');
end
litere13={};
for j=3:length(imagini)
    cale_imagine=fullfile(folder,imagini(j).name);
    
    imagine=imread(cale_imagine);
    lit=Segmentare_litere_2(imagine,6);
    litere13=[litere13,lit];
end
for i=1:length(litere13)
    litera=litere13{i};
    nume_fisier = sprintf('imagine_%s_%d.jpg', datestr(now, 'HHMMSS'), i);
    cale_fisier = fullfile(folder_destinatie, nume_fisier);
    imwrite(litera,cale_fisier,'bmp');
end

%% Stergere imagini reziduale

folder="path to folder with letter segmentation";
imagini=dir(fullfile(folder));

for i=3:length(imagini)
    cale_imagine=fullfile(folder,imagini(i).name);
    imagine=imread(cale_imagine);
    [M,N]=size(imagine);
    if (M<=15)
        delete(cale_imagine);
    end
   
end
%% Keep only unique images
folder = "path to folder with letter segmentation";
folder_destinatie="path to destination folder with unique images with letters";
imagini = dir(fullfile(folder));
imagini_unice = containers.Map();

for i = 3:length(imagini) 
    cale_imagine = fullfile(folder, imagini(i).name);
    img = imread(cale_imagine);
    %img = rgb2gray(img);
    ok = true;
    chei = imagini_unice.keys();
    for j = 1:length(chei)
        cheie = chei{j};
        imagine_unica = imagini_unice(cheie);
        
        if isequal(img,imagine_unica)
            ok = false;
            break;
        end
    end

    if ok
        imagini_unice(cale_imagine) = img;
        imwrite(img, fullfile(folder_destinatie,imagini(i).name),'bmp');
    end
end


 
%% Letters clasification
folder = "path to folder with unique images with letters";
folder_destinatie='path to destination folder with classified letters';
imagini=dir(fullfile(folder));
probabilitate_minima=0.1;
for i=3:length(imagini)
    cale_imagine=fullfile(folder,imagini(i).name);
    
    imagine=imread(cale_imagine);
    [M,N]=size(imagine);
    % imagine=im2gray(imagine);
    % imagine=imbinarize(imagine);
    imagine=incadrare_caracter(imagine);
    imagine=imresize(imagine,[30,30]);
    rezultat_clasificare=classify(net_litere,imagine);

    probabilitate_clasificare=max(predict(net_litere,imagine));
     if probabilitate_clasificare >= probabilitate_minima
        folder_eticheta = fullfile(folder_destinatie,char(rezultat_clasificare));
        if ~exist(folder_eticheta, 'dir')
            mkdir(folder_eticheta);
        end
        
        nume_fisier = sprintf('imagine_%s_%d.jpg', datestr(now, 'HHMMSS'), i);
        cale_fisier = fullfile(folder_eticheta, nume_fisier);
        imagine=imresize(imagine,[M,N]);
        imwrite(imagine,cale_fisier);
     end

end

