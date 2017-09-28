From: Pierre-Yves MORDRET <pierre-yves.mordret-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v5 0/4] Add STM32 MDMA driver
Date: Thu, 28 Sep 2017 17:36:39 +0200
Message-ID: <1506613003-28376-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabrice GASNIER <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Fabien DESSENNE <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>, Pierre-Yves MORDRET <pierre-yves.mordret-qxv4g6HH51o@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset adds support for the STM32 MDMA controller.
The Master Direct memory access (MDMA) provides high-speed data transfer
between memory and memory or between peripherals and memory.
Contrary to STM32 DMA, the STM32 MDMA controller supports hardware LLI and
uses a larger integrated FIFO (128 vs 16 bytes)
---
  Version history:
     v5:
         * Change 'platform_driver_probe' into
           'platform_driver_register' to manage defer mechanism
     v4:
         * Add safe getter/setter macros
         * forbid DMA preparation in cyclic mode yet
         * Optimize burst and memory width for memcpy
         * replace of_property_xx by device_property_xx
     v3:
         * Update header template
         * Unsigned expression compared with zero
         * Rework stm32_mdma_get_max_width
         * moved to src/dst case where they are used in set_xfer
         * Change of_property_* with device_property_*
         * Add dev_warn whether default value is used
         * Indentation
         * Add MODULE_*
     v2:
         * change compatible into st,stm32h7-mdma to be more SoC specific
         * Add MDMA support in DT for H7
         * Add MDMA support in STM32 defconfig
---
Pierre-Yves MORDRET (4):
  dt-bindings: Document the STM32 MDMA bindings
  dmaengine: Add STM32 MDMA driver
  ARM: dts: stm32: Add MDMA support for STM32H743 SoC
  ARM: configs: stm32: Add MDMA support in STM32 defconfig

 .../devicetree/bindings/dma/stm32-mdma.txt         |   94 ++
 arch/arm/boot/dts/stm32h743.dtsi                   |   10 +
 arch/arm/configs/stm32_defconfig                   |    1 +
 drivers/dma/Kconfig                                |   12 +
 drivers/dma/Makefile                               |    1 +
 drivers/dma/stm32-mdma.c                           | 1666 ++++++++++++++++++++
 6 files changed, 1784 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/stm32-mdma.txt
 create mode 100644 drivers/dma/stm32-mdma.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
