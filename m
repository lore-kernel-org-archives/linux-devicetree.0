From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: [PATCH v4 5/6] ARM: dts: imx7d: Add turnoff reset
Date: Tue, 14 Aug 2018 19:50:19 +0300
Message-ID: <c305d4da96ead7d570bf755fde9f0e0cc68f88e0.1534264292.git.leonard.crestez@nxp.com>
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
 arch/arm/boot/dts/imx7d.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index 7234e8330a57..efbdeaaa8dcd 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -144,12 +144,13 @@
 					 <&clks IMX7D_PLL_ENET_MAIN_100M_CLK>;
 
 		fsl,max-link-speed = <2>;
 		power-domains = <&pgc_pcie_phy>;
 		resets = <&src IMX7_RESET_PCIEPHY>,
-			 <&src IMX7_RESET_PCIE_CTRL_APPS_EN>;
-		reset-names = "pciephy", "apps";
+			 <&src IMX7_RESET_PCIE_CTRL_APPS_EN>,
+			 <&src IMX7_RESET_PCIE_CTRL_APPS_TURNOFF>;
+		reset-names = "pciephy", "apps", "turnoff";
 		status = "disabled";
 	};
 };
 
 &ca_funnel_ports {
-- 
2.17.1
