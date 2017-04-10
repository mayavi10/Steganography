%somaya image steganography
coverim=input('enter the image to act like cover image--','s');
msgim=input('enter the message image to act like secret message hidden in cover image--','s');

cover=imread(coverim);
msg=imread(msgim);

cover=double(cover);
msg=double(msg);
 figure(1),imshow(coverim);
 title('cover image');
 figure(2),imshow(msgim);
 title('hidden image');

imbed=4;
msgshift=bitshift(msg,-(8-imbed));
showmsg=uint8(msgshift);
showmsg=bitshift(showmsg,8-imbed);
figure(3),imshow(showmsg);
title('4 bit secret image');

cvr=cover;
for i=1:imbed
    cvr=bitset(cvr,i,0);
end
stego=uint8(msgshift+cvr);
figure(4),imshow(stego);title('final image(stego image)');

secmsg=bitshift(showmsg,-(8-imbed));
shh=uint8(secmsg);
shh=bitshift(shh,8-imbed);
figure(5),imshow(shh);
title('recovered image');
%ss=bitshift(shh,+(8+imbed));
%kk=uint8(ss);
%kk=bitshift(kk,(8+imbed));
%figure(6),imshow(kk);
%title('recovered secret msg');