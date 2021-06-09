function img = resizeNearestNghbrRGB(I, rate)
    i = floor(512*rate);
    [~,~,depth] = size(I);
    E = zeros(i,ceil(i/rate),depth);
    x = zeros(i,ceil(i/rate),depth);
    y = zeros(ceil(i/rate),i,depth);
    res = zeros(i,i,depth);
    arr = zeros(i,1);
    %normalising pixel positions
    for c = 1:i
        arr(c,1)=c;
    end
    %determine which row|column will take which pixel's (in original picture) value
    for c = 1:i
        arr(c,1)=ceil(arr(c,1)/rate);
    end
    %satir
    for r = 1:i
        for c = 1:i
            for m = 1:depth
                res(r,c,m) = I(arr(r,1),arr(c,1),m);
            end
        end
    end
    img = res;
end