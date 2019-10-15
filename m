From: jassisinghbrar@gmail.com
Subject: [PATCH v4 0/2] Add support for AHB DMA controller on Milbeaut series
Date: Mon, 14 Oct 2019 22:33:01 -0500
Message-ID: <20191015033301.14791-1-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: vkoul@kernel.org, masami.hiramatsu@linaro.org, orito.takao@socionext.com, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Jassi Brar <jaswinder.singh@linaro.org>

The following series adds AHB DMA (HDMAC) controller support on Milbeaut series.
This controller is capable of Mem<->MEM and DEV<->MEM transfer. But only DEV<->MEM
is currently supported.

Changes since v3:
 # Drop unused variables
 # Add controller init instruction

Changes since v2:
 # Spelling mistake fix
 # Bug fix prep_slave - made local copy of sgl

Jassi Brar (2):
  dt-bindings: milbeaut-m10v-hdmac: Add Socionext Milbeaut HDMAC
    bindings
  dmaengine: milbeaut-hdmac: Add HDMAC driver for Milbeaut platforms

 .../bindings/dma/milbeaut-m10v-hdmac.txt      |  32 +
 drivers/dma/Kconfig                           |  10 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/milbeaut-hdmac.c                  | 581 ++++++++++++++++++
 4 files changed, 624 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt
 create mode 100644 drivers/dma/milbeaut-hdmac.c

-- 
2.20.1
