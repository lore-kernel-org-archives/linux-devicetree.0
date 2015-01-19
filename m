From: Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v3 0/3] dmaengine: APM X-Gene SoC DMA engine driver support
Date: Mon, 19 Jan 2015 18:11:06 +0530
Message-ID: <1421671269-19441-1-git-send-email-rsahu@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ddutile-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set implements the APM X-Gene SoC DMA driver
support to offload the DMA operations such as memory copy(memcpy),
scatter gathering.

Signed-off-by: Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
---

Rameshwar Prasad Sahu (3):
  dmaengine: Add support for APM X-Gene SoC DMA engine driver
  arm64: dts: Add APM X-Gene DMA device and DMA clock DTS nodes
  Documentation: dma: Add APM X-Gene SoC DMA engine driver documentation

 .../devicetree/bindings/dma/apm-xgene-dma.txt      |   49 +
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |   28 +
 drivers/dma/Kconfig                                |    8 +
 drivers/dma/Makefile                               |    1 +
 drivers/dma/xgene-dma.c                            | 1566 ++++++++++++++++++++
 5 files changed, 1652 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/apm-xgene-dma.txt
 create mode 100644 drivers/dma/xgene-dma.c

--
1.8.2.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
