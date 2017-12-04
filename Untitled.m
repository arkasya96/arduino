case 'distantaCuloareMedie'
        %completati codul Matlab
        culoriMediiPiese = zeros(N,c);
        imagini = zeros(N,1);
        for i = 1:N

            piesaCurenta = params.pieseMozaic(:,:,:,i);% 28*40*3
            imagini = [imagini,piesaCurenta];
            if(c==1)
                 piesaCurenta = rgb2gray(piesaCurenta);%28*40
            end
            for k=1:c
                culoriMediiPiese(i,k) = mean(mean(piesaCurenta(:,:,k)));
            end
        end
        
     
    i=1;
    j=1;
     patchCurent = params.imgReferintaRedimensionata(1:H,1:W,:);
                culoareMediePatchCurent = zeros(1,c);
                for k = 1:c
                culoareMediePatchCurent(k) = mean(mean(patchCurent(:,:,k)));
                end
                distanteCulori = zeros(N,1);
                
                for k =1:N 
                    distanteCulori(k) = sqrt(sum((culoareMediePatchCurent - culoriMediiPiese(k,:)).^2));
                end
                
                indiceMin = find(distanteCulori == min(distanteCulori),1);
                
                piesaAleasa = params.pieseMozaic(:,:,:,indiceMin);
                if(c==1)
                    piesaAleasa = rgb2gray(piesaAleasa);
                end
                
                imgMozaic(1:H,1:W,:) = piesaAleasa;
                indice = find(imagini,piesaAleasa);
                matrice(i,j) = indice;
            end
clear i j
i=1;
for j=2:params.numarPieseMozaicOrizontala
    
    patchCurent = params.imgReferintaRedimensionata(1:H,(j-1)*W+1:j*W,:);
    culoareMediePatchCurent = zeros(1,c);
                for k = 1:c
                culoareMediePatchCurent(k) = mean(mean(patchCurent(:,:,k)));
                end
                distanteCulori = zeros(N,1);
                
                for k =1:N 
                    distanteCulori(k) = sqrt(sum((culoareMediePatchCurent - culoriMediiPiese(k,:)).^2));
                end
                distanteCuloriSort = sort(distanteCulori);            
                indiceMin = find(distanteCulori == min(distanteCulori),2);
                %ind = find(min(distanteCuloriSort) ~=matrice(i,j-1),1);
                if(indiceMin(1) ==matrice(i,j-1))
                    piesaAleasa = params.pieseMozaic(:,:,:,indiceMin(2));
                    matrice(i,j) = indiceMin(2);
                else
                    piesaAleasa = params.pieseMozaic(:,:,:,indiceMin(1));
                    matrice(i,j) = indiceMin(1);
                end    

                
                if(c==1)
                    piesaAleasa = rgb2gray(piesaAleasa);
                end
                piesaAleasa = params.pieseMozaic(:,:,:,matrice(i,j));
                imgMozaic(1:H,(j-1)*W+1:j*W,:) = piesaAleasa;
                
end
clear i j indiceMin
j=1;
for i=2:params.numarPieseMozaicOrizontala
    
    patchCurent = params.imgReferintaRedimensionata((i-1)*H+1:i*H,1:W,:);
    culoareMediePatchCurent = zeros(1,c);
                for k = 1:c
                culoareMediePatchCurent(k) = mean(mean(patchCurent(:,:,k)));
                end
                distanteCulori = zeros(N,1);
                
                for k =1:N 
                    distanteCulori(k) = sqrt(sum((culoareMediePatchCurent - culoriMediiPiese(k,:)).^2));
                end
                distanteCuloriSort = sort(distanteCulori);            
                indiceMin = find(distanteCulori == min(distanteCulori),2);
                %ind = find(min(distanteCuloriSort) ~=matrice(i-1,j),1);
                if(indiceMin(1) == matrice(i-1,j))
                    piesaAleasa = params.pieseMozaic(:,:,:,indiceMin(2));
                    matrice(i,j) = indiceMin(2);
                else
                    piesaAleasa = params.pieseMozaic(:,:,:,indiceMin(1));
                    matrice(i,j) = indiceMin(1);
                end    

                
                if(c==1)
                    piesaAleasa = rgb2gray(piesaAleasa);
                end
                piesaAleasa = params.pieseMozaic(:,:,:,matrice(i,j));
                imgMozaic((i-1)*H+1:i*H,1:W,:) = piesaAleasa;
end

clear i j indiceMin

        for i = 2:params.numarPieseMozaicVerticala
            for j = 2:params.numarPieseMozaicOrizontala
                patchCurent = params.imgReferintaRedimensionata((i-1)*H+1:i*H,(j-1)*W+1:j*W,:);
                culoareMediePatchCurent = zeros(1,c);
                for k = 1:c
                culoareMediePatchCurent(k) = mean(mean(patchCurent(:,:,k)));
                end
                distanteCulori = zeros(N,1);
                
                for k =1:N 
                    distanteCulori(k) = sqrt(sum((culoareMediePatchCurent - culoriMediiPiese(k,:)).^2));
                end
                
                indiceMin = find(distanteCulori == min(distanteCulori),3);
                
                if(indiceMin(1) == matrice(i-1,j))
                    if(indiceMin(1) == matrice(i,j-1))        
                        matrice(i,j) = indiceMin(2);
                    end
                    if(indiceMin(2) == matrice(i,j-1))
                        matrice(i,j) == indiceMin(3);
                    end
                    if(indiceMin(3) == matrice(i,j-1))
                        matrice(i,j) = indiceMin(2);
                    end 
                else
                    matrice(i,j) = indiceMin(1);

                    %elseif(indiceMin(2) == matrice(i-1,j))
                    %if(indiceMin(1) == matrice(i,j-1))        
                    %    matrice(i,j) = indiceMin(3);
                    %end
                    %if(indiceMin(3) == matrice(i,j-1))
                    %    matrice(i,j) == indiceMin(1);
                    %end
                    %if(indiceMin(1) == matrice(i,j-1))
                    %    matrice(i,j) = indiceMin(3);
                    %end    


                end
                piesaAleasa = params.pieseMozaic(:,:,:,matrice(i,j));
                if(c==1)
                    piesaAleasa = rgb2gray(piesaAleasa);
                end
                
                imgMozaic((i-1)*H+1:i*H,(j-1)*W+1:j*W,:) = piesaAleasa;
            end
        end
        