clear;
g = 9.8;
f = 100;
T = 1/f;
cal_t = 3;
cal_n = cal_t/T;
% load the file
[file, path] = uigetfile('*.txt','select txt file');
complete = strcat(path, file);
txt = textread(complete);
% load the calibration data
ax = txt(1:cal_n,1);
ay = txt(1:cal_n,2);
az = txt(1:cal_n,3);
wx = txt(1:cal_n,4);
wy = txt(1:cal_n,5);
wz = txt(1:cal_n,6);
% calibration values
wx0 = mean(wx);
wy0 = mean(wy);
wz0 = mean(wz);
ax0 = mean(ax);
ay0 = mean(ay);
az0 = mean(az)-1;
% calculate initial angle by accelerometer
% dy0 = asind(ax0);
% dx0 = asind(-1*ay0/cosd(dy0));
dx0 = 0;
dy0 = 0;
dz0 = 0;
% load the input data
len = length(txt);
ax = txt(cal_n+1:len,1);
ay = txt(cal_n+1:len,2);
az = txt(cal_n+1:len,3);
% az = az - 1;
wx = txt(cal_n+1:len,4);
wy = txt(cal_n+1:len,5);
wz = txt(cal_n+1:len,6);
% angular velocity calibration
wx = fix(10*(wx-wx0))/10;
wy = fix(10*(wy-wy0))/10;
wz = fix(10*(wz-wz0))/10;
windowSize = 100;
b = (1/windowSize)*ones(1,windowSize);
a = 1;
ax = ax - ax0;
ay = ay - ay0;
az = az - az0;
%ax = filter(b,a,ax);
%ay = filter(b,a,ay);
%az = filter(b,a,az);
ax = fix(2*(ax-ax0))/2;
ay = fix(2*(ay-ay0))/2;
az = round(2*(az-az0))/2;
% angle calculation
t = 0:T:T*(len-cal_n-1);
dx = dx0 + cumtrapz(t,wx);
dy = dy0 + cumtrapz(t,wy);
dz = dz0 + cumtrapz(t,wz);
% accel calibration
ax = ax - sind(dy);
for i = 1:len-cal_n
    ay(i) = ay(i) + sind(dx(i))*cosd(dy(i));
    az(i) = az(i) - cosd(dx(i))*cosd(dy(i));
end
% movement calculation
vx = cumtrapz(t,ax);
vy = cumtrapz(t,ay);
vz = cumtrapz(t,az);
sx = cumtrapz(t,vx);
sy = cumtrapz(t,vy);
sz = cumtrapz(t,vz);
sx = sx * g * 100;
sy = sy * g * 100;
sz = sz * g * 100;
% plot the movement
figure
scatter(dy,-dx);
% axis([-10 10 -10 10 -10 10]);