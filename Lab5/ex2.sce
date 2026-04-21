// ============================================================
// Lab 5 - Exercise 2
// Convolution via the Z-transform.
//
//  (a) x1 = {1^,2,3,4,5},     x2 = {1^,1,1}
//      y  = {1,3,6,9,12,9,5}
//  (b) x1 = (1/5)^n u(n),     x2 = 2^n u(n)
//      y  = [-1/9 * (1/5)^n + 10/9 * 2^n] u(n)
//  (c) x1 = n u(n),           x2 = 2^n u(n-1)
//      y  = [2^(n+1) - 2 - 2n] u(n)
//
//  NOTE: built-in convol() may use FFT for long vectors and introduce
//  small floating-point noise. Use conv_lin() for direct sum convolution.
// ============================================================
clear; clf;

function y = conv_lin(x, h)
    // Linear convolution y = x * h (same as convol, dot-product sum)
    nx = length(x); nh = length(h); ny = nx + nh - 1;
    y = zeros(1, ny);
    for i = 1:ny
        s = 0;
        for k = 1:nx
            j = i - k + 1;
            if j >= 1 & j <= nh then
                s = s + x(k) * h(j);
            end
        end
        y(i) = s;
    end
endfunction

// --------- (a) Finite-length sequences ---------
x1 = [1 2 3 4 5];
x2 = [1 1 1];
y_a = conv_lin(x1, x2);
disp("Ex.2(a)  y(n) = "); disp(y_a);

// --------- (b) Infinite causal sequences (truncate) ---------
N  = 40;
n  = 0:N-1;
x1b = (1/5).^n;
x2b = 2.^n;
y_b = conv_lin(x1b, x2b);  y_b = y_b(1:N);
y_b_ana = -1/9*(1/5).^n + 10/9*2.^n;
disp("Ex.2(b)  max |conv_lin - formula| = " + string(max(abs(y_b - y_b_ana))));

// --------- (c) ---------
x1c = n;                           // n u(n)
x2c = 2.^n;  x2c(1) = 0;           // 2^n u(n-1)  (zero at n=0)
y_c = conv_lin(x1c, x2c);  y_c = y_c(1:N);
y_c_ana = 2.^(n+1) - 2 - 2*n;
disp("Ex.2(c)  first 8 samples (conv_lin): "); disp(y_c(1:8));
disp("Ex.2(c)  first 8 samples (formula): "); disp(y_c_ana(1:8));
disp("Ex.2(c)  max err = " + string(max(abs(y_c - y_c_ana))));

// --------- Visualization ---------
subplot(3,1,1);
plot2d3(0:length(y_a)-1, y_a);
xtitle("Ex.2(a) y(n) = conv({1,2,3,4,5},{1,1,1})", "n", "y(n)");

Nplot = 8;
subplot(3,1,2);
plot2d3(0:Nplot-1, y_b(1:Nplot));
xtitle("Ex.2(b) y(n) = -1/9*(1/5)^n + 10/9*2^n", "n", "y(n)");

subplot(3,1,3);
plot2d3(0:Nplot-1, y_c(1:Nplot));
xtitle("Ex.2(c) y(n) = 2^(n+1) - 2 - 2n", "n", "y(n)");
