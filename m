From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: [RFC] ARM: BCM5301X: add NAND flash chip description
Date: Sun, 24 May 2015 20:32:29 +0200
Message-ID: <1432492349-18517-1-git-send-email-hauke@hauke-m.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the NAND flash chip description for a standard chip found
connected to this SoC. This makes use of generic Broadcom NAND driver
with the iProc interface.

Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
---

This would be the patch when we completely change to device tree only 
for the nand flash controller.

 arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts        |  4 +++
 arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts        |  4 +++
 arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts  |  4 +++
 arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts       |  8 ++---
 arch/arm/boot/dts/bcm4708-netgear-r6250.dts        |  4 +++
 arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts     |  4 +++
 arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts      |  4 +++
 arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts        |  4 +++
 arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts |  4 +++
 arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts  |  4 +++
 arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts  |  4 +++
 arch/arm/boot/dts/bcm4709-netgear-r8000.dts        |  4 +++
 arch/arm/boot/dts/bcm5301x.dtsi                    | 38 +++++++++++++++-------
 13 files changed, 74 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts
index 71cff8d..f9e187f 100644
--- a/arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts
+++ b/arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts
@@ -23,6 +23,10 @@
 		reg = <0x00000000 0x08000000>;
 	};
 
+	nand: nand@18028000 {
+		status = "ok";
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
diff --git a/arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts b/arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts
index 8b62836..0559dcf 100644
--- a/arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts
+++ b/arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts
@@ -23,6 +23,10 @@
 		reg = <0x00000000 0x08000000>;
 	};
 
+	nand: nand@18028000 {
+		status = "ok";
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
diff --git a/arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts b/arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts
index 78e95c0..6e1ab06 100644
--- a/arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts
+++ b/arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts
@@ -23,6 +23,10 @@
 		reg = <0x00000000 0x08000000>;
 	};
 
+	nand: nand@18028000 {
+		status = "ok";
+	};
+
 	spi {
 		compatible = "spi-gpio";
 		num-chipselects = <1>;
diff --git a/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts b/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts
index 946c728..1aa141c 100644
--- a/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts
+++ b/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts
@@ -23,12 +23,10 @@
 		reg = <0x00000000 0x08000000>;
 	};
 
-	axi@18000000 {
-		nand@28000 {
-			reg = <0x00028000 0x1000>;
-			#address-cells = <1>;
-			#size-cells = <1>;
+	nand: nand@18028000 {
+		status = "ok";
 
+		nandcs@0 {
 			partition@0 {
 				label = "ubi";
 				reg = <0x00000000 0x08000000>;
diff --git a/arch/arm/boot/dts/bcm4708-netgear-r6250.dts b/arch/arm/boot/dts/bcm4708-netgear-r6250.dts
index 2ed9e57..236e0ee 100644
--- a/arch/arm/boot/dts/bcm4708-netgear-r6250.dts
+++ b/arch/arm/boot/dts/bcm4708-netgear-r6250.dts
@@ -33,6 +33,10 @@
 		};
 	};
 
+	nand: nand@18028000 {
+		status = "ok";
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
diff --git a/arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts b/arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts
index 3991042..d36eee5 100644
--- a/arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts
+++ b/arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts
@@ -23,6 +23,10 @@
 		reg = <0x00000000 0x08000000>;
 	};
 
+	nand: nand@18028000 {
+		status = "ok";
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
diff --git a/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts b/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
index 66dfb53..bd4ad04 100644
--- a/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
+++ b/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
@@ -23,6 +23,10 @@
 		reg = <0x00000000 0x08000000>;
 	};
 
+	nand: nand@18028000 {
+		status = "ok";
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
diff --git a/arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts b/arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts
index 0ee85ea..815d3b7 100644
--- a/arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts
+++ b/arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts
@@ -23,6 +23,10 @@
 		reg = <0x00000000 0x08000000>;
 	};
 
+	nand: nand@18028000 {
+		status = "ok";
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
diff --git a/arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts b/arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts
index db9131e..488d2b6 100644
--- a/arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts
+++ b/arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts
@@ -23,6 +23,10 @@
 		reg = <0x00000000 0x08000000>;
 	};
 
+	nand: nand@18028000 {
+		status = "ok";
+	};
+
 	spi {
 		compatible = "spi-gpio";
 		num-chipselects = <1>;
diff --git a/arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts b/arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts
index 7d6868a..547a70a 100644
--- a/arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts
+++ b/arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts
@@ -23,6 +23,10 @@
 		reg = <0x00000000 0x08000000>;
 	};
 
+	nand: nand@18028000 {
+		status = "ok";
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts b/arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts
index 548e93b..ad2b27f 100644
--- a/arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts
+++ b/arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts
@@ -23,6 +23,10 @@
 		reg = <0x00000000 0x08000000>;
 	};
 
+	nand: nand@18028000 {
+		status = "ok";
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
diff --git a/arch/arm/boot/dts/bcm4709-netgear-r8000.dts b/arch/arm/boot/dts/bcm4709-netgear-r8000.dts
index ea26dd3..ff50fd4 100644
--- a/arch/arm/boot/dts/bcm4709-netgear-r8000.dts
+++ b/arch/arm/boot/dts/bcm4709-netgear-r8000.dts
@@ -23,6 +23,10 @@
 		reg = <0x00000000 0x08000000>;
 	};
 
+	nand: nand@18028000 {
+		status = "ok";
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
index 78aec62..cb86748 100644
--- a/arch/arm/boot/dts/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/bcm5301x.dtsi
@@ -124,17 +124,7 @@
 			<0x00026000 0 &gic GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
 
 			/* Ethernet Controller 3 */
-			<0x00027000 0 &gic GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
-
-			/* NAND Controller */
-			<0x00028000 0 &gic GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
-			<0x00028000 1 &gic GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
-			<0x00028000 2 &gic GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
-			<0x00028000 3 &gic GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
-			<0x00028000 4 &gic GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
-			<0x00028000 5 &gic GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
-			<0x00028000 6 &gic GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
-			<0x00028000 7 &gic GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			<0x00027000 0 &gic GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
 
 		chipcommon: chipcommon@0 {
 			reg = <0x00000000 0x1000>;
@@ -143,4 +133,30 @@
 			#gpio-cells = <2>;
 		};
 	};
+
+	nand: nand@18028000 {
+		compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1", "brcm,brcmnand";
+		reg = <0x18028000 0x600>, <0x1811a408 0x600>, <0x18028f00 0x20>;
+		reg-names = "nand", "iproc-idm", "iproc-ext";
+		interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+
+		status = "disabled";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		brcm,nand-has-wp;
+
+		nandcs@0 {
+			compatible = "brcm,nandcs";
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			nand-ecc-strength = <8>;
+			nand-ecc-step-size = <512>;
+
+			linux,part-probe = "ofpart", "bcm47xxpart";
+		};
+	};
 };
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
