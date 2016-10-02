From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH] ARM: dts: vf610-zii-dev-rev-b: Remove I2C3
Date: Sat,  1 Oct 2016 18:28:39 -0700
Message-ID: <1475371719-28736-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Stefan Agner <stefan@agner.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

I2C3 bus was only brought out in revision A1 of the board and revision
B1 only brings out 3 I2C busses (I2C0, I2C1 and I2C2).

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 arch/arm/boot/dts/vf610-zii-dev-rev-b.dts | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts b/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
index 5c1fcab..fa19cfd 100644
--- a/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
+++ b/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
@@ -499,13 +499,6 @@
 	};
 };
 
-&i2c3 {
-	clock-frequency = <100000>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c3>;
-	status = "okay";
-};
-
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart0>;
@@ -663,13 +656,6 @@
 		>;
 	};
 
-	pinctrl_i2c3: i2c3grp {
-		fsl,pins = <
-			VF610_PAD_PTA30__I2C3_SCL	0x37ff
-			VF610_PAD_PTA31__I2C3_SDA	0x37ff
-		>;
-	};
-
 	pinctrl_leds_debug: pinctrl-leds-debug {
 		fsl,pins = <
 			 VF610_PAD_PTD20__GPIO_74	0x31c2
-- 
2.5.5
