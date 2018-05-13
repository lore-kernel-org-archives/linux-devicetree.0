Return-Path: <SRS0=Thvr=IA=vanguardiasur.com.ar=hernan@kernel.org>
From: =?UTF-8?q?Hern=C3=A1n=20Gonzalez?= <hernan@vanguardiasur.com.ar>
Subject: [PATCH] ARM: dts: am335x-baltos-ir3220: Use IRQ_TYPE specifier
Date: Sun, 13 May 2018 20:16:33 -0300
Message-Id: <1526253393-3247-1-git-send-email-hernan@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: bcousson@baylibre.com
Cc: tony@atomide.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Hern=C3=A1n=20Gonzalez?= <hernan@vanguardiasur.com.ar>
List-ID: <devicetree@vger.kernel.org>

GPIO_ACTIVE_LOW was being used to specify an interrupt, use
IRQ_TYPE_EDGE_RISING instead. This improves DT readability.

Signed-off-by: Hernán Gonzalez <hernan@vanguardiasur.com.ar>
---
 arch/arm/boot/dts/am335x-baltos-ir3220.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am335x-baltos-ir3220.dts b/arch/arm/boot/dts/am335x-baltos-ir3220.dts
index 46df1b2..1b215c4 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir3220.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir3220.dts
@@ -85,7 +85,7 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-parent = <&gpio0>;
-		interrupts = <20 GPIO_ACTIVE_LOW>;
+		interrupts = <20 IRQ_TYPE_EDGE_RISING>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&tca6416_pins>;
 	};
-- 
2.7.4
