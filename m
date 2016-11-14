From: Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/2] Add support for the DW IP Prototyping Kits for MIPI CSI-2 Host
Date: Mon, 14 Nov 2016 14:20:21 +0000
Message-ID: <cover.1479132355.git.roliveir@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, simon.horman-wFxRvT7yatFl57MIdRCFDg@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset adds basic support for the DW CSI-2 Host IPK. There are 
some parts of the kit that aren't currently supported by this media 
platform driver but will be in the future.

Ramiro Oliveira (2):
  Add Documentation for Media Device, Video Device, and Synopsys DW MIPI
    CSI-2 Host
  Add basic support for DW CSI-2 Host IPK

 .../devicetree/bindings/media/snps,dw-mipi-csi.txt |  27 +
 .../devicetree/bindings/media/snps,plat-ipk.txt    |   9 +
 .../bindings/media/snps,video-device.txt           |  12 +
 MAINTAINERS                                        |   7 +
 drivers/media/platform/Kconfig                     |   1 +
 drivers/media/platform/Makefile                    |   2 +
 drivers/media/platform/dwc/Kconfig                 |  36 +
 drivers/media/platform/dwc/Makefile                |   3 +
 drivers/media/platform/dwc/dw_mipi_csi.c           | 687 +++++++++++++++++
 drivers/media/platform/dwc/dw_mipi_csi.h           | 179 +++++
 drivers/media/platform/dwc/plat_ipk.c              | 835 +++++++++++++++++++++
 drivers/media/platform/dwc/plat_ipk.h              |  97 +++
 drivers/media/platform/dwc/plat_ipk_video.h        |  97 +++
 drivers/media/platform/dwc/video_device.c          | 741 ++++++++++++++++++
 drivers/media/platform/dwc/video_device.h          | 101 +++
 15 files changed, 2834 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/snps,dw-mipi-csi.txt
 create mode 100644 Documentation/devicetree/bindings/media/snps,plat-ipk.txt
 create mode 100644 Documentation/devicetree/bindings/media/snps,video-device.txt
 create mode 100644 drivers/media/platform/dwc/Kconfig
 create mode 100644 drivers/media/platform/dwc/Makefile
 create mode 100644 drivers/media/platform/dwc/dw_mipi_csi.c
 create mode 100644 drivers/media/platform/dwc/dw_mipi_csi.h
 create mode 100644 drivers/media/platform/dwc/plat_ipk.c
 create mode 100644 drivers/media/platform/dwc/plat_ipk.h
 create mode 100644 drivers/media/platform/dwc/plat_ipk_video.h
 create mode 100644 drivers/media/platform/dwc/video_device.c
 create mode 100644 drivers/media/platform/dwc/video_device.h

-- 
2.10.2


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
