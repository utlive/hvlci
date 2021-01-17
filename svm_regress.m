function q = svm_regress(r)


fid = fopen('test_ind','w');
for jj = 1:size(r,1)
     fprintf(fid,'%f ',jj);
    for kk = 1:size(r,2)       
        fprintf(fid,'%d:%f ',kk,r(jj,kk));
    end
    fprintf(fid,'\n');
end
fclose(fid);
system('svm-scale -r range2 test_ind >> test_ind_scaled');
system(['svm-predict   test_ind_scaled model_89 output_89 >>dump']);
load output_89
q = output_89;

delete  output_89 test_ind test_ind_scaled dump