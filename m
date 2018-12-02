From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 5/9] ARM: dts: imx7d-pico: Pass the Ethernet PHY reset GPIO
Date: Sun,  2 Dec 2018 19:25:16 -0200
Message-ID: <20181202212520.16650-6-otavio@ossystems.com.br>
References: <20181202212520.16650-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181202212520.16650-1-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Fabio Estevam <festevam@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <festevam@gmail.com>

Pass the "phy-reset-gpios" property in order to describe the GPIO
that performs the Ethernet PHY reset.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 arch/arm/boot/dts/imx7d-pico.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-pico.dtsi b/arch/arm/boot/dts/imx7d-pico.dtsi
index cb30bded1e4a..35791a1adabf 100644
--- a/arch/arm/boot/dts/imx7d-pico.dtsi
+++ b/arch/arm/boot/dts/imx7d-pico.dtsi
@@ -88,6 +88,7 @@
 	phy-mode = "rgmii";
 	phy-handle = <&ethphy0>;
 	fsl,magic-packet;
+	phy-reset-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	mdio {
@@ -290,6 +291,7 @@
 			MX7D_PAD_ENET1_RGMII_RD2__ENET1_RGMII_RD2	0x1
 			MX7D_PAD_ENET1_RGMII_RD3__ENET1_RGMII_RD3	0x1
 			MX7D_PAD_ENET1_RGMII_RX_CTL__ENET1_RGMII_RX_CTL	0x1
+			MX7D_PAD_SD3_RESET_B__GPIO6_IO11                0x1  /* Ethernet reset */
 		>;
 	};
 
-- 
2.19.2
