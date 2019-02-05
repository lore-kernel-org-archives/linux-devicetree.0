From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 1/2] ARM: dts: sun8i: a83t: Enable PMIC power supplies on various boards
Date: Tue,  5 Feb 2019 23:00:39 +0800
Message-ID: <20190205150040.12343-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On the Bananapi M3 and Cubietruck Plus, the DC input jacks are wired to
the ACIN pins, which is represented by the AC power supply. Both boards
have connectors for LiPo batteries, which are represented by the battery
power supply.

The H8 Homlet is a set-top box design. The DC input jack is wired to the
ACIN pins, but there are no battery connectors.

Enable these power supplies in the device tree.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts | 4 ++++
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts           | 8 ++++++++
 arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts       | 8 ++++++++
 3 files changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts b/arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts
index 1c012a4def16..9c006fc18821 100644
--- a/arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts
+++ b/arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts
@@ -154,6 +154,10 @@
 
 #include "axp81x.dtsi"
 
+&ac_power_supply {
+	status = "okay";
+};
+
 &reg_aldo1 {
 	regulator-always-on;
 	regulator-min-microvolt = <1800000>;
diff --git a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
index 7d30d3e530fb..838be7b3715f 100644
--- a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
+++ b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
@@ -237,6 +237,14 @@
 
 #include "axp81x.dtsi"
 
+&ac_power_supply {
+	status = "okay";
+};
+
+&battery_power_supply {
+	status = "okay";
+};
+
 &reg_aldo1 {
 	regulator-always-on;
 	regulator-min-microvolt = <1800000>;
diff --git a/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts b/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
index a5a9f5a0603e..fcbec3d7ccd7 100644
--- a/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
+++ b/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
@@ -247,6 +247,14 @@
 
 #include "axp81x.dtsi"
 
+&ac_power_supply {
+	status = "okay";
+};
+
+&battery_power_supply {
+	status = "okay";
+};
+
 &reg_aldo1 {
 	regulator-always-on;
 	regulator-min-microvolt = <1800000>;
-- 
2.20.1
