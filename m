From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: dts: imx6: Add initial support for phyBOARD-Mira
Date: Tue, 19 Dec 2017 15:10:17 -0200
Message-ID: <CAOMZO5CSQSpPXTnR69HqHfKZiUpi+eqonqjuEu9mgBECsWG_5g@mail.gmail.com>
References: <1513698588-13325-1-git-send-email-s.riedmueller@phytec.de> <1513698588-13325-3-git-send-email-s.riedmueller@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513698588-13325-3-git-send-email-s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Riedmueller <s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christoph Fritz <chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christian Hemp <c.hemp-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>, Stefan Christ <s.christ-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 19, 2017 at 1:49 PM, Stefan Riedmueller
<s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org> wrote:

> +       reg_pcie: regulator-pcie {
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_pcie_reg>;
> +               compatible = "regulator-fixed";
> +               regulator-name = "mPCIe_1V5";
> +               regulator-min-microvolt = <1500000>;
> +               regulator-max-microvolt = <1500000>;
> +               gpio = <&gpio3 0 GPIO_ACTIVE_HIGH>;
> +               regulator-always-on;

Instead of using 'regulator-always-on' here, you could use:

vpcie-supply = <&reg_pcie>;

under the &pcie node

> +       panel {
> +               compatible = "auo,g104sn02";

I could not find this compatible in linux-next.

> +       i2c_rtc: rtc@68 {
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_rtc_int>;
> +               compatible = "mc,rv4162";

I could not find this compatible in linux-next.

> +&pcie {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pcie>;
> +       reset-gpio = <&gpio2 25 GPIO_ACTIVE_HIGH>;

The imx driver ignores the polarity and it is active high only when
'reset-gpio-active-high' property is present.

The correct here would be: reset-gpio = <&gpio2 25 GPIO_ACTIVE_LOW>;

> +&uart3 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_uart3>;
> +       fsl,uart-has-rtscts;

uart-has-rtscts, please.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
