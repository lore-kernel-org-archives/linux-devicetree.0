From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] arm: dts: sun6i: a31s: fix: bpi-m2: add
 missing regulators
Date: Fri,  9 Feb 2018 18:52:36 +0100
Message-ID: <20180209175236.21215-4-embed3d@gmail.com>
References: <20180209175236.21215-1-embed3d@gmail.com>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD257DPK24NRB25767JQKGQEPQB65QA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180209175236.21215-1-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch fixes a bootproblem with the Bananapi M2 board. Since there
are some regulators missing we add them right now. Those values come
from the schematic, below you can find a small overview:

* reg_aldo1:  3,3V, powers the wifi
* reg_aldo2:  2,5V, powers the IO of the RTL8211E
* reg_aldo3:  3,3V, powers the audio

* reg_dldo1:  3,0V, powers the RTL8211E
* reg_dldo2:  2,8V, powers the analog part of the csi
* reg_dldo3:  3,3V, powers misc
* reg_eldo1:  1,8V, powers the csi
* reg_ldo_io1:1,8V, powers the gpio

* reg_dc5ldo: needs to be always on

Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts | 56 ++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts b/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
index 51e6f1d21c32..01fcfe0649ad 100644
--- a/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
+++ b/arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts
@@ -99,6 +99,7 @@
 	pinctrl-0 = <&gmac_pins_rgmii_a>, <&gmac_phy_reset_pin_bpi_m2>;
 	phy = <&phy1>;
 	phy-mode = "rgmii";
+	phy-supply = <&reg_dldo1>;
 	snps,reset-gpio = <&pio 0 21 GPIO_ACTIVE_HIGH>; /* PA21 */
 	snps,reset-active-low;
 	snps,reset-delays-us = <0 10000 30000>;
@@ -193,7 +194,28 @@
 
 #include "axp22x.dtsi"
 
+&reg_aldo1 {
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-name = "vcc-wifi";
+};
+
+&reg_aldo2 {
+	regulator-always-on;
+	regulator-min-microvolt = <2500000>;
+	regulator-max-microvolt = <2500000>;
+	regulator-name = "vcc-gmac";
+};
+
+&reg_aldo3 {
+	regulator-always-on;
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "avcc";
+};
+
 &reg_dc5ldo {
+	regulator-always-on;
 	regulator-min-microvolt = <700000>;
 	regulator-max-microvolt = <1320000>;
 	regulator-name = "vdd-cpus";
@@ -233,6 +255,40 @@
 	regulator-name = "vcc-dram";
 };
 
+&reg_dldo1 {
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "vcc-mac";
+};
+
+&reg_dldo2 {
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+	regulator-name = "avdd-csi";
+};
+
+&reg_dldo3 {
+	regulator-always-on;
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-name = "vcc-pb";
+};
+
+&reg_eldo1 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vdd-csi";
+	status = "okay";
+};
+
+&reg_ldo_io1 {
+	regulator-always-on;
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-pm-cpus";
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins_a>;
-- 
2.11.0
