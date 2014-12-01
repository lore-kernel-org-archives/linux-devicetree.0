From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 00/10] Xilinx Video IP Core support
Date: Mon,  1 Dec 2014 22:13:30 +0200
Message-ID: <1417464820-6718-1-git-send-email-laurent.pinchart@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: Michal Simek <michal.simek@xilinx.com>, Chris Kohn <christian.kohn@xilinx.com>, Hyun Kwon <hyun.kwon@xilinx.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

Here's the fourth version of the Xilinx FPGA Video IP Cores kernel driv=
ers.

I won't detail in great lengths the Xilinx Video IP architecture here, =
as that
would result in dozens of pages of documentation. The interested reader=
 can
refer to the Zynq ZC702 Base TRD (Targeted Reference Design) User Guide
(http://www.xilinx.com/support/documentation/boards_and_kits/zc702_zvik=
/2014_2/ug925-zynq-zc702-base-trd.pdf).

In a nutshell, the Xilinx Video IP Cores architecture specifies how
video-related IP cores need to be designed to interoperate and how to a=
ssemble
them in pipelines of various complexities. The concepts map neatly to t=
he
media controller architecture, which this patch set uses extensively.

The series starts with various new V4L2 core features, bug fixes or cle=
anups,
with a small documentation enhancement (01/10), the addition of new med=
ia bus
formats needed by the new drivers (02/10 to 04/10) and a new V4L2 OF li=
nk
parsing function (05/10).

The next two patches (06/10 and 07/10) fix two race conditions in video=
buf2.
I'd like to get them in v3.19, either as part of this series or indepen=
dently.

The last three patches are the core of this series.

Patch 08/10 adds support for the Xilinx Video IP architecture core in t=
he form
of a base object to model video IP cores (xilinx-vip.c - Video IP), a
framework that parses a DT representation of a video pipeline and conne=
cts the
corresponding V4L2 subdevices together (xilinx-vipp.c - Video IP Pipeli=
ne) and
a glue between the Video DMA engine driver and the V4L2 API (xilinx-dma=
=2Ec).

Patch =C3=A09/10 adds a driver for the Video Timing Controller (VTC) IP=
 core. While
not strictly a video processing IP core, the VTC is required by other v=
ideo IP
core drivers.

=46inally, patch 10/10 adds a first video IP core driver for the Test P=
attern
Generator (TPG). Drivers for other IP cores will be added in the future=
=2E

Changes since v3:

- Drop the three Xilinx Video DMA patches since they have been merged i=
n the
  dmaengine tree
- Manage the subdevs clocks explicitly
- Add and use resource init and cleanup helpers
- Rename V4L2_MBUS_FMT_* to MEDIA_BUS_FMT_*
- Cleanup unused vdma configuration.
- Return buffers to vb2 when media pipeline start fails

Cc: devicetree@vger.kernel.org

Hyun Kwon (2):
  v4l: Sort YUV formats of v4l2_mbus_pixelcode
  v4l: Add VUY8 24 bits bus format

Laurent Pinchart (8):
  media: entity: Document the media_entity_ops structure
  v4l: Add RBG and RGB 8:8:8 media bus formats on 24 and 32 bit busses
  v4l: of: Add v4l2_of_parse_link() function
  v4l: vb2: Fix race condition in vb2_fop_poll
  v4l: vb2: Fix race condition in _vb2_fop_release
  v4l: xilinx: Add Xilinx Video IP core
  v4l: xilinx: Add Video Timing Controller driver
  v4l: xilinx: Add Test Pattern Generator driver

 Documentation/DocBook/media/v4l/subdev-formats.xml | 719 +++++++++----=
---
 .../devicetree/bindings/media/xilinx/video.txt     |  52 ++
 .../devicetree/bindings/media/xilinx/xlnx,v-tc.txt |  33 +
 .../bindings/media/xilinx/xlnx,v-tpg.txt           |  71 ++
 .../bindings/media/xilinx/xlnx,video.txt           |  55 ++
 MAINTAINERS                                        |  10 +
 drivers/media/platform/Kconfig                     |   1 +
 drivers/media/platform/Makefile                    |   2 +
 drivers/media/platform/xilinx/Kconfig              |  23 +
 drivers/media/platform/xilinx/Makefile             |   5 +
 drivers/media/platform/xilinx/xilinx-dma.c         | 753 +++++++++++++=
++++
 drivers/media/platform/xilinx/xilinx-dma.h         | 109 +++
 drivers/media/platform/xilinx/xilinx-tpg.c         | 925 +++++++++++++=
++++++++
 drivers/media/platform/xilinx/xilinx-vip.c         | 296 +++++++
 drivers/media/platform/xilinx/xilinx-vip.h         | 233 ++++++
 drivers/media/platform/xilinx/xilinx-vipp.c        | 669 +++++++++++++=
++
 drivers/media/platform/xilinx/xilinx-vipp.h        |  49 ++
 drivers/media/platform/xilinx/xilinx-vtc.c         | 380 +++++++++
 drivers/media/platform/xilinx/xilinx-vtc.h         |  42 +
 drivers/media/v4l2-core/v4l2-of.c                  |  61 ++
 drivers/media/v4l2-core/videobuf2-core.c           |  35 +-
 include/media/media-entity.h                       |   9 +
 include/media/v4l2-of.h                            |  27 +
 include/uapi/linux/Kbuild                          |   1 +
 include/uapi/linux/media-bus-format.h              |  19 +-
 include/uapi/linux/xilinx-v4l2-controls.h          |  73 ++
 26 files changed, 4310 insertions(+), 342 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/vide=
o.txt
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx=
,v-tc.txt
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx=
,v-tpg.txt
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx=
,video.txt
 create mode 100644 drivers/media/platform/xilinx/Kconfig
 create mode 100644 drivers/media/platform/xilinx/Makefile
 create mode 100644 drivers/media/platform/xilinx/xilinx-dma.c
 create mode 100644 drivers/media/platform/xilinx/xilinx-dma.h
 create mode 100644 drivers/media/platform/xilinx/xilinx-tpg.c
 create mode 100644 drivers/media/platform/xilinx/xilinx-vip.c
 create mode 100644 drivers/media/platform/xilinx/xilinx-vip.h
 create mode 100644 drivers/media/platform/xilinx/xilinx-vipp.c
 create mode 100644 drivers/media/platform/xilinx/xilinx-vipp.h
 create mode 100644 drivers/media/platform/xilinx/xilinx-vtc.c
 create mode 100644 drivers/media/platform/xilinx/xilinx-vtc.h
 create mode 100644 include/uapi/linux/xilinx-v4l2-controls.h

--=20
Regards,

Laurent Pinchart
