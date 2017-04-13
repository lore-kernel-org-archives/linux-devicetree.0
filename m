From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/8] ARM: dts: imx7d-sdb: Add GPIO expander node
Date: Thu, 13 Apr 2017 19:20:13 -0300
Message-ID: <CAOMZO5A9u9bjbFa=0LQ_gnwFry4wm2HGD8xncThb3ta1TaZ1aw@mail.gmail.com>
References: <20170413133242.5068-1-andrew.smirnov@gmail.com> <20170413133242.5068-7-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170413133242.5068-7-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andrey,

On Thu, Apr 13, 2017 at 10:32 AM, Andrey Smirnov
<andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
> index 5be01a1..e0ff276 100644
> --- a/arch/arm/boot/dts/imx7d-sdb.dts
> +++ b/arch/arm/boot/dts/imx7d-sdb.dts
> @@ -52,6 +52,30 @@
>                 reg = <0x80000000 0x80000000>;
>         };
>
> +       spi4 {

Here you use spi4 label...

> +               compatible = "spi-gpio";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_spi1>;

and here spi1, which is a bit confusing.

> +               status = "okay";
> +               gpio-sck = <&gpio1 13 0>;
> +               gpio-mosi = <&gpio1 9 0>;
> +               cs-gpios = <&gpio1 12 0>;

You could use GPIO_ACTIVE_HIGH flag for better readability.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
