From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] arm: imx: dts: Remove leading 0x and 0s from bindings notation
Date: Fri, 15 Dec 2017 15:20:29 -0200
Message-ID: <CAOMZO5D4R0o5ViiT7Z=wFro-=WxS1rwpMbZmjvMZF3A0SzSB6A@mail.gmail.com>
References: <20171215124631.30132-1-malat@debian.org> <20171215171327.8513-1-malat@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215171327.8513-1-malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

HI Mathieu,

On Fri, Dec 15, 2017 at 3:13 PM, Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:

> diff --git a/arch/arm/boot/dts/imx6q-display5.dtsi b/arch/arm/boot/dts/imx6q-display5.dtsi
> index 4084de43d4d9..09085fde3341 100644
> --- a/arch/arm/boot/dts/imx6q-display5.dtsi
> +++ b/arch/arm/boot/dts/imx6q-display5.dtsi
> @@ -255,7 +255,7 @@
>         pinctrl-0 = <&pinctrl_i2c1>;
>         status = "okay";
>
> -       codec: tfa9879@6C {
> +       codec: tfa9879@6c {

This change is fine, but it no longer matches the Subject and commit log.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
