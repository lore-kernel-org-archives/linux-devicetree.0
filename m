From: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH] arm64: dts: allwinner: a64: orangepi-win: Add wifi and bluetooth nodes
Date: Sun, 28 Apr 2019 22:13:26 +0200
Message-ID: <20190428201326.27767-1-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, wens@csie.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The AP6212 is based on the Broadcom BCM43430 or BCM43438. The WiFi side
identifies as BCM43430, while the Bluetooth side identifies as BCM43438.

WiFi is connected to mmc1 and the Bluetooth side is connected to UART1
in a 4 wire configuration. Same as the WiFi side, due to being the same
chip and package, DLDO2 provides overall power via VBAT, and DLDO4
provides I/O power via VDDIO. The RTC clock output provides the LPO low
power clock at 32.768 kHz.

This patch enables WiFi and Bluetooth on OrangePi Win boards and adds
missing LPO clock on the WiFi side. PCM connection also exists for
Bluetooth audio, but it's not used here.

Bluetooth UART speed is set to 1.5 MBaud in order to be able transmit
audio. While module supports even higher speeds, currently sunxi UART
driver doesn't support higher speed.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../dts/allwinner/sun50i-a64-orangepi-win.dts | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts b/=
arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
index 510f661229dc..5ef3c62c765e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
@@ -109,6 +109,8 @@
 	wifi_pwrseq: wifi_pwrseq {
 		compatible =3D "mmc-pwrseq-simple";
 		reset-gpios =3D <&r_pio 0 8 GPIO_ACTIVE_LOW>; /* PL8 */
+		clocks =3D <&rtc 1>;
+		clock-names =3D "ext_clock";
 	};
 };
=20
@@ -170,6 +172,14 @@
 	bus-width =3D <4>;
 	non-removable;
 	status =3D "okay";
+
+	brcmf: wifi@1 {
+		reg =3D <1>;
+		compatible =3D "brcm,bcm4329-fmac";
+		interrupt-parent =3D <&r_pio>;
+		interrupts =3D <0 7 IRQ_TYPE_LEVEL_LOW>; /* PL7 */
+		interrupt-names =3D "host-wake";
+	};
 };
=20
 &ohci0 {
@@ -342,7 +352,20 @@
 &uart1 {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
 	status =3D "okay";
+
+	bluetooth {
+		compatible =3D "brcm,bcm43438-bt";
+		max-speed =3D <1500000>;
+		clocks =3D <&rtc 1>;
+		clock-names =3D "lpo";
+		vbat-supply =3D <&reg_dldo2>;
+		vddio-supply =3D <&reg_dldo4>;
+		device-wakeup-gpios =3D <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
+		host-wakeup-gpios =3D <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* PL5 */
+		shutdown-gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
+	};
 };
=20
 /* On Pi-2 connector, RTS/CTS optional */
--=20
2.21.0
