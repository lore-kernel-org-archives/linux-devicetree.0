From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/7] ARM: dts: lpc4350-hitex-eval: fix unit name warnings from dtc
Date: Wed, 30 Mar 2016 00:30:44 +0200
Message-ID: <1459290646-3592-6-git-send-email-manabian@gmail.com>
References: <1459290646-3592-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459290646-3592-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fix the following warnings from dtc by either adding or removing
the unit name from the node.

Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /soc/flash-controller@40003000/flash@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /pca_buttons/button@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /pca_buttons/button@1 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /pca_buttons/button@2 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /pca_buttons/button@3 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /pca_buttons/button@4 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /pca_buttons/button@5 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /pca_buttons/button@6 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /pca_buttons/button@7 has a unit name, but no reg property

Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/lpc4350-hitex-eval.dts | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/lpc4350-hitex-eval.dts b/arch/arm/boot/dts/lpc4350-hitex-eval.dts
index 6d0c698..cb65352 100644
--- a/arch/arm/boot/dts/lpc4350-hitex-eval.dts
+++ b/arch/arm/boot/dts/lpc4350-hitex-eval.dts
@@ -33,7 +33,7 @@
 		stdout-path = &uart0;
 	};
 
-	memory {
+	memory@28000000 {
 		device_type = "memory";
 		reg = <0x28000000 0x800000>; /* 8 MB */
 	};
@@ -45,50 +45,50 @@
 		poll-interval = <100>;
 		autorepeat;
 
-		button@0 {
+		button0 {
 			label = "joy:right";
 			linux,code = <KEY_RIGHT>;
 			gpios = <&pca_gpio 8 GPIO_ACTIVE_LOW>;
 		};
 
-		button@1 {
+		button1 {
 			label = "joy:up";
 			linux,code = <KEY_UP>;
 			gpios = <&pca_gpio 9 GPIO_ACTIVE_LOW>;
 		};
 
 
-		button@2 {
+		button2 {
 			label = "joy:enter";
 			linux,code = <KEY_ENTER>;
 			gpios = <&pca_gpio 10 GPIO_ACTIVE_LOW>;
 		};
 
-		button@3 {
+		button3 {
 			label = "joy:left";
 			linux,code = <KEY_LEFT>;
 			gpios = <&pca_gpio 11 GPIO_ACTIVE_LOW>;
 		};
 
-		button@4 {
+		button4 {
 			label = "joy:down";
 			linux,code = <KEY_DOWN>;
 			gpios = <&pca_gpio 12 GPIO_ACTIVE_LOW>;
 		};
 
-		button@5 {
+		button5 {
 			label = "user:sw3";
 			linux,code = <KEY_F1>;
 			gpios = <&pca_gpio 13 GPIO_ACTIVE_LOW>;
 		};
 
-		button@6 {
+		button6 {
 			label = "user:sw4";
 			linux,code = <KEY_F2>;
 			gpios = <&pca_gpio 14 GPIO_ACTIVE_LOW>;
 		};
 
-		button@7 {
+		button7 {
 			label = "user:sw5";
 			linux,code = <KEY_F3>;
 			gpios = <&pca_gpio 15 GPIO_ACTIVE_LOW>;
@@ -453,7 +453,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&spifi_pins>;
 
-	flash@0 {
+	flash {
 		compatible = "jedec,spi-nor";
 		spi-rx-bus-width = <4>;
 		#address-cells = <1>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
