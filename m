From: jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org
Subject: [PATCH v4 3/8] dts: sun8i-h3: move uart0 pinmux/peripheral assocation to DSTI
Date: Wed,  7 Sep 2016 09:58:56 +0200
Message-ID: <1473235141-12768-4-git-send-email-jorik@kippendief.biz>
References: <1473235141-12768-1-git-send-email-jorik@kippendief.biz>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473235141-12768-1-git-send-email-jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wens-jdAy2FN1RRM@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>

This is the only sensible pinmux/peripheral association for uart0, so I have
moved it from the board specific DTS to the DTSI. It is still up to the boards
to enable it, though.

Signed-off-by: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts | 2 --
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts       | 2 --
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts     | 2 --
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts      | 2 --
 arch/arm/boot/dts/sun8i-h3.dtsi                 | 2 ++
 5 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts b/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
index 45f623b..c874270 100644
--- a/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
+++ b/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
@@ -178,8 +178,6 @@
 };
 
 &uart0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
index 6cb29f3..c9c0014 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
@@ -171,8 +171,6 @@
 };
 
 &uart0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
index a1423cc..c830ff9 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
@@ -134,8 +134,6 @@
 };
 
 &uart0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
index 772239e..ae87061 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
@@ -156,8 +156,6 @@
 };
 
 &uart0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index 933d42c..6635f3d 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -399,6 +399,8 @@
 			resets = <&ccu RST_BUS_UART0>;
 			dmas = <&dma 6>, <&dma 6>;
 			dma-names = "rx", "tx";
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_pins>;
 			status = "disabled";
 		};
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
