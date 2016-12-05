From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: imx6: Add Savageboard common file
Date: Mon, 5 Dec 2016 09:36:50 -0200
Message-ID: <CAOMZO5BzLc7Xr9G0hLP1O4aYx+7J5gy0VHdQ3Kz0GFq=WdQ1gw@mail.gmail.com>
References: <20161205010729.7047-1-woogyom.kim@gmail.com> <20161205010729.7047-2-woogyom.kim@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161205010729.7047-2-woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 4, 2016 at 11:07 PM, Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> +       regulators {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               reg_3p3v: regulator@0 {
> +                       compatible = "regulator-fixed";
> +                       reg = <0>;
> +                       regulator-name = "3P3V";
> +                       regulator-min-microvolt = <3300000>;
> +                       regulator-max-microvolt = <3300000>;
> +                       regulator-always-on;
> +               };

Please remove the regulators container and put the regulator node
directly as follows:

reg_3p3v: regulator-3p3v {
   compatible = "regulator-fixed";
   regulator-name = "3P3V";
   regulator-min-microvolt = <3300000>;
   regulator-max-microvolt = <3300000>;
   regulator-always-on;
}

> +       };
> +};
> +
> +&clks {
> +       assigned-clocks = <&clks IMX6QDL_CLK_LDB_DI0_SEL>,
> +                         <&clks IMX6QDL_CLK_LDB_DI1_SEL>;
> +       assigned-clock-parents = <&clks IMX6QDL_CLK_PLL3_USB_OTG>,
> +                                <&clks IMX6QDL_CLK_PLL3_USB_OTG>;
> +};
> +
> +&fec {
> +       phy-mode = "rgmii";
> +       phy-reset-gpios = <&gpio1 25 GPIO_ACTIVE_HIGH>;

I think you meant
phy-reset-gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;

> +&iomuxc {
> +       savageboard {
> +               pinctrl_emmc: emmcgrp {
> +                       fsl,pins = <
> +                               MX6QDL_PAD_SD4_CMD__SD4_CMD             0x17059
> +                               MX6QDL_PAD_SD4_CLK__SD4_CLK             0x10059
> +                               MX6QDL_PAD_SD4_DAT0__SD4_DATA0          0x17059
> +                               MX6QDL_PAD_SD4_DAT1__SD4_DATA1          0x17059
> +                               MX6QDL_PAD_SD4_DAT2__SD4_DATA2          0x17059
> +                               MX6QDL_PAD_SD4_DAT3__SD4_DATA3          0x17059
> +                               MX6QDL_PAD_SD4_DAT4__SD4_DATA4          0x17059
> +                               MX6QDL_PAD_SD4_DAT5__SD4_DATA5          0x17059
> +                               MX6QDL_PAD_SD4_DAT6__SD4_DATA6          0x17059
> +                               MX6QDL_PAD_SD4_DAT7__SD4_DATA7          0x17059
> +                       >;
> +               };

You can remove the savegeboard level. Please check
arch/arm/boot/dts/imx6q-tbs2910.dts.

iomux usually go as the last node of the dts file.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
