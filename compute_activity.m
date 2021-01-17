function [si ti] = compute_activity(chunk)
% chunk is a set of frames from the video corresponding to 0.2 secs - 5
% frames for 25 fps videos

f = [-0.0052625 -0.0173446 -0.0427401 -0.0768961 -0.0957739 -0.0696751 0 ...
    0.0696751 0.0957739 0.0768961 0.0427401 0.0173446 0.0052625];
fh = repmat(f,[13,1]);
fv = repmat(f',[1 13]);

Ih = zeros(size(chunk,1),size(chunk,2));
Iv = zeros(size(chunk,1),size(chunk,2));
sp = []; tp = [];
for i = 1:size(chunk,3)
    Ih = filter2(fh,chunk(:,:,i));
    Iv = filter2(fv,chunk(:,:,i));    
    
    Isi = sqrt(Ih.^2  + Iv.^2);
    
    sp = [sp;im2col(Isi,[8 8],'distinct')];

end


for i = 2:size(chunk,3)
    diff  = abs(chunk(:,:,i)-chunk(:,:,i-1));
    
    tp = [tp;im2col(diff,[4 4],'distinct')];
end

si = std(sp);
ti = std(tp);


si(si<12) = 12; ti(ti<3) = 3;

si = mean(si); ti = mean(ti);
