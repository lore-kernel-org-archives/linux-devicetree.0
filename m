From: Simon Guinot <simon@sequanux.org>
Subject: Re: [PATCH 4/4] ARM: kirkwood: convert orion-wdt to fdt.
Date: Fri, 2 Mar 2012 10:15:11 +0100
Message-ID: <20120302091510.GC29461@kw.sim.vm.gnt>
References: <cover.1330625877.git.jason@lakedaemon.net>
 <2f29e88b98b2bcff0c241996e6d7216a60995d2d.1330625878.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6732645464433427308=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2f29e88b98b2bcff0c241996e6d7216a60995d2d.1330625878.git.jason@lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de
List-Id: devicetree@vger.kernel.org


--===============6732645464433427308==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rErXCrER28iYcLtG"
Content-Disposition: inline


--rErXCrER28iYcLtG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On Thu, Mar 01, 2012 at 06:20:55PM +0000, Jason Cooper wrote:
> Converted register address to a variable so that it could be set from
> fdt.  Also, pull clock frequency from fdt and clean up failure logic a
> bit.
>=20
> Same as rtc-mv, this device is used in all kirkwood boards.  So, it is
> placed in kirkwood.dtsi.
>=20
> Signed-off-by: Jason Cooper <jason@lakedaemon.net>
> ---
>  arch/arm/boot/dts/kirkwood.dtsi   |    6 +++++
>  arch/arm/mach-kirkwood/board-dt.c |    1 -
>  arch/arm/mach-kirkwood/common.c   |    2 +-
>  arch/arm/mach-kirkwood/common.h   |    1 -
>  drivers/watchdog/orion_wdt.c      |   44 ++++++++++++++++++++++++++-----=
-----
>  5 files changed, 39 insertions(+), 15 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/kirkwood.dtsi b/arch/arm/boot/dts/kirkwood=
=2Edtsi
> index 5fb185c..bf28424 100644
> --- a/arch/arm/boot/dts/kirkwood.dtsi
> +++ b/arch/arm/boot/dts/kirkwood.dtsi
> @@ -8,5 +8,11 @@
>  		reg =3D <0xf1010300 0x1f>;
>  		interrupts =3D <53>;
>  	};
> +
> +	wdt@fed20300 {
> +		compatible =3D "marvell,orion-wdt";
> +		reg =3D <0xfed20300 0x28>;
> +		clock-frequency =3D <200000000>;
> +	};

How this will work for boards using a different clock frequency (TCLK) ?
Here, we could have 166MHz for example.

Can this node be updated during the board initialization with a detected
TCLK value ?

Or maybe this clock-frequency can reference a TCLK frequency defined in
a board specific dts (I don't know if the DT format allow such things) ?

Regards,

Simon

>  };
> =20
> diff --git a/arch/arm/mach-kirkwood/board-dt.c b/arch/arm/mach-kirkwood/b=
oard-dt.c
> index 6fc41ae..7ef5fb7 100644
> --- a/arch/arm/mach-kirkwood/board-dt.c
> +++ b/arch/arm/mach-kirkwood/board-dt.c
> @@ -135,7 +135,6 @@ static void __init kirkwood_dt_init(void)
>  #endif
> =20
>  	/* internal devices that every board has */
> -	kirkwood_wdt_init();
>  	kirkwood_xor0_init();
>  	kirkwood_xor1_init();
>  	kirkwood_crypto_init();
> diff --git a/arch/arm/mach-kirkwood/common.c b/arch/arm/mach-kirkwood/com=
mon.c
> index 0c0375f..35dc40b 100644
> --- a/arch/arm/mach-kirkwood/common.c
> +++ b/arch/arm/mach-kirkwood/common.c
> @@ -303,7 +303,7 @@ void __init kirkwood_xor1_init(void)
>  /***********************************************************************=
******
>   * Watchdog
>   ***********************************************************************=
*****/
> -void __init kirkwood_wdt_init(void)
> +static void __init kirkwood_wdt_init(void)
>  {
>  	orion_wdt_init(kirkwood_tclk);
>  }
> diff --git a/arch/arm/mach-kirkwood/common.h b/arch/arm/mach-kirkwood/com=
mon.h
> index ca08826..ac4b2fb 100644
> --- a/arch/arm/mach-kirkwood/common.h
> +++ b/arch/arm/mach-kirkwood/common.h
> @@ -53,7 +53,6 @@ void kirkwood_restart(char, const char *);
> =20
>  char *kirkwood_id(void);
>  void kirkwood_l2_init(void);
> -void kirkwood_wdt_init(void);
>  void kirkwood_xor0_init(void);
>  void kirkwood_xor1_init(void);
>  void kirkwood_crypto_init(void);
> diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
> index 4ad78f8..4be76ca 100644
> --- a/drivers/watchdog/orion_wdt.c
> +++ b/drivers/watchdog/orion_wdt.c
> @@ -17,6 +17,7 @@
>  #include <linux/fs.h>
>  #include <linux/miscdevice.h>
>  #include <linux/platform_device.h>
> +#include <linux/of.h>
>  #include <linux/watchdog.h>
>  #include <linux/init.h>
>  #include <linux/uaccess.h>
> @@ -28,9 +29,9 @@
>  /*
>   * Watchdog timer block registers.
>   */
> -#define TIMER_CTRL		(TIMER_VIRT_BASE + 0x0000)
> +#define TIMER_CTRL		0x0000
>  #define  WDT_EN			0x0010
> -#define WDT_VAL			(TIMER_VIRT_BASE + 0x0024)
> +#define WDT_VAL			0x0024
> =20
>  #define WDT_MAX_CYCLE_COUNT	0xffffffff
>  #define WDT_IN_USE		0
> @@ -40,6 +41,7 @@ static int nowayout =3D WATCHDOG_NOWAYOUT;
>  static int heartbeat =3D -1;		/* module parameter (seconds) */
>  static unsigned int wdt_max_duration;	/* (seconds) */
>  static unsigned int wdt_tclk;
> +static unsigned int wdt_reg;
>  static unsigned long wdt_status;
>  static DEFINE_SPINLOCK(wdt_lock);
> =20
> @@ -48,7 +50,7 @@ static void orion_wdt_ping(void)
>  	spin_lock(&wdt_lock);
> =20
>  	/* Reload watchdog duration */
> -	writel(wdt_tclk * heartbeat, WDT_VAL);
> +	writel(wdt_tclk * heartbeat, wdt_reg + WDT_VAL);
> =20
>  	spin_unlock(&wdt_lock);
>  }
> @@ -60,7 +62,7 @@ static void orion_wdt_enable(void)
>  	spin_lock(&wdt_lock);
> =20
>  	/* Set watchdog duration */
> -	writel(wdt_tclk * heartbeat, WDT_VAL);
> +	writel(wdt_tclk * heartbeat, wdt_reg + WDT_VAL);
> =20
>  	/* Clear watchdog timer interrupt */
>  	reg =3D readl(BRIDGE_CAUSE);
> @@ -68,9 +70,9 @@ static void orion_wdt_enable(void)
>  	writel(reg, BRIDGE_CAUSE);
> =20
>  	/* Enable watchdog timer */
> -	reg =3D readl(TIMER_CTRL);
> +	reg =3D readl(wdt_reg + TIMER_CTRL);
>  	reg |=3D WDT_EN;
> -	writel(reg, TIMER_CTRL);
> +	writel(reg, wdt_reg + TIMER_CTRL);
> =20
>  	/* Enable reset on watchdog */
>  	reg =3D readl(RSTOUTn_MASK);
> @@ -92,9 +94,9 @@ static void orion_wdt_disable(void)
>  	writel(reg, RSTOUTn_MASK);
> =20
>  	/* Disable watchdog timer */
> -	reg =3D readl(TIMER_CTRL);
> +	reg =3D readl(wdt_reg + TIMER_CTRL);
>  	reg &=3D ~WDT_EN;
> -	writel(reg, TIMER_CTRL);
> +	writel(reg, wdt_reg + TIMER_CTRL);
> =20
>  	spin_unlock(&wdt_lock);
>  }
> @@ -102,7 +104,7 @@ static void orion_wdt_disable(void)
>  static int orion_wdt_get_timeleft(int *time_left)
>  {
>  	spin_lock(&wdt_lock);
> -	*time_left =3D readl(WDT_VAL) / wdt_tclk;
> +	*time_left =3D readl(wdt_reg + WDT_VAL) / wdt_tclk;
>  	spin_unlock(&wdt_lock);
>  	return 0;
>  }
> @@ -236,15 +238,23 @@ static struct miscdevice orion_wdt_miscdev =3D {
>  static int __devinit orion_wdt_probe(struct platform_device *pdev)
>  {
>  	struct orion_wdt_platform_data *pdata =3D pdev->dev.platform_data;
> +	struct device_node *np =3D pdev->dev.of_node;
>  	int ret;
> =20
> -	if (pdata) {
> +	if (pdata)
>  		wdt_tclk =3D pdata->tclk;
> -	} else {
> -		printk(KERN_ERR "Orion Watchdog misses platform data\n");
> +
> +	of_property_read_u32(np, "clock-frequency", &wdt_tclk);
> +
> +	if (!wdt_tclk) {
> +		printk(KERN_ERR "Orion Watchdog can't get clock freq\n");
>  		return -ENODEV;
>  	}
> =20
> +	wdt_reg =3D TIMER_VIRT_BASE;
> +
> +	of_property_read_u32(np, "reg", &wdt_reg);
> +
>  	if (orion_wdt_miscdev.parent)
>  		return -EBUSY;
>  	orion_wdt_miscdev.parent =3D &pdev->dev;
> @@ -284,6 +294,15 @@ static void orion_wdt_shutdown(struct platform_devic=
e *pdev)
>  		orion_wdt_disable();
>  }
> =20
> +#ifdef CONFIG_OF
> +static struct of_device_id orion_wdt_of_match_table[] =3D {
> +	{ .compatible =3D "marvell,orion-wdt", },
> +	{},
> +};
> +#else
> +#define orion_wdt_of_match_table NULL
> +#endif
> +
>  static struct platform_driver orion_wdt_driver =3D {
>  	.probe		=3D orion_wdt_probe,
>  	.remove		=3D __devexit_p(orion_wdt_remove),
> @@ -291,6 +310,7 @@ static struct platform_driver orion_wdt_driver =3D {
>  	.driver		=3D {
>  		.owner	=3D THIS_MODULE,
>  		.name	=3D "orion_wdt",
> +		.of_match_table =3D orion_wdt_of_match_table,
>  	},
>  };
> =20
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--rErXCrER28iYcLtG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk9Qj54ACgkQgtp0PDeOcDqabgCgpConbJWZUQaBcHfs0G3nvPqM
hDQAnRlGojL/Zxo3K1YzuUDrvY2QWbVI
=WNy0
-----END PGP SIGNATURE-----

--rErXCrER28iYcLtG--


--===============6732645464433427308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6732645464433427308==--
