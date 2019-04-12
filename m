From: Pablo Greco <pgreco@centosproject.org>
Subject: [PATCH v2 1/6] ARM: dts: sun8i: v40: bananapi-m2-berry: Sort device node dereferences.
Date: Fri, 12 Apr 2019 07:33:00 -0300
Message-ID: <1555065186-8154-2-git-send-email-pgreco@centosproject.org>
References: <1555065186-8154-1-git-send-email-pgreco@centosproject.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555065186-8154-1-git-send-email-pgreco@centosproject.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-sunxi@googlegroups.com
Cc: Pablo Greco <pgreco@centosproject.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The device node dereferences are out of order, sort them.

Signed-off-by: Pablo Greco <pgreco@centosproject.org>
---
 arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 36 +++++++++++------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
index bf97f62..f05cabd 100644
--- a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
+++ b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
@@ -105,6 +105,24 @@
 
 #include "axp22x.dtsi"
 
+&mmc0 {
+	vmmc-supply = <&reg_dcdc1>;
+	bus-width = <4>;
+	cd-gpios = <&pio 7 13 GPIO_ACTIVE_LOW>; /* PH13 */
+	status = "okay";
+};
+
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pg_pins>;
+	vmmc-supply = <&reg_dldo2>;
+	vqmmc-supply = <&reg_dldo1>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+};
+
 &reg_aldo3 {
 	regulator-always-on;
 	regulator-min-microvolt = <2700000>;
@@ -152,24 +170,6 @@
 	regulator-name = "vcc-wifi";
 };
 
-&mmc0 {
-	vmmc-supply = <&reg_dcdc1>;
-	bus-width = <4>;
-	cd-gpios = <&pio 7 13 GPIO_ACTIVE_LOW>; /* PH13 */
-	status = "okay";
-};
-
-&mmc1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mmc1_pg_pins>;
-	vmmc-supply = <&reg_dldo2>;
-	vqmmc-supply = <&reg_dldo1>;
-	mmc-pwrseq = <&wifi_pwrseq>;
-	bus-width = <4>;
-	non-removable;
-	status = "okay";
-};
-
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
1.8.3.1
