From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 3/5] ARM: dts: sun8i: r40: bananapi-m2-ultra: Fix WiFi regulator definitions
Date: Wed,  9 Jan 2019 23:02:55 +0800
Message-ID: <20190109150257.12602-4-wens@csie.org>
References: <20190109150257.12602-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190109150257.12602-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

The design of the Bananapi M2 Ultra has both DLDO1 and DLDO2 regulators
provide power to the WiFi+BT module, which is based on the Broadcom
BCM43438 or BCM43430 chip. Each regulator output from the PMIC can supply
up to 200 mA. The datasheet of the chip suggests a maximum power draw of
up to 360 mA when transmitting, thus requiring two outputs from the PMIC
to handle the load. However the device tree only references one of them,
leaving the other unused and possibly turned off.

This patch marks both as always-on, since we don't have a proper binding
to specify two regulators as "bound together". The name and constraints
of DLDO2 are also added.

Fixes: da7ac948fa93 ("ARM: dts: sun8i: Add board dts file for Banana Pi M2
		      Ultra")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
index 438b7b44dab3..1a6794e63b90 100644
--- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
+++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
@@ -250,12 +250,27 @@
 	regulator-name = "vcc-wifi-io";
 };
 
+/*
+ * Our WiFi chip needs both DLDO2 and DLDO3 to be powered at the same
+ * time, with the two being in sync, to be able to meet maximum power
+ * consumption during transmits. Since this is not really supported
+ * right now, just use the two as always on, and we will fix it later.
+ */
+
 &reg_dldo2 {
+	regulator-always-on;
 	regulator-min-microvolt = <3300000>;
 	regulator-max-microvolt = <3300000>;
 	regulator-name = "vcc-wifi";
 };
 
+&reg_dldo3 {
+	regulator-always-on;
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-name = "vcc-wifi-2";
+};
+
 &reg_dldo4 {
 	regulator-min-microvolt = <2500000>;
 	regulator-max-microvolt = <2500000>;
-- 
2.20.1
