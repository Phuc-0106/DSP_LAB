// ============================================================
// Lab 5 - Exercise 1
// System: y(n) - y(n-2) = x(n)   =>   H(z) = 1 / (1 - z^-2)
// Analytical impulse response: h(n) = [1 + (-1)^n]/2 * u(n)
// ============================================================
clear; clf;

N = 15;
n = 0:N-1;

// --- Direct time-domain simulation with x(n) = delta(n) ---
x      = zeros(1, N);  x(1) = 1;
h_sim  = zeros(1, N);
for k = 1:N
    y2 = 0;
    if k - 2 >= 1 then y2 = h_sim(k-2); end
    h_sim(k) = y2 + x(k);
end

// --- Analytical formula ---
h_ana  = 0.5 * (1 + (-1).^n);

disp("Exercise 1");
disp("h_sim = ");  disp(h_sim);
disp("h_ana = ");  disp(h_ana);
disp("max |h_sim - h_ana| = " + string(max(abs(h_sim - h_ana))));

// --- Visualization ---
subplot(2,1,1);
plot2d3(n, h_sim);
xtitle("Simulation of y(n) - y(n-2) = delta(n)", "n", "h(n)");

subplot(2,1,2);
plot2d3(n, h_ana);
xtitle("Analytical  h(n) = [1+(-1)^n]/2 u(n)", "n", "h(n)");
