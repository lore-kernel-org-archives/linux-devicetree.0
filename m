From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 0/3] add support for Mediatek High-Speed DMA controller on MT7622 and MT7623 SoC
Date: Thu, 1 Feb 2018 11:45:22 +0800
Message-ID: <cover.1517454174.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Changes since v2:
- remove extra tasklets and refactor driver for letting descriptors being processed ASAP.
- add more comments stating the relevant logic
- remove unused macro and variables
- change to use the disclaimer with SPDX identifier
- add mt7622 support
- refine hardware initialization sequence
- add tx_status support for DMA_RESIDUE_GRANULARITY_SEGMENT
- refine remove handler with killing vc's tasklet

Changes since v1:
- fix typo in the commit message.
- delete status shown in the dt-binding example.

This patchset introduces support for MediaTek High-Speed DMA controller
(MTK-HSDMA) Currently, the driver is already tested successfully with
dmatest module on MT7622 and MT7623 SoC. 

MTK-HSDMA on MT7622/23 SoC has a single ring which is dedicated for
doing memory-to-memory transfer through ring-based descriptor management.
Even though there is only a single ring available inside HSDMA, the
driver is being extended to the support for multiple virtual channels
processing simultaneously by means of DMA_VIRTUAL_CHANNELS.

Sean Wang (3):
  dt-bindings: dmaengine: Add MediaTek High-Speed DMA controller
    bindings
  dmaengine: mediatek: Add MediaTek High-Speed DMA controller for MT7622
    and MT7623 SoC
  dmaengine: mediatek: update MAINTAINERS entry with MediaTek DMA driver

 .../devicetree/bindings/dma/mtk-hsdma.txt          |   33 +
 MAINTAINERS                                        |    9 +
 drivers/dma/Kconfig                                |    2 +
 drivers/dma/Makefile                               |    1 +
 drivers/dma/mediatek/Kconfig                       |   13 +
 drivers/dma/mediatek/Makefile                      |    1 +
 drivers/dma/mediatek/mtk-hsdma.c                   | 1045 ++++++++++++++++++++
 7 files changed, 1104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/mtk-hsdma.txt
 create mode 100644 drivers/dma/mediatek/Kconfig
 create mode 100644 drivers/dma/mediatek/Makefile
 create mode 100644 drivers/dma/mediatek/mtk-hsdma.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
