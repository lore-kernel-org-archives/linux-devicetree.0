From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH 0/4] Fix imx8mq ratio 1:1 check
Date: Thu, 28 Mar 2019 06:38:24 -0700
Message-ID: <20190328133828.20999-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: angus@akkea.ca
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, Carlo Caione <ccaione@baylibre.com>, Daniel Baluta <daniel.baluta@nxp.com>, =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The imx8mq 1:1 check breaks some earlier imx chips so limit the
ratio check to the imx8mq.

Angus Ainslie (Purism) (4):
  arm64: dts: imx8mq: Fix the fsl,imx8mq-sdma compatible string
  dmaengine: imx-sdma: Add clock ratio 1:1 check
  dt-bindings: Document the new imx8mq-sdma compatible string
  arm64: dts: imx8mq: Change ahb clock for imx8mq

 .../devicetree/bindings/dma/fsl-imx-sdma.txt  |  1 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  4 +--
 drivers/dma/imx-sdma.c                        | 31 ++++++++++++++++---
 3 files changed, 30 insertions(+), 6 deletions(-)

-- 
2.17.1
