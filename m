From: jassisinghbrar@gmail.com
Subject: [PATCH 0/2] Add support for AHB DMA controller on Milbeaut series
Date: Wed, 12 Jun 2019 19:51:09 -0500
Message-ID: <20190613005109.1867-1-jassisinghbrar@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, orito.takao@socionext.com, masami.hiramatsu@linaro.org, kasai.kazuhiro@socionext.com, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Jassi Brar <jaswinder.singh@linaro.org>

The following series adds AHB DMA (HDMAC) controller support on Milbeaut series.
This controller is capable of Mem<->MEM and DEV<->MEM transfer. But only DEV<->MEM
is currently supported.

Jassi Brar (2):
  dt-bindings: milbeaut-hdmac: Add Socionext Milbeaut HDMAC bindings
  dmaengine: milbeaut-hdmac: Add HDMAC driver for Milbeaut platforms

 .../bindings/dma/milbeaut-m10v-hdmac.txt           |  54 ++
 drivers/dma/Kconfig                           |  10 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/milbeaut-hdmac.c                  | 572 ++++++++++++++++++
 4 files changed, 637 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt
 create mode 100644 drivers/dma/milbeaut-hdmac.c

-- 
2.17.1
