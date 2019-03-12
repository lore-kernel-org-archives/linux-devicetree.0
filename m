From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: fsl: librem5: Add a device tree for the
 Librem5 devkit
Date: Mon, 11 Mar 2019 21:10:07 -0300
Message-ID: <CAOMZO5Do+GF-sLO5wHEMR0daUbf4pnrwQby9dtvLXF+4fVC+Xw@mail.gmail.com>
References: <20190311234655.30357-1-angus@akkea.ca> <20190311234655.30357-2-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311234655.30357-2-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, NXP Linux Team <linux-imx@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 11, 2019 at 8:47 PM Angus Ainslie (Purism) <angus@akkea.ca> wrote:

> +/ {
> +       model = "Purism Librem 5 devkit 1.0";
> +       compatible = "fsl,librem5-devkit", "fsl,imx8mq";

This board is not manufactured by FSL/NXP, so it should be
"purism,librem5-devkit", "fsl,imx8mq" instead.

You should also add an entry for the purism vendor entry in
Documentation/devicetree/bindings/vendor-prefixes.txt in a separate
patch.

> +
> +       chosen {
> +               stdout-path = &uart1;
> +       };
> +
> +       reg_usdhc2_vmmc: regulator-vsd-3v3 {

The usual format would be:

reg_usdhc2_vmmc: regulator-usdhc2-vmmc {


> +               compatible = "regulator-fixed";
> +               regulator-name = "VSD_3V3";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +               regulator-always-on;

Always on? It would be better to pass this regulator inside the mmc node.

> +       };
> +
> +       reg_pwr_en: pwr_en {

reg_pwr_en: regulator-pwr-en {

> +               compatible = "regulator-fixed";
> +               regulator-name = "PWR_EN";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               gpio = <&gpio1 8 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +               regulator-always-on;

Same here. No need for "regulator-always-on" as it is controlled by
the gyroscope.

> +&fec1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_fec1>;
> +       phy-mode = "rgmii-id";
> +       phy-handle = <&ethphy0>;
> +       fsl,magic-packet;
> +       status = "okay";
> +       phy-supply = <&reg_pwr_en>;
> +
> +       mdio {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               ethphy0: ethernet-phy@0 {
> +                       compatible = "ethernet-phy-ieee802.3-c22";
> +                       reg = <1>;

You pass @0 and use reg = <1>, which is a mismatch. Building it with
W=1 would have warned you about this mismatch.

> +                       at803x,led-act-blind-workaround;
> +                       at803x,eee-disabled;
> +                       power-supply = <&reg_pwr_en>;
> +               };
> +       };
> +};
> +
> +&iomuxc {
> +       imx8m-som {

No need for this imx8m-som level.


> +               pinctrl_nc: ncgrp {

Not a very descriptive naming.

> +                       fsl,pins = <
> +                       MX8MQ_IOMUXC_SAI1_MCLK_SAI1_MCLK        0x00
> +                       MX8MQ_IOMUXC_I2C4_SCL_I2C4_SCL          0x4000007f
> +                       MX8MQ_IOMUXC_I2C4_SDA_I2C4_SDA          0x4000007f
> +                       >;
> +               };
> +
> +               pinctrl_up: upgrp {

Same here. Also, this is not used. Please remove it.

> +                       fsl,pins = <
> +                       MX8MQ_IOMUXC_SAI1_TXD2_SAI1_TX_DATA2            0x00
> +                       >;
> +               };
> +
> +               pinctrl_csi1: csi1grp {

This is not used at the moment. Please remove it and re-add it when
CSI gets supported.

> +                       fsl,pins = <
> +                       /* CSI_nRST */
> +                       MX8MQ_IOMUXC_GPIO1_IO06_GPIO1_IO6               0x11
> +                       /* CSI_PWDN */
> +                       MX8MQ_IOMUXC_GPIO1_IO07_GPIO1_IO7               0x19
> +                       /* CLK01 */
> +                       MX8MQ_IOMUXC_GPIO1_IO14_CCMSRCGPCMIX_CLKO1      0x19
> +                       >;
> +               };
> +
> +               pinctrl_pwr_en: pwr_engrp {
> +                       fsl,pins = <
> +                       MX8MQ_IOMUXC_GPIO1_IO08_GPIO1_IO8               0x06
> +                       >;
> +               };
> +
> +               pinctrl_wwan: wwan_grp {

Not used. Please remove this one and all unused pinctrl nodes.

> +&i2c1 {
> +       clock-frequency = <400000>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c1>;
> +       status = "okay";
> +
> +       pmic: bd71837@4b {

Node names should be generic: pmic@4b

> +       typec_ptn5100: ptn5110@52 {

Same here.

> +       charger: charger@6b { /* bq25896 */
> +               compatible = "ti,bq25890";
> +               reg = <0x6b>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_charger>;
> +               interrupt-parent = <&gpio3>;
> +               interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
> +               ti,battery-regulation-voltage = <4192000>; // 4.192V
> +               ti,charge-current = <1600000>; // 1.6 A
> +               ti,termination-current = <66000>;  // 66mA
> +               ti,precharge-current = <1300000>; // 1.3A
> +               ti,minimum-sys-voltage = <2750000>; // 2.75V
> +               ti,boost-voltage = <5000000>; // 5V
> +               ti,boost-max-current = <50000>; // 50mA

No // style comments, please/

> +&i2c3 {
> +       clock-frequency = <100000>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c3>, <&pinctrl_imu>;
> +       status = "okay";
> +
> +       lsm9d: lsm9d@6a {
> +               compatible = "st,lsm9ds1-gyro";

I don't find this binding.

> +               reg = <0x6a>;
> +               interrupt-parent = <&gpio3>;
> +               interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
> +               power-supply = <&reg_pwr_en>;
> +       };
> +};

> +&uart4 { /* BT */
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_uart4>, <&pinctrl_bt>;
> +       fsl,uart-has-rtscts;

uart-has-rtscts is preferred.

> +       /* resets = <&modem_reset>; */

Please remove this line instead of commenting it out.
