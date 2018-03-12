From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 3/4] ARM: dts: sun8i: a33: Enable PMIC power supplies on A33-OLinuXino
Date: Mon, 12 Mar 2018 12:23:55 +0800
Message-ID: <20180312042356.18625-4-wens@csie.org>
References: <20180312042356.18625-1-wens@csie.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180312042356.18625-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The A33-OLinuXino has a DC jack wired to the onboard PMIC's ACIN pins.
There is also a battery connector, wired to the PMIC's battery charger.

Enable the power supplies for both these components.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun8i-a33-olinuxino.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a33-olinuxino.dts b/arch/arm/boot/dts/sun8i-a33-olinuxino.dts
index 925a5339711f..7f8a481af570 100644
--- a/arch/arm/boot/dts/sun8i-a33-olinuxino.dts
+++ b/arch/arm/boot/dts/sun8i-a33-olinuxino.dts
@@ -101,6 +101,14 @@
 
 #include "axp223.dtsi"
 
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
 	regulator-min-microvolt = <3300000>;
-- 
2.16.2
