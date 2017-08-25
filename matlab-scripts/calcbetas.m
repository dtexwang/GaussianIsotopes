function betas = calcbetas(freqs,T)
%CALCBETAS  Function to read data from STR and corresponding STC files. 
%
% Written for stream data files produced by TDLWintel version 1.14.57.  STR 
% files contain number densities vs. time.  STC files (stream conditions)
% give parameters used in getting the spectral fits.
% 
% INPUT  freqs    = matrix containing vibrational frequencies, with
%                   dimensions of (# vib modes) rows x (# isotopoloues) cols
%                   e.g., [12CO2, 13CO2] or [12CH4, 13CH4, 12CH3D, 13CH3D]
%        T        = (# T's) x 1 matrix containing the temperatures at which
%                   beta's will be calculated (T's in Kelvin)
%
% OUTPUT betas    = (# T's) x (# isotopologues - 1) matrix containing beta's
%                   calculated at the desired temperatures
%
% See also CO2CH4BETAS.

% last modified 08 Nov 2014 // MATLAB R2012b (8.0.0.783) 64-bit Windows 7
% David T. Wang (dtw@mit.edu)

%% set up calculation
h = 6.626176*10^-34;        % Planck constant (J s)
kb = 1.380662*10^-23;       % Boltzmann constnat (J/K)
c = 2.99792458*10^8*100;    % speed of light (cm/s)

u = h*c/kb.*freqs;               % u-term, i.e., dimensionless vibrational frequency
    [x y] = size(freqs);
        
Q = zeros(x,length(T));         % make matrix to store calculated Q, 
                                % partitition function of isotopologue
                                
betas = zeros(length(T),y-1);   % make matrix to store calculated beta-factors, 
                                % i.e., partition function ratios, or *Q/Q, 
                                % where *Q is partition function for isotopically-substituted isotopologue

%% calculate Q's and beta-factors
for m=2:y,
	for n = 1:length(T),
	   Tk = T(n); 
	   Q(:,n) = u(:,m)./u(:,1).*(exp(-u(:,m)/2/Tk))./(exp(-u(:,1)/2/Tk)).*(1-exp(-u(:,1)/Tk))./(1-exp(-u(:,m)/Tk));	   
	end
	betas(:,m-1) = prod(Q,1)'; 	
end


