function res = resize_bilinear(img,rate)
    K = img;
    sze = ceil(512*rate);
    res = zeros(sze,sze);
    for i=2:sze-1
        for j=2:sze-1
            %nearest four pixels
            bir = K(floor(i/rate),floor(j/rate));
            iki = K(ceil((i)/rate),ceil((j)/rate));
            uc = K(floor(i/rate), ceil((j)/rate));
            dort = K(ceil((i)/rate),floor(j/rate));
            x=rem(i/rate,1);
            y=rem(j/rate,1);
            tr = (uc*y)+(bir*(1-y));
            br = (iki*y)+(dort*(1-y));
            res(i,j) = (br*x)+(tr*(1-x));
        end
    end
    
end
    
   
