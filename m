From: jassisinghbrar@gmail.com
Subject: [PATCH v2 0/2] Add support for AHB DMA controller on Milbeaut series
Date: Sun, 18 Aug 2019 00:16:47 -0500
Message-ID: <20190818051647.17475-1-jassisinghbrar@gmail.com>
References: <20190613005109.1867-1-jassisinghbrar@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613005109.1867-1-jassisinghbrar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: vkoul@kernel.org, robh+dt@kernel.org, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Jassi Brar <jaswinder.singh@linaro.org>

Changes since v1:
1) Drop uncessary headers from driver
2) Some Cosmetic changes.
3) Define macro for magic numbers
4) Specify constraints on number of channels/irq in DT bindings

Jassi Brar (2):
  dt-bindings: milbeaut-m10v-hdmac: Add Socionext Milbeaut HDMAC
    bindings
  dmaengine: milbeaut-hdmac: Add HDMAC driver for Milbeaut platforms

 .../bindings/dma/milbeaut-m10v-hdmac.txt      |  32 +
 drivers/dma/Kconfig                           |  10 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/milbeaut-hdmac.c                  | 571 ++++++++++++++++++
 4 files changed, 614 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt
 create mode 100644 drivers/dma/milbeaut-hdmac.c

-- 
2.17.1
