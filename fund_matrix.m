function [fund_matrix,residual] = fund_matrix(matches)

Eight_point_matrix = [matches(:,1).*matches(:,3), matches(:,1).*matches(:,4), matches(:,1), ...
    matches(:,3).*matches(:,2), matches(:,2).*matches(:,4), matches(:,2), matches(:,3), ...
    matches(:,4), ones(size(matches,1),1)];
[U D V] = svd(Eight_point_matrix);
fund_matrix = reshape(V(:,9),3,[]);
[Uf Df Vf] = svd(fund_matrix);
Df(3,3) = 0;
fund_matrix = Uf*Df*Vf';
residual = norm(Eight_point_matrix*reshape(fund_matrix,9,[]));
% disp("The residual between points in both images and the corresponding epipolar lines: "+ newline + residual);

end

