function Set_total_caracteristici = Zoning_feature_extraction(im)

[m,n ]=size(im);
caracteristici1=[];
 hist_oriz=0;
 hist_vert=0;
for i=1:3
    for j=1:3
        imagine=im((i-1)*floor(m/3)+1:i*floor(m/3),(j-1)*floor(n/3)+1:j*floor(n/3));
        
        [m1,n1]=size(imagine); 
        nr_pixeli_oriz=0;
        nr_pixeli_vert=0;
        nr_pixeli_diag_dr=0;
        nr_pixeli_diag_stg=0;
        
        for h=2:m1-1
            for k=1:n1-1
                if(imagine(h,k)==1&&imagine(h,k+1)==1)
                    nr_pixeli_oriz=nr_pixeli_oriz+1;
                end
                if(imagine(h,k)==1&&imagine(h+1,k)==1)
                    nr_pixeli_vert=nr_pixeli_vert+1;
                end
                if(imagine(h,k)==1&&imagine(h+1,k+1)==1)
                    nr_pixeli_diag_stg=nr_pixeli_diag_stg+1;
                end
                if(imagine(h,k)==1&&imagine(h-1,k+1)==1)
                    nr_pixeli_diag_dr=nr_pixeli_diag_dr+1;
                end


            end
        end
 nr_total_pixeli=m1*n1;
        valoare_medie=sum(sum(imagine==1))/nr_total_pixeli;
        D=floor(sqrt(m1^2+n1^2));
        
        caracteristici1=[caracteristici1,nr_pixeli_oriz/n1,nr_pixeli_vert/m1,nr_pixeli_diag_dr/D,nr_pixeli_diag_stg/D,valoare_medie];
    end
end

caracteristici2=[];
for i=1:3
        imagine=im((i-1)*floor(m/3)+1:i*floor(m/3),:);
        [m1,n1]=size(imagine);
        nr_pixeli_oriz=0;
        nr_pixeli_vert=0;
        nr_pixeli_diag_dr=0;
        nr_pixeli_diag_stg=0;

        for h=2:m1-1
            for k=1:n1-1
                if(imagine(h,k)==1&&imagine(h,k+1)==1)
                    nr_pixeli_oriz=nr_pixeli_oriz+1;
                end
                if(imagine(h,k)==1&&imagine(h+1,k)==1)
                    nr_pixeli_vert=nr_pixeli_vert+1;
                end
                if(imagine(h,k)==1&&imagine(h+1,k+1)==1)
                    nr_pixeli_diag_stg=nr_pixeli_diag_stg+1;
                end
                if(imagine(h,k)==1&&imagine(h-1,k+1)==1)
                    nr_pixeli_diag_dr=nr_pixeli_diag_dr+1;
                end
            end
        end
       nr_total_pixeli=m1*n1;
        valoare_medie=sum(sum(imagine==1))/nr_total_pixeli;
        D=floor(sqrt(m1^2+n1^2));
        
        caracteristici2=[caracteristici2,nr_pixeli_oriz/n1,nr_pixeli_vert/m1,nr_pixeli_diag_dr/D,nr_pixeli_diag_stg/D,valoare_medie];
end
caracteristici3=[];
for i=1:3
        imagine=im(:,(i-1)*floor(m/3)+1:i*floor(m/3));
        [m1,n1]=size(imagine);
        nr_pixeli_oriz=0;
        nr_pixeli_vert=0;
        nr_pixeli_diag_dr=0;
        nr_pixeli_diag_stg=0;

        for h=2:m1-1
            for k=1:n1-1
                if(imagine(h,k)==1&&imagine(h,k+1)==1)
                    nr_pixeli_oriz=nr_pixeli_oriz+1;
                end
                if(imagine(h,k)==1&&imagine(h+1,k)==1)
                    nr_pixeli_vert=nr_pixeli_vert+1;
                end
                if(imagine(h,k)==1&&imagine(h+1,k+1)==1)
                    nr_pixeli_diag_stg=nr_pixeli_diag_stg+1;
                end
                if(imagine(h,k)==1&&imagine(h-1,k+1)==1)
                    nr_pixeli_diag_dr=nr_pixeli_diag_dr+1;
                end
            end
        end
        nr_total_pixeli=m1*n1;
        valoare_medie=sum(sum(imagine==1))/nr_total_pixeli;
        D=floor(sqrt(m1^2+n1^2));
        
        caracteristici3=[caracteristici3,nr_pixeli_oriz/n1,nr_pixeli_vert/m1,nr_pixeli_diag_dr/D,nr_pixeli_diag_stg/D,valoare_medie];
end



Set_total_caracteristici=[caracteristici1,caracteristici2,caracteristici3];

end