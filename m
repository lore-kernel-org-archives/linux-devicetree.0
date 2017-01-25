From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH 0/2] dmaengine: Add DW AXI DMAC driver
Date: Wed, 25 Jan 2017 18:34:15 +0300
Message-ID: <1485358457-22957-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

This patch series add support for the DW AXI DMAC controller.

DW AXI DMAC is a part of upcoming development board from Synopsys.

In this driver implementation only DMA_MEMCPY and DMA_SG transfers
are supported.

Changes for v0:
 * Switch to virt-dma API (according to previous RFC)
 * Small fixies according to previous RFC
 * Add DT bindings

Eugeniy Paltsev (2):
  dt-bindings: Document the Synopsys DW AXI DMA bindings
  dmaengine: Add DW AXI DMAC driver

 .../devicetree/bindings/dma/snps,axi-dw-dmac.txt   |   33 +
 drivers/dma/Kconfig                                |    8 +
 drivers/dma/Makefile                               |    1 +
 drivers/dma/axi_dma_platform.c                     | 1060 ++++++++++++++++++++
 drivers/dma/axi_dma_platform.h                     |  124 +++
 drivers/dma/axi_dma_platform_reg.h                 |  189 ++++
 6 files changed, 1415 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/snps,axi-dw-dmac.txt
 create mode 100644 drivers/dma/axi_dma_platform.c
 create mode 100644 drivers/dma/axi_dma_platform.h
 create mode 100644 drivers/dma/axi_dma_platform_reg.h

-- 
2.5.5
