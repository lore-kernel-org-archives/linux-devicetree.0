From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
Subject: [PATCH 03/12] ARM: dts: imx7d: cl-som-imx7: fix i2c2
Date: Mon, 26 Aug 2019 16:37:51 +0100
Message-ID: <20190826153800.35400-3-git@andred.net>
References: <20190826153800.35400-1-git@andred.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190826153800.35400-1-git@andred.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>, Ilya Ledvich <ilya@compulab.co.il>, Igor Grinberg <grinberg@compulab.co.il>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

I2C2 is configured incorrectly at the moment:
* update i2c2 to actually work (fix incorrect pinctrl assignments)
* add the i2c2 bus recovery information [1]

[1] Note that scl is being marked as GPIO_OPEN_DRAIN even
though the i.MX pinctrl driver does not support enabling
open drain directly - it is enabled by the fixed pinmux
entry.
So while this flag has no effect in practice, it needs
to be there purely so as to fix the following warning
from gpiolib:
    gpio-6 (scl): enforced open drain please flag it properly in DT/ACPI DSDT/board file
as that is the mode requested by i2c-imx.c

Signed-off-by: André Draszik <git@andred.net>
Cc: Ilya Ledvich <ilya@compulab.co.il>
Cc: Igor Grinberg <grinberg@compulab.co.il>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 26 +++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
index e0432a3aa36f..ec82f4738c4f 100644
--- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
@@ -72,8 +72,11 @@
 };
 
 &i2c2 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-1 = <&pinctrl_i2c2_recovery>;
+	sda-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio1 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pmic: pmic@8 {
@@ -236,13 +239,6 @@
 		>;
 	};
 
-	pinctrl_i2c2: i2c2grp {
-		fsl,pins = <
-			MX7D_PAD_I2C2_SDA__I2C2_SDA		0x4000007f
-			MX7D_PAD_I2C2_SCL__I2C2_SCL		0x4000007f
-		>;
-	};
-
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX7D_PAD_UART1_TX_DATA__UART1_DCE_TX	0x79
@@ -273,4 +269,18 @@
 			MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4	0x34
 		>;
 	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO07__I2C2_SDA	0x4000000f
+			MX7D_PAD_LPSR_GPIO1_IO06__I2C2_SCL	0x4000000f
+		>;
+	};
+
+	pinctrl_i2c2_recovery: i2c2recoverygrp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO07__GPIO1_IO7	0x4000007f
+			MX7D_PAD_LPSR_GPIO1_IO06__GPIO1_IO6	0x4000007f
+		>;
+	};
 };
-- 
2.23.0.rc1
