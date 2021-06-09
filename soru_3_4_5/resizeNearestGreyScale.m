function img = resizeNearestGreyScale(I, rate)
    i = floor(512*rate);
    E = zeros(i,ceil(i/rate));
    x = zeros(i,ceil(i/rate));
    y = zeros(ceil(i/rate),i);
    res = zeros(i,i);
    arr = zeros(i,1);
    %normalising pixel positions
    for c = 1:i
        arr(c,1)=c;
    end
    for c = 1:i
        arr(c,1)=arr(c,1)/rate;
    end
    %determine which row|column will take which pixel's (in original picture) value
    for c = 1:i
        arr(c,1) = ceil(arr(c,1));
    end
    %satir
    for c = 1:i
        x = I(arr(c,1),:);
        E(c,:) = x;
    end
    %sutun
    for c = 1:i
        y = E(:,arr(c,1));
        res(:,c) = y;
    end
    img = res;
end