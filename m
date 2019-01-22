From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx: Add support for Logic PD i.MX6QD EVM
Date: Tue, 22 Jan 2019 13:19:17 -0200
Message-ID: <CAOMZO5D1bNjBkRbVukDCgXYOO6wqAEiBgj17dmW22Zstcj3e7w@mail.gmail.com>
References: <20190122140705.4918-1-aford173@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122140705.4918-1-aford173@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Ford <aford173@gmail.com>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Adam,

On Tue, Jan 22, 2019 at 12:07 PM Adam Ford <aford173@gmail.com> wrote:

> +       reg_audio: regulator-audio {
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_reg_audio>;
> +               compatible = "regulator-fixed";
> +               regulator-name = "3v3_aud";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               gpio = <&gpio1 29 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +               regulator-always-on;

It seems that the 'regulator-always-on' property is not needed in this case.

> +&i2c1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c1>;
> +       clock-frequency = <400000>;
> +       status = "okay";
> +
> +       codec: wm8962@1a {

Node name should be generic and label name should be specific, so:

wm8962: codec@1a {

> +       chosen {
> +               stdout-path = &uart1;
> +       };
> +
> +       memory@10000000 {

Need to pass device_type = "memory";

> +               reg = <0x10000000 0x80000000>;
> +       };
> +
> +       reg_wl18xx_vmmc: regulator-wl18xx {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vwl1837";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               gpio = <&gpio7 0 GPIO_ACTIVE_HIGH>;
> +               startup-delay-us = <70000>;
> +               enable-active-high;
> +       };
> +

No need for this blank line.

> +};

> +&i2c3 {
> +       clock-frequency = <100000>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c3>;
> +       status = "okay";
> +
> +       pmic: pfuze100@8 {

pfuze100: pmic@8

> +       tmp102_0: tmp102@4a {

generic node name, please.

> +               compatible = "ti,tmp102";
> +               reg = <0x4a>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_tempsense>;
> +               interrupt-parent = <&gpio6>;
> +               interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
> +               #thermal-sensor-cells = <1>;
> +       };
> +
> +       tmp102_1: tmp102@49 {

Ditto

> +               compatible = "ti,tmp102";
> +               reg = <0x49>;
> +               interrupt-parent = <&gpio6>;
> +               interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
> +               #thermal-sensor-cells = <1>;
> +       };
> +
> +       at24c64_mfg: at24@51 {

Ditto

> +               compatible = "atmel,24c64";
> +               pagesize = <32>;
> +               read-only;      /* Manufacturing EEPROM programmed at factory */
> +               reg = <0x51>;
> +       };
> +
> +       at24c64_usr: at24@52 {

Ditto

> +       panel-lvds0 {
> +               compatible = "ampire,am800480b3tmqw";

Could not found this compatible documented.

> +&i2c1 {
> +       ili_touch: ilitouch@26 {

Generic node name, please.

> +               compatible = "ili,ili2117a";

Could not found this compatible documented.
