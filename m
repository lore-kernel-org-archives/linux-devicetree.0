From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH v2 0/3] Fix imx8mq ratio 1:1 check
Date: Fri, 29 Mar 2019 08:21:27 -0700
Message-ID: <20190329152130.18411-1-angus@akkea.ca>
References: <20190328133828.20999-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328133828.20999-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: angus.ainslie@puri.sm
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Carlo Caione <ccaione@baylibre.com>, Daniel Baluta <daniel.baluta@nxp.com>, =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The imx8mq 1:1 check breaks some earlier imx chips so limit the
ratio check to the imx8mq.

Changes since v1:
Use the correct compatible string when fixing things.
Just add the imx8mq parts to the ratio check.
Drop the dt bindings update.

Angus Ainslie (Purism) (3):
  arm64: dts: imx8mq: Fix the fsl,imx8mq-sdma compatible string
  dmaengine: imx-sdma: Only check ratio on parts that support 1:1
  arm64: dts: imx8mq: Change ahb clock for imx8mq

 arch/arm64/boot/dts/freescale/imx8mq.dtsi |  4 ++--
 drivers/dma/imx-sdma.c                    | 15 ++++++++++++++-
 2 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.17.1
