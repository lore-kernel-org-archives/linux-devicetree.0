From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] Add support for the eukrea-cpuimx28.
Date: Mon, 9 Dec 2013 11:25:32 +0800
Message-ID: <20131209032530.GC825@S2101-09.ap.freescale.net>
References: <1386250086-4666-1-git-send-email-denis@eukrea.com>
 <1386250086-4666-3-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386250086-4666-3-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eric =?iso-8859-1?Q?B=E9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 05, 2013 at 02:28:06PM +0100, Denis Carikli wrote:
> From: Eric B=E9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>

Please have a proper prefix for patch subject.

>=20
> The following devices/functionalities were tested:
>  * Main UART.
>  * Ethernet0.
>  * Ethernet1.
>  * SD.
>  * USB host.
>  * USB otg.
>  * Display(and its backlight).
>  * Touchscreen.
>  * Audio.
>  * nand.
>  * i2c and the pcf8563 device.
>  * The gpio buttons.
>  * The gpio leds.
>  * Watchdog
>=20
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Eric B=E9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                   |    2 +
>  arch/arm/boot/dts/imx28-eukrea-mbmx283lc.dts |   71 ++++++
>  arch/arm/boot/dts/imx28-eukrea-mbmx287lc.dts |   50 ++++
>  arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi |  326 ++++++++++++++++=
++++++++++
>  arch/arm/mach-mxs/mach-mxs.c                 |    8 +
>  5 files changed, 457 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx28-eukrea-mbmx283lc.dts
>  create mode 100644 arch/arm/boot/dts/imx28-eukrea-mbmx287lc.dts
>  create mode 100644 arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi

<snip>

> diff --git a/arch/arm/mach-mxs/mach-mxs.c b/arch/arm/mach-mxs/mach-mx=
s.c
> index 02b17f7..3b5f57e 100644
> --- a/arch/arm/mach-mxs/mach-mxs.c
> +++ b/arch/arm/mach-mxs/mach-mxs.c
> @@ -448,6 +448,12 @@ static int __init mxs_restart_init(void)
>  	return 0;
>  }
> =20
> +static void __init eukrea_mbmx283lc_init(void)
> +{
> +	enable_clk_enet_out();

This shouldn't be needed since commit daa7d39 (net: freescale: fec: add
support for optional enet_out clk) and commit (f231a9f ARM: dts: mxs:
add enet_out clock to devicetree)

Shawn

> +	mxs_saif_clkmux_select(MXS_DIGCTL_SAIF_CLKMUX_EXTMSTR0);
> +}
> +
>  static void __init mxs_machine_init(void)
>  {
>  	struct device_node *root;
> @@ -486,6 +492,8 @@ static void __init mxs_machine_init(void)
>  		apx4devkit_init();
>  	else if (of_machine_is_compatible("crystalfontz,cfa10036"))
>  		crystalfontz_init();
> +	else if (of_machine_is_compatible("eukrea,mbmx283lc"))
> +		eukrea_mbmx283lc_init();
>  	else if (of_machine_is_compatible("i2se,duckbill"))
>  		duckbill_init();
>  	else if (of_machine_is_compatible("msr,m28cu3"))
> --=20
> 1.7.9.5
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
