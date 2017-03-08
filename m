From: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: dts: mvebu: linksys: enable buffer manager support
Date: Wed,  8 Mar 2017 06:33:12 +0100
Message-ID: <20170308053312.29243-1-ralph.sennhauser@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "moderated list:ARM/Marvell
        Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add appropriate properties to devices in the Linksys WRT AC Series for the
mvneta driver to use hardware buffer management.

Also update "soc" ranges property and set the status of bm and bm-bppi
to "okay" (SRAM).

Signed-off-by: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/armada-385-linksys.dtsi     | 17 ++++++++++++++++-
 arch/arm/boot/dts/armada-xp-linksys-mamba.dts | 17 ++++++++++++++++-
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/armada-385-linksys.dtsi b/arch/arm/boot/dts/armada-385-linksys.dtsi
index df47bf1..4aac375 100644
--- a/arch/arm/boot/dts/armada-385-linksys.dtsi
+++ b/arch/arm/boot/dts/armada-385-linksys.dtsi
@@ -59,7 +59,8 @@
 		ranges = <MBUS_ID(0xf0, 0x01) 0 0xf1000000 0x100000
 			  MBUS_ID(0x01, 0x1d) 0 0xfff00000 0x100000
 			  MBUS_ID(0x09, 0x19) 0 0xf1100000 0x10000
-			  MBUS_ID(0x09, 0x15) 0 0xf1110000 0x10000>;
+			  MBUS_ID(0x09, 0x15) 0 0xf1110000 0x10000
+			  MBUS_ID(0x0c, 0x04) 0 0xf1200000 0x100000>;
 
 		internal-regs {
 			i2c@11000 {
@@ -88,6 +89,9 @@
 			ethernet@70000 {
 				status = "okay";
 				phy-mode = "rgmii-id";
+				buffer-manager = <&bm>;
+				bm,pool-long = <1>;
+				bm,pool-short = <3>;
 				fixed-link {
 					speed = <1000>;
 					full-duplex;
@@ -97,6 +101,9 @@
 			ethernet@34000 {
 				status = "okay";
 				phy-mode = "sgmii";
+				buffer-manager = <&bm>;
+				bm,pool-long = <0>;
+				bm,pool-short = <3>;
 				fixed-link {
 					speed = <1000>;
 					full-duplex;
@@ -159,6 +166,10 @@
 				status = "okay";
 			};
 
+			bm@c8000 {
+				status = "okay";
+			};
+
 			/* USB part of the eSATA/USB 2.0 port */
 			usb@58000 {
 				status = "okay";
@@ -241,6 +252,10 @@
 			};
 		};
 
+		bm-bppi {
+			status = "okay";
+		};
+
 		pcie-controller {
 			status = "okay";
 
diff --git a/arch/arm/boot/dts/armada-xp-linksys-mamba.dts b/arch/arm/boot/dts/armada-xp-linksys-mamba.dts
index 3744ba3..b188a4dc 100644
--- a/arch/arm/boot/dts/armada-xp-linksys-mamba.dts
+++ b/arch/arm/boot/dts/armada-xp-linksys-mamba.dts
@@ -71,7 +71,8 @@
 		ranges = <MBUS_ID(0xf0, 0x01) 0 0 0xf1000000 0x100000
 			  MBUS_ID(0x01, 0x1d) 0 0 0xfff00000 0x100000
 			  MBUS_ID(0x09, 0x09) 0 0 0xf1100000 0x10000
-			  MBUS_ID(0x09, 0x05) 0 0 0xf1110000 0x10000>;
+			  MBUS_ID(0x09, 0x05) 0 0 0xf1110000 0x10000
+			  MBUS_ID(0x0c, 0x04) 0 0 0xf1200000 0x100000>;
 
 		internal-regs {
 
@@ -95,6 +96,9 @@
 				pinctrl-names = "default";
 				status = "okay";
 				phy-mode = "rgmii-id";
+				buffer-manager = <&bm>;
+				bm,pool-long = <0>;
+				bm,pool-short = <3>;
 				fixed-link {
 					speed = <1000>;
 					full-duplex;
@@ -106,6 +110,9 @@
 				pinctrl-names = "default";
 				status = "okay";
 				phy-mode = "rgmii-id";
+				buffer-manager = <&bm>;
+				bm,pool-long = <1>;
+				bm,pool-short = <3>;
 				fixed-link {
 					speed = <1000>;
 					full-duplex;
@@ -186,6 +193,10 @@
 				};
 			};
 
+			bm@c8000 {
+				status = "okay";
+			};
+
 			nand@d0000 {
 				status = "okay";
 				num-cs = <1>;
@@ -259,6 +270,10 @@
 				};
 			};
 		};
+
+		bm-bppi {
+			status = "okay";
+		};
 	};
 
 	gpio_keys {
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
