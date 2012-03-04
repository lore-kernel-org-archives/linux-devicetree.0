From: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH 4/5 v2] ARM: kirkwood: convert rtc-mv to fdt.
Date: Sun, 4 Mar 2012 16:12:44 +0100
Message-ID: <201203041612.44966.michael@walle.cc>
References: <cover.1330709314.git.jason@lakedaemon.net>
 <4de611961e8210a0a2c3b56fe72b40dba638752a.1330709314.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4de611961e8210a0a2c3b56fe72b40dba638752a.1330709314.git.jason@lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, Jason Cooper <jason@lakedaemon.net>, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

Am Freitag 02 M=E4rz 2012, 18:50:21 schrieb Jason Cooper:
> The comment at mach-kirkwood/common.c:469, says this device is in every
> kirkwood board.  So, it is placed in kirkwood.dtsi.
> =

> Signed-off-by: Jason Cooper <jason@lakedaemon.net>
> ---
> =

> Changes since v1:
> =

>     - removed unnecessary of_*() code from _probe()
>     - use of_match_ptr()
> =

>  arch/arm/boot/dts/kirkwood.dtsi   |    6 ++++++
>  arch/arm/mach-kirkwood/board-dt.c |    1 -
>  arch/arm/mach-kirkwood/common.c   |    2 +-
>  arch/arm/mach-kirkwood/common.h   |    1 -
>  drivers/rtc/rtc-mv.c              |    7 +++++++
>  5 files changed, 14 insertions(+), 3 deletions(-)
> =

> diff --git a/arch/arm/boot/dts/kirkwood.dtsi
> b/arch/arm/boot/dts/kirkwood.dtsi index 771c6bb..5fb185c 100644
> --- a/arch/arm/boot/dts/kirkwood.dtsi
> +++ b/arch/arm/boot/dts/kirkwood.dtsi
> @@ -2,5 +2,11 @@
> =

>  / {
>  	compatible =3D "marvell,kirkwood";
> +
> +	rtc@f1010300 {
> +		compatible =3D "marvell,rtc";
> +		reg =3D <0xf1010300 0x1f>;
> +		interrupts =3D <53>;
> +	};
>  };
> =

> diff --git a/arch/arm/mach-kirkwood/board-dt.c
> b/arch/arm/mach-kirkwood/board-dt.c index 2a45656..6e18338 100644
> --- a/arch/arm/mach-kirkwood/board-dt.c
> +++ b/arch/arm/mach-kirkwood/board-dt.c
> @@ -134,7 +134,6 @@ static void __init kirkwood_dt_init(void)
>  #endif
> =

>  	/* internal devices that every board has */
> -	kirkwood_rtc_init();
>  	kirkwood_wdt_init();
>  	kirkwood_xor0_init();
>  	kirkwood_xor1_init();
> diff --git a/arch/arm/mach-kirkwood/common.c
> b/arch/arm/mach-kirkwood/common.c index 167b6c8..0c0375f 100644
> --- a/arch/arm/mach-kirkwood/common.c
> +++ b/arch/arm/mach-kirkwood/common.c
> @@ -163,7 +163,7 @@ void __init kirkwood_nand_init_rnb(struct mtd_partiti=
on
> *parts, int nr_parts,
> /*************************************************************************
> **** * SoC RTC
>  =

> **************************************************************************
> **/ -void __init kirkwood_rtc_init(void)
> +static void __init kirkwood_rtc_init(void)
>  {
>  	orion_rtc_init(RTC_PHYS_BASE, IRQ_KIRKWOOD_RTC);
>  }
> diff --git a/arch/arm/mach-kirkwood/common.h
> b/arch/arm/mach-kirkwood/common.h index c382447..ca08826 100644
> --- a/arch/arm/mach-kirkwood/common.h
> +++ b/arch/arm/mach-kirkwood/common.h
> @@ -53,7 +53,6 @@ void kirkwood_restart(char, const char *);
> =

>  char *kirkwood_id(void);
>  void kirkwood_l2_init(void);
> -void kirkwood_rtc_init(void);
>  void kirkwood_wdt_init(void);
>  void kirkwood_xor0_init(void);
>  void kirkwood_xor1_init(void);
> diff --git a/drivers/rtc/rtc-mv.c b/drivers/rtc/rtc-mv.c
> index 768e2ed..3108b18 100644
> --- a/drivers/rtc/rtc-mv.c
> +++ b/drivers/rtc/rtc-mv.c
> @@ -12,6 +12,7 @@
>  #include <linux/bcd.h>
>  #include <linux/io.h>
>  #include <linux/platform_device.h>
> +#include <linux/of.h>
>  #include <linux/delay.h>
>  #include <linux/gfp.h>
>  #include <linux/module.h>
> @@ -294,11 +295,17 @@ static int __exit mv_rtc_remove(struct
> platform_device *pdev) return 0;
>  }
> =

> +static struct of_device_id rtc_mv_of_match_table[] =3D {
> +	{ .compatible =3D "marvell,rtc", },
> +	{}
> +};
> +
Isn't here an ifdef CONFIG_OF missing to prevent compiler warnings?

>  static struct platform_driver mv_rtc_driver =3D {
>  	.remove		=3D __exit_p(mv_rtc_remove),
>  	.driver		=3D {
>  		.name	=3D "rtc-mv",
>  		.owner	=3D THIS_MODULE,
> +		.of_match_table =3D of_match_ptr(rtc_mv_of_match_table),
>  	},
>  };


-- =

Michael
