From: Emmanuel Vadot <manu@freebsd.org>
Subject: [PATCH] arm64: allwinner: a64-sopine: Add cd-gpios to mmc0 node
Date: Wed, 20 Jun 2018 11:30:55 +0200
Message-ID: <20180620093055.10928-1-manu@freebsd.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Emmanuel Vadot <manu@freebsd.org>
List-Id: devicetree@vger.kernel.org

The card detect GPIO for Sopine and Pine64-LTS is PF6.
Add this to the dts.

Signed-off-by: Emmanuel Vadot <manu@freebsd.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi
index 43418bd881d8..3dfc0c55eb96 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi
@@ -45,6 +45,8 @@
 
 #include "sun50i-a64.dtsi"
 
+#include <dt-bindings/gpio/gpio.h>
+
 &mmc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins>;
@@ -52,6 +54,7 @@
 	non-removable;
 	disable-wp;
 	bus-width = <4>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
 	status = "okay";
 };
 
-- 
2.17.0
