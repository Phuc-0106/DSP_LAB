// ============================================================
// Lab 5 - Exercise 4
// y(n) = 0.7 y(n-1) + x(n)
//   (a) Block diagram: x(n) -> (+) -> y(n)  ;  y(n-1) -> *0.7 -> (+)
//   (b) h(n) = 0.7^n u(n)
//   (c) y(n) = (10 - 7*0.7^n)/3 u(n)   when x(n)=u(n)
// ============================================================
clear; clf;
N = 30;
n = 0:N-1;

// --- (b) Impulse response ---
h_sim = zeros(1, N);
x     = zeros(1, N);  x(1) = 1;
for k = 1:N
    y1 = 0;  if k > 1 then y1 = h_sim(k-1); end
    h_sim(k) = 0.7*y1 + x(k);
end
h_ana = 0.7.^n;
disp("Ex.4(b)  max |h_sim - h_ana| = " + string(max(abs(h_sim - h_ana))));

// --- (c) Step response ---
y_sim = zeros(1, N);
x     = ones(1, N);
for k = 1:N
    y1 = 0;  if k > 1 then y1 = y_sim(k-1); end
    y_sim(k) = 0.7*y1 + x(k);
end
y_ana = (10 - 7*0.7.^n)/3;
disp("Ex.4(c)  max |y_sim - y_ana| = " + string(max(abs(y_sim - y_ana))));
disp("Ex.4(c)  y(Inf) = " + string(y_sim($)) + " (expected 10/3 = 3.3333)");

// --- Visualization ---
subplot(2,1,1);
plot2d3(n, h_sim);
xtitle("Ex.4(b)  h(n) = 0.7^n u(n)", "n", "h(n)");

subplot(2,1,2);
plot2d3(n, y_sim);
xtitle("Ex.4(c)  y(n) = (10 - 7*0.7^n)/3,  x(n) = u(n)", "n", "y(n)");
