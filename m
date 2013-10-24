From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv5][ 4/9] ARM: imx{25,27} DT: Permit the selection of the
 imxfb framebuffer driver.
Date: Thu, 24 Oct 2013 14:32:42 +0800
Message-ID: <20131024063237.GB11466@S2101-09.ap.freescale.net>
References: <1382516974-13371-1-git-send-email-denis@eukrea.com>
 <1382516974-13371-4-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1382516974-13371-4-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Eric =?iso-8859-1?Q?B=E9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 23, 2013 at 10:29:29AM +0200, Denis Carikli wrote:
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Cc: Eric B=E9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
>=20
> Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>

Can you please write up a sensible commit log to help me understand why
device tree build needs to select IMX_HAVE_PLATFORM_IMX_FB?

Shawn

> ---
>  arch/arm/mach-imx/Kconfig |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> index 9f67338..23c1773 100644
> --- a/arch/arm/mach-imx/Kconfig
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -254,6 +254,7 @@ endchoice
>  config MACH_IMX25_DT
>  	bool "Support i.MX25 platforms from device tree"
>  	select SOC_IMX25
> +	select IMX_HAVE_PLATFORM_IMX_FB
>  	help
>  	  Include support for Freescale i.MX25 based platforms
>  	  using the device tree for discovery
> @@ -442,6 +443,7 @@ config MACH_IMX27IPCAM
>  config MACH_IMX27_DT
>  	bool "Support i.MX27 platforms from device tree"
>  	select SOC_IMX27
> +	select IMX_HAVE_PLATFORM_IMX_FB
>  	help
>  	  Include support for Freescale i.MX27 based platforms
>  	  using the device tree for discovery
> --=20
> 1.7.9.5
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
