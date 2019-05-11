From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v8 1/3] arm64: dts: fsl: librem5: Add a device tree for
 the Librem5 devkit
Date: Sat, 11 May 2019 12:34:08 -0300
Message-ID: <CAOMZO5APMf+iuJuqXCrMNX0Ud73iANXvEs+Y59iH+g6tuMX++Q@mail.gmail.com>
References: <20190501225719.3257-1-angus@akkea.ca> <20190501225719.3257-2-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190501225719.3257-2-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Angus,

This looks good. Only minor issues:

On Wed, May 1, 2019 at 7:57 PM Angus Ainslie (Purism) <angus@akkea.ca> wrote:
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> @@ -0,0 +1,823 @@
> +/* SPDX-License-Identifier: GPL-2.0+

This should be
// SPDX-License-Identifier: GPL-2.0+

as pointed out by checkpatch.

> +       reg_1v8_p: regulator-1V8-P {

Maybe lowercase instead?

> +       wifi_pwr_en: wifi-en {
> +               compatible = "regulator-fixed";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_wifi_pwr_en>;
> +               regulator-name = "WIFI_EN";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               gpio = <&gpio3 5 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +               regulator-always-on;

Do you really needs all these regulators to be 'regulator-always-on'?

> +&i2c1 {
> +       clock-frequency = <400000>;

Maybe you could use 100kHz instead in order to avoid the problem
described by the following i.MX8M erratum:

e7805: I2C: When the I2C clock speed is configured for 400 kHz, the
SCL low period violates the I2C spec of 1.3 uS min
https://www.nxp.com/docs/en/errata/IMX8MDQLQ_1N14W.pdf

> +&usdhc2 {
> +       pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +       pinctrl-0 = <&pinctrl_usdhc2>;
> +       pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
> +       pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
> +       bus-width = <4>;
> +       vmmc-supply = <&reg_usdhc2_vmmc>;
> +       power-supply = <&wifi_pwr_en>;
> +

Unneeded blank line.
