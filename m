From: M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/5] Add STM32 DMAMUX support
Date: Mon, 13 Mar 2017 15:15:56 +0100
Message-ID: <1489414561-28912-1-git-send-email-cedric.madianga@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds support for the STM32 DMA multiplexer.
It allows to map any peripheral DMA request to any channel of the product
DMAs.
This IP has been introduced with STM32H7 SoC.

M'boumba Cedric Madianga (5):
  dt-bindings: Document the STM32 DMAMUX bindings
  dmaengine: Add STM32 DMAMUX driver
  dt-bindings: stm32-dma: Add property to handle STM32 DMAMUX
  dmaengine: stm32-dma: Add support for STM32 DMAMUX
  ARM: configs: stm32: Add DMAMUX support in STM32 defconfig

 .../devicetree/bindings/dma/stm32-dma.txt          |   3 +
 .../devicetree/bindings/dma/stm32-dmamux.txt       |  57 +++++
 arch/arm/configs/stm32_defconfig                   |   1 +
 drivers/dma/Kconfig                                |   9 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/stm32-dma.c                            |  13 +-
 drivers/dma/stm32-dmamux.c                         | 231 +++++++++++++++++++++
 7 files changed, 312 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/stm32-dmamux.txt
 create mode 100644 drivers/dma/stm32-dmamux.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
