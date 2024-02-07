% Transmitter
% Diego Torres (c) 2_5_2024

% Clear everything
clear; close all; clc;

% Set parameters
oversampling_factor = 20;
carrier_frequency = 1010E3;
carrier_amplitude = 1;
baseband_duration = 0.002;
baseband_frequency = 5000.0; 
baseband_amplitude = 1;
modulation_index = 1;

% Create timebase
sampling_frequency = oversampling_factor * max(carrier_frequency);
time = 0:1/sampling_frequency:baseband_duration - 1/sampling_frequency;
N = length(time);

% Create carrier signal
carrier_signal = cos(2.0 * pi * carrier_frequency * time);

% Create baseband signal
baseband_signal = baseband_amplitude * cos(2.0 * pi * baseband_frequency * time);

% Amplitude Modulation
modulated_signal_basic = (carrier_amplitude + baseband_signal) .* carrier_signal;

% Amplitude Modulation using ammod function
modulated_signal_ammod = ammod(baseband_signal, carrier_frequency, sampling_frequency, 0, modulation_index);

% Plot results
figure;

subplot(3,1,1)
plot(time, baseband_signal)
xlabel("Time (s)")
ylabel("Amplitude")
title("Baseband Signal (Time Domain)")

subplot(3,1,2)
plot(time, modulated_signal_basic)
xlabel("Time (s)")
ylabel("Amplitude")
title("Amplitude Modulated Signal (Basic)")

subplot(3, 1, 3);
plot(time, modulated_signal_ammod);
xlabel('Time (s)');
ylabel('Amplitude');
title('AM Modulated Signal (Using ammod)');