From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: [PATCH v4 3/6] reset: imx7: Add PCIE_CTRL_APPS_TURNOFF
Date: Tue, 14 Aug 2018 19:50:17 +0300
Message-ID: <88a5997e37d048cfc2dabb44cc13dce89c93d5eb.1534264292.git.leonard.crestez@nxp.com>
References: <cover.1534264292.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1534264292.git.leonard.crestez@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Richard Zhu <hongxing.zhu@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>, linux-pci@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

This is required for the imx pci driver to send the PME_Turn_Off TLP.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 drivers/reset/reset-imx7.c             | 1 +
 include/dt-bindings/reset/imx7-reset.h | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/reset-imx7.c b/drivers/reset/reset-imx7.c
index 97d9f08271c5..77911fa8f31d 100644
--- a/drivers/reset/reset-imx7.c
+++ b/drivers/reset/reset-imx7.c
@@ -65,10 +65,11 @@ static const struct imx7_src_signal imx7_src_signals[IMX7_RESET_NUM] = {
 	[IMX7_RESET_MIPI_PHY_MRST]	= { SRC_MIPIPHY_RCR, BIT(1) },
 	[IMX7_RESET_MIPI_PHY_SRST]	= { SRC_MIPIPHY_RCR, BIT(2) },
 	[IMX7_RESET_PCIEPHY]		= { SRC_PCIEPHY_RCR, BIT(2) | BIT(1) },
 	[IMX7_RESET_PCIEPHY_PERST]	= { SRC_PCIEPHY_RCR, BIT(3) },
 	[IMX7_RESET_PCIE_CTRL_APPS_EN]	= { SRC_PCIEPHY_RCR, BIT(6) },
+	[IMX7_RESET_PCIE_CTRL_APPS_TURNOFF] = { SRC_PCIEPHY_RCR, BIT(11) },
 	[IMX7_RESET_DDRC_PRST]		= { SRC_DDRC_RCR, BIT(0) },
 	[IMX7_RESET_DDRC_CORE_RST]	= { SRC_DDRC_RCR, BIT(1) },
 };
 
 static struct imx7_src *to_imx7_src(struct reset_controller_dev *rcdev)
diff --git a/include/dt-bindings/reset/imx7-reset.h b/include/dt-bindings/reset/imx7-reset.h
index 63948170c7b2..31b3f87dde9a 100644
--- a/include/dt-bindings/reset/imx7-reset.h
+++ b/include/dt-bindings/reset/imx7-reset.h
@@ -54,9 +54,11 @@
  */
 #define IMX7_RESET_PCIE_CTRL_APPS_EN	22
 #define IMX7_RESET_DDRC_PRST		23
 #define IMX7_RESET_DDRC_CORE_RST	24
 
-#define IMX7_RESET_NUM			25
+#define IMX7_RESET_PCIE_CTRL_APPS_TURNOFF 25
+
+#define IMX7_RESET_NUM			26
 
 #endif
 
-- 
2.17.1
