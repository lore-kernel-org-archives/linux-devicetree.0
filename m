From: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v10 0/2] Initial Allwinner V3s CSI Support
Date: Fri,  4 May 2018 14:44:08 +0800
Message-ID: <1525416248-36076-1-git-send-email-yong.deng@magewell.com>
Reply-To: yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBD2JNYHK4MEBBAMDWDLQKGQE2AFFJCI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Cc: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Todor Tomov <todor.tomov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-med
List-Id: devicetree@vger.kernel.org

This patchset add initial support for Allwinner V3s CSI.

Allwinner V3s SoC features two CSI module. CSI0 is used for MIPI CSI-2
interface and CSI1 is used for parallel interface. This is not
documented in datasheet but by test and guess.

This patchset implement a v4l2 framework driver and add a binding=20
documentation for it.=20

Currently, the driver only support the parallel interface. And has been
tested with a BT1120 signal which generating from FPGA. The following
fetures are not support with this patchset:
  - ISP=20
  - MIPI-CSI2
  - Master clock for camera sensor
  - Power regulator for the front end IC

Changes in v10:
  * change sun6i_csi_is_format_support to sun6i_csi_is_format_supported
  * using media_entity_get_fwnode_pad to get source pad
  * switch media_entity_call to media_entity_setup_link
  * remove V4L2_INPUT_TYPE_CAMERA

Changes in v9:
  * Merge the patchs from Maxime:
    a. Fill dma_pfn_offset to accomodate for the RAM offset
    b. Reduce the error level
    c. Pass the sun6i_csi_dev pointer to our helpers
    d. Don't emit a warning when the configured format isn't found
    e. Support the YUYV format properly
    f. Invert the polaritie of all signals
    g. Expose controls on the v4l2_device

Changes in v8:
  * Revert to v6 and add 'hack' for PHYS_OFFSET.

Changes in v7:
  * Add 'depends on ARM' in Kconfig to avoid built with non-ARM arch.

Changes in v6:
  * Add Rob Herring's review tag.
  * Fix a NULL pointer dereference by picking Maxime Ripard's patch.
  * Add Maxime Ripard's test tag.

Changes in v5:
  * Using the new SPDX tags.
  * Fix MODULE_LICENSE.
  * Add many default cases and warning messages.
  * Detail the parallel bus properties
  * Fix some spelling and syntax mistakes.

Changes in v4:
  * Deal with the CSI 'INNER QUEUE'.
    CSI will lookup the next dma buffer for next frame before the
    the current frame done IRQ triggered. This is not documented
    but reported by Ond=C5=99ej Jirman.
    The BSP code has workaround for this too. It skip to mark the
    first buffer as frame done for VB2 and pass the second buffer
    to CSI in the first frame done ISR call. Then in second frame
    done ISR call, it mark the first buffer as frame done for VB2
    and pass the third buffer to CSI. And so on. The bad thing is
    that the first buffer will be written twice and the first frame
    is dropped even the queued buffer is sufficient.
    So, I make some improvement here. Pass the next buffer to CSI
    just follow starting the CSI. In this case, the first frame
    will be stored in first buffer, second frame in second buffer.
    This mothed is used to avoid dropping the first frame, it
    would also drop frame when lacking of queued buffer.
  * Fix: using a wrong mbus_code when getting the supported formats
  * Change all fourcc to pixformat
  * Change some function names

Changes in v3:
  * Get rid of struct sun6i_csi_ops
  * Move sun6i-csi to new directory drivers/media/platform/sunxi
  * Merge sun6i_csi.c and sun6i_csi_v3s.c into sun6i_csi.c
  * Use generic fwnode endpoints parser
  * Only support a single subdev to make things simple
  * Many complaintion fix

Changes in v2:=20
  * Change sunxi-csi to sun6i-csi
  * Rebase to media_tree master branch=20

Following is the 'v4l2-compliance -s -f' output, I have test this
with both interlaced and progressive signal:

# ./v4l2-compliance -s -f
v4l2-compliance SHA   : 6049ea8bd64f9d78ef87ef0c2b3dc9b5de1ca4a1

Driver Info:
        Driver name   : sun6i-video
        Card type     : sun6i-csi
        Bus info      : platform:csi
        Driver version: 4.15.0
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
        test MMAP: OK                                    =20
        test USERPTR: OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Stream using all formats:
        test MMAP for Format HM12, Frame Size 1280x720:
                Stride 1920, Field None: OK                                =
=20
        test MMAP for Format NV12, Frame Size 1280x720:
                Stride 1920, Field None: OK                                =
=20
        test MMAP for Format NV21, Frame Size 1280x720:
                Stride 1920, Field None: OK                                =
=20
        test MMAP for Format YU12, Frame Size 1280x720:
                Stride 1920, Field None: OK                                =
=20
        test MMAP for Format YV12, Frame Size 1280x720:
                Stride 1920, Field None: OK                                =
=20
        test MMAP for Format NV16, Frame Size 1280x720:
                Stride 2560, Field None: OK                                =
=20
        test MMAP for Format NV61, Frame Size 1280x720:
                Stride 2560, Field None: OK                                =
=20
        test MMAP for Format 422P, Frame Size 1280x720:
                Stride 2560, Field None: OK                                =
=20

Total: 54, Succeeded: 54, Failed: 0, Warnings: 0

Yong Deng (2):
  dt-bindings: media: Add Allwinner V3s Camera Sensor Interface (CSI)
  media: V3s: Add support for Allwinner CSI.

 .../devicetree/bindings/media/sun6i-csi.txt        |  59 ++
 MAINTAINERS                                        |   8 +
 drivers/media/platform/Kconfig                     |   1 +
 drivers/media/platform/Makefile                    |   2 +
 drivers/media/platform/sunxi/sun6i-csi/Kconfig     |   9 +
 drivers/media/platform/sunxi/sun6i-csi/Makefile    |   3 +
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 931 +++++++++++++++++=
++++
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h | 145 ++++
 .../media/platform/sunxi/sun6i-csi/sun6i_csi_reg.h | 196 +++++
 .../media/platform/sunxi/sun6i-csi/sun6i_video.c   | 767 +++++++++++++++++
 .../media/platform/sunxi/sun6i-csi/sun6i_video.h   |  53 ++
 11 files changed, 2174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/sun6i-csi.txt
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_reg.h
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.h

--=20
1.8.3.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
