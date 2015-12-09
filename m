From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: imx6qdl-sabreauto: assert GPIO at boot
 in order to connect NOR
Date: Wed, 9 Dec 2015 11:25:56 -0200
Message-ID: <CAOMZO5CLcA9Ws4sTMBcjS+mvKw6dU7HR-nNpLahtY9AyA=sLwQ@mail.gmail.com>
References: <20151207082440.GY11966@pengutronix.de>
	<1449618520-3432-1-git-send-email-alison_chaiken@mentor.com>
	<1449618520-3432-2-git-send-email-alison_chaiken@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449618520-3432-2-git-send-email-alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alison Chaiken <alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, alison-hh6fLRYtCEIS+FvcfC7Uqw@public.gmane.org, rowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 8, 2015 at 9:48 PM, Alison Chaiken
<alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:

> +&gpio5 {
> +       p4 {
> +               /* Select NOR or I2C3 via setting of port-expander
> +                * steering logic.
> +                * Low: Attach p-NOR line D18.
> +                * High: Attach I2C3 line SDA.
> +                */
> +               gpio-initval;

Markus' series that add gpio-initval property has not been applied
yet. I could not see it in linux-next.

It seems you need his series to be applied first.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
