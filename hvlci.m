function [bit_rate si_vid ti_vid] = hvlci(yuv_file,nrows,ncolms,nframes)

% % 
% % H264 Visually Lossless Compressibility Index (HVLCI) Software release.
% % ========================================================================
% % 
% % -----------COPYRIGHT NOTICE STARTS WITH THIS LINE------------
% % Copyright (c) 2010 The University of Texas at Austin
% % All rights reserved.
% % 
% % Permission is hereby granted, without written agreement and without license or royalty fees, to use, copy, 
% % modify, and distribute this code (the source files) and its documentation for
% % any purpose, provided that the copyright notice in its entirety appear in all copies of this code, and the 
% % original source of this code, Laboratory for Image and Video Engineering (LIVE, http://live.ece.utexas.edu)
% % and Center for Perceptual Systems (CPS, http://www.cps.utexas.edu) at the University of Texas at Austin (UT Austin, 
% % http://www.utexas.edu), is acknowledged in any publication that reports research using this code. The research
% % is to be cited in the bibliography as:
% % 
% % 1. A. K. Moorthy and A. C. Bovik, ``H.264 Visually Lossless Compressibility Index: Psychophysics and Algorithm Design'',
% % IEEE Image, Video, and Multidimensional Signal Processing (IVMSP) Workshop: Perception and Visual Signal Analysis. June 2011.
% % 
% % 2. A. K. Moorthy and A. C. Bovik, “H.264 Visually Loss- less Compressibility Index (HVLCI), Software release,” 
% % http://live.ece.utexas.edu/research/quality/hvlci.zip, 2011.
% % 
% % IN NO EVENT SHALL THE UNIVERSITY OF TEXAS AT AUSTIN BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, 
% % OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OF THIS DATABASE AND ITS DOCUMENTATION, EVEN IF THE UNIVERSITY OF TEXAS
% % AT AUSTIN HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
% % 
% % THE UNIVERSITY OF TEXAS AT AUSTIN SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
% % WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE DATABASE PROVIDED HEREUNDER IS ON AN "AS IS" BASIS,
% % AND THE UNIVERSITY OF TEXAS AT AUSTIN HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
% % 
% % -----------COPYRIGHT NOTICE ENDS WITH THIS LINE------------%
% % 
% % Author  : Anush Krishna Moorthy
% % Version : 1.0
% % 
% % The authors are with the Laboratory for Image and Video Engineering
% % (LIVE), Department of Electrical and Computer Engineering, The
% % University of Texas at Austin, Austin, TX.
% % 
% % Kindly report any suggestions or corrections to anushmoorthy@gmail.com
% % 
% % ========================================================================


% Function to compute the visually lossless bit-rate for H.264
% compressed videos.


% Inputs:
% yuv_file = filename of yuv file to be compressed -- assumed to be YUV420p
% nrows = number of rows in one frame
% ncolms = number of colms in one frame
% nframes = number of frames of video

% Outputs:
% bit_rate = visually lossless bit-rate
% si_vid = spatial activity
% ti_vid = temporal activity

% Usage:
% 1. vl_bit_rate = hvlci('yuvfilename.yuv');

chunk_length = 5; %0.2 seconds for 25 fps.
num_scales = 3;
num_or = 8;

fid = fopen(yuv_file,'rb');
tic
j = 1; l = 1;
si_all = []; ti_all = [];
while(j<=nframes)
    frame = fread(fid,nrows*ncolms*1.5,'uchar'); j = j+1;
    frame = reshape(frame(1:nrows*ncolms),ncolms,nrows)';
    % Texture feature
    [pyr1, pind] = buildSFpyr(frame, num_scales, num_or-1);
    l = 1; clear feature
    for p = 1:num_scales
        for k =1:num_or
            bandind = k+(p-1)*num_or+1;
            subband =  pyrBand(pyr1, pind, bandind);
            feature(l,j) = kurtosis(subband(:));
            l = l+1;
        end
    end

    
    
    chunk(:,:,l) = frame; l = l+1;
    if(l>chunk_length)
        [si ti] = compute_activity(chunk);
        l = 1;
        si_all = [si_all si];
        ti_all = [ti_all ti];
        clear chunk
    end

end
fclose(fid);
si_vid = mean(si_all);
ti_vid = mean(ti_all);
texture = mean(median(feature,1));

rep_vec = [texture ti_vid];
bit_rate = svm_regress(rep_vec);