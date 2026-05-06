// DSP Lab 6 - Exercise 4
// y(n) + 0.1*y(n-1) + 0.2*y(n-2) = x(n)
// H(omega) = 1 / (1 + 0.1*exp(-j*omega) + 0.2*exp(-j*2*omega))

clear; clf;

N = 2048;
omega = linspace(-%pi, %pi, N);

num = ones(1, N);
den = 1 + 0.1*exp(-%i*omega) + 0.2*exp(-%i*2*omega);
H = num ./ den;

Hmag = abs(H);
// Unwrapped phase (principal value via atan)
Hph = atan(imag(H), real(H));

scf(0); clf();
subplot(2,1,1);
plot(omega/%pi, Hmag);
xlabel("omega / pi"); ylabel("|H(omega)|");
xtitle("Exercise 4: magnitude |H(omega)|");

subplot(2,1,2);
plot(omega/%pi, Hph);
xlabel("omega / pi"); ylabel("Phase (rad)");
xtitle("Exercise 4: phase of H(omega)");

// Optional: poles of H(z) = 1/(1 + 0.1*z^-1 + 0.2*z^-2)  <=> z^2 + 0.1*z + 0.2 = 0
p = roots([1 0.1 0.2]);
disp("Poles of H(z) (in z-plane): "); disp(p);
disp("Max pole magnitude: " + string(max(abs(p))));
