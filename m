From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH_V3 0/3] dma: dt: Add DMA driver for jz4780
Date: Thu, 26 Feb 2015 12:43:31 +0000
Message-ID: <1424954614-12589-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com
Cc: dan.j.williams@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alex@alex-smith.me.uk, Zubair.Kakakhel@imgtec.com
List-Id: devicetree@vger.kernel.org

Hi,

Here we have three patches that add a DMA driver for the Ingenic JZ4780 SoC.

JZ4780 support is still in-flight.

See http://patchwork.linux-mips.org/bundle/paulburton/ci20-v3.20/

These are based on 4.0-rc1.

Apart from the channel numbers, jz4740 and jz4780 are quite different.
The descriptor bit fields are different in a register
There is an extra register for stride in jz4780
jz4780 has more/different features in hardware.

Hence, we are unable to use the jz4740-dma driver.

V2->V3 changes
DMA bindings. See patches for details.

V1->V2 changes
Updates for dmaengine api changes.
Add residue support.
Details in the patch commit message

ZubairLK

Alex Smith (2):
  dt-bindings: dma: Add binding for jz4780-dma
  dma: jz4780: add driver for the Ingenic JZ4780 DMA controller

Zubair Lutfullah Kakakhel (1):
  MAINTAINERS: Add Ingenic JZ4780 DMA driver maintainer entry

 .../devicetree/bindings/dma/jz4780-dma.txt         |  56 ++
 MAINTAINERS                                        |   5 +
 drivers/dma/Kconfig                                |  10 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/dma-jz4780.c                           | 873 +++++++++++++++++++++
 include/dt-bindings/dma/jz4780-dma.h               |  49 ++
 6 files changed, 994 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/jz4780-dma.txt
 create mode 100644 drivers/dma/dma-jz4780.c
 create mode 100644 include/dt-bindings/dma/jz4780-dma.h

-- 
1.9.1
