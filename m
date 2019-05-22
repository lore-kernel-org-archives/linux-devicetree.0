Return-Path: <SRS0=4i2X=TW=xs4all.nl=hverkuil@kernel.org>
Subject: Re: [PATCH v6 0/5] Add ZynqMP VCU/Allegro DVT H.264 encoder driver
References: <20190513172131.15048-1-m.tretter@pengutronix.de>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <23de1fe8-f868-d13d-4217-05bc007fab13@xs4all.nl>
Date: Wed, 22 May 2019 14:04:23 +0200
MIME-Version: 1.0
In-Reply-To: <20190513172131.15048-1-m.tretter@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Michael Tretter <m.tretter@pengutronix.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org, dshah@xilinx.com
List-ID: <devicetree@vger.kernel.org>

On 5/13/19 7:21 PM, Michael Tretter wrote:
> This is v6 of the Allegro DVT H.264 encoder driver found in the EV
> family of the Xilinx ZynqMP platform.
> 
> Only minor changes this time. I dropped the implementation of the
> selection api, removed all references mentioning the decoder, and fixed
> a few issues reported by sparse and smatch.
> 
> The v4l2-compliance result using the current vicodec branch is
> 
> v4l2-compliance SHA: c2ad13e4b7aef9ae160303189c67a91e1775f025, 64 bits
> 
> Compliance test for allegro device /dev/video4:
> 
> Driver Info:
> 	Driver name      : allegro
> 	Card type        : Allegro DVT Video Encoder
> 	Bus info         : platform:a0009000.video-codec
> 	Driver version   : 5.1.0
> 	Capabilities     : 0x84208000
> 		Video Memory-to-Memory
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04208000
> 		Video Memory-to-Memory
> 		Streaming
> 		Extended Pix Format
> 	Detected Stateful Encoder
> 
> Required ioctls:
> 	test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
> 	test second /dev/video4 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 10 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 
> Test input 0:
> 
> Streaming ioctls:
> 	test read/write: OK (Not Supported)
> 	test blocking wait: OK
> 	Video Capture: Captured 60 buffers                
> 	test MMAP (select): OK
> 	Video Capture: Captured 60 buffers                
> 	test MMAP (epoll): OK
> 	test USERPTR (select): OK (Not Supported)
> 	test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for allegro device /dev/video4: 49, Succeeded: 49, Failed: 0, Warnings: 0
> 
> I observed that the "MMAP (select)" test occasionally fails, because the
> test did not receive an V4L2_EVENT_EOS when dequeuing a buffer with
> V4L2_BUF_FLAG_LAST being set. The driver always queues the event before
> returning the last buffer and the "MMAP (epoll)" does not fail. Thus, I
> decided to send the series anyway.

Where exactly does v4l2-compliance fail? This is weird, and I believe
this warrants a bit more debugging. I recommend adding a debug
statement in allegro_channel_buf_done() to see when a buffer is marked
LAST.

These tests really should not fail, and it is a strong indication of a
bug somewhere.

I don't want to merge a driver that has a FAIL in v4l2-compliance without
at the very least understanding why that happens. Ignoring it defeats the
purpose of v4l2-compliance.

Regards,

	Hans
