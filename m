From: Pascal PAILLET-LME <p.paillet@st.com>
Subject: [PATCH v2 1/3] ARM: dts: stm32: add stpmic1 support on stm32mp157c
 ed1 board
Date: Tue, 9 Apr 2019 09:07:03 +0000
Message-ID: <1554800820-5412-2-git-send-email-p.paillet@st.com>
References: <1554800820-5412-1-git-send-email-p.paillet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554800820-5412-1-git-send-email-p.paillet@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "olof@lixom.net" <olof@lixom.net>, "arnd@arndb.de" <arnd@arndb.de>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "biju.das@bp.renesas.com" <biju.das@bp.renesas.com>, Yannick FERTRE <yannick.fertre@st.com>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.i>
Cc: Pascal PAILLET-LME <p.paillet@st.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
List-Id: devicetree@vger.kernel.org

This patch adds stpmic1 support on stm32mp157c ed1 board.
The STPMIC1 is a PMIC from STMicroelectronics. The STPMIC1 integrates 10
regulators, 3 power switches, a watchdog and an input for a power on key.
The DMAs are disabled because the PMIC generates a very few traffic and
DMA channels may lack for other usage.

Signed-off-by: Pascal Paillet <p.paillet@st.com>
---
 arch/arm/boot/dts/stm32mp157c-ed1.dts | 156 ++++++++++++++++++++++++++++++=
----
 1 file changed, 140 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm3=
2mp157c-ed1.dts
index 9fd7943..62a8c78 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -8,6 +8,7 @@
 #include "stm32mp157c.dtsi"
 #include "stm32mp157-pinctrl.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/mfd/st,stpmic1.h>
=20
 / {
 	model =3D "STMicroelectronics STM32MP157C eval daughter";
@@ -42,22 +43,6 @@
 		regulator-always-on;
 	};
=20
-	vdd_sd: regulator-vdd_sd {
-		compatible =3D "regulator-fixed";
-		regulator-name =3D "vdd_sd";
-		regulator-min-microvolt =3D <3300000>;
-		regulator-max-microvolt =3D <3300000>;
-		regulator-always-on;
-	};
-
-	vdd_usb: vdd-usb {
-		compatible =3D "regulator-fixed";
-		regulator-name =3D "vdd_usb";
-		regulator-min-microvolt =3D <3300000>;
-		regulator-max-microvolt =3D <3300000>;
-		regulator-always-on;
-	};
-
 	sd_switch: regulator-sd_switch {
 		compatible =3D "regulator-gpio";
 		regulator-name =3D "sd_switch";
@@ -82,6 +67,145 @@
 	i2c-scl-rising-time-ns =3D <185>;
 	i2c-scl-falling-time-ns =3D <20>;
 	status =3D "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	pmic: stpmic@33 {
+		compatible =3D "st,stpmic1";
+		reg =3D <0x33>;
+		interrupts-extended =3D <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+		status =3D "okay";
+
+		regulators {
+			compatible =3D "st,stpmic1-regulators";
+			ldo1-supply =3D <&v3v3>;
+			ldo2-supply =3D <&v3v3>;
+			ldo3-supply =3D <&vdd_ddr>;
+			ldo5-supply =3D <&v3v3>;
+			ldo6-supply =3D <&v3v3>;
+			pwr_sw1-supply =3D <&bst_out>;
+			pwr_sw2-supply =3D <&bst_out>;
+
+			vddcore: buck1 {
+				regulator-name =3D "vddcore";
+				regulator-min-microvolt =3D <800000>;
+				regulator-max-microvolt =3D <1350000>;
+				regulator-always-on;
+				regulator-initial-mode =3D <0>;
+				regulator-over-current-protection;
+			};
+
+			vdd_ddr: buck2 {
+				regulator-name =3D "vdd_ddr";
+				regulator-min-microvolt =3D <1350000>;
+				regulator-max-microvolt =3D <1350000>;
+				regulator-always-on;
+				regulator-initial-mode =3D <0>;
+				regulator-over-current-protection;
+			};
+
+			vdd: buck3 {
+				regulator-name =3D "vdd";
+				regulator-min-microvolt =3D <3300000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-always-on;
+				st,mask-reset;
+				regulator-initial-mode =3D <0>;
+				regulator-over-current-protection;
+			};
+
+			v3v3: buck4 {
+				regulator-name =3D "v3v3";
+				regulator-min-microvolt =3D <3300000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-always-on;
+				regulator-over-current-protection;
+				regulator-initial-mode =3D <0>;
+			};
+
+			vdda: ldo1 {
+				regulator-name =3D "vdda";
+				regulator-min-microvolt =3D <2900000>;
+				regulator-max-microvolt =3D <2900000>;
+				interrupts =3D <IT_CURLIM_LDO1 0>;
+			};
+
+			v2v8: ldo2 {
+				regulator-name =3D "v2v8";
+				regulator-min-microvolt =3D <2800000>;
+				regulator-max-microvolt =3D <2800000>;
+				interrupts =3D <IT_CURLIM_LDO2 0>;
+			};
+
+			vtt_ddr: ldo3 {
+				regulator-name =3D "vtt_ddr";
+				regulator-min-microvolt =3D <500000>;
+				regulator-max-microvolt =3D <750000>;
+				regulator-always-on;
+				regulator-over-current-protection;
+			};
+
+			vdd_usb: ldo4 {
+				regulator-name =3D "vdd_usb";
+				regulator-min-microvolt =3D <3300000>;
+				regulator-max-microvolt =3D <3300000>;
+				interrupts =3D <IT_CURLIM_LDO4 0>;
+			};
+
+			vdd_sd: ldo5 {
+				regulator-name =3D "vdd_sd";
+				regulator-min-microvolt =3D <2900000>;
+				regulator-max-microvolt =3D <2900000>;
+				interrupts =3D <IT_CURLIM_LDO5 0>;
+				regulator-boot-on;
+			};
+
+			v1v8: ldo6 {
+				regulator-name =3D "v1v8";
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				interrupts =3D <IT_CURLIM_LDO6 0>;
+			};
+
+			vref_ddr: vref_ddr {
+				regulator-name =3D "vref_ddr";
+				regulator-always-on;
+				regulator-over-current-protection;
+			};
+
+			bst_out: boost {
+				regulator-name =3D "bst_out";
+				interrupts =3D <IT_OCP_BOOST 0>;
+			};
+
+			vbus_otg: pwr_sw1 {
+				regulator-name =3D "vbus_otg";
+				interrupts =3D <IT_OCP_OTG 0>;
+			 };
+
+			 vbus_sw: pwr_sw2 {
+				regulator-name =3D "vbus_sw";
+				interrupts =3D <IT_OCP_SWOUT 0>;
+				regulator-active-discharge;
+			 };
+		};
+
+		onkey {
+			compatible =3D "st,stpmic1-onkey";
+			interrupts =3D <IT_PONKEY_F 0>, <IT_PONKEY_R 0>;
+			interrupt-names =3D "onkey-falling", "onkey-rising";
+			power-off-time-sec =3D <10>;
+			status =3D "okay";
+		};
+
+		watchdog {
+			compatible =3D "st,stpmic1-wdt";
+			status =3D "disabled";
+		};
+	};
 };
=20
 &ipcc {
--=20
1.9.1
