From: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Subject: [PATCHv6 08/10] arm: mvebu: define and use common Armada XP SPI pinctrl setting
Date: Sat, 22 Nov 2014 00:46:39 +0100
Message-ID: <d404b7abd80ee5a0fd8e8d3586d33cd37740d589.1416613429.git.arno@natisbad.org>
References: <cover.1416613429.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1416613429.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


This patch defines common Armada XP pinctrl settings in armada-xp.dtsi
for the supported SPI interface (MPP36-39) and use it as default
for Armada XP spi interface. That being done, it removes the now
redundant definitions in armada-xp-axpwifiap.dts.

Note: this patch has the potential to break out-of-tree users w/o
specific pinctrl settings for their spi interfaces if the default
above does not match their config (i.e. if they do not use CS0).

Acked-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
---
 arch/arm/boot/dts/armada-xp-axpwifiap.dts |  7 -------
 arch/arm/boot/dts/armada-xp.dtsi          | 11 +++++++++++
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/armada-xp-axpwifiap.dts b/arch/arm/boot/dts/armada-xp-axpwifiap.dts
index 0e53fad111de..c9d25bdbe795 100644
--- a/arch/arm/boot/dts/armada-xp-axpwifiap.dts
+++ b/arch/arm/boot/dts/armada-xp-axpwifiap.dts
@@ -100,8 +100,6 @@
 
 			spi0: spi@10600 {
 				status = "okay";
-				pinctrl-0 = <&pmx_spi>;
-				pinctrl-names = "default";
 
 				spi-flash@0 {
 					#address-cells = <1>;
@@ -138,11 +136,6 @@
 		marvell,function = "gpio";
 	};
 
-	pmx_spi: pmx-spi {
-		marvell,pins = "mpp36", "mpp37", "mpp38", "mpp39";
-		marvell,function = "spi";
-	};
-
 	pmx_phy_int: pmx-phy-int {
 		marvell,pins = "mpp32";
 		marvell,function = "gpio";
diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
index 7cefb9b6d27c..bdb36a05c039 100644
--- a/arch/arm/boot/dts/armada-xp.dtsi
+++ b/arch/arm/boot/dts/armada-xp.dtsi
@@ -43,6 +43,11 @@
 				wt-override;
 			};
 
+			spi0: spi@10600 {
+				pinctrl-0 = <&spi0_pins>;
+				pinctrl-names = "default";
+			};
+
 			i2c0: i2c@11000 {
 				compatible = "marvell,mv78230-i2c", "marvell,mv64xxx-i2c";
 				reg = <0x11000 0x100>;
@@ -240,6 +245,12 @@
 		marvell,function = "sd0";
 	};
 
+	spi0_pins: spi0-pins {
+		marvell,pins = "mpp36", "mpp37",
+			       "mpp38", "mpp39";
+		marvell,function = "spi";
+	};
+
 	uart2_pins: uart2-pins {
 		marvell,pins = "mpp42", "mpp43";
 		marvell,function = "uart2";
-- 
2.1.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
