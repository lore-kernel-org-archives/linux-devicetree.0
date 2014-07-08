From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/2] new Atmel DMA controller
Date: Tue, 8 Jul 2014 15:11:34 +0200
Message-ID: <1404825096-15724-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This set of patches introduces support for the new Atmel DMA controller know as
XDMAC and available on SAMA5D4.

Documentation has been updated including Mark and Sergei comments. Some locking
issues have been fixed thanks to Leilei.


Changes from:
- v2
  - documentation updated
  - fix locking issues
- v1
  - add power management stuff
  - check maxburst value
  - revert subsys_initcall remove, EPROBE_DEFER not yet available on the kernel
  version I use to do the tests, moreover other devices are not ready to use it

- RFC:
  - DMA_SUCCESS replaced by DMA_COMPLETE
  - fix memcpy issue caused by a mistake in interfaces used
  - add filter function
  - remove some parameters from device tree since we can get them through the
  dma slave configuration
  - use readl/writel relaxed
  - remove subsys_initcall
  - synchronize irq before killing tasklets
  - use BIT macro
  - misc cleanup

Ludovic Desroches (2):
  dma: at_xdmac: creation of the atmel eXtended DMA Controller driver
  ARM: dts: at_xdmac: add bindings documentation

 .../devicetree/bindings/dma/atmel-xdma.txt         |   48 +
 drivers/dma/Kconfig                                |    7 +
 drivers/dma/Makefile                               |    1 +
 drivers/dma/at_xdmac.c                             | 1181 ++++++++++++++++++++
 drivers/dma/at_xdmac.h                             |  308 +++++
 include/dt-bindings/dma/at91.h                     |   25 +
 6 files changed, 1570 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/atmel-xdma.txt
 create mode 100644 drivers/dma/at_xdmac.c
 create mode 100644 drivers/dma/at_xdmac.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
