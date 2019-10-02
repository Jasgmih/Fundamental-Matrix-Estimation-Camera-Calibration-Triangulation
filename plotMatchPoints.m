function [] = plotMatchPoints(image,matches)

if image == "house"
    picture1 = 'data/house/house1.jpg';
    picture2 = 'data/house/house2.jpg';
elseif image == "library"
    picture1 = 'data/library/library1.jpg';
    picture2 = 'data/library/library2.jpg';
end

pic1 = imread(picture1);
figure,imshow(pic1);
hold on
plot(matches(:,1),matches(:,2),'go','MarkerFaceColor','r','MarkerSize',5)
hold off

pic2 = imread(picture2);
figure,imshow(pic2);
hold on
plot(matches(:,3),matches(:,4),'go','MarkerFaceColor','r','MarkerSize',5)
hold off
end

