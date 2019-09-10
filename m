From: Benoit Parrot <bparrot@ti.com>
Subject: Re: [Patch 00/13] media: am437x-vpfe: overdue maintenance
Date: Tue, 10 Sep 2019 11:20:48 -0500
Message-ID: <20190910162048.wrxy7tjlmf3k6axm@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
 <5b73285c-5d05-1799-06fc-f4ab84cb9a1d@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5b73285c-5d05-1799-06fc-f4ab84cb9a1d@xs4all.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hans Verkuil <hverkuil@xs4all.nl> wrote on Tue [2019-Sep-10 12:42:51 +0200]:
> Hi Benoit,
> 
> On 9/9/19 6:27 PM, Benoit Parrot wrote:
> > This patch series is a collection of patches we have been carrying for a
> > while.
> > 
> > A few patches do fix actual bug and v4l2-compliance errors/warnings.
> > Other are drivers re-work to simplify/clarify the code for easier
> > maintenance.
> 
> Can you post the output of the latest version of v4l2-compliance? Use
> the '-s' option so streaming is tested as well.
> 
> Thanks!
> 
> 	Hans

As already discussed, I'll paste the result here and I'll make sure to
include it in the next revision.

./v4l2-compliance_5b168dc84739 -d 0 -s   
v4l2-compliance SHA: 5b168dc8473911227890526bad26553d9e8ff81b, 32 bits

Compliance test for vpfe device /dev/video0:

Driver Info:
	Driver name      : vpfe
	Card type        : TI AM437x VPFE
	Bus info         : platform:vpfe 48326000.vpfe
	Driver v ersion   : 5.3.0
	Capabilities     : 0x85200001
		Video Capture
		Read/Write
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x05200001
		Video Capture
		Read/Write
		Streaming
		Extended Pix Format

Required ioctls:
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 3 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
		fail: v4l2-test-formats.cpp(1419): node->frmsizes_count[pixfmt] > 1
	test Cropping: FAIL
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
	test read/write: OK
	test blocking wait: OK
	test MMAP (no poll): OK                           
	test MMAP (select): OK                            
	test MMAP (epoll): OK                             
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for vpfe device /dev/video0: 51, Succeeded: 50, Failed: 1, Warnings: 0

Benoit

> 
> > 
> > We also include the SPDX Licensing update which seemed to have been
> > missed by the global script thus far.
> > 
> > Benoit Parrot (12):
> >   media: am437x-vpfe: Fix missing first line
> >   media: am437x-vpfe: Rework ISR routine for clarity
> >   media: am437x-vpfe: Wait for end of frame before tear-down
> >   media: am437x-vpfe: Streamlined vb2 buffer cleanup
> >   media: am437x-vpfe: Setting STD to current value is not an error
> >   media: am437x-vpfe: Use a per instance format array instead of a
> >     static one
> >   media: am437x-vpfe: Maintain a reference to the current vpfe_fmt
> >   media: am437x-vpfe: fix function trace debug log
> >   media: am437x-vpfe: Remove print_fourcc helper
> >   media: am437x-vpfe: TRY_FMT ioctl is not really trying anything
> >   media: am437x-vpfe: Remove per bus width static data
> >   media: am437x-vpfe: Switch to SPDX Licensing
> > 
> > Dave Gerlach (1):
> >   media: am437x-vpfe: Fix suspend path to always handle pinctrl config
> > 
> >  drivers/media/platform/am437x/am437x-vpfe.c   | 906 ++++++++----------
> >  drivers/media/platform/am437x/am437x-vpfe.h   |  44 +-
> >  .../media/platform/am437x/am437x-vpfe_regs.h  |  10 +-
> >  3 files changed, 438 insertions(+), 522 deletions(-)
> > 
> 
