case 'distantaCuloareMedie323'
        %completati codul Matlab
        culoriMediiPiese = zeros(N,c);
        for i = 1:N
            piesaCurenta = params.pieseMozaic(:,:,:,i);% 28*40*3
            if(c==1)
                 piesaCurenta = rgb2gray(piesaCurenta);%28*40
            end
            for k=1:c
                culoriMediiPiese(i,k) = mean(mean(piesaCurenta(:,:,k)));
            end
        end
        
    

    matrice = zeros(params.numarPieseMozaicVerticala,params.numarPieseMozaicOrizontala);


        for i = 1:params.numarPieseMozaicVerticala
            for j = 1:params.numarPieseMozaicOrizontala

            if(i==1 && j==1)

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
                matrice(i,j) = indiceMin;
                disp(matrice1,1);
            

            distanteCuloriSort = sort(distanteCulori);
            elseif(i==1)
                patchCurent = params.imgReferintaRedimensionata(1:H,(j-1)*W+1:j*W,:);
                culoareMediePatchCurent = zeros(1,c);
                for k = 1:c
                culoareMediePatchCurent(k) = mean(mean(patchCurent(:,:,k)));
                end
                distanteCulori = zeros(N,1);
                
                for k =1:N 
                    distanteCulori(k) = sqrt(sum((culoareMediePatchCurent - culoriMediiPiese(k,:)).^2));
                end
                
        
                indiceMin = find(min(distanteCuloriSort) ~= matrice(i,j-1) ,1);
                
                piesaAleasa = params.pieseMozaic(:,:,:,indiceMin);
                if(c==1)
                    piesaAleasa = rgb2gray(piesaAleasa);
                end
                
                imgMozaic(1:H,(j-1)*W+1:j*W,:) = piesaAleasa;
                matrice(i,j) = indiceMin;
                
                
            

            elseif(j==1)
                patchCurent = params.imgReferintaRedimensionata((i-1)*H+1:i*H,1:W,:);
                culoareMediePatchCurent = zeros(1,c);
                for k = 1:c
                culoareMediePatchCurent(k) = mean(mean(patchCurent(:,:,k)));
                end
                distanteCulori = zeros(N,1);
                
                for k =1:N 
                    distanteCulori(k) = sqrt(sum((culoareMediePatchCurent - culoriMediiPiese(k,:)).^2));
                end
                indiceMin = find(min(distanteCuloriSort) ~= matrice(i-1,j) ,1);
                
                piesaAleasa = params.pieseMozaic(:,:,:,indiceMin);
                if(c==1)
                    piesaAleasa = rgb2gray(piesaAleasa);
                end
                
                imgMozaic((i-1)*H+1:i*H,1:W,:) = piesaAleasa;
                matrice(i,j) = indiceMin;
                
                
            

            else
                patchCurent = params.imgReferintaRedimensionata((i-1)*H+1:i*H,1:W,:);
                culoareMediePatchCurent = zeros(1,c);
                for k = 1:c
                culoareMediePatchCurent(k) = mean(mean(patchCurent(:,:,k)));
                end
                distanteCulori = zeros(N,1);
                
                for k =1:N 
                    distanteCulori(k) = sqrt(sum((culoareMediePatchCurent - culoriMediiPiese(k,:)).^2));
                end
        indiceMin = find(min(distanteCuloriSort) ~= matrice(i-1,j) & min(distanteCuloriSort) ~= matrice(i,j-1),1);
                
                piesaAleasa = params.pieseMozaic(:,:,:,indiceMin);
                if(c==1)
                    piesaAleasa = rgb2gray(piesaAleasa);
                end
                
                imgMozaic((i-1)*H+1:i*H,(j-1)*W+1:j*W,:) = piesaAleasa;
                matrice(i,j) = indiceMin;
end

            end
        end