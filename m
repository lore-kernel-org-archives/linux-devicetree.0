From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v4 0/2] dmaengine: add UniPhier MIO DMAC driver
Date: Fri, 12 Oct 2018 01:41:01 +0900
Message-ID: <1539276063-5103-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

1/2: DT-binding
2/2: driver


Masahiro Yamada (2):
  dt-bindings: dmaengine: add DT binding for UniPhier MIO DMAC
  dmaengine: uniphier-mdmac: add UniPhier MIO DMAC driver

 .../devicetree/bindings/dma/uniphier-mio-dmac.txt  |  25 +
 MAINTAINERS                                        |   1 +
 drivers/dma/Kconfig                                |  11 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/uniphier-mdmac.c                       | 506 +++++++++++++++++++++
 5 files changed, 544 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/uniphier-mio-dmac.txt
 create mode 100644 drivers/dma/uniphier-mdmac.c

-- 
2.7.4
