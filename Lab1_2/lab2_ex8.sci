clf;
n = -2:1;
x = [1 -2 3 6];
//y = x(-n)
y1 = x($:-1:1);
subplot(3,1,1); 
xlabel("n"); 
ylabel("y1"); 
title("signal of y1(n)"); 
plot2d3(n,y1);
//y = x(n+3)
y2 = x; 
n1 = n - 3;
subplot(3,1,2); 
xlabel("n1"); 
ylabel("y2"); 
title("signal of y2(n)"); 
plot2d3(n1,y2);
//y = 2x(-n-2) 
n2 = -n - 2;
n2 = n2($:-1:1);
x_flip = x($:-1:1);
y3 = 2*x_flip;
subplot(3,1,3); 
xlabel("n2"); 
ylabel("y3"); 
title("signal of y3(n)"); 
plot2d3(n2,y3);
