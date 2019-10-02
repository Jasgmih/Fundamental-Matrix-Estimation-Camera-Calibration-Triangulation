function [points3D] = Triangulations(matches,P1,P2,image)

points3D = zeros(4,size(matches,1));
for i = 1:size(matches,1)
    A = [matches(i,1).*P1(3,:)-P1(1,:);...
        matches(i,2).*P1(3,:)-P1(2,:);...
        matches(i,3).*P2(3,:)-P2(1,:);...
        matches(i,4).*P2(3,:)-P2(2,:)];
    [~,~,V] = svd(A);
    points3D(:,i) = V(:,end)./V(end,end);
end
[~,~,V1] = svd(P1);
[~,~,V2] = svd(P2);
cameraCenter1 = V1(1:3,end)/V1(end,end);
cameraCenter2 = V2(1:3,end)/V2(end,end);

figure,scatter3(points3D(1,:),points3D(2,:),points3D(3,:));
hold on
scatter3(cameraCenter1(1),cameraCenter1(2),cameraCenter1(3),'filled');
text(cameraCenter1(1),cameraCenter1(2),cameraCenter1(3),'cameraCenter1')
scatter3(cameraCenter2(1),cameraCenter2(2),cameraCenter2(3),'filled');
text(cameraCenter2(1),cameraCenter2(2),cameraCenter2(3),'cameraCenter2')
hold off

plotMatchPoints(image,matches);
end

