From: Kedareswara rao Appana <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/4] dmaengine: vdma: AXI DMAS Enhancments
Date: Fri, 10 Jun 2016 14:42:30 +0530
Message-ID: <1465549954-30220-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series does the following thing.
---> Add support for AXI DMA Multi-channel DMA mode.
---> Delete AXI DMA binding doc.
---> Rename the driver and update config options.

This patch series is created on top of the patch series
"dmaengine: Add Xilinx zynqmp dma engine driver support".

Kedareswara rao Appana (4):
  Documentation: DT: vdma: Update binding doc for multi-channel dma
    mode
  dmaengine: vdma: Add support for mulit-channel dma mode
  Documentation: DT: dma: Delete binding doc for AXI DMA
  dmaengine: dma: Rename driver and config

 .../devicetree/bindings/dma/xilinx/xilinx_dma.txt  |   92 ++++++--
 .../devicetree/bindings/dma/xilinx/xilinx_vdma.txt |  107 ---------
 drivers/dma/Kconfig                                |   13 +-
 drivers/dma/xilinx/Makefile                        |    2 +-
 drivers/dma/xilinx/{xilinx_vdma.c => xilinx_dma.c} |  242 ++++++++++++++++++--
 include/linux/dma/xilinx_dma.h                     |   18 ++
 6 files changed, 316 insertions(+), 158 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
 rename drivers/dma/xilinx/{xilinx_vdma.c => xilinx_dma.c} (91%)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
