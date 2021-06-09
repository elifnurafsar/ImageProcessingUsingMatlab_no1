function res = resize_bilinear_rgb(img,rate)
    K = img;
    [~,~,depth] = size(img);
    sze = ceil(512*rate);
    res = zeros(sze,sze,depth);
    for i=2:sze-1
        for j=2:sze-1
            %we found nearest four pixels such as K(floor(i/rate), ceil((j)/rate),:)
            %now directly use them
            x=rem(i/rate,1);
            y=rem(j/rate,1);
            for k=1:depth
                distx1 = (K(floor(i/rate), ceil((j)/rate),k)*y)+(K(floor(i/rate),floor(j/rate),k)*(1-y));
                distx2 = (K(ceil((i)/rate),ceil((j)/rate),k)*y)+(K(ceil((i)/rate),floor(j/rate),k)*(1-y));
                res(i,j,k) = (distx2*x)+(distx1*(1-x));
            end
        end
    end
end
    
   
