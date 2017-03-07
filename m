From: Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/4] Support for Synopsys DW CSI-2 Host
Date: Tue,  7 Mar 2017 14:37:47 +0000
Message-ID: <cover.1488885081.git.roliveir@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Jean-Christophe Trotin <jean-christophe.trotin-qxv4g6HH51o@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds support for the DW CSI-2 Host and also for a video
device associated with it. 

The first 2 patches are only for the DW CSI-2 Host and the last 2 are for
the video device.

Although this patchset is named as v1 there were already two patchsets
previous to this one, but with a different name: "Add support for the DW
IP Prototyping Kits for MIPI CSI-2 Host".

v3:
 - Correct description errors in Documentation
 - Remove empty functions
 - Change device caps and description setting
 - Remove left-over code
 - Add more VB2 io_modes
 - Add support for dma_contig
 - Correct spelling mistakes

v2: 
 - Add more detailed descriptions in the DT documentation
 - Add binding examples to DT documentation
 - Remove unnecessary debug structures
 - Remove unused fields in structures
 - Change variable types
 - Remove unused functions
 - Declare functions as static
 - Remove some prints
 - Add missing newlines.

Ramiro Oliveira (4):
  Documentation: dt: Add bindings documentation for DW MIPI CSI-2 Host
  media: platform: dwc: Support for DW CSI-2 Host
  Documentation: dt: Add bindings documentation for CSI-2 Host Video
    Platform
  media: platform: dwc: Support for CSI-2 Host video platform

 .../devicetree/bindings/media/snps,dw-mipi-csi.txt |  37 +
 .../devicetree/bindings/media/snps,plat-csi2.txt   |  77 ++
 MAINTAINERS                                        |   7 +
 drivers/media/platform/Kconfig                     |   1 +
 drivers/media/platform/Makefile                    |   2 +
 drivers/media/platform/dwc/Kconfig                 |  45 ++
 drivers/media/platform/dwc/Makefile                |   3 +
 drivers/media/platform/dwc/csi_video_device.c      | 721 ++++++++++++++++++
 drivers/media/platform/dwc/csi_video_device.h      |  83 +++
 drivers/media/platform/dwc/csi_video_plat.c        | 818 +++++++++++++++++++++
 drivers/media/platform/dwc/csi_video_plat.h        | 101 +++
 drivers/media/platform/dwc/dw_mipi_csi.c           | 653 ++++++++++++++++
 drivers/media/platform/dwc/dw_mipi_csi.h           | 181 +++++
 include/media/dwc/csi_host_platform.h              |  97 +++
 14 files changed, 2826 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/snps,dw-mipi-csi.txt
 create mode 100644 Documentation/devicetree/bindings/media/snps,plat-csi2.txt
 create mode 100644 drivers/media/platform/dwc/Kconfig
 create mode 100644 drivers/media/platform/dwc/Makefile
 create mode 100644 drivers/media/platform/dwc/csi_video_device.c
 create mode 100644 drivers/media/platform/dwc/csi_video_device.h
 create mode 100644 drivers/media/platform/dwc/csi_video_plat.c
 create mode 100644 drivers/media/platform/dwc/csi_video_plat.h
 create mode 100644 drivers/media/platform/dwc/dw_mipi_csi.c
 create mode 100644 drivers/media/platform/dwc/dw_mipi_csi.h
 create mode 100644 include/media/dwc/csi_host_platform.h

-- 
2.11.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
