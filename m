From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCHv2 3/3] mpc52xx/wdt: remove obsolete old WDT implementation
Date: Thu, 12 Nov 2009 20:56:46 +0100
Message-ID: <20091112195646.GB13350@pengutronix.de>
References: <1258051520.2280.3@antares>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7432922227734526499=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1258051520.2280.3@antares>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Albrecht =?iso-8859-15?Q?Dre=DF?= <albrecht.dress-KvP5wT2u2U0@public.gmane.org>
Cc: Linux PPC Development <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Devicetree Discussions <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============7432922227734526499==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Content-Disposition: inline


--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2009 at 07:45:20PM +0100, Albrecht Dre=DF wrote:
> Remove the old WDT implementation.
>=20
> Signed-off-by: Albrecht Dre=DF <albrecht.dress-KvP5wT2u2U0@public.gmane.org>
> ---
>=20
> Change against v1: WDT stuff now fully merged into the file
> arch/powerpc/platforms/52xx/mpc52xx_gpt.c.
>=20
> Note: The file drivers/watchdog/mpc5200_wdt.c is now obsolete and should =
be removed.

Ehrm, this is possible within a patch :)

>=20
>  drivers/watchdog/Kconfig  |    4 +++-
>  drivers/watchdog/Makefile |    1 -
>  2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 3711b88..d958b76 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -861,8 +861,10 @@ config GEF_WDT
>  	  Watchdog timer found in a number of GE Fanuc single board computers.
> =20
>  config MPC5200_WDT
> -	tristate "MPC5200 Watchdog Timer"
> +	bool "MPC52xx Watchdog Timer"
>  	depends on PPC_MPC52xx
> +	help
> +	  Use General Purpose Timer (GPT) 0 on the MPC5200 as Watchdog.

s/5200/52xx/ here too.

> =20
>  config 8xxx_WDT
>  	tristate "MPC8xxx Platform Watchdog Timer"
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 699199b..89c045d 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -118,7 +118,6 @@ obj-$(CONFIG_TXX9_WDT) +=3D txx9wdt.o
> =20
>  # POWERPC Architecture
>  obj-$(CONFIG_GEF_WDT) +=3D gef_wdt.o
> -obj-$(CONFIG_MPC5200_WDT) +=3D mpc5200_wdt.o
>  obj-$(CONFIG_8xxx_WDT) +=3D mpc8xxx_wdt.o
>  obj-$(CONFIG_MV64X60_WDT) +=3D mv64x60_wdt.o
>  obj-$(CONFIG_PIKA_WDT) +=3D pika_wdt.o
>=20
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/linuxppc-dev

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkr8aH4ACgkQD27XaX1/VRsdEwCgrOgjgL2n3WzSosnIcsux+AgL
EuAAnjCqdtHI0Spx7oUmgZfwSll3Ymm0
=ebpH
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--

--===============7432922227734526499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7432922227734526499==--
