From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
Subject: [PATCH 10/12] ARM: dts: imx7d: cl-som-imx7: add WiLink8 WLAN support
Date: Mon, 26 Aug 2019 16:37:58 +0100
Message-ID: <20190826153800.35400-10-git@andred.net>
References: <20190826153800.35400-1-git@andred.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190826153800.35400-1-git@andred.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>, Ilya Ledvich <ilya@compulab.co.il>, Igor Grinberg <grinberg@compulab.co.il>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

add / enable TI's WiLink8 WLAN module on SDIO2.

Notes:
* power is always enabled (because of bluetooth)
* the downstream delay of 70ms after power-on
  doesn't seem to reliably work, hence it was
  bumped to 700ms

Signed-off-by: André Draszik <git@andred.net>
Cc: Ilya Ledvich <ilya@compulab.co.il>
Cc: Igor Grinberg <grinberg@compulab.co.il>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 60 +++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
index a16cbb070a12..4cb36decef3d 100644
--- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
@@ -28,6 +28,24 @@
 		compatible = "smsc,usb3503";
 		reset-gpios = <&pca9555 6 GPIO_ACTIVE_LOW>;
 	};
+
+	pwrseq_ti_wifi: ti-wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pca9555 0 GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <700>;
+		/* 10μs during shutdown, but 60μs between two enables */
+		power-off-delay-us = "60";
+	};
+
+	reg_ti_wifi: regulator-ti-wifi {
+		compatible = "regulator-fixed";
+		regulator-name = "wilink-regulator";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pca9555 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
 };
 
 &cpu0 {
@@ -232,6 +250,31 @@
 	status = "okay";
 };
 
+&usdhc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	bus-width = <4>;
+	no-1-8-v;
+	keep-power-in-suspend;
+	wakeup-source;
+	vmmc-supply = <&reg_ti_wifi>;
+	mmc-pwrseq = <&pwrseq_ti_wifi>;
+	non-removable;
+	cap-power-off-card;
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+	wlcore: wlcore@2 {
+		compatible = "ti,wl1835";
+		reg = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usdhc2_wlcore>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <15 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
+
 &usdhc3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usdhc3>;
@@ -308,6 +351,23 @@
 		>;
 	};
 
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX7D_PAD_SD2_CMD__SD2_CMD		0x59
+			MX7D_PAD_SD2_CLK__SD2_CLK		0x19
+			MX7D_PAD_SD2_DATA0__SD2_DATA0		0x59
+			MX7D_PAD_SD2_DATA1__SD2_DATA1		0x59
+			MX7D_PAD_SD2_DATA2__SD2_DATA2		0x59
+			MX7D_PAD_SD2_DATA3__SD2_DATA3		0x59
+		>;
+	};
+
+	pinctrl_usdhc2_wlcore: usdhc2wlcoregrp {
+		fsl,pins = <
+			MX7D_PAD_GPIO1_IO15__GPIO1_IO15		0x34
+		>;
+	};
+
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
 			MX7D_PAD_SD3_CMD__SD3_CMD		0x59
-- 
2.23.0.rc1
