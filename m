From: pgreco@centosproject.org
Subject: [PATCH 2/2] ARM: dts: sun8i: v40: Update BPi M2 Berry DTS to the
 level of M2 Ultra
Date: Thu, 11 Apr 2019 08:54:49 -0300
Message-ID: <1554983689-47305-3-git-send-email-pgreco@centosproject.org>
References: <1554983689-47305-1-git-send-email-pgreco@centosproject.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1554983689-47305-1-git-send-email-pgreco@centosproject.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-sunxi@googlegroups.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, Pablo Greco <pgreco@centosproject.org>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Pablo Greco <pgreco@centosproject.org>

BPi M2 Berry is a trimmed down version of the BPi M2 Ultra, completely
software compatible.

Changes include:
- 2GiB -> 1GiB
- no eMMC
- no onboard microphone
- no IR
- no blue LED
- no charging (and power jack to USB)
- dropped USB2 and connect USB1 to a 4-port HUB.

This patch brings the BPi M2 Berry to the same level as the BPi M2 Ultra
Includes the changes from:
commit c36fd5a48bd2 ("ARM: dts: sun8i: r40: bananapi-m2-ultra: Enable GMAC
ethernet controller")
commit db49c6825901 ("ARM: dts: sun8i: r40: Enable HDMI output on BananaPi
M2 Ultra")
commit ccefd95f648a ("ARM: dts: sun8i: r40: Add missing TCON-TOP - TCON
connections")
commit 6a7556f604f9 ("ARM: dts: sun8i: r40: Disable TCONs by default.")
commit 666907a3f9bd ("ARM: dts: sun8i: sun8i-r40-bananapi-m2-ultra: enable
AHCI")
commit e5c6e693be83 ("ARM: dts: sun8i: r40: bananapi-m2-ultra: Fix WiFi
regulator definitions")
commit 1e5f1db4ccd8 ("ARM: dts: sun8i: r40: bananapi-m2-ultra: Add
Bluetooth device node")

Signed-off-by: Pablo Greco <pgreco@centosproject.org>
---
 arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 118 ++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
index f05cabd..3d0bb7e 100644
--- a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
+++ b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
@@ -50,6 +50,7 @@
 	compatible = "sinovoip,bpi-m2-berry", "allwinner,sun8i-r40";
 
 	aliases {
+		ethernet0 = &gmac;
 		serial0 = &uart0;
 	};
 
@@ -57,6 +58,17 @@
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -84,14 +96,52 @@
 	wifi_pwrseq: wifi_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&pio 6 10 GPIO_ACTIVE_LOW>; /* PG10 WIFI_EN */
+		clocks = <&ccu CLK_OUTA>;
+		clock-names = "ext_clock";
 	};
 };
 
+&ahci {
+	ahci-supply = <&reg_dldo4>;
+	phy-supply = <&reg_eldo3>;
+	status = "okay";
+};
+
+&de {
+	status = "okay";
+};
+
 &ehci1 {
 	/* Terminus Tech FE 1.1s 4-port USB 2.0 hub here */
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
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -123,6 +173,18 @@
 	status = "okay";
 };
 
+&pio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&clk_out_a_pin>;
+};
+
+&reg_aldo2 {
+	regulator-always-on;
+	regulator-min-microvolt = <2500000>;
+	regulator-max-microvolt = <2500000>;
+	regulator-name = "vcc-pa";
+};
+
 &reg_aldo3 {
 	regulator-always-on;
 	regulator-min-microvolt = <2700000>;
@@ -130,6 +192,12 @@
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
@@ -164,18 +232,68 @@
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
+&reg_dldo4 {
+	regulator-min-microvolt = <2500000>;
+	regulator-max-microvolt = <2500000>;
+	regulator-name = "vdd2v5-sata";
+};
+
+&reg_eldo3 {
+	regulator-min-microvolt = <1200000>;
+	regulator-max-microvolt = <1200000>;
+	regulator-name = "vdd1v2-sata";
+};
+
+&tcon_tv0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
 	status = "okay";
 };
 
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pg_pins>, <&uart3_rts_cts_pg_pins>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clocks = <&ccu CLK_OUTA>;
+		clock-names = "lpo";
+		vbat-supply = <&reg_dldo2>;
+		vddio-supply = <&reg_dldo1>;
+		device-wakeup-gpios = <&pio 6 11 GPIO_ACTIVE_HIGH>; /* PG11 */
+		/* TODO host wake line connected to PMIC GPIO pins */
+		shutdown-gpios = <&pio 7 12 GPIO_ACTIVE_HIGH>; /* PH12 */
+		max-speed = <1500000>;
+	};
+};
+
 &usbphy {
 	usb1_vbus-supply = <&reg_vcc5v0>;
 	status = "okay";
-- 
1.8.3.1
