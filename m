From: jassisinghbrar@gmail.com
Subject: [PATCH 0/2] Add support for AXI DMA controller on Milbeaut series
Date: Sun, 18 Aug 2019 00:21:54 -0500
Message-ID: <20190818052154.17789-1-jassisinghbrar@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: vkoul@kernel.org, robh+dt@kernel.org, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Jassi Brar <jaswinder.singh@linaro.org>

The following series adds AXI DMA (XDMAC) controller support on Milbeaut series.
This controller is capable of only Mem<->MEM transfers. Number of channels is
configurable {2,4,8}

Jassi Brar (2):
  dt-bindings: milbeaut-m10v-xdmac: Add Socionext Milbeaut XDMAC
    bindings
  dmaengine: milbeaut-xdmac: Add XDMAC driver for Milbeaut platforms

 .../bindings/dma/milbeaut-m10v-xdmac.txt      |  24 +
 drivers/dma/Kconfig                           |  10 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/milbeaut-xdmac.c                  | 426 ++++++++++++++++++
 4 files changed, 461 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/milbeaut-m10v-xdmac.txt
 create mode 100644 drivers/dma/milbeaut-xdmac.c

-- 
2.17.1
