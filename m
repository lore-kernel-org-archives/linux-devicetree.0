From: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Subject: [PATCHv3 09/12] arm: mvebu: define and use ge0/1 rgmii pinctrl
 settings for armada XP
Date: Tue, 18 Nov 2014 00:28:07 +0100
Message-ID: <9cb4b81e1d0f160af4c7db8ec35870ba6dcaa985.1416266432.git.arno@natisbad.org>
References: <cover.1416266432.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1416266432.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Armada XP AXWiFiAP has local definitions for ge0/1 rgmii pinctrl
settings which can be be used by other boards. This patch moves
those definitions to armada-xp.dtsi file and then reference those
pinctrl entries in all current .dts files using ge0/1 interface
in rgmii-id mode for their PHY.

Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
---
 arch/arm/boot/dts/armada-xp-axpwifiap.dts       | 18 ++----------------
 arch/arm/boot/dts/armada-xp-db.dts              |  4 ++++
 arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts |  4 ++++
 arch/arm/boot/dts/armada-xp-netgear-rn2120.dts  |  4 ++++
 arch/arm/boot/dts/armada-xp.dtsi                | 14 ++++++++++++++
 5 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/armada-xp-axpwifiap.dts b/arch/arm/boot/dts/armada-xp-axpwifiap.dts
index a55a97a70505..7a6e50632a1f 100644
--- a/arch/arm/boot/dts/armada-xp-axpwifiap.dts
+++ b/arch/arm/boot/dts/armada-xp-axpwifiap.dts
@@ -64,20 +64,6 @@
 				pinctrl-0 = <&pmx_phy_int>;
 				pinctrl-names = "default";
 
-				pmx_ge0: pmx-ge0 {
-					marvell,pins = "mpp0", "mpp1", "mpp2", "mpp3",
-						       "mpp4", "mpp5", "mpp6", "mpp7",
-						       "mpp8", "mpp9", "mpp10", "mpp11";
-					marvell,function = "ge0";
-				};
-
-				pmx_ge1: pmx-ge1 {
-					marvell,pins = "mpp12", "mpp13", "mpp14", "mpp15",
-						       "mpp16", "mpp17", "mpp18", "mpp19",
-						       "mpp20", "mpp21", "mpp22", "mpp23";
-					marvell,function = "ge1";
-				};
-
 				pmx_keys: pmx-keys {
 					marvell,pins = "mpp33";
 					marvell,function = "gpio";
@@ -118,14 +104,14 @@
 			};
 
 			ethernet@70000 {
-				pinctrl-0 = <&pmx_ge0>;
+				pinctrl-0 = <&ge0_rgmii_pins>;
 				pinctrl-names = "default";
 				status = "okay";
 				phy = <&phy0>;
 				phy-mode = "rgmii-id";
 			};
 			ethernet@74000 {
-				pinctrl-0 = <&pmx_ge1>;
+				pinctrl-0 = <&ge1_rgmii_pins>;
 				pinctrl-names = "default";
 				status = "okay";
 				phy = <&phy1>;
diff --git a/arch/arm/boot/dts/armada-xp-db.dts b/arch/arm/boot/dts/armada-xp-db.dts
index 42ddb2864365..bc28691161f4 100644
--- a/arch/arm/boot/dts/armada-xp-db.dts
+++ b/arch/arm/boot/dts/armada-xp-db.dts
@@ -142,11 +142,15 @@
 			};
 
 			ethernet@70000 {
+				pinctrl-0 = <&ge0_rgmii_pins>;
+				pinctrl-names = "default";
 				status = "okay";
 				phy = <&phy0>;
 				phy-mode = "rgmii-id";
 			};
 			ethernet@74000 {
+				pinctrl-0 = <&ge1_rgmii_pins>;
+				pinctrl-names = "default";
 				status = "okay";
 				phy = <&phy1>;
 				phy-mode = "rgmii-id";
diff --git a/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts b/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
index cccf54784c4c..8560047ce426 100644
--- a/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
+++ b/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
@@ -97,12 +97,16 @@
 			};
 
 			ethernet@70000 {
+				pinctrl-0 = <&ge0_rgmii_pins>;
+				pinctrl-names = "default";
 				status = "okay";
 				phy = <&phy0>;
 				phy-mode = "rgmii-id";
 			};
 
 			ethernet@74000 {
+				pinctrl-0 = <&ge1_rgmii_pins>;
+				pinctrl-names = "default";
 				status = "okay";
 				phy = <&phy1>;
 				phy-mode = "rgmii-id";
diff --git a/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts b/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
index 7d8f32873e82..d61caf829b8b 100644
--- a/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
+++ b/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
@@ -152,12 +152,16 @@
 			};
 
 			ethernet@70000 {
+				pinctrl-0 = <&ge0_rgmii_pins>;
+				pinctrl-names = "default";
 				status = "okay";
 				phy = <&phy0>;
 				phy-mode = "rgmii-id";
 			};
 
 			ethernet@74000 {
+				pinctrl-0 = <&ge1_rgmii_pins>;
+				pinctrl-names = "default";
 				status = "okay";
 				phy = <&phy1>;
 				phy-mode = "rgmii-id";
diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
index c7449f652fb5..4f685f7ec273 100644
--- a/arch/arm/boot/dts/armada-xp.dtsi
+++ b/arch/arm/boot/dts/armada-xp.dtsi
@@ -58,6 +58,20 @@
 					marvell,pins = "mpp44", "mpp45";
 					marvell,function = "uart3";
 				};
+
+				ge0_rgmii_pins: ge0-rgmii-pins {
+					marvell,pins = "mpp0", "mpp1", "mpp2", "mpp3",
+						       "mpp4", "mpp5", "mpp6", "mpp7",
+						       "mpp8", "mpp9", "mpp10", "mpp11";
+					marvell,function = "ge0";
+				};
+
+				ge1_rgmii_pins: ge1-rgmii-pins {
+					marvell,pins = "mpp12", "mpp13", "mpp14", "mpp15",
+						       "mpp16", "mpp17", "mpp18", "mpp19",
+						       "mpp20", "mpp21", "mpp22", "mpp23";
+					marvell,function = "ge1";
+				};
 			};
 
 			i2c0: i2c@11000 {
-- 
2.1.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
