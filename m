From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V6 7/7] ARM: dts: imx6sx-sabreauto: add egalax touch screen support
Date: Sat,  5 May 2018 16:29:23 +0800
Message-ID: <1525508963-7986-7-git-send-email-Anson.Huang@nxp.com>
References: <1525508963-7986-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525508963-7986-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, haibo.chen@freescale.com, fugang.duan@nxp.com, aisheng.dong@nxp.com, yibin.gong@nxp.com
Cc: Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add egalax touch screen support on i2c2 bus.

Signed-off-by: Haibo Chen <haibo.chen@freescale.com>
Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
changes since V5:
	improve pinctrl node name and touchscreen node name.
 arch/arm/boot/dts/imx6sx-sabreauto.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sx-sabreauto.dts b/arch/arm/boot/dts/imx6sx-sabreauto.dts
index 1dc5b58..3fe41d3 100644
--- a/arch/arm/boot/dts/imx6sx-sabreauto.dts
+++ b/arch/arm/boot/dts/imx6sx-sabreauto.dts
@@ -122,6 +122,12 @@
 };
 
 &iomuxc {
+	pinctrl_egalax_int: egalax-intgrp {
+		fsl,pins = <
+			MX6SX_PAD_SD4_RESET_B__GPIO6_IO_22      0x80000000
+		>;
+	};
+
 	pinctrl_enet1: enet1grp {
 		fsl,pins = <
 			MX6SX_PAD_ENET1_MDIO__ENET1_MDIO        0xa0b1
@@ -264,6 +270,16 @@
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
+	egalax_touchscreen@4 {
+		compatible = "eeti,egalax_ts";
+		reg = <0x04>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_egalax_int>;
+		interrupt-parent = <&gpio6>;
+		interrupts = <22 IRQ_TYPE_EDGE_FALLING>;
+		wakeup-gpios = <&gpio6 22 GPIO_ACTIVE_HIGH>;
+	};
+
 	pfuze100: pmic@8 {
 		compatible = "fsl,pfuze100";
 		reg = <0x08>;
-- 
2.7.4
