From: Jan Tuerk <jan.tuerk@emtrion.com>
Subject: [PATCH 4/5] ARM: dts: Add support for emtrion emCON-MX6 series
Date: Thu, 23 Nov 2017 13:55:54 +0100
Message-ID: <20171123125600.41562-5-jan.tuerk@emtrion.com>
References: <20171123125600.41562-1-jan.tuerk@emtrion.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0457735628407602846=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171123125600.41562-1-jan.tuerk@emtrion.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Jan Tuerk <jan.tuerk@emtrion.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Kevin Hilman <khilman@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, SZ Lin <sz.lin@moxa.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============0457735628407602846==
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This patch adds support for the emtrion GmbH emCON-MX6 modules.
They are available with imx.6 Solo, Dual-Lite, Dual and Quad
equipped with Memory from 512MB to 2GB (configured by U-Boot).

Our default developer-Kit ships with the Avari baseboard and the
EDT ETM0700G0BDH6 Display (imx6[q|dl]-emcon-avari).

The devicetree is split into the common part providing all module
components and the basic support for all SoC versions
(imx6qdl-emcon.dtsi) and parts which are i.mx6 S|DL and D|Q relevant.
Finally the support for the avari baseboard in the developer-kit
configuration is provided by the emcon-avari dts files.

Signed-off-by: Jan Tuerk <jan.tuerk@emtrion.com>
---
 Documentation/devicetree/bindings/arm/emtrion.txt |  13 +
 arch/arm/boot/dts/Makefile                        |   2 +
 arch/arm/boot/dts/imx6dl-emcon-avari.dts          | 233 ++++++
 arch/arm/boot/dts/imx6dl-emcon.dtsi               |  37 +
 arch/arm/boot/dts/imx6q-emcon-avari.dts           | 233 ++++++
 arch/arm/boot/dts/imx6q-emcon.dtsi                |  37 +
 arch/arm/boot/dts/imx6qdl-emcon.dtsi              | 849 ++++++++++++++++++=
++++
 7 files changed, 1404 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/emtrion.txt
 create mode 100644 arch/arm/boot/dts/imx6dl-emcon-avari.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-emcon.dtsi
 create mode 100644 arch/arm/boot/dts/imx6q-emcon-avari.dts
 create mode 100644 arch/arm/boot/dts/imx6q-emcon.dtsi
 create mode 100644 arch/arm/boot/dts/imx6qdl-emcon.dtsi

diff --git a/Documentation/devicetree/bindings/arm/emtrion.txt b/Documentat=
ion/devicetree/bindings/arm/emtrion.txt
new file mode 100644
index 000000000000..3ff6c6c2034d
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/emtrion.txt
@@ -0,0 +1,13 @@
+Emtrion Devicetree Bindings
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+
+emCON Series:
+-------------
+
+Required root node properties
+       - compatible:
+       - "emtrion,emcon-mx6", "fsl,imx6q", "fsl,imx6dl"; : emCON-MX6 Gener=
ic SoM
+       - "emtrion,emcon-mx6", "fsl,imx6q";             : emCON-MX6D or emC=
ON-MX6Q SoM
+       - "emtrion,emcon-mx6-avari", "fsl,imx6q";       : emCON-MX6D or emC=
ON-MX6Q SoM on Avari Base
+       - "emtrion,emcon-mx6", "fsl,imx6dl";            : emCON-MX6S or emC=
ON-MX6DL SoM
+       - "emtrion,emcon-mx6-avari", "fsl,imx6dl";      : emCON-MX6S or emC=
ON-MX6DL SoM on Avari Base
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d0381e9caf21..5ce643ece228 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -373,6 +373,7 @@ dtb-$(CONFIG_SOC_IMX6Q) +=3D \
        imx6dl-colibri-eval-v3.dtb \
        imx6dl-cubox-i.dtb \
        imx6dl-dfi-fs700-m60.dtb \
+       imx6dl-emcon-avari.dtb \
        imx6dl-gw51xx.dtb \
        imx6dl-gw52xx.dtb \
        imx6dl-gw53xx.dtb \
@@ -424,6 +425,7 @@ dtb-$(CONFIG_SOC_IMX6Q) +=3D \
        imx6q-dfi-fs700-m60.dtb \
        imx6q-display5-tianma-tm070-1280x768.dtb \
        imx6q-dmo-edmqmx6.dtb \
+       imx6q-emcon-avari.dtb \
        imx6q-evi.dtb \
        imx6q-gk802.dtb \
        imx6q-gw51xx.dtb \
diff --git a/arch/arm/boot/dts/imx6dl-emcon-avari.dts b/arch/arm/boot/dts/i=
mx6dl-emcon-avari.dts
new file mode 100644
index 000000000000..f8ca63258eda
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-emcon-avari.dts
@@ -0,0 +1,233 @@
+/*
+ * Copyright (C) 2017 emtrion GmbH
+ * Author: Jan Tuerk  <jan.tuerk@emtrion.com>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ *
+ */
+
+/dts-v1/;
+#include "imx6dl.dtsi"
+#include "imx6qdl-emcon.dtsi"
+#include "imx6dl-emcon.dtsi" /*Include camera2 pinmux*/
+
+/ {
+       model =3D "emtrion SoM emCON-MX6 Solo/Dual-Lite Avari";
+       compatible =3D "emtrion,emcon-mx6-avari", "fsl,imx6dl";
+
+       aliases {
+               mmc0 =3D &usdhc3;
+               mmc2 =3D &usdhc1;
+               mmc1 =3D &usdhc2;
+               mmc3 =3D &usdhc4;
+       };
+
+       chosen {
+               stdout-path =3D <&uart1>;
+       };
+
+       memory {
+               reg =3D <0x10000000 0x40000000>;
+       };
+
+       supplies {
+               compatible =3D "simple-bus";
+               #address-cells =3D <1>;
+               #size-cells =3D <0>;
+
+               wallplug5p0: supply@0 {
+                       compatible =3D "regulator-fixed";
+                       reg =3D <0>;
+                       regulator-name =3D "WALL-PLUG";
+                       regulator-min-microvolt =3D <5000000>;
+                       regulator-max-microvolt =3D <5000000>;
+                       regulator-always-on;
+                       regulator-boot-on;
+               };
+
+               base3p3: supply@1 {
+                       compatible =3D "regulator-fixed";
+                       reg =3D <1>;
+                       vin-supply =3D <&wallplug5p0>;
+                       regulator-name =3D "3V3-avari";
+                       regulator-min-microvolt =3D <3300000>;
+                       regulator-max-microvolt =3D <3300000>;
+                       regulator-always-on;
+                       regulator-boot-on;
+               };
+
+               base1p5: supply@2 {
+                       compatible =3D "regulator-fixed";
+                       reg =3D <2>;
+                       vin-supply =3D <&base3p3>;
+                       regulator-name =3D "1V5-avari";
+                       regulator-min-microvolt =3D <1500000>;
+                       regulator-max-microvolt =3D <1500000>;
+                       regulator-always-on;
+                       regulator-boot-on;
+               };
+
+               reg_usb_otg: otgvbus {
+                       compatible =3D "regulator-fixed";
+                       reg =3D <3>;
+                       vin-supply =3D <&wallplug5p0>;
+                       regulator-name =3D "OTG_VBUS";
+                       regulator-min-microvolt =3D <5000000>;
+                       regulator-max-microvolt =3D <5000000>;
+                       gpio =3D <&gpio1 8 GPIO_ACTIVE_LOW>;
+                       regulator-always-on;
+               };
+
+       };
+
+
+       sndosc: 12MHZosc {
+               compatible =3D "fixed-clock";
+               #clock-cells =3D <0>;
+               clock-frequency  =3D <12000000>;
+       };
+
+       sound {
+               compatible =3D "fsl,imx-audio-sgtl5000";
+               model =3D "emCON-avari-sgtl5000";
+               ssi-controller =3D <&ssi2>;
+               audio-codec =3D <&sgtl5000>;
+               audio-routing =3D
+                       "Headphone Jack", "HP_OUT";
+               mux-int-port =3D <2>;
+               mux-ext-port =3D <3>;
+       };
+
+};
+
+
+&iomuxc {
+       pinctrl-names =3D "default";
+       /*Unused emCON-MX6 outputs on AVARI*/
+       pinctrl-0 =3D <
+                                &pinctrl_emcon_gpio1 &pinctrl_emcon_gpio2
+                                &pinctrl_emcon_gpio3 &pinctrl_emcon_gpio5
+                                &pinctrl_emcon_gpio6 &pinctrl_emcon_gpio7
+                                &pinctrl_emcon_gpio8 &pinctrl_emcon_irq_a
+                                &pinctrl_emcon_irq_b &pinctrl_emcon_irq_c
+                                &pinctrl_emcon_irq_pwr &pinctrl_nor_flash
+                                &pinctrl_usdhc2
+                                &pinctrl_spdif_out     &pinctrl_spdif_in
+                                &pinctrl_cpi1          &pinctrl_cpi2
+                               >;
+};
+
+&audmux {
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_audmux>;
+       status =3D "okay";
+};
+
+
+
+&i2c3 {
+       clock-frequency =3D <100000>;
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_i2c3>;
+       status =3D "okay";
+
+       sgtl5000: sgtl5000@0a {
+               compatible =3D "fsl,sgtl5000";
+               reg =3D <0x0a>;
+               clocks =3D <&sndosc>;
+               VDDA-supply =3D <&base3p3>;
+               VDDIO-supply =3D <&base3p3>;
+       };
+
+       boardID: pca8754a@3A {
+               compatible =3D "nxp,pca8574";
+               reg =3D <0x3A>;
+               gpio-controller;
+               #gpio-cells =3D <1>;
+       };
+
+       captouch: edt-ft5x06@38 {
+               reg =3D <0x38>;
+               pinctrl-names =3D "default";
+               pinctrl-0 =3D <&pinctrl_irq_touch2 &pinctrl_emcon_gpio4>;
+               interrupt-parent =3D <&gpio6>;
+               interrupts =3D <31 IRQ_TYPE_EDGE_FALLING>;
+               compatible =3D "edt,edt-ft5406";
+               wake-gpios =3D <&gpio2 3 GPIO_ACTIVE_HIGH>;
+               wakeup-source;
+       };
+};
+
+&ssi2 {
+       status =3D "okay";
+};
+
+&rgb_encoder {
+       status =3D "okay";
+};
+
+&rgb_panel {
+       compatible =3D "edt,etm0700g0bdh6";
+       status =3D "okay";
+};
+
+&i2c2 {
+       status =3D "okay";
+};
+
+&hdmi {
+       ddc-i2c-bus =3D <&i2c2>;
+       status =3D "okay";
+};
+
+&usbh1 {
+       status =3D "okay";
+};
+
+&usbotg {
+       status =3D "okay";
+};
+
+&pcie {
+       status =3D "okay";
+};
+
+&usdhc1 {
+       status =3D "okay";
+};
+
+&can1 {
+       status =3D "okay";
+};
+
+&can2 {
+       status =3D "okay";
+};
+
+&uart2 {
+       status =3D "okay";
+       uart-has-rtscts;
+};
+
+&uart3 {
+       status =3D "okay";
+};
+
+&uart4 {
+       status =3D "okay";
+};
+
+&uart5 {
+       status =3D "okay";
+};
+
+&ecspi2 {
+       status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx6dl-emcon.dtsi b/arch/arm/boot/dts/imx6dl=
-emcon.dtsi
new file mode 100644
index 000000000000..47f43bae5ac5
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-emcon.dtsi
@@ -0,0 +1,37 @@
+/*
+ * Copyright (C) 2017 emtrion GmbH
+ * Author: Jan Tuerk  <jan.tuerk@emtrion.com>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ *
+ */
+
+/ {
+       model =3D "emtrion SoM emCON-MX6 Solo/DualLite";
+       compatible =3D "emtrion,emcon-mx6","fsl,imx6dl";
+};
+
+&iomuxc {
+       pinctrl_cpi2: csi1grp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_EIM_D17__IPU1_CSI1_PIXCLK    0x0b0b1
+                       MX6QDL_PAD_EIM_EB3__IPU1_CSI1_HSYNC             0x1=
b0b1
+                       MX6QDL_PAD_EIM_D29__IPU1_CSI1_VSYNC             0x1=
b0b1
+                       MX6QDL_PAD_EIM_A17__IPU1_CSI1_DATA12    0x1b0b1
+                       MX6QDL_PAD_EIM_D27__IPU1_CSI1_DATA13    0x1b0b1
+                       MX6QDL_PAD_EIM_D26__IPU1_CSI1_DATA14    0x1b0b1
+                       MX6QDL_PAD_EIM_D20__IPU1_CSI1_DATA15    0x1b0b1
+                       MX6QDL_PAD_EIM_D19__IPU1_CSI1_DATA16    0x1b0b1
+                       MX6QDL_PAD_EIM_D18__IPU1_CSI1_DATA17    0x1b0b1
+                       MX6QDL_PAD_EIM_D16__IPU1_CSI1_DATA18    0x1b0b1
+                       MX6QDL_PAD_EIM_EB2__IPU1_CSI1_DATA19    0x1b0b1
+               >;
+       };
+};
diff --git a/arch/arm/boot/dts/imx6q-emcon-avari.dts b/arch/arm/boot/dts/im=
x6q-emcon-avari.dts
new file mode 100644
index 000000000000..bccfd6344c18
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-emcon-avari.dts
@@ -0,0 +1,233 @@
+/*
+ * Copyright (C) 2017 emtrion GmbH
+ * Author: Jan Tuerk  <jan.tuerk@emtrion.com>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ *
+ */
+
+/dts-v1/;
+#include "imx6q.dtsi"
+#include "imx6qdl-emcon.dtsi"
+#include "imx6q-emcon.dtsi" /*Include camera2 pinmux*/
+
+/ {
+       model =3D "emtrion SoM emCON-MX6 Dual/Quad on Avari";
+       compatible =3D "emtrion,emcon-mx6-avari", "fsl,imx6q";
+
+       aliases {
+               mmc0 =3D &usdhc3;
+               mmc2 =3D &usdhc1;
+               mmc1 =3D &usdhc2;
+               mmc3 =3D &usdhc4;
+       };
+
+       chosen {
+               stdout-path =3D <&uart1>;
+       };
+
+       memory {
+               reg =3D <0x10000000 0x40000000>;
+       };
+
+       supplies {
+               compatible =3D "simple-bus";
+               #address-cells =3D <1>;
+               #size-cells =3D <0>;
+
+               wallplug5p0: supply@0 {
+                       compatible =3D "regulator-fixed";
+                       reg =3D <0>;
+                       regulator-name =3D "WALL-PLUG";
+                       regulator-min-microvolt =3D <5000000>;
+                       regulator-max-microvolt =3D <5000000>;
+                       regulator-always-on;
+                       regulator-boot-on;
+               };
+
+               base3p3: supply@1 {
+                       compatible =3D "regulator-fixed";
+                       reg =3D <1>;
+                       vin-supply =3D <&wallplug5p0>;
+                       regulator-name =3D "3V3-avari";
+                       regulator-min-microvolt =3D <3300000>;
+                       regulator-max-microvolt =3D <3300000>;
+                       regulator-always-on;
+                       regulator-boot-on;
+               };
+
+               base1p5: supply@2 {
+                       compatible =3D "regulator-fixed";
+                       reg =3D <2>;
+                       vin-supply =3D <&base3p3>;
+                       regulator-name =3D "1V5-avari";
+                       regulator-min-microvolt =3D <1500000>;
+                       regulator-max-microvolt =3D <1500000>;
+                       regulator-always-on;
+                       regulator-boot-on;
+               };
+
+               reg_usb_otg: otgvbus {
+                       compatible =3D "regulator-fixed";
+                       reg =3D <3>;
+                       vin-supply =3D <&wallplug5p0>;
+                       regulator-name =3D "OTG_VBUS";
+                       regulator-min-microvolt =3D <5000000>;
+                       regulator-max-microvolt =3D <5000000>;
+                       gpio =3D <&gpio1 8 GPIO_ACTIVE_LOW>;
+                       regulator-always-on;
+               };
+
+       };
+
+
+       sndosc: 12MHZosc {
+               compatible =3D "fixed-clock";
+               #clock-cells =3D <0>;
+               clock-frequency  =3D <12000000>;
+       };
+
+       sound {
+               compatible =3D "fsl,imx-audio-sgtl5000";
+               model =3D "emCON-avari-sgtl5000";
+               ssi-controller =3D <&ssi2>;
+               audio-codec =3D <&sgtl5000>;
+               audio-routing =3D
+                       "Headphone Jack", "HP_OUT";
+               mux-int-port =3D <2>;
+               mux-ext-port =3D <3>;
+       };
+
+};
+
+
+&iomuxc {
+       pinctrl-names =3D "default";
+       /*Unused emCON-MX6 pingroups on AVARI baseboard, enable defaults*/
+       pinctrl-0 =3D <
+                                &pinctrl_emcon_gpio1 &pinctrl_emcon_gpio2
+                                &pinctrl_emcon_gpio3 &pinctrl_emcon_gpio5
+                                &pinctrl_emcon_gpio6 &pinctrl_emcon_gpio7
+                                &pinctrl_emcon_gpio8 &pinctrl_emcon_irq_a
+                                &pinctrl_emcon_irq_b &pinctrl_emcon_irq_c
+                                &pinctrl_emcon_irq_pwr &pinctrl_nor_flash
+                                &pinctrl_usdhc2
+                                &pinctrl_spdif_out     &pinctrl_spdif_in
+                                &pinctrl_cpi1          &pinctrl_cpi2
+                               >;
+};
+
+&audmux {
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_audmux>;
+       status =3D "okay";
+};
+
+
+
+&i2c3 {
+       clock-frequency =3D <100000>;
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_i2c3>;
+       status =3D "okay";
+
+       sgtl5000: sgtl5000@0a {
+               compatible =3D "fsl,sgtl5000";
+               reg =3D <0x0a>;
+               clocks =3D <&sndosc>;
+               VDDA-supply =3D <&base3p3>;
+               VDDIO-supply =3D <&base3p3>;
+       };
+
+       boardID: pca8754a@3A {
+               compatible =3D "nxp,pca8574";
+               reg =3D <0x3A>;
+               gpio-controller;
+               #gpio-cells =3D <1>;
+       };
+
+       captouch: edt-ft5x06@38 {
+               reg =3D <0x38>;
+               pinctrl-names =3D "default";
+               pinctrl-0 =3D <&pinctrl_irq_touch2 &pinctrl_emcon_gpio4>;
+               interrupt-parent =3D <&gpio6>;
+               interrupts =3D <31 IRQ_TYPE_EDGE_FALLING>;
+               compatible =3D "edt,edt-ft5406";
+               wake-gpios =3D <&gpio2 3 GPIO_ACTIVE_HIGH>;
+               wakeup-source;
+       };
+};
+
+&ssi2 {
+       status =3D "okay";
+};
+
+&rgb_encoder {
+       status =3D "okay";
+};
+
+&rgb_panel {
+       compatible =3D "edt,etm0700g0bdh6";
+       status =3D "okay";
+};
+
+&i2c2 {
+       status =3D "okay";
+};
+
+&hdmi {
+       ddc-i2c-bus =3D <&i2c2>;
+       status =3D "okay";
+};
+
+&usbh1 {
+       status =3D "okay";
+};
+
+&usbotg {
+       status =3D "okay";
+};
+
+&pcie {
+       status =3D "okay";
+};
+
+&usdhc1 {
+       status =3D "okay";
+};
+
+&can1 {
+       status =3D "okay";
+};
+
+&can2 {
+       status =3D "okay";
+};
+
+&uart2 {
+       status =3D "okay";
+       uart-has-rtscts;
+};
+
+&uart3 {
+       status =3D "okay";
+};
+
+&uart4 {
+       status =3D "okay";
+};
+
+&uart5 {
+       status =3D "okay";
+};
+
+&ecspi2 {
+       status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/imx6q-emcon.dtsi b/arch/arm/boot/dts/imx6q-e=
mcon.dtsi
new file mode 100644
index 000000000000..64fc0cd74c05
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-emcon.dtsi
@@ -0,0 +1,37 @@
+/*
+ * Copyright (C) 2017 emtrion GmbH
+ * Author: Jan Tuerk  <jan.tuerk@emtrion.com>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ *
+ */
+
+/ {
+       model =3D "emtrion SoM emCON-MX6 Dual/Quad";
+       compatible =3D "emtrion,emcon-mx6","fsl,imx6q";
+};
+
+&iomuxc {
+       pinctrl_cpi2: csi1grp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_EIM_D17__IPU2_CSI1_PIXCLK    0x0b0b1
+                       MX6QDL_PAD_EIM_EB3__IPU2_CSI1_HSYNC             0x1=
b0b1
+                       MX6QDL_PAD_EIM_D29__IPU2_CSI1_VSYNC             0x1=
b0b1
+                       MX6QDL_PAD_EIM_A17__IPU2_CSI1_DATA12    0x1b0b1
+                       MX6QDL_PAD_EIM_D27__IPU2_CSI1_DATA13    0x1b0b1
+                       MX6QDL_PAD_EIM_D26__IPU2_CSI1_DATA14    0x1b0b1
+                       MX6QDL_PAD_EIM_D20__IPU2_CSI1_DATA15    0x1b0b1
+                       MX6QDL_PAD_EIM_D19__IPU2_CSI1_DATA16    0x1b0b1
+                       MX6QDL_PAD_EIM_D18__IPU2_CSI1_DATA17    0x1b0b1
+                       MX6QDL_PAD_EIM_D16__IPU2_CSI1_DATA18    0x1b0b1
+                       MX6QDL_PAD_EIM_EB2__IPU2_CSI1_DATA19    0x1b0b1
+               >;
+       };
+};
diff --git a/arch/arm/boot/dts/imx6qdl-emcon.dtsi b/arch/arm/boot/dts/imx6q=
dl-emcon.dtsi
new file mode 100644
index 000000000000..22ad05880ea7
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qdl-emcon.dtsi
@@ -0,0 +1,849 @@
+/*
+ * Copyright (C) 2017 emtrion GmbH
+ * Author: Jan Tuerk  <jan.tuerk@emtrion.com>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ *
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+
+       model =3D "emtrion SoM emCON-MX6";
+       compatible =3D "emtrion,emcon-mx6","fsl,imx6q", "fsl,imx6dl";
+
+       aliases {
+               mmc0 =3D &usdhc3;
+               mmc2 =3D &usdhc1;
+               mmc1 =3D &usdhc2;
+       };
+
+       regulators {
+               compatible =3D "simple-bus";
+               #address-cells =3D <1>;
+               #size-cells =3D <0>;
+
+               reg_parallel_disp: regulator@0 {
+                       compatible =3D "regulator-fixed";
+                       reg =3D <0>;
+                       pinctrl-names =3D "default";
+                       pinctrl-0 =3D <&pinctrl_rgb_bl_en>;
+                       regulator-name =3D "LCD-Supply";
+                       regulator-min-microvolt =3D <5000000>;
+                       regulator-max-microvolt =3D <5000000>;
+                       gpio =3D <&gpio7 9 GPIO_ACTIVE_HIGH>;
+                       enable-active-high;
+               };
+
+               reg_lvds_disp: regulator@1 {
+                       compatible =3D "regulator-fixed";
+                       reg =3D <1>;
+                       regulator-name =3D "LVDS-Supply";
+                       regulator-min-microvolt =3D <5000000>;
+                       regulator-max-microvolt =3D <5000000>;
+                       gpio =3D <&gpio7 10 GPIO_ACTIVE_HIGH>;
+                       enable-active-high;
+               };
+       };
+
+       som_leds: leds {
+               compatible =3D "gpio-leds";
+               pinctrl-names =3D "default";
+               pinctrl-0 =3D <&pinctrl_som_leds>;
+
+               green {
+                       label =3D "som:green";
+                       gpios =3D <&gpio3 0 GPIO_ACTIVE_HIGH>;
+                       linux,default-trigger =3D "heartbeat";
+                       default-state =3D "on";
+               };
+
+               red {
+                       label =3D "som:red";
+                       gpios =3D <&gpio3 1 GPIO_ACTIVE_LOW>;
+                       default-state =3D "keep";
+               };
+
+       };
+
+       gpio-keys {
+               compatible =3D "gpio-keys";
+               pinctrl-names =3D "default";
+               pinctrl-0 =3D <&pinctrl_emcon_wake>;
+
+               wake {
+                       label =3D "Wake";
+                       linux,code =3D <KEY_WAKEUP>;
+                       gpios =3D <&gpio3 2 GPIO_ACTIVE_LOW>;
+                       wakeup-source;
+               };
+       };
+
+       pwm_fan: pwm-fan {
+               compatible =3D "pwm-fan";
+               cooling-min-state =3D <0>;
+               cooling-max-state =3D <4>;
+               #cooling-cells =3D <2>;
+               pwms =3D <&pwm4 0 50000>;
+               cooling-levels =3D <0 64 127 191 255>;
+               status =3D "disabled";
+       };
+
+       rgb_encoder: lcd@di0 {
+               compatible =3D "fsl,imx-parallel-display";
+               #address-cells =3D <1>;
+               #size-cells =3D <0>;
+               pinctrl-names =3D "default";
+               pinctrl-0 =3D <&pinctrl_rgb24_display>;
+               status =3D "disabled";
+
+               port@0 {
+                       reg =3D <0>;
+                       rgb_encoder_in: endpoint {
+                               remote-endpoint =3D <&ipu1_di0_disp0>;
+                       };
+               };
+
+               port@1 {
+                       reg =3D <1>;
+                       rgb_encoder_out: endpoint {
+                               remote-endpoint =3D <&rgb_panel_in>;
+                       };
+               };
+       };
+
+       rgb_panel: panel {
+               backlight =3D <&rgb_backlight>;
+               power-supply =3D <&reg_prallel_disp>;
+               port {
+                       rgb_panel_in: endpoint {
+                               remote-endpoint =3D <&rgb_encoder_out>;
+                       };
+               };
+       };
+
+       rgb_backlight: rgb_backlight {
+               compatible =3D "pwm-backlight";
+               pinctrl-names =3D "default";
+               pinctrl-0 =3D <&pinctrl_rgb_bl>;
+               enable-gpios =3D <&gpio6 8 GPIO_ACTIVE_HIGH>;
+               pwms =3D <&pwm3 0 5000000>;
+               brightness-levels =3D <250 176 160 144 128 112
+                                                       96 80 64 48 32 16 8=
 1
+                                                       >;
+               default-brightness-level =3D <13>;
+               status =3D "okay";
+       };
+
+       lvds_backlight: lvds_backlight {
+               compatible =3D "pwm-backlight";
+               pinctrl-names =3D "default";
+               pinctrl-0 =3D <&pinctrl_lvds_bl>;
+               enable-gpios =3D <&gpio6 9 GPIO_ACTIVE_HIGH>;
+               pwms =3D <&pwm1 0 50000>;
+               brightness-levels =3D <0 4 8 16 32 64 80 96 112
+                                                       128 144 160 176 250
+                                                       >;
+               default-brightness-level =3D <13>;
+               status =3D "okay";
+       };
+};
+
+
+&iomuxc {
+
+       pinctrl_secure: securegrp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_GPIO_18__GPIO7_IO13                  0x1=
b0b1
+               >;
+       };
+
+       pinctrl_uart1: uart1grp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA    0x1b0b1
+                       MX6QDL_PAD_CSI0_DAT11__UART1_RX_DATA    0x1b0b1
+               >;
+       };
+
+       pinctrl_uart2: uart2grp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_SD4_DAT5__UART2_RTS_B                0x1=
b0b1
+                       MX6QDL_PAD_SD4_DAT6__UART2_CTS_B                0x1=
b0b1
+                       MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA              0x1=
b0b1
+                       MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA              0x1=
b0b1
+               >;
+       };
+
+       pinctrl_uart3: uart3grp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_EIM_D24__UART3_TX_DATA               0x1=
b0b1
+                       MX6QDL_PAD_EIM_D25__UART3_RX_DATA               0x1=
b0b1
+               >;
+       };
+
+       pinctrl_uart4: uart4grp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_KEY_COL0__UART4_TX_DATA              0x1=
b0b1
+                       MX6QDL_PAD_KEY_ROW0__UART4_RX_DATA              0x1=
b0b1
+               >;
+       };
+
+       pinctrl_uart5: uart5grp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_KEY_COL1__UART5_TX_DATA              0x1=
b0b1
+                       MX6QDL_PAD_KEY_ROW1__UART5_RX_DATA              0x1=
b0b1
+               >;
+       };
+
+       pinctrl_emcon_gpio1: emcongpio1 {
+               fsl,pins =3D <
+                       MX6QDL_PAD_NANDF_D0__GPIO2_IO00                 0x0=
b0b1
+               >;
+       };
+
+       pinctrl_emcon_gpio2: emcongpio2 {
+               fsl,pins =3D <
+                       MX6QDL_PAD_NANDF_D1__GPIO2_IO01                 0x0=
b0b1
+               >;
+       };
+
+       pinctrl_emcon_gpio3: emcongpio3 {
+               fsl,pins =3D <
+                       MX6QDL_PAD_NANDF_D2__GPIO2_IO02                 0x0=
b0b1
+               >;
+       };
+
+       pinctrl_emcon_gpio4: emcongpio4 {
+               fsl,pins =3D <
+                       MX6QDL_PAD_NANDF_D3__GPIO2_IO03                 0x0=
b0b1
+               >;
+       };
+
+       pinctrl_emcon_gpio5: emcongpio5 {
+               fsl,pins =3D <
+                       MX6QDL_PAD_NANDF_D4__GPIO2_IO04                 0x0=
b0b1
+               >;
+       };
+
+       pinctrl_emcon_gpio6: emcongpio6 {
+               fsl,pins =3D <
+                       MX6QDL_PAD_NANDF_D5__GPIO2_IO05                 0x0=
b0b1
+               >;
+       };
+
+       pinctrl_emcon_gpio7: emcongpio7 {
+               fsl,pins =3D <
+                       MX6QDL_PAD_NANDF_D6__GPIO2_IO06                 0x0=
b0b1
+               >;
+       };
+
+       pinctrl_emcon_gpio8: emcongpio8 {
+               fsl,pins =3D <
+                       MX6QDL_PAD_NANDF_D7__GPIO2_IO07                 0x0=
b0b1
+               >;
+       };
+
+       pinctrl_emcon_irq_a: emconirqa {
+               fsl,pins =3D <
+                       MX6QDL_PAD_NANDF_CLE__GPIO6_IO07                0x0=
b0b1
+               >;
+       };
+
+       pinctrl_emcon_irq_b: emconirqb {
+               fsl,pins =3D <
+                       MX6QDL_PAD_NANDF_CS2__GPIO6_IO15                0x0=
b0b1
+               >;
+       };
+
+       pinctrl_emcon_irq_c: emconirqc {
+               fsl,pins =3D <
+                       MX6QDL_PAD_NANDF_CS3__GPIO6_IO16                0x0=
b0b1
+               >;
+       };
+
+       pinctrl_emcon_wake: emconwake {
+               fsl,pins =3D <
+                       MX6QDL_PAD_EIM_DA2__GPIO3_IO02                  0x1=
b0b1
+               >;
+       };
+
+       pinctrl_emcon_irq_pwr: emconirqpwr {
+               fsl,pins =3D <
+                       MX6QDL_PAD_EIM_D23__GPIO3_IO23                  0x0=
b0b1
+               >;
+       };
+
+       pinctrl_som_leds: somledgrp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_EIM_DA0__GPIO3_IO00                  0x0=
b0b1
+                       MX6QDL_PAD_EIM_DA1__GPIO3_IO01                  0x0=
b0b1
+               >;
+       };
+
+       pinctrl_nor_flash: norflashgrp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_NANDF_CS0__GPIO6_IO11                0x1=
b0b1
+                       MX6QDL_PAD_EIM_D21__ECSPI4_SCLK                 0x1=
00b1
+                       MX6QDL_PAD_EIM_D28__ECSPI4_MOSI                 0x1=
00b1
+                       MX6QDL_PAD_EIM_D22__ECSPI4_MISO                 0x1=
00b1
+                       MX6QDL_PAD_EIM_A25__GPIO5_IO02                  0x1=
00b1
+               >;
+       };
+
+       pinctrl_ecspi2: ecspi2grp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_EIM_CS0__ECSPI2_SCLK                 0x1=
00b1
+                       MX6QDL_PAD_EIM_CS1__ECSPI2_MOSI                 0x1=
00b1
+                       MX6QDL_PAD_EIM_OE__ECSPI2_MISO                  0x1=
00b1
+                       MX6QDL_PAD_EIM_LBA__GPIO2_IO27                  0x1=
00b1
+                       MX6QDL_PAD_EIM_RW__GPIO2_IO26                   0x1=
00b1
+               >;
+       };
+
+       pinctrl_pwm_fan: pwmfan {
+               fsl,pins =3D <
+                       MX6QDL_PAD_SD4_DAT2__PWM4_OUT                   0x0=
b0b1
+               >;
+       };
+
+       pinctrl_can1: can1grp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX                0x1=
b0b1
+                       MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX                0x1=
b0b1
+               >;
+       };
+
+       pinctrl_can2: can2grp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_KEY_COL4__FLEXCAN2_TX                0x1=
b0b1
+                       MX6QDL_PAD_KEY_ROW4__FLEXCAN2_RX                0x1=
b0b1
+               >;
+       };
+
+       pinctrl_spdif_out: spdifout {
+               fsl,pins =3D <
+                       MX6QDL_PAD_GPIO_19__SPDIF_OUT                   0x1=
3091
+               >;
+       };
+
+       pinctrl_spdif_in: spdifin {
+               fsl,pins =3D <
+                       MX6QDL_PAD_GPIO_16__SPDIF_IN                    0x1=
b0b0
+               >;
+       };
+
+       pinctrl_cpi1: csi0grp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_CSI0_PIXCLK__IPU1_CSI0_PIXCLK 0xb0b1
+                       MX6QDL_PAD_CSI0_MCLK__IPU1_CSI0_HSYNC   0x1b0b1
+                       MX6QDL_PAD_CSI0_VSYNC__IPU1_CSI0_VSYNC  0x1b0b1
+                       MX6QDL_PAD_CSI0_DAT12__IPU1_CSI0_DATA12 0x1b0b1
+                       MX6QDL_PAD_CSI0_DAT13__IPU1_CSI0_DATA13 0x1b0b1
+                       MX6QDL_PAD_CSI0_DAT14__IPU1_CSI0_DATA14 0x1b0b1
+                       MX6QDL_PAD_CSI0_DAT15__IPU1_CSI0_DATA15 0x1b0b1
+                       MX6QDL_PAD_CSI0_DAT16__IPU1_CSI0_DATA16 0x1b0b1
+                       MX6QDL_PAD_CSI0_DAT17__IPU1_CSI0_DATA17 0x1b0b1
+                       MX6QDL_PAD_CSI0_DAT18__IPU1_CSI0_DATA18 0x1b0b1
+                       MX6QDL_PAD_CSI0_DAT19__IPU1_CSI0_DATA19 0x1b0b1
+               >;
+       };
+
+       /*camera2-pinctrl is in imx6q-emcon.dtsi or imx6dl-emcon.dtsi*/
+
+       pinctrl_pcie_ctrl: pciegrp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_EIM_A16__GPIO2_IO22                  0x1=
b0b1
+                       MX6QDL_PAD_GPIO_17__GPIO7_IO12                  0x1=
b0b1
+               >;
+       };
+
+       pinctrl_audmux: audmux {
+               fsl,pins =3D <
+                       MX6QDL_PAD_CSI0_DAT7__AUD3_RXD                  0x1=
30b0
+                       MX6QDL_PAD_CSI0_DAT4__AUD3_TXC                  0x1=
b060
+                       MX6QDL_PAD_CSI0_DAT5__AUD3_TXD                  0x1=
30B0
+                       MX6QDL_PAD_CSI0_DAT6__AUD3_TXFS                 0x1=
b060
+               >;
+       };
+
+       pinctrl_i2c1: i2c1grp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_CSI0_DAT8__I2C1_SDA          0x4001b8b1
+                       MX6QDL_PAD_CSI0_DAT9__I2C1_SCL          0x4001b8b1
+               >;
+       };
+
+       pinctrl_i2c2: i2c2grp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_KEY_COL3__I2C2_SCL           0x4001b8b1
+                       MX6QDL_PAD_KEY_ROW3__I2C2_SDA           0x4001b8b1
+               >;
+       };
+
+       pinctrl_i2c3: i2c3grp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_GPIO_3__I2C3_SCL             0x4000b070
+                       MX6QDL_PAD_GPIO_6__I2C3_SDA             0x4001b870
+               >;
+       };
+
+       pinctrl_pmic: pmicgrp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_SD4_DAT0__GPIO2_IO08                 0x0=
b0b1
+               >;
+       };
+
+       pinctrl_usb_host1: usbhgrp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_EIM_D31__USB_H1_PWR                  0x1=
B058
+                       MX6QDL_PAD_EIM_D30__USB_H1_OC                   0x1=
B058
+               >;
+       };
+
+       pinctrl_usb_otg: usbotggrp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_ENET_RX_ER__USB_OTG_ID               0x1=
7059
+                       MX6QDL_PAD_GPIO_7__GPIO1_IO07                   0x1=
7059
+                       MX6QDL_PAD_GPIO_8__GPIO1_IO08                   0x1=
7059
+               >;
+       };
+
+       pinctrl_lvds_reg: lvdsreggrp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_SD4_CLK__GPIO7_IO10                  0x0=
b0b1
+               >;
+       };
+
+       pinctrl_lvds_bl: lvdsbacklightgrp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_GPIO_9__PWM1_OUT                     0x0=
b0b1
+                       MX6QDL_PAD_NANDF_WP_B__GPIO6_IO09               0x0=
b0b1
+               >;
+       };
+
+       pinctrl_irq_touch1: irqtouch1 {
+               fsl,pins =3D <
+                       MX6QDL_PAD_GPIO_5__GPIO1_IO05                   0x0=
b0b1
+               >;
+       };
+
+       pinctrl_rgb_bl_en: rgbenable {
+               fsl,pins =3D <
+                       MX6QDL_PAD_SD4_CMD__GPIO7_IO09                  0x0=
b0b1
+               >;
+       };
+
+       pinctrl_irq_touch2: irqtouch2 {
+               fsl,pins =3D <
+                       MX6QDL_PAD_EIM_BCLK__GPIO6_IO31                 0x0=
b0b1
+               >;
+       };
+
+       pinctrl_rgb_bl: rgbbacklightgrp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_SD4_DAT1__PWM3_OUT                   0x0=
b0b1
+                       MX6QDL_PAD_NANDF_ALE__GPIO6_IO08                0x0=
b0b1
+               >;
+       };
+
+       pinctrl_rgb24_display: rgbgrp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK 0x10
+                       MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15       0x10
+                       MX6QDL_PAD_DI0_PIN2__IPU1_DI0_PIN02        0x10
+                       MX6QDL_PAD_DI0_PIN3__IPU1_DI0_PIN03        0x10
+                       MX6QDL_PAD_DISP0_DAT0__IPU1_DISP0_DATA00   0x10
+                       MX6QDL_PAD_DISP0_DAT1__IPU1_DISP0_DATA01   0x10
+                       MX6QDL_PAD_DISP0_DAT2__IPU1_DISP0_DATA02   0x10
+                       MX6QDL_PAD_DISP0_DAT3__IPU1_DISP0_DATA03   0x10
+                       MX6QDL_PAD_DISP0_DAT4__IPU1_DISP0_DATA04   0x10
+                       MX6QDL_PAD_DISP0_DAT5__IPU1_DISP0_DATA05   0x10
+                       MX6QDL_PAD_DISP0_DAT6__IPU1_DISP0_DATA06   0x10
+                       MX6QDL_PAD_DISP0_DAT7__IPU1_DISP0_DATA07   0x10
+                       MX6QDL_PAD_DISP0_DAT8__IPU1_DISP0_DATA08   0x10
+                       MX6QDL_PAD_DISP0_DAT9__IPU1_DISP0_DATA09   0x10
+                       MX6QDL_PAD_DISP0_DAT10__IPU1_DISP0_DATA10  0x10
+                       MX6QDL_PAD_DISP0_DAT11__IPU1_DISP0_DATA11  0x10
+                       MX6QDL_PAD_DISP0_DAT12__IPU1_DISP0_DATA12  0x10
+                       MX6QDL_PAD_DISP0_DAT13__IPU1_DISP0_DATA13  0x10
+                       MX6QDL_PAD_DISP0_DAT14__IPU1_DISP0_DATA14  0x10
+                       MX6QDL_PAD_DISP0_DAT15__IPU1_DISP0_DATA15  0x10
+                       MX6QDL_PAD_DISP0_DAT16__IPU1_DISP0_DATA16  0x10
+                       MX6QDL_PAD_DISP0_DAT17__IPU1_DISP0_DATA17  0x10
+                       MX6QDL_PAD_DISP0_DAT18__IPU1_DISP0_DATA18  0x10
+                       MX6QDL_PAD_DISP0_DAT19__IPU1_DISP0_DATA19  0x10
+                       MX6QDL_PAD_DISP0_DAT20__IPU1_DISP0_DATA20  0x10
+                       MX6QDL_PAD_DISP0_DAT21__IPU1_DISP0_DATA21  0x10
+                       MX6QDL_PAD_DISP0_DAT22__IPU1_DISP0_DATA22  0x10
+                       MX6QDL_PAD_DISP0_DAT23__IPU1_DISP0_DATA23  0x10
+               >;
+       };
+
+       pinctrl_enet: enetgrp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_ENET_MDIO__ENET_MDIO                 0x1=
b030
+                       MX6QDL_PAD_ENET_MDC__ENET_MDC                   0x1=
b030
+                       MX6QDL_PAD_RGMII_TXC__RGMII_TXC                 0x1=
b030
+                       MX6QDL_PAD_RGMII_TD0__RGMII_TD0                 0x1=
b030
+                       MX6QDL_PAD_RGMII_TD1__RGMII_TD1                 0x1=
b030
+                       MX6QDL_PAD_RGMII_TD2__RGMII_TD2                 0x1=
b030
+                       MX6QDL_PAD_RGMII_TD3__RGMII_TD3                 0x1=
b030
+                       MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL   0x1b030
+                       MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK    0x4001a0b1
+                       MX6QDL_PAD_RGMII_RXC__RGMII_RXC                 0x1=
b030
+                       MX6QDL_PAD_RGMII_RD0__RGMII_RD0                 0x1=
b030
+                       MX6QDL_PAD_RGMII_RD1__RGMII_RD1                 0x1=
b030
+                       MX6QDL_PAD_RGMII_RD2__RGMII_RD2                 0x1=
b030
+                       MX6QDL_PAD_RGMII_RD3__RGMII_RD3                 0x1=
b030
+                       MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL   0x1b0b0
+                       MX6QDL_PAD_CSI0_DATA_EN__GPIO5_IO20             0x1=
b058
+                       MX6QDL_PAD_ENET_TXD0__GPIO1_IO30                0x1=
b0b0
+                >;
+       };
+
+
+       pinctrl_usdhc3: usdhc3grp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_SD3_CMD__SD3_CMD                     0x1=
7059
+                       MX6QDL_PAD_SD3_CLK__SD3_CLK                     0x1=
0059
+                       MX6QDL_PAD_SD3_DAT0__SD3_DATA0                  0x1=
7059
+                       MX6QDL_PAD_SD3_DAT1__SD3_DATA1                  0x1=
7059
+                       MX6QDL_PAD_SD3_DAT2__SD3_DATA2                  0x1=
7059
+                       MX6QDL_PAD_SD3_DAT3__SD3_DATA3                  0x1=
7059
+                       MX6QDL_PAD_SD3_DAT4__SD3_DATA4                  0x1=
7059
+                       MX6QDL_PAD_SD3_DAT5__SD3_DATA5                  0x1=
7059
+                       MX6QDL_PAD_SD3_DAT6__SD3_DATA6                  0x1=
7059
+                       MX6QDL_PAD_SD3_DAT7__SD3_DATA7                  0x1=
7059
+                       MX6QDL_PAD_SD3_RST__SD3_RESET                   0x1=
b0b1
+               >;
+       };
+
+       pinctrl_usdhc1: usdhc1grp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_SD1_CMD__SD1_CMD                     0x1=
7059
+                       MX6QDL_PAD_SD1_CLK__SD1_CLK                     0x1=
0059
+                       MX6QDL_PAD_SD1_DAT0__SD1_DATA0                  0x1=
7059
+                       MX6QDL_PAD_SD1_DAT1__SD1_DATA1                  0x1=
7059
+                       MX6QDL_PAD_SD1_DAT2__SD1_DATA2                  0x1=
7059
+                       MX6QDL_PAD_SD1_DAT3__SD1_DATA3                  0x1=
7059
+                       MX6QDL_PAD_GPIO_1__SD1_CD_B                     0x1=
b0b1
+                       MX6QDL_PAD_DI0_PIN4__SD1_WP                     0x1=
b0b1
+               >;
+       };
+
+       pinctrl_usdhc2: usdhc2grp {
+               fsl,pins =3D <
+                       MX6QDL_PAD_SD2_CMD__SD2_CMD                     0x1=
7059
+                       MX6QDL_PAD_SD2_CLK__SD2_CLK                     0x1=
0059
+                       MX6QDL_PAD_SD2_DAT0__SD2_DATA0                  0x1=
7059
+                       MX6QDL_PAD_SD2_DAT1__SD2_DATA1                  0x1=
7059
+                       MX6QDL_PAD_SD2_DAT2__SD2_DATA2                  0x1=
7059
+                       MX6QDL_PAD_SD2_DAT3__SD2_DATA3                  0x1=
7059
+                       MX6QDL_PAD_GPIO_4__SD2_CD_B                     0x1=
b0b1
+                       MX6QDL_PAD_GPIO_2__SD2_WP                       0x1=
b0b1
+               >;
+       };
+
+};
+
+
+&i2c1 {
+       clock-frequency =3D <100000>;
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_i2c1>;
+       status =3D "okay";
+
+       rtc: rtc@68 {
+               compatible =3D "dallas,ds1307";
+               reg =3D <0x68>;
+       };
+
+       da9063: da9063@58 {
+               compatible =3D "dlg,da9063";
+               reg =3D <0x58>;
+               pinctrl-names =3D "default";
+               pinctrl-0 =3D <&pinctrl_pmic>;
+               interrupt-parent =3D <&gpio2>;
+               interrupts =3D <8 IRQ_TYPE_LEVEL_LOW>;
+               interrupt-controller;
+
+               onkey {
+                       wakeup-source;
+                       compatible =3D "dlg,da9063-onkey";
+               };
+
+               wdt {
+                       compatible =3D "dlg,da9063-watchdog";
+                       timeout-sec =3D <0>;
+               };
+
+               regulators {
+                       vddcore_reg: bcore1 {
+                               regulator-min-microvolt =3D <1100000>;
+                               regulator-max-microvolt =3D <1450000>;
+                               regulator-ramp-delay =3D <20000>;
+                               regulator-name =3D "DA9063_CORE";
+                               regulator-always-on;
+                       };
+
+                       vddsoc_reg: bcore2 {
+                               regulator-min-microvolt =3D <1100000>;
+                               regulator-max-microvolt =3D <1450000>;
+                               regulator-ramp-delay =3D <20000>;
+                               regulator-name =3D "DA9063_SOC";
+                               regulator-always-on;
+                       };
+
+                       vdd_ddr3_reg: bpro {
+                               regulator-min-microvolt =3D <1500000>;
+                               regulator-max-microvolt =3D <1500000>;
+                               regulator-ramp-delay =3D <20000>;
+                               regulator-always-on;
+                       };
+
+                       vdd_3v3_reg: bperi {
+                               regulator-min-microvolt =3D <3300000>;
+                               regulator-max-microvolt =3D <3300000>;
+                               regulator-ramp-delay =3D <20000>;
+                               regulator-always-on;
+                       };
+
+                       vdd_sata_reg: ldo3 {
+                               regulator-min-microvolt =3D <2500000>;
+                               regulator-max-microvolt =3D <2500000>;
+                               regulator-always-on;
+                       };
+                       vdd_mipi_reg: ldo4 {
+                               regulator-min-microvolt =3D <2500000>;
+                               regulator-max-microvolt =3D <2500000>;
+                               regulator-always-on;
+                       };
+
+                       vdd_mx6_snvs_reg: ldo5 {
+                               regulator-min-microvolt =3D <3300000>;
+                               regulator-max-microvolt =3D <3300000>;
+                               regulator-always-on;
+                       };
+
+                       vdd_hdmi_reg: ldo6 {
+                               regulator-min-microvolt =3D <2500000>;
+                               regulator-max-microvolt =3D <2500000>;
+                               regulator-always-on;
+                               regulator-boot-on;
+                       };
+
+                       vdd_pcie_reg: ldo7 {
+                               regulator-min-microvolt =3D <2500000>;
+                               regulator-max-microvolt =3D <2500000>;
+                               regulator-always-on;
+                       };
+
+                       vdd_1V8_reg: ldo8 {
+                               regulator-min-microvolt =3D <1800000>;
+                               regulator-max-microvolt =3D <1800000>;
+                               regulator-always-on;
+                       };
+
+                       vdd_3V3_sdc_reg: ldo9 {
+                               regulator-min-microvolt =3D <1800000>;
+                               regulator-max-microvolt =3D <3300000>;
+                               regulator-always-on;
+                       };
+
+                       vdd_1V2_reg: ldo10 {
+                               regulator-min-microvolt =3D <1200000>;
+                               regulator-max-microvolt =3D <1200000>;
+                               regulator-always-on;
+                       };
+               };
+       };
+};
+
+&uart1 {
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_uart1>;
+       status =3D "okay";
+};
+
+&uart2 {
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_uart2>;
+};
+
+&uart3 {
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_uart3>;
+};
+
+&uart4 {
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_uart4>;
+};
+
+&uart5 {
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_uart5>;
+};
+
+&fec {
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_enet>;
+       phy-mode =3D "rgmii";
+       phy-reset-gpios =3D <&gpio5 20 GPIO_ACTIVE_LOW>;
+       phy-reset-duration =3D <50>;
+       phy-supply =3D <&vdd_1V8_reg>;
+       phy-handle =3D <&ksz9031>;
+       status =3D "okay";
+
+
+       mdio {
+               #address-cells =3D <1>;
+               #size-cells =3D <0>;
+
+               ksz9031: phy {
+                       reg =3D <0>;
+                       compatible =3D "ethernet-phy-ieee802.3-c22";
+                       interrupt-parent =3D <&gpio1>;
+                       interrupts =3D <30 IRQ_TYPE_EDGE_FALLING>;
+                       rxdv-skew-ps =3D <480>;
+                       txen-skew-ps =3D <480>;
+                       rxd0-skew-ps =3D <480>;
+                       rxd1-skew-ps =3D <480>;
+                       rxd2-skew-ps =3D <480>;
+                       rxd3-skew-ps =3D <480>;
+                       txd0-skew-ps =3D <420>;
+                       txd1-skew-ps =3D <420>;
+                       txd2-skew-ps =3D <360>;
+                       txd3-skew-ps =3D <360>;
+                       txc-skew-ps =3D <1020>;
+                       rxc-skew-ps =3D <960>;
+               };
+       };
+};
+
+
+&usdhc3 {
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_usdhc3>;
+       non-removable;
+       bus-width =3D <8>;
+       status =3D "okay";
+};
+
+&pcie {
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_pcie_ctrl>;
+       reset-gpio =3D <&gpio7 12 GPIO_ACTIVE_LOW>;
+       disable-gpio =3D <&gpio2 22 GPIO_ACTIVE_LOW>;
+};
+
+&i2c2 {
+       clock-frequency =3D <100000>;
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_i2c2>;
+};
+
+&usdhc1 {
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_usdhc1>;
+       fsl,wp-controller;
+};
+
+&usdhc2 {
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_usdhc2>;
+       fsl,wp-controller;
+};
+
+
+&ipu1_di0_disp0 {
+       remote-endpoint =3D <&rgb_encoder_in>;
+};
+
+&pwm1 {
+       status =3D "okay";
+};
+
+&pwm3 {
+       status =3D "okay";
+};
+
+&pwm4 {
+       status =3D "okay";
+};
+
+&ecspi2 {
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_ecspi2>;
+       cs-gpios =3D  <&gpio2 25 GPIO_ACTIVE_HIGH>,
+                               <&gpio2 26 GPIO_ACTIVE_HIGH>;
+};
+
+&ecspi4 {
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_nor_flash>;
+};
+
+&can1 {
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_can1>;
+};
+
+&can2 {
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_can2>;
+};
+
+&usbh1 {
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_usb_host1>;
+};
+
+&usbotg {
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_usb_otg>;
+       vbus-supply =3D <&reg_usb_otg>;
+       dr_mode =3D "peripheral";
+};
+
+/******device power Management*********/
+
+&cpu0 {
+       voltage-tolerance =3D <2>;
+};
+
+&reg_arm {
+       vin-supply =3D <&vddcore_reg>;
+};
+
+&reg_soc {
+       vin-supply =3D <&vddsoc_reg>;
+};
+
+&reg_pu {
+       vin-supply =3D <&vddsoc_reg>;
+};
+
+
+
+/*******Disabled HW following***********/
+
+
+&weim {
+       status =3D "disabled";
+};
+
+&snvs_rtc {
+       status =3D "disabled";
+};
+
--
2.11.0


emtrion GmbH
Kreativpark - Alter Schlachthof 45
76131 Karlsruhe
GERMANY
http://www.emtrion.de
_______________________________________

Amtsgericht Mannheim
HRB 110 300
Gesch=E4ftsf=FChrer: Dieter Baur, Ramona Maurer
_______________________________________


--===============0457735628407602846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0457735628407602846==--
