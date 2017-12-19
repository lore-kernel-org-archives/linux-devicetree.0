From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: dts: imx6: Add initial support for phyCORE-i.MX
 6 SOM
Date: Tue, 19 Dec 2017 15:03:13 -0200
Message-ID: <CAOMZO5Do0G8nJ2LTq+u-JDL7ONCyyLvn2+kcLYyMnmBH1aGDmA@mail.gmail.com>
References: <1513698588-13325-1-git-send-email-s.riedmueller@phytec.de> <1513698588-13325-2-git-send-email-s.riedmueller@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513698588-13325-2-git-send-email-s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Riedmueller <s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christoph Fritz <chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christian Hemp <c.hemp-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>, Stefan Christ <s.christ-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 19, 2017 at 1:49 PM, Stefan Riedmueller
<s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org> wrote:

> +
> +/ {
> +       model = "PHYTEC phyCORE-i.MX 6";
> +       compatible = "phytec,imx6qdl-pcm058", "fsl,imx6qdl";
> +
> +       aliases {
> +               ipu0 = &ipu1;

Is this alias needed?

> +               rtc1 = &da9062_rtc;
> +               rtc2 = &snvs_rtc;
> +       };
> +
> +       /*
> +        * Set the minimum memory size here and
> +        * let the bootloader set the real size.
> +        */
> +       memory {


memory@10000000 so that you don't get warnings when building with W=1.

Also, please build W=1 and make sure to not introduce any build
warning in this series.

> +&i2c3 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c3>;
> +       clock-frequency = <400000>;
> +       status = "okay";
> +
> +       eeprom: eeprom@50 {
> +               compatible = "cat,24c32";

This compatible is not documented.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
