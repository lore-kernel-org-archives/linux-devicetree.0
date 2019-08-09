From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
Subject: [PATCH] ARM: dts: imx7d: cl-som-imx7: make ethernet work again
Date: Fri,  9 Aug 2019 04:12:27 +0100
Message-ID: <20190809031227.3319-1-git@andred.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>, Ilya Ledvich <ilya@compulab.co.il>, Igor Grinberg <grinberg@compulab.co.il>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Recent changes to the atheros at803x driver caused
ethernet to stop working on this board.
In particular commit 6d4cd041f0af
("net: phy: at803x: disable delay only for RGMII mode")
and commit cd28d1d6e52e
("net: phy: at803x: Disable phy delay for RGMII mode")
fix the AR8031 driver to configure the phy's (RX/TX)
delays as per the 'phy-mode' in the device tree.

This now prevents ethernet from working on this board.

It used to work before those commits, because the
AR8031 comes out of reset with RX delay enabled, and
the at803x driver didn't touch the delay configuration
at all when "rgmii" mode was selected, and because
arch/arm/mach-imx/mach-imx7d.c:ar8031_phy_fixup()
unconditionally enables TX delay.

Since above commits ar8031_phy_fixup() also has no
effect anymore, and the end-result is that all delays
are disabled in the phy, no ethernet.

Update the device tree to restore functionality.

Signed-off-by: André Draszik <git@andred.net>
CC: Ilya Ledvich <ilya@compulab.co.il>
CC: Igor Grinberg <grinberg@compulab.co.il>
CC: Rob Herring <robh+dt@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Fabio Estevam <festevam@gmail.com>
CC: NXP Linux Team <linux-imx@nxp.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
index e61567437d73..62d5e9a4a781 100644
--- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
@@ -44,7 +44,7 @@
 			  <&clks IMX7D_ENET1_TIME_ROOT_CLK>;
 	assigned-clock-parents = <&clks IMX7D_PLL_ENET_MAIN_100M_CLK>;
 	assigned-clock-rates = <0>, <100000000>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy0>;
 	fsl,magic-packet;
 	status = "okay";
@@ -70,7 +70,7 @@
 			  <&clks IMX7D_ENET2_TIME_ROOT_CLK>;
 	assigned-clock-parents = <&clks IMX7D_PLL_ENET_MAIN_100M_CLK>;
 	assigned-clock-rates = <0>, <100000000>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy1>;
 	fsl,magic-packet;
 	status = "okay";
-- 
2.20.1
