From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH 0/2] dt: dma: Add DMA driver for jz4780
Date: Thu, 29 Jan 2015 12:19:37 +0000
Message-ID: <1422533980-42761-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com, dan.j.williams@intel.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, Zubair.Kakakhel@imgtec.com
List-Id: devicetree@vger.kernel.org

Hi,

Here we have two patches that add a DMA driver for the Ingenic JZ4780 SoC.

JZ4780 support is still in-flight.

See http://patchwork.linux-mips.org/bundle/paulburton/ci20-v3.20/

These are based on 3.19-rc6.

Apart from the channel numbers, jz4740 and jz4780 are quite different.
jz4780 has many more features in hardware.

Hence, we are unable to use the jz4740-dma driver.

ZubairLK

Alex Smith (2):
  dt: dma: Add DT binding document for jz4780-dma
  dma: jz4780: add driver for the Ingenic JZ4780 DMA controller

 .../devicetree/bindings/dma/jz4780-dma.txt         |  59 ++
 drivers/dma/Kconfig                                |  10 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/dma-jz4780.c                           | 856 +++++++++++++++++++++
 include/dt-bindings/dma/jz4780-dma.h               |  49 ++
 5 files changed, 975 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/jz4780-dma.txt
 create mode 100644 drivers/dma/dma-jz4780.c
 create mode 100644 include/dt-bindings/dma/jz4780-dma.h

-- 
1.9.1
