From: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Subject: [PATCHv5 05/10] arm: mvebu: define and use common Armada 370 SPI
 pinctrl settings
Date: Fri, 21 Nov 2014 20:45:44 +0100
Message-ID: <a0eb580b7cc0f7cf39f1a69f0cc5747bded66300.1416598537.git.arno@natisbad.org>
References: <cover.1416598536.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1416598536.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


This patch defines common Armada 370 pinctrl settings for spi0 and spi1
interfaces:

 spi0: MPP33-36 as default, MPP32,63-65 as available alternate config
 spi1: MPP49-52 as default

Currently, the Armada 370 DB .dts file has no explicit pinctrl info
for the spi0 interface used to access the flash on the board. The
patch fixes that by also adding explicit pinctrl info (MPP32,63-65)
for this SPI interface.

Note: this patch has the potential to break out-of-tree users w/o
specific pinctrl settings for their spi interfaces if the default
above does not match their config.

Suggested-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
---
 arch/arm/boot/dts/armada-370-db.dts |  2 ++
 arch/arm/boot/dts/armada-370.dtsi   | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/armada-370-db.dts b/arch/arm/boot/dts/armada-370-db.dts
index 29f1c8c0369f..f688ab4202e3 100644
--- a/arch/arm/boot/dts/armada-370-db.dts
+++ b/arch/arm/boot/dts/armada-370-db.dts
@@ -111,6 +111,8 @@
 			};
 
 			spi0: spi@10600 {
+				pinctrl-0 = <&spi0_pins2>;
+				pinctrl-names = "default";
 				status = "okay";
 
 				spi-flash@0 {
diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/armada-370.dtsi
index 90e1286d414f..f1284ae0cddd 100644
--- a/arch/arm/boot/dts/armada-370.dtsi
+++ b/arch/arm/boot/dts/armada-370.dtsi
@@ -197,6 +197,20 @@
 				status = "disabled";
 			};
 
+			/*
+			 * Default SPI pinctrl setting, can be overwritten on
+			 * board level if a different configuration is used.
+			 */
+			spi0: spi@10600 {
+				pinctrl-0 = <&spi0_pins1>;
+				pinctrl-names = "default";
+			};
+
+			spi1: spi@10680 {
+				pinctrl-0 = <&spi1_pins>;
+				pinctrl-names = "default";
+			};
+
 			usb@50000 {
 				clocks = <&coreclk 0>;
 			};
@@ -249,6 +263,24 @@
 &pinctrl {
 	compatible = "marvell,mv88f6710-pinctrl";
 
+	spi0_pins1: spi0-pins1 {
+		marvell,pins = "mpp33", "mpp34",
+			       "mpp35", "mpp36";
+		marvell,function = "spi0";
+	};
+
+	spi0_pins2: spi0_pins2 {
+		marvell,pins = "mpp32", "mpp63",
+			       "mpp64", "mpp65";
+		marvell,function = "spi0";
+	};
+
+	spi1_pins: spi1-pins {
+		marvell,pins = "mpp49", "mpp50",
+			       "mpp51", "mpp52";
+		marvell,function = "spi1";
+	};
+
 	sdio_pins1: sdio-pins1 {
 		marvell,pins = "mpp9",  "mpp11", "mpp12",
 				"mpp13", "mpp14", "mpp15";
-- 
2.1.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
