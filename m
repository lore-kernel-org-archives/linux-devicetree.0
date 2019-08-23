From: megous@megous.com
Subject: [PATCH] arm64: dts: allwinner: orange-pi-3: Enable WiFi
Date: Fri, 23 Aug 2019 11:42:28 +0200
Message-ID: <20190823094228.6540-1-megous@megous.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ondrej Jirman <megous@megous.com>
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

Orange Pi 3 has AP6256 WiFi/BT module. WiFi part of the module is called
bcm43356 and can be used with the brcmfmac driver. The module is powered by
the two always on regulators (not AXP805).

WiFi uses a PG port with 1.8V voltage level signals. SoC needs to be
configured so that it sets up an 1.8V input bias on this port. This is done
by the pio driver by reading the vcc-pg-supply voltage.

You'll need a fw_bcm43456c5_ag.bin firmware file and nvram.txt
configuration that can be found in the Xulongs's repository for H6:

https://github.com/orangepi-xunlong/OrangePiH6_external/tree/master/ap6256

Mainline brcmfmac driver expects the firmware and nvram at the following
paths relative to the firmware directory:

  brcm/brcmfmac43456-sdio.bin
  brcm/brcmfmac43456-sdio.txt

Signed-off-by: Ondrej Jirman <megous@megous.com>
---

Since RTC patches for H6 were merged, this can now go in too, if it looks ok.

Other patches for this WiFi chip support were merged in previous cycles,
so this just needs enabling in DTS now.

Sorry for the links in the commit log, but this information is useful,
even if the link itself goes bad. Any pointer what to google for
(file names, tree name) is great for anyone searching in the future.

Please take a look.

Thank you,
	Ondrej

 .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index eda9d5f640b9..49d954369087 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -56,6 +56,34 @@
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 	};
+
+	reg_vcc33_wifi: vcc33-wifi {
+		/* Always on 3.3V regulator for WiFi and BT */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc33-wifi";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc5v>;
+	};
+
+	reg_vcc_wifi_io: vcc-wifi-io {
+		/* Always on 1.8V/300mA regulator for WiFi and BT IO */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-wifi-io";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc33_wifi>;
+	};
+
+	wifi_pwrseq: wifi_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rtc 1>;
+		clock-names = "ext_clock";
+		reset-gpios = <&r_pio 1 3 GPIO_ACTIVE_LOW>; /* PM3 */
+		post-power-on-delay-ms = <200>;
+	};
 };
 
 &cpu0 {
@@ -91,6 +119,25 @@
 	status = "okay";
 };
 
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	vmmc-supply = <&reg_vcc33_wifi>;
+	vqmmc-supply = <&reg_vcc_wifi_io>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+
+	brcm: sdio-wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+		interrupt-parent = <&r_pio>;
+		interrupts = <1 0 IRQ_TYPE_LEVEL_LOW>; /* PM0 */
+		interrupt-names = "host-wake";
+	};
+};
+
 &ohci0 {
 	status = "okay";
 };
@@ -102,6 +149,7 @@
 &pio {
 	vcc-pc-supply = <&reg_bldo2>;
 	vcc-pd-supply = <&reg_cldo1>;
+	vcc-pg-supply = <&reg_vcc_wifi_io>;
 };
 
 &r_i2c {
-- 
2.23.0
