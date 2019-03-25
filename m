From: Kazuhiro Kasai <kasai.kazuhiro@socionext.com>
Subject: [PATCH 0/2] Add support for AXI DMA controller on Milbeaut series
Date: Mon, 25 Mar 2019 13:15:12 +0900
Message-ID: <1553487314-9185-1-git-send-email-kasai.kazuhiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, orito.takao@socionext.com, sugaya.taichi@socionext.com, kanematsu.shinji@socionext.com, jaswinder.singh@linaro.org, masami.hiramatsu@linaro.org, linux-kernel@vger.kernel.org, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>
List-Id: devicetree@vger.kernel.org

The following series adds AXI DMA controller support on Milbeaut series.
This controller has only capable of memory to memory transfer.

Kazuhiro Kasai (2):
  dt-bindings: dmaengine: Add Milbeaut AXI DMA controller bindings
  dmaengine: milbeaut: Add Milbeaut AXI DMA controller

 .../devicetree/bindings/dma/xdmac-milbeaut.txt     |  24 ++
 drivers/dma/Kconfig                                |   8 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/xdmac-milbeaut.c                       | 353 +++++++++++++++++++++
 4 files changed, 386 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/xdmac-milbeaut.txt
 create mode 100644 drivers/dma/xdmac-milbeaut.c

--
1.9.1
