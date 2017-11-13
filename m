From: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 0/3] Initial Allwinner V3s CSI Support
Date: Mon, 13 Nov 2017 15:22:59 +0800
Message-ID: <1510557779-43600-1-git-send-email-yong.deng@magewell.com>
Reply-To: yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD2JNYHK4MEBBEURUXIAKGQEJA63I6I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
Cc: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rick Chang <rick.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree@vger.
List-Id: devicetree@vger.kernel.org

This patchset add initial support for Allwinner V3s CSI.

Allwinner V3s SoC have two CSI module. CSI0 is used for MIPI interface
and CSI1 is used for parallel interface. This is not documented in
datasheet but by testing and guess.

This patchset implement a v4l2 framework driver and add a binding 
documentation for it. 

Currently, the driver only support the parallel interface. And has been
tested with a BT1120 signal which generating from FPGA. The following
fetures are not support with this patchset:
  - ISP 
  - MIPI-CSI2
  - Master clock for camera sensor
  - Power regulator for the front end IC

Changes in v3:
  * get rid of struct sun6i_csi_ops
  * move sun6i-csi to new directory drivers/media/platform/sunxi
  * merge sun6i_csi.c and sun6i_csi_v3s.c into sun6i_csi.c
  * use generic fwnode endpoints parser
  * only support a single subdev to make things simple
  * many complaintion fix

Changes in v2: 
  * Change sunxi-csi to sun6i-csi
  * Rebase to media_tree master branch 

Following is the 'v4l2-compliance -s -f' output, I have test this
with both interlaced and progressive signal:

# ./v4l2-compliance -s -f
v4l2-compliance SHA   : 7b2d48ff594dcc2c9b395463441e5abb4f5e9439

Driver Info:
        Driver name   : sun6i-video
        Card type     : sun6i-csi
        Bus info      : platform:csi
        Driver version: 4.14.0
        Capabilities  : 0x84200001
                Video Capture
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps   : 0x04200001
                Video Capture
                Streaming
                Extended Pix Format

Compliance test for device /dev/video0 (not using libv4l2):

Required ioctls:
        test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
        test second video open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

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
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Test input 0:

        Control ioctls:
                test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
                test VIDIOC_QUERYCTRL: OK (Not Supported)
                test VIDIOC_G/S_CTRL: OK (Not Supported)
                test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
                test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
                test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
                Standard Controls: 0 Private Controls: 0

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
                test Scaling: OK (Not Supported)

        Codec ioctls:
                test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
                test VIDIOC_G_ENC_INDEX: OK (Not Supported)
                test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

        Buffer ioctls:
                test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
                test VIDIOC_EXPBUF: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test MMAP: OK                                     
        test USERPTR: OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Stream using all formats:
        test MMAP for Format HM12, Frame Size 1920x1080:
                Stride 2880, Field None: OK                                 
        test MMAP for Format NV12, Frame Size 1920x1080:
                Stride 2880, Field None: OK                                 
        test MMAP for Format NV21, Frame Size 1920x1080:
                Stride 2880, Field None: OK                                 
        test MMAP for Format YU12, Frame Size 1920x1080:
                Stride 2880, Field None: OK                                 
        test MMAP for Format YV12, Frame Size 1920x1080:
                Stride 2880, Field None: OK                                 
        test MMAP for Format NV16, Frame Size 1920x1080:
                Stride 3840, Field None: OK                                 
        test MMAP for Format NV61, Frame Size 1920x1080:
                Stride 3840, Field None: OK                                 
        test MMAP for Format 422P, Frame Size 1920x1080:
                Stride 3840, Field None: OK                                 

Total: 54, Succeeded: 54, Failed: 0, Warnings: 0


Yong Deng (3):
  media: V3s: Add support for Allwinner CSI.
  dt-bindings: media: Add Allwinner V3s Camera Sensor Interface (CSI)
  media: MAINTAINERS: add entries for Allwinner V3s CSI

 .../devicetree/bindings/media/sun6i-csi.txt        |  51 ++
 MAINTAINERS                                        |   8 +
 drivers/media/platform/Kconfig                     |   1 +
 drivers/media/platform/Makefile                    |   2 +
 drivers/media/platform/sunxi/sun6i-csi/Kconfig     |   9 +
 drivers/media/platform/sunxi/sun6i-csi/Makefile    |   3 +
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 918 +++++++++++++++++++++
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h | 146 ++++
 .../media/platform/sunxi/sun6i-csi/sun6i_csi_reg.h | 203 +++++
 .../media/platform/sunxi/sun6i-csi/sun6i_video.c   | 722 ++++++++++++++++
 .../media/platform/sunxi/sun6i-csi/sun6i_video.h   |  61 ++
 11 files changed, 2124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/sun6i-csi.txt
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_reg.h
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.h

-- 
1.8.3.1
