clf();
//parameter
f = 50;
Fs = 300;
delta = 0.1;
//analog signal
T = 1/f;
t = 0:0.00002:5*T;//start from 0, step 0.00002(plot 0.02/0.00002=100 points), end at cyle 
//omega = 2*pi*f = 100*pi
xa = 3*sin(100*%pi*t);
//**plot analog signal**
subplot(3,1,1);
plot(t, xa);
title("analog signal");
//digital signal
Ts = 1/Fs;
//N = 6(periodic condition of discrete signal is 6 samples)
//n = 6*5 = 30
n = 0:29;
//t = nTs
xn = 3*sin(100*%pi*Ts*n);//Omega = 100*pi/300 = pi/300
//**plot discrete signal**
subplot(3,1,2);
plot2d3(n,xn);
title("digital signal");
//quantized discrete signal
xq = delta*fix(xn/delta);
subplot(3,1,3);
plot2d3(n,xq);
title("quantized signal");
