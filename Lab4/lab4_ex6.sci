clf(); // Clear graphic window

// Define  x(n) = [1, 2, -3, 2, 1] with original at index 1(mũi tên)
// In Scilab, index start from 1. n_x run from 0 to 4.s
x = [1, 2, -3, 2, 1];
nx = 0:4;

// Define h(n) = [1, 0, -1] with original index 1
// n_h run from 0 to 2.
h = [1, 0, -1];
nh = 0:2;

// --- Folding and Shifting for x and h---
y_conv = convol(h, x);
ny = (nx(1) + nh(1)) : (nx($) + nh($)); // Identify time axis for y(n)

// --- Matrix Method for convolution ---x
// create Toeplitz matrix to calculate convolution sum
L = length(x);
M = length(h);
N = L + M - 1;
H_matrix = zeros(N, L);
for i = 1:L
    H_matrix(i : i+M-1, i) = h';
end
y_matrix = H_matrix * x';

// --- Calculate Energy ---
// Formula: E = sum(|x(n)|^2)
E_x = sum(abs(x).^2); 
E_y = sum(abs(y_conv).^2);

// --- Sketch graph ---
// sketch x(n)
subplot(2,1,1);
plot2d3(nx, x, 2); // Vẽ dạng stem
scatter(nx, x, "fill");
xtitle("Input Signal x(n) (Energy: " + string(E_x) + ")", "n", "Amplitude");

// sketch y(n)
subplot(2,1,2);
plot2d3(ny, y_conv, 5);
scatter(ny, y_conv, "fill");
xtitle("Linear Convolution y(n) (Energy: " + string(E_y) + ")", "n", "Amplitude");

// Print result to console
printf("Result y(n) using Folding/Shifting: "); disp(y_conv);
printf("Result y(n) using Matrix Method: "); disp(y_matrix');
printf("Result E_x");

disp(E_x);
printf("Result E_");
disp(E_y);
