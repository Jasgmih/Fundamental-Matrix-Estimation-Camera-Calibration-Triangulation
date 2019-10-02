function [F_recons,match_ind] = fund_matrix_RANSAC(PointsPic1,PointsPic2)


N = 80;
s = 8;
threshold = 0.2;
matches = [PointsPic1,PointsPic2];

T = zeros(N,1);
randomSelect =zeros(s,N);
error=zeros(size(matches,1),N);

for i = 1:N
    randomSelect(:,i) = randperm(size(matches,1),s);
    [F,~] = fund_matrix(matches(randomSelect(:,i),:));
    error_matrix = [PointsPic1,ones(size(PointsPic1,1),1)]*F*[PointsPic2,ones(size(PointsPic2,1),1)]';
    error(:,i) = diag(error_matrix);
    T(i) = length(find(error(:,i) <= threshold))/size(matches,1);
end

[Max,index] = max(T);
disp(newline+"Ratio of inliers to all the data: ");
disp(Max);
match_ind = find(error(:,index) <= threshold);

[F_recons,~] = fund_matrix(matches(match_ind,:));


end

