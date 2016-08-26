From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 3/3] ARM: dts: sun8i-q8-common: Add support for SDIO wifi
 controllers
Date: Fri, 26 Aug 2016 16:52:36 +0200
Message-ID: <20160826145236.30210-4-hdegoede@redhat.com>
References: <20160826145236.30210-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160826145236.30210-1-hdegoede@redhat.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Hans de Goede <hdegoede@redhat.com>
List-Id: devicetree@vger.kernel.org

Most of the sun8i q8 boards have an usb wifi controller, on the
variants which use an USB wifi controller, this will result in a
couple of error msg-s in dmesg when proving the sdio bus and
an used mmc controller.

The best way to deal with wifi on this boards really is to simply
let the kernel auto-detect usb or sdio wifi controllers, so we
will just have to live with the few errors in dmesg.

This has been tested on a23 based q8 tablets with ESP8089, RTL8703AS and
RTL8189FTV wifi controllers.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 arch/arm/boot/dts/sun8i-q8-common.dtsi | 49 ++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-q8-common.dtsi b/arch/arm/boot/dts/sun8i-q8-common.dtsi
index 60fa958..29f837a 100644
--- a/arch/arm/boot/dts/sun8i-q8-common.dtsi
+++ b/arch/arm/boot/dts/sun8i-q8-common.dtsi
@@ -42,10 +42,59 @@
 #include "sunxi-reference-design-tablet.dtsi"
 #include "sun8i-reference-design-tablet.dtsi"
 
+/ {
+	aliases {
+		serial0 = &r_uart;
+		/* Make u-boot set mac-address for wifi without an eeprom */
+		ethernet0 = &sdio_wifi;
+	};
+
+	wifi_pwrseq: wifi_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		/*
+		 * Q8 boards use various PL# pins as wifi-en. On other boards
+		 * these may be connected to a wifi module output pin. To avoid
+		 * short-circuits we configure these as inputs with pull-ups via
+		 * pinctrl, instead of listing them as active-low reset-gpios.
+		 */
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_pwrseq_pin_q8>;
+		/* The esp8089 needs 200 ms after driving wifi-en high */
+		post-power-on-delay-ms = <200>;
+	};
+};
+
 &ehci0 {
 	status  = "okay";
 };
 
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins_a>;
+	vmmc-supply = <&reg_dldo1>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+
+	sdio_wifi: sdio_wifi@1 {
+		reg = <1>;
+	};
+};
+
+&mmc1_pins_a {
+	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+};
+
+&r_pio {
+	wifi_pwrseq_pin_q8: wifi_pwrseq_pin@0 {
+		allwinner,pins = "PL6", "PL7", "PL11";
+		allwinner,function = "gpio_in";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	};
+};
+
 &usbphy {
 	usb1_vbus-supply = <&reg_dldo1>;
 };
-- 
2.9.3
