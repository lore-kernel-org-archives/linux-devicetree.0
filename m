From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] ARM: dts: vf-colibri: add basic supply regulators
Date: Tue, 16 Feb 2016 22:28:05 -0200
Message-ID: <CAOMZO5Bb1eGSinoNkUhB_2w8mWdA+RQA0Z4geJp8B-MfGryAHw@mail.gmail.com>
References: <1455668317-15728-1-git-send-email-stefan@agner.ch>
	<1455668317-15728-2-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455668317-15728-2-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 16, 2016 at 10:18 PM, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org> wrote:

> +       reg_module_3v3: regulator-module-3v3 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "+V3.3";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-always-on;

This 'regulator-always-on' property can be removed.

> +       };
> +
> +       reg_module_3v3_avdd: regulator-module-3v3-avdd {
> +               compatible = "regulator-fixed";
> +               regulator-name = "+V3.3_AVDD_AUDIO";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-always-on;

Same here.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
