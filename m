From: Pablo Greco <pgreco@centosproject.org>
Subject: [PATCH v5 2/7] ARM: dts: sun8i: v40: bananapi-m2-berry: Add GPIO pin-bank regulator supplies
Date: Tue, 23 Apr 2019 14:25:59 -0300
Message-ID: <1556040365-10913-3-git-send-email-pgreco@centosproject.org>
References: <1556040365-10913-1-git-send-email-pgreco@centosproject.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556040365-10913-1-git-send-email-pgreco@centosproject.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-sunxi@googlegroups.com
Cc: Pablo Greco <pgreco@centosproject.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The bananapi-m2-berry has the PMIC providing voltage to all the pin-bank
supply rails from its various regulator outputs, tie them to the pio
node.

Signed-off-by: Pablo Greco <pgreco@centosproject.org>
---
 arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
index f05cabd..2cb2ce0 100644
--- a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
+++ b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
@@ -123,6 +123,16 @@
 	status = "okay";
 };
 
+&pio {
+	pinctrl-names = "default";
+	vcc-pa-supply = <&reg_aldo2>;
+	vcc-pc-supply = <&reg_dcdc1>;
+	vcc-pd-supply = <&reg_dcdc1>;
+	vcc-pe-supply = <&reg_eldo1>;
+	vcc-pf-supply = <&reg_dcdc1>;
+	vcc-pg-supply = <&reg_dldo1>;
+};
+
 &reg_aldo3 {
 	regulator-always-on;
 	regulator-min-microvolt = <2700000>;
-- 
1.8.3.1
