case 'distantaCuloareMedie'
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
        
     

pieseVert = uint8(params.numarPieseMozaicVerticala);
pieseOriz = uint8(params.numarPieseMozaicOrizontala);

matrice = zeros(pieseVert,pieseOriz);
imageVector = zeros(N,1);

for idx = 1:N
    piesaCurenta = imread([params.numeDirector '/' imaginiPiese(idx).name]);
    pieseMozaic(:,:,:,idx) = piesaCurenta;
    imageVector = [imageVector,piesaCurenta];
end

for i = 1:N 
    

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
    matrice(i,j) = find(imageVector,piesaAleasa); 


        for i = 1:params.numarPieseMozaicVerticala
            for j = 1:params.numarPieseMozaicOrizontala
                patchCurent = params.imgReferintaRedimensionata(,:);
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
                
                imgMozaic((i-1)*H+1:i*H,(j-1)*W+1:j*W,:) = piesaAleasa;
            end
        end