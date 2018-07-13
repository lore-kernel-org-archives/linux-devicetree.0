From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH 2/3] ARM: dts: imx6sll-evk: correct lcd regulator GPIO pin
Date: Fri, 13 Jul 2018 15:58:26 +0800
Message-ID: <1531468707-25737-2-git-send-email-Anson.Huang@nxp.com>
References: <1531468707-25737-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531468707-25737-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On i.MX6SLL EVK board, lcd regulator is controlled
by GPIO4 IO03 using MX6SLL_PAD_KEY_ROW5__GPIO4_IO03 pin,
NOT MX6SLL_PAD_ECSPI1_SCLK__GPIO4_IO08, correct it.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6sll-evk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6sll-evk.dts b/arch/arm/boot/dts/imx6sll-evk.dts
index cc5cf5e..41e87e6 100644
--- a/arch/arm/boot/dts/imx6sll-evk.dts
+++ b/arch/arm/boot/dts/imx6sll-evk.dts
@@ -74,7 +74,7 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_reg_lcd>;
 		regulator-name = "lcd-pwr";
-		gpio = <&gpio4 8 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio4 3 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -289,7 +289,7 @@
 
 	pinctrl_reg_lcd: reglcdgrp {
 		fsl,pins = <
-			MX6SLL_PAD_ECSPI1_SCLK__GPIO4_IO08 0x17059
+			MX6SLL_PAD_KEY_ROW5__GPIO4_IO03 0x17059
 		>;
 	};
 
-- 
2.7.4
