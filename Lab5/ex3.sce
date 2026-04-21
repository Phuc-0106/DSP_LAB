// ============================================================
// Lab 5 - Exercise 3
// Inverse Z-transform with all possible ROCs.
//
//   X1(z) = 1 / (2 - 3 z^-1 + z^-2)
//   X2(z) = (1 + 2z^-1 + z^-2) / (1 + 4z^-1 + 4z^-2)
//   X3(z) = (1 + z^-1) / [(1 - 0.5 z^-1)^2 (1 - 0.3 z^-1)],  0.3 < |z| < 0.5
// ============================================================
clear; clf;

// ---------- X1: verify causal formula via long division ----------
// Numerator and denominator in ascending powers of z^-1
num1 = [1];
den1 = [2 -3 1];
M    = 10;
x1_div = zeros(1, M);
// Long division:  x1(n) = (1 - sum_{k=1..N} den1(k+1) x1(n-k)) / den1(1)
x1_div(1) = num1(1) / den1(1);
for n = 2:M
    s = 0;
    for k = 1:min(n-1, length(den1)-1)
        s = s + den1(k+1) * x1_div(n-k);
    end
    b = 0;
    if n <= length(num1) then b = num1(n); end
    x1_div(n) = (b - s) / den1(1);
end
n = 0:M-1;
x1_causal = 1 - (0.5).^(n+1);
disp("Ex.3(a)  causal x(n) (long division) = "); disp(x1_div);
disp("Ex.3(a)  causal x(n) (formula)       = "); disp(x1_causal);
disp("Ex.3(a)  max err = " + string(max(abs(x1_div - x1_causal))));

// ---------- X2: verify causal formula via long division ----------
num2 = [1 2 1];
den2 = [1 4 4];
x2_div = zeros(1, M);
x2_div(1) = num2(1) / den2(1);
for n = 2:M
    s = 0;
    for k = 1:min(n-1, length(den2)-1)
        s = s + den2(k+1) * x2_div(n-k);
    end
    b = 0;
    if n <= length(num2) then b = num2(n); end
    x2_div(n) = (b - s) / den2(1);
end
n = 0:M-1;
// Causal closed form: 0.25*delta(n) + [0.5 + 0.25(n+1)] (-2)^n
x2_causal = 0.5*(-2).^n + 0.25*(n+1).*(-2).^n;
x2_causal(1) = x2_causal(1) + 0.25;   // add delta(0) contribution
disp("Ex.3(b)  causal x(n) (long division) = "); disp(x2_div);
disp("Ex.3(b)  causal x(n) (formula)       = "); disp(x2_causal);
disp("Ex.3(b)  max err = " + string(max(abs(x2_div - x2_causal))));

// ---------- X3: two-sided case 0.3 < |z| < 0.5 ----------
// x(n) = 9.75 (0.3)^n u(n)  +  (8.75 - 7.5 n)(0.5)^n u(-n-1)
n_neg = -10:-1;
n_pos = 0:9;
x3_neg = (8.75 - 7.5*n_neg) .* (0.5).^n_neg;
x3_pos = 9.75 * (0.3).^n_pos;
disp("Ex.3(c)  x(n) for n = -10..-1: "); disp(x3_neg);
disp("Ex.3(c)  x(n) for n =   0.. 9: "); disp(x3_pos);

subplot(2,1,1); plot2d3(-10:9, [x3_neg x3_pos]);
xtitle("Ex.3(c)  x(n), two-sided, ROC 0.3 < |z| < 0.5", "n", "x(n)");
subplot(2,1,2); plot2d3(0:M-1, x2_causal);
xtitle("Ex.3(b)  x(n), causal", "n", "x(n)");
