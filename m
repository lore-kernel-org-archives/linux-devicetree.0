From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 18/20] ARM: shmobile: kzm9g-reference: Add LED1-LED4 to the device tree
Date: Wed, 15 May 2013 02:18:18 +0200
Message-ID: <1368577100-3530-19-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1368577100-3530-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1368577100-3530-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-sh-owner@vger.kernel.org
To: linux-sh@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Guennadi Liakhovetski <g.liakhovetski+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

LED1 to LED4 are GPIO LEDs. Add corresponding DT nodes.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/sh73a0-kzm9g-reference.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/sh73a0-kzm9g-reference.dts b/arch/arm/boot/dts/sh73a0-kzm9g-reference.dts
index cdfd71a..21b0fe3 100644
--- a/arch/arm/boot/dts/sh73a0-kzm9g-reference.dts
+++ b/arch/arm/boot/dts/sh73a0-kzm9g-reference.dts
@@ -88,6 +88,22 @@
 		vddvario-supply = <&reg_1p8v>;
 		vdd33a-supply = <&reg_3p3v>;
 	};
+
+	leds {
+		compatible = "gpio-leds";
+		led1 {
+			gpios = <&pfc 20 1>; /* Active low */
+		};
+		led2 {
+			gpios = <&pfc 21 1>; /* Active low */
+		};
+		led3 {
+			gpios = <&pfc 22 1>; /* Active low */
+		};
+		led4 {
+			gpios = <&pfc 23 1>; /* Active low */
+		};
+	};
 };
 
 &i2c0 {
-- 
1.8.1.5

