// ============================================================
// Lab 5 - Exercise 5
// y(n) = 2 y(n-1) - 3 y(n-2) + x(n) + x(n-1)
//
//   Poles:  p = 1 +/- j*sqrt(2) = sqrt(3) * exp(+/- j*theta),  theta = atan(sqrt(2))
//
//   (b) h(n)   = (sqrt(3))^(n+1) * cos((n-1)*theta) u(n)
//   (c) yzi(n) = -(sqrt(3))^n * [cos(n*theta) + 2*sqrt(2)*sin(n*theta)] u(n)
//       with y(-1) = y(-2) = 1
//   (d) yzs(n) = [2^(n+1) - (sqrt(3))^n (cos(n*theta) - sqrt(2)*sin(n*theta))] u(n)
//       with x(n) = 2^n u(n)
// ============================================================
clear; clf;
N     = 12;
n     = 0:N-1;
theta = atan(sqrt(2));

// --------- (b) Impulse response ---------
h_sim = zeros(1, N);
x     = zeros(1, N);  x(1) = 1;
for k = 1:N
    y1 = 0;  y2 = 0;  x1 = 0;
    if k > 1 then y1 = h_sim(k-1); end
    if k > 2 then y2 = h_sim(k-2); end
    if k > 1 then x1 = x(k-1);      end
    h_sim(k) = 2*y1 - 3*y2 + x(k) + x1;
end
h_ana = (sqrt(3)).^(n+1) .* cos((n-1)*theta);
disp("Ex.5(b)  max |h_sim - h_ana| = " + string(max(abs(h_sim - h_ana))));

// --------- (c) Zero-input response, y(-1)=y(-2)=1 ---------
yzi     = zeros(1, N);
ym1     = 1;  ym2 = 1;
yzi(1)  = 2*ym1 - 3*ym2;        // n = 0
yzi(2)  = 2*yzi(1) - 3*ym1;     // n = 1
for k = 3:N
    yzi(k) = 2*yzi(k-1) - 3*yzi(k-2);
end
yzi_ana = -(sqrt(3)).^n .* ( cos(n*theta) + 2*sqrt(2)*sin(n*theta) );
disp("Ex.5(c)  max |yzi_sim - yzi_ana| = " + string(max(abs(yzi - yzi_ana))));

// --------- (d) Zero-state response, x(n) = 2^n u(n) ---------
yzs = zeros(1, N);
x   = 2.^n;
for k = 1:N
    y1 = 0;  y2 = 0;  x1 = 0;
    if k > 1 then y1 = yzs(k-1); end
    if k > 2 then y2 = yzs(k-2); end
    if k > 1 then x1 = x(k-1);    end
    yzs(k) = 2*y1 - 3*y2 + x(k) + x1;
end
yzs_ana = 2.^(n+1) - (sqrt(3)).^n .* ( cos(n*theta) - sqrt(2)*sin(n*theta) );
disp("Ex.5(d)  max |yzs_sim - yzs_ana| = " + string(max(abs(yzs - yzs_ana))));

// --------- Visualization ---------
subplot(3,1,1); plot2d3(n, h_sim);
xtitle("Ex.5(b) Impulse response h(n)", "n", "h(n)");

subplot(3,1,2); plot2d3(n, yzi);
xtitle("Ex.5(c) Zero-input response y_{zi}(n)", "n", "yzi(n)");

subplot(3,1,3); plot2d3(n, yzs);
xtitle("Ex.5(d) Zero-state response y_{zs}(n),  x(n)=2^n u(n)", "n", "yzs(n)");
