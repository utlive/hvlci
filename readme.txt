H264 Visually Lossless Compressibility Index (HVLCI) Software release.
========================================================================

-----------COPYRIGHT NOTICE STARTS WITH THIS LINE------------
Copyright (c) 2010 The University of Texas at Austin
All rights reserved.

Permission is hereby granted, without written agreement and without license or royalty fees, to use, copy, 
modify, and distribute this code (the source files) and its documentation for
any purpose, provided that the copyright notice in its entirety appear in all copies of this code, and the 
original source of this code, Laboratory for Image and Video Engineering (LIVE, http://live.ece.utexas.edu)
and Center for Perceptual Systems (CPS, http://www.cps.utexas.edu) at the University of Texas at Austin (UT Austin, 
http://www.utexas.edu), is acknowledged in any publication that reports research using this code. The research
is to be cited in the bibliography as:

1. A. K. Moorthy and A. C. Bovik, ``H.264 Visually Lossless Compressibility Index: Psychophysics and Algorithm Design'',
IEEE Image, Video, and Multidimensional Signal Processing (IVMSP) Workshop: Perception and Visual Signal Analysis. June 2011.

2. A. K. Moorthy and A. C. Bovik, “H.264 Visually Loss- less Compressibility Index (HVLCI), Software release,” 
http://live.ece.utexas.edu/research/quality/hvlci.zip, 2011.

IN NO EVENT SHALL THE UNIVERSITY OF TEXAS AT AUSTIN BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, 
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OF THIS DATABASE AND ITS DOCUMENTATION, EVEN IF THE UNIVERSITY OF TEXAS
AT AUSTIN HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

THE UNIVERSITY OF TEXAS AT AUSTIN SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE DATABASE PROVIDED HEREUNDER IS ON AN "AS IS" BASIS,
AND THE UNIVERSITY OF TEXAS AT AUSTIN HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.

-----------COPYRIGHT NOTICE ENDS WITH THIS LINE------------%

Author  : Anush Krishna Moorthy
Version : 1.0

The authors are with the Laboratory for Image and Video Engineering
(LIVE), Department of Electrical and Computer Engineering, The
University of Texas at Austin, Austin, TX.

Kindly report any suggestions or corrections to anushmoorthy@gmail.com

========================================================================

This is a demonstration of the H264 Visually Lossless Compressibility Index (HVLCI).

The algorithm is described in:
A. K. Moorthy and A. C. Bovik, ``H.264 Visually Lossless Compressibility Index: Psychophysics and Algorithm Design'',
IEEE Image, Video, and Multidimensional Signal Processing (IVMSP) Workshop: Perception and Visual Signal Analysis. June 2011.

You can change this program as you like and use it anywhere, but please
refer to its original source (cite our paper and our web page at
http://live.ece.utexas.edu/research/quality/hvlci.zip).

% Inputs:
% yuv_file = filename of yuv file to be compressed -- assumed to be YUV420p
% nrows = number of rows in one frame
% ncolms = number of colms in one frame
% nframes = number of frames of video
% Outputs:
% bit_rate = visually lossless bit-rate
% si_vid = spatial activity
% ti_vid = temporal activity

Usage:

1. vl_bit_rate = hvlci('yuvfilename.yuv',768, 432, 300);

Dependencies: 
Steerable Pyramid Toolbox, Download from: http://www.cns.nyu.edu/~eero/steerpyr/
You may need the MATLAB Image Processing Toolbox
Binaries: svm-predict, svm-train, svm-scale (from LibSVM) - provided with release
MATLAB files: hvlci.m, compute_activity.m svm_regress.m (provided with release)

Data files: range2, model_89  (provided with release)

NOTE: Please rename the .exe1 to .exe -- this code will work only on WINDOWS systems.

========================================================================

Note on training: 
This release version of HVLCI was trained on the entire database described in the reference.


This program uses LibSVM binaries.
Below is the requried copyright notice for the binaries distributed with this release.

====================================================================
LibSVM tools: svm-predict, svm-scale (binaries)
--------------------------------------------------------------------


Copyright (c) 2000-2009 Chih-Chung Chang and Chih-Jen Lin
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

1. Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.

3. Neither name of copyright holders nor the names of its contributors
may be used to endorse or promote products derived from this software
without specific prior written permission.


THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
====================================================================