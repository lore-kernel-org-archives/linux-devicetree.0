From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Subject: [PATCH v3 0/5] Add STM32 DMAMUX support
Date: Thu, 6 Jul 2017 14:20:18 +0200
Message-ID: <1499343623-5964-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Dan Williams <dan.j.williams@intel.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, Fabrice GASNIER <fabrice.gasnier@st.com>, Herbert Xu <herbert@gondor.apana.org.au>, Fabien DESSENNE <fabien.dessenne@st.com>, Amelie Delaunay <amelie.delaunay@st.com>, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds support for the STM32 DMA multiplexer.
It allows to map any peripheral DMA request to any channel of the product
DMAs.
This IP has been introduced with STM32H7 SoC.

---
 Version history:
    v3:
        * change compatible to st,stm32h7-dmamux to be mode Soc specific
        * add verbosity in dma-cells
---

Pierre-Yves MORDRET (5):
  dt-bindings: Document the STM32 DMAMUX bindings
  dmaengine: Add STM32 DMAMUX driver
  dt-bindings: stm32-dma: Add property to handle STM32 DMAMUX
  dmaengine: stm32-dma: Add support for STM32 DMAMUX
  ARM: configs: stm32: Add DMAMUX support in STM32 defconfig

 .../devicetree/bindings/dma/stm32-dma.txt          |   5 +-
 .../devicetree/bindings/dma/stm32-dmamux.txt       |  60 +++++
 arch/arm/configs/stm32_defconfig                   |   1 +
 drivers/dma/Kconfig                                |   9 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/stm32-dma.c                            |  44 ++--
 drivers/dma/stm32-dmamux.c                         | 253 +++++++++++++++++++++
 include/linux/dma/stm32-dmamux.h                   |  21 ++
 8 files changed, 380 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/stm32-dmamux.txt
 create mode 100644 drivers/dma/stm32-dmamux.c
 create mode 100644 include/linux/dma/stm32-dmamux.h

-- 
2.7.4
