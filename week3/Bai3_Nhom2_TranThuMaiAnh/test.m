M = 16;             % Modulation alphabet size
phOffset = 0;       % Phase offset
symMap = 'binary';  % Symbol mapping (either 'binary' or 'gray')
pskModulator = comm.PSKModulator(M,phOffset,'SymbolMapping',symMap);
constellation(pskModulator)