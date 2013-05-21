From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v4 16/21] ARM: shmobile: armadillo-reference: Add LED1-LED4 to the device tree
Date: Tue, 21 May 2013 14:14:37 +0200
Message-ID: <1369138482-5871-17-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1369138482-5871-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1369138482-5871-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-sh-owner@vger.kernel.org
To: linux-sh@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <damm@opensource.se>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
List-Id: devicetree@vger.kernel.org

LED1 to LED4 are GPIO LEDs. Add corresponding DT nodes.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/r8a7740-armadillo800eva-reference.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva-reference.dts b/arch/arm/boot/dts/r8a7740-armadillo800eva-reference.dts
index a037776..746c64a 100644
--- a/arch/arm/boot/dts/r8a7740-armadillo800eva-reference.dts
+++ b/arch/arm/boot/dts/r8a7740-armadillo800eva-reference.dts
@@ -33,6 +33,21 @@
 		regulator-boot-on;
 	};
 
+	leds {
+		compatible = "gpio-leds";
+		led1 {
+			gpios = <&pfc 102 0>;
+		};
+		led2 {
+			gpios = <&pfc 111 0>;
+		};
+		led3 {
+			gpios = <&pfc 110 0>;
+		};
+		led4 {
+			gpios = <&pfc 177 0>;
+		};
+	};
 };
 
 &i2c0 {
-- 
1.8.1.5

