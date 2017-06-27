From: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Subject: [PATCH RFC 0/2] Initial Allwinner V3s CSI Support
Date: Tue, 27 Jun 2017 19:07:32 +0800
Message-ID: <1498561654-14658-1-git-send-email-yong.deng@magewell.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hugues.fruchet-qxv4g6HH51o@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, kamil-MZ2JYD8fkKLYtjvyW6yDsg@public.gmane.org, kieran+renesas-7hKh/agyDeatmTQ+vhA3Yw@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset add initial support for Allwinner V3s CSI.

Allwinner V3s SoC have two CSI module. CSI0 is used for MIPI interface
and CSI1 is used for parallel interface. This is not documented in
datatsheet but by testing and guess.

This patchset implement a v4l2 framework driver and add a binding 
documentation for it.

Currently, the driver only support the parallel interface. And has been
tested with a BT1120 signal which generating from FPGA. The following
fetures are not support with this patchset:
  - ISP
  - MIPI-CSI2
  - Master clock for camera sensor
  - Power regulator for the front end IC

Yong Deng (2):
  media: V3s: Add support for Allwinner CSI.
  dt-bindings: add binding documentation for Allwinner CSI

 .../devicetree/bindings/media/sunxi-csi.txt        |  51 ++
 drivers/media/platform/Kconfig                     |   1 +
 drivers/media/platform/Makefile                    |   2 +
 drivers/media/platform/sunxi-csi/Kconfig           |   8 +
 drivers/media/platform/sunxi-csi/Makefile          |   3 +
 drivers/media/platform/sunxi-csi/sunxi_csi.c       | 535 +++++++++++++
 drivers/media/platform/sunxi-csi/sunxi_csi.h       | 203 +++++
 drivers/media/platform/sunxi-csi/sunxi_csi_v3s.c   | 827 +++++++++++++++++++++
 drivers/media/platform/sunxi-csi/sunxi_csi_v3s.h   | 206 +++++
 drivers/media/platform/sunxi-csi/sunxi_video.c     | 667 +++++++++++++++++
 drivers/media/platform/sunxi-csi/sunxi_video.h     |  61 ++
 11 files changed, 2564 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/sunxi-csi.txt
 create mode 100644 drivers/media/platform/sunxi-csi/Kconfig
 create mode 100644 drivers/media/platform/sunxi-csi/Makefile
 create mode 100644 drivers/media/platform/sunxi-csi/sunxi_csi.c
 create mode 100644 drivers/media/platform/sunxi-csi/sunxi_csi.h
 create mode 100644 drivers/media/platform/sunxi-csi/sunxi_csi_v3s.c
 create mode 100644 drivers/media/platform/sunxi-csi/sunxi_csi_v3s.h
 create mode 100644 drivers/media/platform/sunxi-csi/sunxi_video.c
 create mode 100644 drivers/media/platform/sunxi-csi/sunxi_video.h

-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
