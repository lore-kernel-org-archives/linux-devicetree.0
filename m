From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz-knWk7/PSn+s@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: imx6: Add support for Toradex Apalis
	iMX6Q/D SoM
Date: Fri, 8 Jan 2016 09:57:34 +0100
Message-ID: <20160108085734.GC27359@ibawizard.net>
References: <1452011942-11940-1-git-send-email-marcel.ziswiler@toradex.com> <1452011942-11940-2-git-send-email-marcel.ziswiler@toradex.com>
Reply-To: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz-knWk7/PSn+s@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452011942-11940-2-git-send-email-marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz-knWk7/PSn+s@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> +	i2cddc: i2c@0 {
> +		gpios = <&gpio3 16 GPIO_ACTIVE_HIGH /* sda */
> +			 &gpio2 30 GPIO_ACTIVE_HIGH /* scl */
> +			>;

According to one of the comments, it should be changed to the following:

		sda-gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
		scl-gpios = <&gpio2 30 GPIO_ACTIVE_HIGH>;

-- ynezz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
