// Đọc file âm thanh (.wav)
[y, fs] = wavread("D:\file_example_WAV_1MG.wav"); 

// y: Ma trận chứa dữ liệu âm thanh
// fs: Sampling frequency

// Lấy thông tin cơ bản
n = size(y, "c");      // Số mẫu (samples)
t = (0:n-1)/fs;        // Tạo trục thời gian (seconds)
clf();
// Vẽ dạng sóng thời gian (Time Domain)
subplot(2,1,1);
plot(t, y);
xtitle("Audio Waveform", "Time (s)", "Amplitude");

// Phân tích phổ tần số (Frequency Domain - FFT)
f = (0:n-1)*(fs/n);    // Trục tần số
Y = abs(fft(y));       // Biến đổi Fourier nhanh

subplot(2,1,2);
plot(f(1:n/2), Y(1:n/2)); // Chỉ vẽ một nửa phổ (dương)
xtitle("Frequency Spectrum", "Frequency (Hz)", "Magnitude");

// Phát âm thanh để kiểm tra
playsnd(y, fs);
