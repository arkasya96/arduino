function imgMozaic = adaugaPieseMozaicModAleator(params)

imgMozaic = uint8(zeros(size(params.imgReferintaRedimensionata)));
[H,W,C,N] = size(params.pieseMozaic);
[h,w,c] = size(params.imgReferintaRedimensionata);



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
        
       
        matricePixeli = zeros(h-1,w-1);        

     %   pixelNeocupat=0;
      %  for i=1:h
       %     for j=1:w
        %        if(matricePixeli(i,j) == 0)
         %           pixelNeocupat
                    
        %k = find(matricePixeli)==0,1);        
       while (prod(matricePixeli) == 0)
           
        
        pixelx = randi([1,w]);
        pixely = randi([1,h]);
        dimPiesax = pixelx + W-1;
        dimPiesay = pixely + H-1;

          
           
           
           if(pixelx+W>w)
               pixelx=w-W;
           end
           
           if(pixely+H>h)
               pixely=h-H;
           end
           
               
           dimensiune1 = dimPiesax - pixelx;
           dimensiune2 = dimPiesay - pixely;
                patchCurent = params.imgReferintaRedimensionata(pixely:pixely+H-1,pixelx:pixelx+W-1,:);
                
                culoareMediePatchCurent = zeros(1,c);
                for k = 1:c
                culoareMediePatchCurent(k) = mean(mean(patchCurent(:,:,k)));
                end
                distanteCulori = zeros(N,1);
                
                for k =1:N 
                    distanteCulori(k) = sqrt(sum((culoareMediePatchCurent - culoriMediiPiese(k,:)).^2));
                end
                
                indiceMin = find(distanteCulori == min(distanteCulori),1);
                %distanteCuloriSort = sort(distanteCulori);
                piesaAleasa = params.pieseMozaic(:,:,:,indiceMin);
                if(c==1)
                    piesaAleasa = rgb2gray(piesaAleasa);
                end
                disp(size(piesaAleasa));
                disp(size(imgMozaic));
                
                disp(size(patchCurent));
                matricePixeli(pixely:pixely+H-1,pixelx:pixelx+W-1) = 1;
                imgMozaic(pixely:pixely+H-1,pixelx:pixelx+W-1,:) = piesaAleasa;
                
           
       end
end