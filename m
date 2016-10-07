From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2] ARM64: dts: meson-gxbb: Add rmii pinctrl node and rename rgmii node
Date: Fri,  7 Oct 2016 16:59:15 +0200
Message-ID: <1475852355-24096-1-git-send-email-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

For boards only supporting 10/100 ethernet over a RMII PHY link, add
a separate pinctrl node. By the way, rename the existing node to rgmii
specific naming in all boards dts.

Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts |  3 ++-
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts    |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi       |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi   |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi            | 17 ++++++++++++++++-
 5 files changed, 21 insertions(+), 5 deletions(-)

Changes since v1 at http://lkml.kernel.org/r/1475678673-15277-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org :
 - Change Nexbox A95X to rmii interface

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
index 80d7b35..399d85f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
@@ -97,8 +97,9 @@
 
 &ethmac {
 	status = "okay";
-	pinctrl-0 = <&eth_pins>;
+	pinctrl-0 = <&eth_rmii_pins>;
 	pinctrl-names = "default";
+	phy-mode = "rmii";
 };
 
 &ir {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index e6e3491..325b9c5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -83,7 +83,7 @@
 
 &ethmac {
 	status = "okay";
-	pinctrl-0 = <&eth_pins>;
+	pinctrl-0 = <&eth_rgmii_pins>;
 	pinctrl-names = "default";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
index 06a34dc..031d69b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
@@ -81,7 +81,7 @@
 
 &ethmac {
 	status = "okay";
-	pinctrl-0 = <&eth_pins>;
+	pinctrl-0 = <&eth_rgmii_pins>;
 	pinctrl-names = "default";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 73f1593..e93221a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -82,7 +82,7 @@
 
 &ethmac {
 	status = "okay";
-	pinctrl-0 = <&eth_pins>;
+	pinctrl-0 = <&eth_rgmii_pins>;
 	pinctrl-names = "default";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 443811b..aad639a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -443,7 +443,7 @@
 			};
 		};
 
-		eth_pins: eth_c {
+		eth_rgmii_pins: eth-rgmii {
 			mux {
 				groups = "eth_mdio",
 				       "eth_mdc",
@@ -463,6 +463,21 @@
 			};
 		};
 
+		eth_rmii_pins: eth-rmii {
+			mux {
+				groups = "eth_mdio",
+				       "eth_mdc",
+				       "eth_clk_rx_clk",
+				       "eth_rx_dv",
+				       "eth_rxd0",
+				       "eth_rxd1",
+				       "eth_tx_en",
+				       "eth_txd0",
+				       "eth_txd1";
+				function = "eth";
+			};
+		};
+
 		pwm_a_x_pins: pwm_a_x {
 			mux {
 				groups = "pwm_a_x";
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
