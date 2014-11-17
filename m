From: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Subject: [PATCHv3 05/12] arm: mvebu: remove duplications in pinctrl nodes for
 Armada 370/XP
Date: Tue, 18 Nov 2014 00:27:34 +0100
Message-ID: <fa0686a71376365a52f9b2526dac6fec0cdec90b.1416266432.git.arno@natisbad.org>
References: <cover.1416266432.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1416266432.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


As suggested by Sebastian and Andrew, it is possible to refactor and
remove duplications in pinctrl nodes for Armada 370/XP in the
following way:

 1) define a pinctrl node in armada-370-xp.dtsi w/ only the reg property
    defined (same for all 370/XP SoCs)
 2) remove now redundant reg properties in armada-370.dtsi and
    armada-xp-mv*.dtsi files
 3) move identical and redundant SDIO pins definitions found in
    armada-xp-mv*.dtsi to a newly created pinctrl node in armada-xp.dtsi

Suggested-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Suggested-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
---
 arch/arm/boot/dts/armada-370-xp.dtsi     | 4 ++++
 arch/arm/boot/dts/armada-370.dtsi        | 1 -
 arch/arm/boot/dts/armada-xp-mv78230.dtsi | 7 -------
 arch/arm/boot/dts/armada-xp-mv78260.dtsi | 7 -------
 arch/arm/boot/dts/armada-xp-mv78460.dtsi | 7 -------
 arch/arm/boot/dts/armada-xp.dtsi         | 8 ++++++++
 6 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370-xp.dtsi b/arch/arm/boot/dts/armada-370-xp.dtsi
index 2be9723bcdf3..02df61a6a11b 100644
--- a/arch/arm/boot/dts/armada-370-xp.dtsi
+++ b/arch/arm/boot/dts/armada-370-xp.dtsi
@@ -103,6 +103,10 @@
 			#size-cells = <1>;
 			ranges = <0 MBUS_ID(0xf0, 0x01) 0 0x100000>;
 
+			pinctrl {
+				reg = <0x18000 0x38>;
+			};
+
 			rtc@10300 {
 				compatible = "marvell,orion-rtc";
 				reg = <0x10300 0x20>;
diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/armada-370.dtsi
index 6b3c23b1e138..2040da11462b 100644
--- a/arch/arm/boot/dts/armada-370.dtsi
+++ b/arch/arm/boot/dts/armada-370.dtsi
@@ -113,7 +113,6 @@
 
 			pinctrl {
 				compatible = "marvell,mv88f6710-pinctrl";
-				reg = <0x18000 0x38>;
 
 				sdio_pins1: sdio-pins1 {
 					marvell,pins = "mpp9",  "mpp11", "mpp12",
diff --git a/arch/arm/boot/dts/armada-xp-mv78230.dtsi b/arch/arm/boot/dts/armada-xp-mv78230.dtsi
index 2592e1c13560..b5933aa9ab50 100644
--- a/arch/arm/boot/dts/armada-xp-mv78230.dtsi
+++ b/arch/arm/boot/dts/armada-xp-mv78230.dtsi
@@ -169,13 +169,6 @@
 		internal-regs {
 			pinctrl {
 				compatible = "marvell,mv78230-pinctrl";
-				reg = <0x18000 0x38>;
-
-				sdio_pins: sdio-pins {
-					marvell,pins = "mpp30", "mpp31", "mpp32",
-						       "mpp33", "mpp34", "mpp35";
-					marvell,function = "sd0";
-				};
 			};
 
 			gpio0: gpio@18100 {
diff --git a/arch/arm/boot/dts/armada-xp-mv78260.dtsi b/arch/arm/boot/dts/armada-xp-mv78260.dtsi
index 480e237a870f..5954b362180c 100644
--- a/arch/arm/boot/dts/armada-xp-mv78260.dtsi
+++ b/arch/arm/boot/dts/armada-xp-mv78260.dtsi
@@ -253,13 +253,6 @@
 		internal-regs {
 			pinctrl {
 				compatible = "marvell,mv78260-pinctrl";
-				reg = <0x18000 0x38>;
-
-				sdio_pins: sdio-pins {
-					marvell,pins = "mpp30", "mpp31", "mpp32",
-						       "mpp33", "mpp34", "mpp35";
-					marvell,function = "sd0";
-				};
 			};
 
 			gpio0: gpio@18100 {
diff --git a/arch/arm/boot/dts/armada-xp-mv78460.dtsi b/arch/arm/boot/dts/armada-xp-mv78460.dtsi
index 2c7b1fef4703..735924d62e12 100644
--- a/arch/arm/boot/dts/armada-xp-mv78460.dtsi
+++ b/arch/arm/boot/dts/armada-xp-mv78460.dtsi
@@ -291,13 +291,6 @@
 		internal-regs {
 			pinctrl {
 				compatible = "marvell,mv78460-pinctrl";
-				reg = <0x18000 0x38>;
-
-				sdio_pins: sdio-pins {
-					marvell,pins = "mpp30", "mpp31", "mpp32",
-						       "mpp33", "mpp34", "mpp35";
-					marvell,function = "sd0";
-				};
 			};
 
 			gpio0: gpio@18100 {
diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
index a68f5b837536..83bf32344a60 100644
--- a/arch/arm/boot/dts/armada-xp.dtsi
+++ b/arch/arm/boot/dts/armada-xp.dtsi
@@ -42,6 +42,14 @@
 				wt-override;
 			};
 
+			pinctrl {
+				sdio_pins: sdio-pins {
+					marvell,pins = "mpp30", "mpp31", "mpp32",
+						       "mpp33", "mpp34", "mpp35";
+					marvell,function = "sd0";
+				};
+			};
+
 			i2c0: i2c@11000 {
 				compatible = "marvell,mv78230-i2c", "marvell,mv64xxx-i2c";
 				reg = <0x11000 0x100>;
-- 
2.1.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
