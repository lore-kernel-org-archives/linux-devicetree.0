From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 2/5] ARM: dts: imx50: Add Kobo Aura DTS
Date: Tue, 19 Mar 2019 16:24:17 +0100
Message-ID: <20190319152421.16179-3-j.neuschaefer@gmx.net>
References: <20190319152421.16179-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190319152421.16179-1-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Thierry Reding <treding@nvidia.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, Jagan Teki <jagan@amarulasolutions.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
List-Id: devicetree@vger.kernel.org

The Kobo Aura is an e-book reader released in 2013.

With the devicetree in its current state, the kernel will boot and run
for about ten seconds. To solve this, the embedded controller needs to
be told that the system should stay powered on. This will be done in a
later patchset.

- The IOMUXC mode bits for the SD interfaces were taken from the
  vendor's U-Boot fork.
- The bus width of the eMMC is 4 bits in the vendor kernel, but I
  achieved better performance with 8 bits.
- The SDIO clock frequency for the WiFi chip is 25MHz in the vendor
  kernel, but the WiFi chip (BCM43362) supports 50MHz, which works
  reliably on this board and gives slightly better performance.
- The I2C pins' IOMUXC settings come from the vendor's U-Boot fork.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 arch/arm/boot/dts/Makefile            |   3 +-
 arch/arm/boot/dts/imx50-kobo-aura.dts | 245 ++++++++++++++++++++++++++
 2 files changed, 247 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/imx50-kobo-aura.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index f4f5aeaf3298..0c85156c552b 100644
=2D-- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -363,7 +363,8 @@ dtb-$(CONFIG_SOC_IMX35) +=3D \
 	imx35-eukrea-mbimxsd35-baseboard.dtb \
 	imx35-pdk.dtb
 dtb-$(CONFIG_SOC_IMX50) +=3D \
-	imx50-evk.dtb
+	imx50-evk.dtb \
+	imx50-kobo-aura.dtb
 dtb-$(CONFIG_SOC_IMX51) +=3D \
 	imx51-apf51.dtb \
 	imx51-apf51dev.dtb \
diff --git a/arch/arm/boot/dts/imx50-kobo-aura.dts b/arch/arm/boot/dts/imx=
50-kobo-aura.dts
new file mode 100644
index 000000000000..e778a677c752
=2D-- /dev/null
+++ b/arch/arm/boot/dts/imx50-kobo-aura.dts
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2019 Jonathan Neusch=C3=A4fer
+//
+// The Kobo Aura e-book reader, model N514. The mainboard is marked as E6=
06F0B.
+
+/dts-v1/;
+#include "imx50.dtsi"
+#include <dt-bindings/input/input.h>
+
+/ {
+	model =3D "Kobo Aura (N514)";
+	compatible =3D "kobo,aura", "fsl,imx50";
+
+	chosen {
+		stdout-path =3D "serial1:115200n8";
+	};
+
+	memory@70000000 {
+		device_type =3D "memory";
+		reg =3D <0x70000000 0x10000000>;
+	};
+
+	gpio-leds {
+		compatible =3D "gpio-leds";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_leds>;
+
+		on {
+			label =3D "kobo_aura:orange:on";
+			gpios =3D <&gpio6 24 GPIO_ACTIVE_LOW>;
+			panic-indicator;
+		};
+	};
+
+	gpio-keys {
+		compatible =3D "gpio-keys";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_gpiokeys>;
+
+		power {
+			label =3D "Power Button";
+			gpios =3D <&gpio4 10 GPIO_ACTIVE_LOW>;
+			linux,code =3D <KEY_POWER>;
+		};
+
+		hallsensor {
+			label =3D "Hallsensor";
+			gpios =3D <&gpio5 15 GPIO_ACTIVE_LOW>;
+			linux,code =3D <0>;
+			linux,input-type =3D <5>;
+		};
+
+		frontlight {
+			label =3D "Frontlight";
+			gpios =3D <&gpio4 1 GPIO_ACTIVE_LOW>;
+			linux,code =3D <KEY_DISPLAYTOGGLE>;
+		};
+	};
+
+	sd2_pwrseq: pwrseq {
+		compatible =3D "mmc-pwrseq-simple";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_sd2_reset>;
+
+		reset-gpios =3D <&gpio4 17 GPIO_ACTIVE_LOW>;
+	};
+
+	sd2_vmmc: gpio-regulator {
+		compatible =3D "regulator-gpio";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_sd2_vmmc>;
+
+		regulator-name =3D "vmmc";
+		states =3D <3300000 0>;
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		enable-gpio =3D <&gpio4 12 GPIO_ACTIVE_LOW>;
+		startup-delay-us =3D <100000>;
+	};
+};
+
+&iomuxc {
+	pinctrl_uart2: uart2 {
+		fsl,pins =3D <
+			MX50_PAD_UART2_TXD__UART2_TXD_MUX	0x1e4
+			MX50_PAD_UART2_RXD__UART2_RXD_MUX	0x1e4
+		>;
+	};
+
+	pinctrl_i2c1: i2c1 {
+		fsl,pins =3D <
+			MX50_PAD_I2C1_SCL__I2C1_SCL		0x400001fd
+			MX50_PAD_I2C1_SDA__I2C1_SDA		0x400001fd
+		>;
+	};
+
+	pinctrl_i2c2: i2c2 {
+		fsl,pins =3D <
+			MX50_PAD_I2C2_SCL__I2C2_SCL		0x400001fd
+			MX50_PAD_I2C2_SDA__I2C2_SDA		0x400001fd
+		>;
+	};
+
+	pinctrl_i2c3: i2c3 {
+		fsl,pins =3D <
+			MX50_PAD_I2C3_SCL__I2C3_SCL		0x400001fd
+			MX50_PAD_I2C3_SDA__I2C3_SDA		0x400001fd
+		>;
+	};
+
+	pinctrl_leds: leds {
+		fsl,pins =3D <
+			MX50_PAD_PWM1__GPIO6_24			0x0
+		>;
+	};
+
+	pinctrl_gpiokeys: gpiokeys {
+		fsl,pins =3D <
+			MX50_PAD_CSPI_MISO__GPIO4_10		0x0
+			MX50_PAD_SD2_D7__GPIO5_15		0x0
+			MX50_PAD_KEY_ROW0__GPIO4_1		0x0
+		>;
+	};
+
+	pinctrl_sd1: sd1 {
+		fsl,pins =3D <
+			MX50_PAD_SD1_CMD__ESDHC1_CMD		0x1e4
+			MX50_PAD_SD1_CLK__ESDHC1_CLK		0xd4
+			MX50_PAD_SD1_D0__ESDHC1_DAT0		0x1d4
+			MX50_PAD_SD1_D1__ESDHC1_DAT1		0x1d4
+			MX50_PAD_SD1_D2__ESDHC1_DAT2		0x1d4
+			MX50_PAD_SD1_D3__ESDHC1_DAT3		0x1d4
+
+			MX50_PAD_SD2_CD__GPIO5_17		0x0
+		>;
+	};
+
+	pinctrl_sd2: sd2 {
+		fsl,pins =3D <
+			MX50_PAD_SD2_CMD__ESDHC2_CMD		0x1e4
+			MX50_PAD_SD2_CLK__ESDHC2_CLK		0xd4
+			MX50_PAD_SD2_D0__ESDHC2_DAT0		0x1d4
+			MX50_PAD_SD2_D1__ESDHC2_DAT1		0x1d4
+			MX50_PAD_SD2_D2__ESDHC2_DAT2		0x1d4
+			MX50_PAD_SD2_D3__ESDHC2_DAT3		0x1d4
+		>;
+	};
+
+	pinctrl_sd2_reset: sd2-reset {
+		fsl,pins =3D <
+			MX50_PAD_ECSPI2_MOSI__GPIO4_17		0x0
+		>;
+	};
+
+	pinctrl_sd2_vmmc: sd2-vmmc {
+		fsl,pins =3D <
+			MX50_PAD_ECSPI1_SCLK__GPIO4_12		0x0
+		>;
+	};
+
+	pinctrl_sd3: sd3 {
+		fsl,pins =3D <
+			MX50_PAD_SD3_CMD__ESDHC3_CMD		0x1e4
+			MX50_PAD_SD3_CLK__ESDHC3_CLK		0xd4
+			MX50_PAD_SD3_D0__ESDHC3_DAT0		0x1d4
+			MX50_PAD_SD3_D1__ESDHC3_DAT1		0x1d4
+			MX50_PAD_SD3_D2__ESDHC3_DAT2		0x1d4
+			MX50_PAD_SD3_D3__ESDHC3_DAT3		0x1d4
+			MX50_PAD_SD3_D4__ESDHC3_DAT4		0x1d4
+			MX50_PAD_SD3_D5__ESDHC3_DAT5		0x1d4
+			MX50_PAD_SD3_D6__ESDHC3_DAT6		0x1d4
+			MX50_PAD_SD3_D7__ESDHC3_DAT7		0x1d4
+		>;
+	};
+};
+
+&uart2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart2>;
+	status =3D "okay";
+};
+
+&i2c1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_i2c1>;
+	status =3D "okay";
+
+	/* TODO: ektf2132 touch controller at 0x15 */
+};
+
+&i2c2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_i2c2>;
+	status =3D "okay";
+
+	/* TODO: TPS65185 PMIC for E Ink at 0x68 */
+};
+
+&i2c3 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_i2c3>;
+	status =3D "okay";
+
+	/* TODO: embedded controller at 0x43 */
+};
+
+&esdhc1 {
+	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_sd1>;
+
+	max-frequency =3D <50000000>;
+	bus-width =3D <4>;
+	cd-gpios =3D <&gpio5 17 GPIO_ACTIVE_LOW>;
+	disable-wp;
+
+	/* External =C2=B5SD card */
+};
+
+&esdhc2 {
+	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_sd2>;
+
+	bus-width =3D <4>;
+	max-frequency =3D <50000000>;
+	disable-wp;
+	mmc-pwrseq =3D <&sd2_pwrseq>;
+	vmmc-supply =3D <&sd2_vmmc>;
+
+	/* CyberTan WC121 SDIO WiFi (BCM43362) */
+};
+
+&esdhc3 {
+	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_sd3>;
+
+	bus-width =3D <8>;
+	non-removable;
+	max-frequency =3D <50000000>;
+	disable-wp;
+
+	/* Internal eMMC */
+};
=2D-
2.20.1
