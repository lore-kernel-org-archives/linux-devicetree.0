From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 126/258] ARM: dts: imx51-zii-rdu1: Do not specify "power-gpio" for hpa1
Date: Mon, 28 Jan 2019 10:57:12 -0500
Message-ID: <20190128155924.51521-126-sashal@kernel.org>
References: <20190128155924.51521-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190128155924.51521-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Andrey Smirnov <andrew.smirnov@gmail.com>

[ Upstream commit 79da07dec740a42c70963ebacbd2bf8866af9e20 ]

TPA6130A2 SD pin on RDU1 is not really controlled by SoC and instead
is only meant to notify the system that audio was "muted" by external
actors. To accommodate that, drop "power-gpio" property of hpa1 node as
well as specify a name for that GPIO so that userspace can access it.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Tested-by: Chris Healy <cphealy@gmail.com>
Signed-off-by: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/imx51-zii-rdu1.dts | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx51-zii-rdu1.dts b/arch/arm/boot/dts/imx51-zii-rdu1.dts
index 469cce2c0357..6e80254c4562 100644
--- a/arch/arm/boot/dts/imx51-zii-rdu1.dts
+++ b/arch/arm/boot/dts/imx51-zii-rdu1.dts
@@ -477,6 +477,15 @@
 };
 
 &gpio1 {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "hp-amp-shutdown-b", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "";
+
 	unused-sd3-wp-gpio {
 		/*
 		 * See pinctrl_esdhc1 below for more details on this
@@ -501,9 +510,6 @@
 	hpa1: amp@60 {
 		compatible = "ti,tpa6130a2";
 		reg = <0x60>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_ampgpio>;
-		power-gpio = <&gpio1 9 GPIO_ACTIVE_HIGH>;
 		Vdd-supply = <&reg_3p3v>;
 	};
 
@@ -677,7 +683,10 @@
 };
 
 &iomuxc {
-	pinctrl_ampgpio: ampgpiogrp {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_hog: hoggrp {
 		fsl,pins = <
 			MX51_PAD_GPIO1_9__GPIO1_9		0x5e
 		>;
-- 
2.19.1
