Return-Path: <SRS0=m20R=QU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:52077 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730792AbfBMRyD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 Feb 2019 12:54:03 -0500
Date: Wed, 13 Feb 2019 18:54:00 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH v3 0/3] Add ZynqMP VCU/Allegro DVT H.264 encoder driver
Message-ID: <20190213185400.51c20d80@litschi.hi.pengutronix.de>
In-Reply-To: <20190213175124.3695-1-m.tretter@pengutronix.de>
References: <20190213175124.3695-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org, dshah@xilinx.com
List-ID: <devicetree@vger.kernel.org>

On Wed, 13 Feb 2019 18:51:21 +0100, Michael Tretter wrote:
> This is v3 of the series to add support for the Allegro DVT H.264 encoder
> found in the EV family of the Xilinx ZynqMP platform.
> 
> The devicetree bindings now also include the clocks as documented in PG252
> "H.264/H.265 Video Codec Unit v1.2" [0].
> 
> Most changes involve added or removed v4l2 callbacks that were mentioned in
> the review comments to make the v4l2-compliance test suite happy.

And here are the test results:

v4l2-compliance SHA: 9e375c965f200538817ab712330a86a123124394, 64 bits

Compliance test for allegro device /dev/video4:

Driver Info:
        Driver name      : allegro
        Card type        : Allegro DVT Video Encoder
        Bus info         : platform:a0009000.al5e
        Driver version   : 5.0.0
        Capabilities     : 0x84208000
                Video Memory-to-Memory
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04208000
                Video Memory-to-Memory
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
        test second /dev/video4 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 8 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        Video Capture: Captured 60 buffers                
        test MMAP (no poll): OK
        Video Capture: Captured 60 buffers                
        test MMAP (select): OK
        test USERPTR (no poll): OK (Not Supported)
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for allegro device /dev/video4: 50, Succeeded: 50, Failed: 0, Warnings: 0

> 
> I also updated the firmware loading and device probing to properly handle
> failures and correctly reset or stop the MCU.
> 
> Still on my list is a check against the documentation of the memory-to-memory
> stateful video encoder interface. If there are fixes necessary, I will include
> them in a v4.
> 
> I did not introduce a separate queue for internal buffers for encoded frames.
> I am still considering this split, but I want to have tracing in place before
> doing this. The changes will completely internal to the driver and can be done
> later anyway.
> 
> Each patch also contains a more detailed changelog.
> 
> Michael
