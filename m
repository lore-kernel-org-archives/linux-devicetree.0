From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/2] dmaengine: mtk-hsdma: add support for Mediatek High-Speed DMA controller on MT7623 SoC
Date: Thu, 25 May 2017 15:12:47 +0800
Message-ID: <cover.1495695814.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, keyhaede-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Changes since v1:
- fix typo in the commit message.
- delete status shown in the dt-binding example.

This patchset introduces support for Mediatek High-Speed DMA controller
(MTK-HSDMA) Currently, the driver is already tested successfully with
dmatest module on MT7623 SoC. 

MTK-HSDMA on MT7623 SoC has the single channel which is dedicated to
memory-to-memory transfer through ring-based descriptor management.
Even though there is only one physical channel available inside HSDMA,
the driver is extended to the support for multiple virtual channels
processing simultaneously in round-round way by means of the feature
DMA_VIRTUAL_CHANNELS.

Sean Wang (2):
  dt-bindings: dmaengine: Add Mediatek High-Speed DMA controller
    bindings
  dmaengine: mtk-hsdma: Add Mediatek High-Speed DMA controller on MT7623
    SoC

 .../devicetree/bindings/dma/mtk-hsdma.txt          |  29 +
 drivers/dma/Kconfig                                |  14 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/mtk-hsdma.c                            | 890 +++++++++++++++++++++
 4 files changed, 934 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/mtk-hsdma.txt
 create mode 100644 drivers/dma/mtk-hsdma.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
