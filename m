From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH 1/2] dt-bindings: reset: Fix typo in imx8mq resets
Date: Wed, 31 Jul 2019 18:43:30 +0200
Message-ID: <f4c58a4a1c7a115cb9756630535031d6e9777247.1564591352.git.agx@sigxcpu.org>
References: <cover.1564591352.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1564591352.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some of the mipi dsi resets were called

  IMX8MQ_RESET_MIPI_DIS__

instead of

  IMX8MQ_RESET_MIPI_DSI__

Since they're DSI related this looks like a typo.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 include/dt-bindings/reset/imx8mq-reset.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/reset/imx8mq-reset.h b/include/dt-bindings/reset/imx8mq-reset.h
index 57c592498aa0..bfa41b0e24f6 100644
--- a/include/dt-bindings/reset/imx8mq-reset.h
+++ b/include/dt-bindings/reset/imx8mq-reset.h
@@ -31,9 +31,9 @@
 #define IMX8MQ_RESET_OTG2_PHY_RESET		20
 #define IMX8MQ_RESET_MIPI_DSI_RESET_BYTE_N	21
 #define IMX8MQ_RESET_MIPI_DSI_RESET_N		22
-#define IMX8MQ_RESET_MIPI_DIS_DPI_RESET_N	23
-#define IMX8MQ_RESET_MIPI_DIS_ESC_RESET_N	24
-#define IMX8MQ_RESET_MIPI_DIS_PCLK_RESET_N	25
+#define IMX8MQ_RESET_MIPI_DSI_DPI_RESET_N	23
+#define IMX8MQ_RESET_MIPI_DSI_ESC_RESET_N	24
+#define IMX8MQ_RESET_MIPI_DSI_PCLK_RESET_N	25
 #define IMX8MQ_RESET_PCIEPHY			26
 #define IMX8MQ_RESET_PCIEPHY_PERST		27
 #define IMX8MQ_RESET_PCIE_CTRL_APPS_EN		28
-- 
2.20.1
