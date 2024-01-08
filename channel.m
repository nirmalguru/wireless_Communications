function chanOut = channel(sig,hasMP,hasAWGN,SNR)
    % Apply multipath channel if selected
    if hasMP
        mpChan = [0.8; zeros(7,1); -0.5; zeros(7,1); 0.34]; 
        mpChanOut = filter(mpChan,1,sig);
    else
        mpChanOut = sig;
    end
    % Apply AWGN if selected
    if hasAWGN
        chanOut = awgn(mpChanOut,SNR,"measured");
    else
        chanOut = mpChanOut;
    end
end