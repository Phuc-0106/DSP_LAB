// DSP Lab 6 - Exercise 3
// (a) x1(n) = 0.1^n u(n)  ->  X(omega) = 1/(1 - 0.1*exp(-j*omega))
// (b) x2(n) = delta(n)+...+delta(n-3)  ->  X(omega) = sum_{k=0}^3 exp(-j*k*omega)

clear; clf;

N = 4096;
omega = linspace(-%pi, %pi, N);

// (a)
X1 = 1 ./ (1 - 0.1*exp(-%i*omega));

// (b)
X2 = 1 + exp(-%i*omega) + exp(-%i*2*omega) + exp(-%i*3*omega);

scf(0); clf();
subplot(2,2,1);
plot(omega/%pi, abs(X1));
xlabel("omega / pi"); ylabel("|X1|");
xtitle("Ex3(a): magnitude |X1(omega)|");

subplot(2,2,2);
plot(omega/%pi, atan(imag(X1), real(X1)));
xlabel("omega / pi"); ylabel("Phase (rad)");
xtitle("Ex3(a): phase of X1(omega)");

subplot(2,2,3);
plot(omega/%pi, abs(X2));
xlabel("omega / pi"); ylabel("|X2|");
xtitle("Ex3(b): magnitude |X2(omega)|");

subplot(2,2,4);
plot(omega/%pi, atan(imag(X2), real(X2)));
xlabel("omega / pi"); ylabel("Phase (rad)");
xtitle("Ex3(b): phase of X2(omega)");
