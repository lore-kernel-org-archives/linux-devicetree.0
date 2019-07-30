From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 14/22] ARM: dts: apalis-imx6: Add some example I2C devices
Date: Tue, 30 Jul 2019 17:53:28 -0300
Message-ID: <CAOMZO5BtXFR7kDuiHedsDA0AaNZqsO_L2x9d3u9ZuULkovChoQ@mail.gmail.com>
References: <20190730144649.19022-1-dev@pschenker.ch> <20190730144649.19022-15-dev@pschenker.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730144649.19022-15-dev@pschenker.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <dev@pschenker.ch>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Max Krummenacher <max.krummenacher@toradex.com>, Stefan Agner <stefan@agner.ch>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Philippe Schenker <philippe.schenker@toradex.com>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 30, 2019 at 11:57 AM Philippe Schenker <dev@pschenker.ch> wrote:

>  &backlight {
> @@ -204,6 +228,77 @@
>   */
>  &i2c3 {
>         status = "okay";
> +
> +       adv7280: adv7280@21 {
> +               compatible = "adv7280";
> +               reg = <0x21>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_ipu1_csi0 &pinctrl_cam_mclk>;
> +               clocks = <&clks 200>;

Please replace this 200 with a proper clock label.

> +               clock-names = "csi_mclk";
> +               DOVDD-supply = <&reg_3p3v>;
> +               AVDD-supply = <&reg_3p3v>;
> +               DVDD-supply = <&reg_3p3v>;
> +               PVDD-supply = <&reg_3p3v>;
> +               csi_id = <0>;

This is not a valid property upstream.

It seems you just ported it from a downstream vendor kernel. Please
make sure you test with the dt-bindings from mainline.

> +               mclk = <24000000>;
> +               mclk_source = <1>;
> +               status = "okay";
> +       };
> +
> +       /* Video ADC on Analog Camera Module */
> +       adv7180: adv7180@21 {
> +               compatible = "adv,adv7180";
> +               reg = <0x21>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_ipu1_csi0 &pinctrl_cam_mclk>;
> +               clocks = <&clks 200>;

clock label, please.

> +               clock-names = "csi_mclk";
> +               DOVDD-supply = <&reg_3p3v>; /* 3.3v */
> +               AVDD-supply = <&reg_3p3v>;  /* 1.8v */
> +               DVDD-supply = <&reg_3p3v>;  /* 1.8v */
> +               PVDD-supply = <&reg_3p3v>;  /* 1.8v */
> +               csi_id = <0>;

Same here

> +               mclk = <24000000>;
> +               mclk_source = <1>;
> +               cvbs = <1>;
> +               status = "disabled";
> +       };
> +
> +       max9526: max9526@20 {
> +               compatible = "maxim,max9526";

This is not documented in mainline.
