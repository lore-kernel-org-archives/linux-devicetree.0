From: Pablo Greco <pgreco@centosproject.org>
Subject: [PATCH v6 2/5] ARM: dts: sun8i: v40: bananapi-m2-berry: Enable GMAC ethernet controller
Date: Thu,  2 May 2019 10:33:46 -0300
Message-ID: <1556804030-25291-3-git-send-email-pgreco@centosproject.org>
References: <1556804030-25291-1-git-send-email-pgreco@centosproject.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556804030-25291-1-git-send-email-pgreco@centosproject.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-sunxi@googlegroups.com
Cc: Pablo Greco <pgreco@centosproject.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Just like the Bananapi M2 Ultra, the Bananapi M2 Berry has a Realtek
RTL8211E RGMII PHY tied to the GMAC.
The PMIC's DC1SW output provides power for the PHY, while the ALDO2
output provides I/O voltages on both sides.

Signed-off-by: Pablo Greco <pgreco@centosproject.org>
---
 arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
index 27297f4..0dfde58 100644
--- a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
+++ b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
@@ -50,6 +50,7 @@
 	compatible = "sinovoip,bpi-m2-berry", "allwinner,sun8i-r40";
 
 	aliases {
+		ethernet0 = &gmac;
 		serial0 = &uart0;
 	};
 
@@ -92,6 +93,22 @@
 	status = "okay";
 };
 
+&gmac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac_rgmii_pins>;
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii";
+	phy-supply = <&reg_dc1sw>;
+	status = "okay";
+};
+
+&gmac_mdio {
+	phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+	};
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -145,6 +162,12 @@
 	regulator-name = "avcc";
 };
 
+&reg_dc1sw {
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "vcc-gmac-phy";
+};
+
 &reg_dcdc1 {
 	regulator-always-on;
 	regulator-min-microvolt = <3000000>;
-- 
1.8.3.1
