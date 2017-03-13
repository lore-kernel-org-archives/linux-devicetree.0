From: M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] Add STM32 MDMA driver
Date: Mon, 13 Mar 2017 16:06:37 +0100
Message-ID: <1489417599-31308-1-git-send-email-cedric.madianga@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds support for the STM32 MDMA controller.
The Master Direct memory access (MDMA) provides high-speed data transfer
between memory and memory or between peripherals and memory.
Contrary to STM32 DMA, the STM32 MDMA controller supports hardware LLI and
uses a larger integrated FIFO (128 vs 16 bytes)

M'boumba Cedric Madianga (2):
  dt-bindings: Document the STM32 MDMA bindings
  dmaengine: Add STM32 MDMA driver

 .../devicetree/bindings/dma/stm32-mdma.txt         |   94 ++
 drivers/dma/Kconfig                                |   12 +
 drivers/dma/Makefile                               |    1 +
 drivers/dma/stm32-mdma.c                           | 1570 ++++++++++++++++++++
 4 files changed, 1677 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/stm32-mdma.txt
 create mode 100644 drivers/dma/stm32-mdma.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
