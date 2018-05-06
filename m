From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V7 5/7] ARM: dts: imx6sx-sabreauto: add wdog external reset
Date: Sun,  6 May 2018 14:28:11 +0800
Message-ID: <1525588093-29994-5-git-send-email-Anson.Huang@nxp.com>
References: <1525588093-29994-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525588093-29994-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, fugang.duan@nxp.com, haibo.chen@nxp.com, yibin.gong@nxp.com, aisheng.dong@nxp.com
Cc: Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

i.MX6SX Sabre Auto board has GPIO1_IO13 pin can be
MUXed as WDOG output to reset PMIC, add this function
support.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
no change.
 arch/arm/boot/dts/imx6sx-sabreauto.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sx-sabreauto.dts b/arch/arm/boot/dts/imx6sx-sabreauto.dts
index fff0081..146d5ab 100644
--- a/arch/arm/boot/dts/imx6sx-sabreauto.dts
+++ b/arch/arm/boot/dts/imx6sx-sabreauto.dts
@@ -221,6 +221,12 @@
 			MX6SX_PAD_KEY_COL1__GPIO2_IO_11		0x17059
 		>;
 	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX6SX_PAD_GPIO1_IO13__WDOG1_WDOG_ANY	0x30b0
+		>;
+	};
 };
 
 &i2c2 {
@@ -359,3 +365,9 @@
 		#gpio-cells = <2>;
 	};
 };
+
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
+};
-- 
2.7.4
