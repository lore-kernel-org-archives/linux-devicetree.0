From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: imx6ul: Add DTS for ConnectCore 6UL SBC Pro
Date: Tue, 4 Sep 2018 12:37:48 -0300
Message-ID: <CAOMZO5B26iFCY2DeBHa6_=uRT3zgdP5J+HBqzpPY-=7HHgP9EA@mail.gmail.com>
References: <1536074909-8654-1-git-send-email-alex.gonzalez@digi.com> <1536074909-8654-2-git-send-email-alex.gonzalez@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1536074909-8654-2-git-send-email-alex.gonzalez@digi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Gonzalez <alex.gonzalez@digi.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 4, 2018 at 12:28 PM, Alex Gonzalez <alex.gonzalez@digi.com> wrote:

> +&lcdif {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_lcdif_dat0_17
> +                    &pinctrl_lcdif_clken
> +                    &pinctrl_lcdif_hvsync>;
> +       lcd-supply = <&ldo4_ext>;       /* BU90T82 LVDS bridge power */
> +       status = "okay";

Missing a panel attached to the lcdif?

> +&pwm4 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm4>;
> +       clocks = <&clks IMX6UL_CLK_PWM4>,
> +               <&clks IMX6UL_CLK_PWM4>;

Why do you need to pass the clocks here? imx6ul.dtsi already defines it.

> +       status = "okay";
> +};
> +
> +&pwm5 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm5>;
> +       clocks = <&clks IMX6UL_CLK_PWM5>,
> +                <&clks IMX6UL_CLK_PWM5>;

Same here.

> +       pinctrl_sai2: sai2grp {
> +               fsl,pins = <
> +                       MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA     0x11088
> +                       MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA        0x11088
> +                       MX6UL_PAD_JTAG_TMS__SAI2_MCLK           0x17088
> +                       MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK        0x17088
> +                       MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC        0x17088
> +                       /* Interrupt */
> +                       MX6UL_PAD_SNVS_TAMPER7__GPIO5_IO07      0x80000000

Please do not use 0x80000000. Use the real IOMUX value instead.
