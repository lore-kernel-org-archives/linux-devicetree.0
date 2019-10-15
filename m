From: jassisinghbrar@gmail.com
Subject: [PATCH v3 0/2] Add support for AXI DMA controller on Milbeaut series
Date: Mon, 14 Oct 2019 22:31:16 -0500
Message-ID: <20191015033116.14580-1-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: vkoul@kernel.org, masami.hiramatsu@linaro.org, orito.takao@socionext.com, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Jassi Brar <jaswinder.singh@linaro.org>

The following series adds AXI DMA (XDMAC) controller support on Milbeaut series.
This controller is capable of only Mem<->MEM transfers. Number of channels is
configurable {2,4,8}

Changes Since v2:
 # Drop unused variable

Changes Since v1:
  # Spelling mistake fix

Jassi Brar (2):
  dt-bindings: milbeaut-m10v-xdmac: Add Socionext Milbeaut XDMAC
    bindings
  dmaengine: milbeaut-xdmac: Add XDMAC driver for Milbeaut platforms

 .../bindings/dma/milbeaut-m10v-xdmac.txt      |  24 +
 drivers/dma/Kconfig                           |  10 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/milbeaut-xdmac.c                  | 418 ++++++++++++++++++
 4 files changed, 453 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/milbeaut-m10v-xdmac.txt
 create mode 100644 drivers/dma/milbeaut-xdmac.c

-- 
2.20.1
