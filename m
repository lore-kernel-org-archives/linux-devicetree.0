From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/6] ARM: sunxi: Introduce Allwinner H3 support
Date: Wed, 6 May 2015 12:04:46 +0200
Message-ID: <20150506100446.GA11057@lukather>
References: <1430904693-1404-1-git-send-email-jenskuske@gmail.com>
 <1430904693-1404-2-git-send-email-jenskuske@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1430904693-1404-2-git-send-email-jenskuske@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Kuske <jenskuske@gmail.com>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Mike Turquette <mturquette@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 06, 2015 at 11:31:28AM +0200, Jens Kuske wrote:
> The Allwinner H3 is a quad-core Cortex-A7-based SoC. It is very similar
> to other sun8i family SoCs like the A23.
>=20
> Signed-off-by: Jens Kuske <jenskuske@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.txt | 1 +
>  arch/arm/mach-sunxi/Kconfig                     | 2 +-
>  arch/arm/mach-sunxi/sunxi.c                     | 3 ++-
>  3 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentat=
ion/devicetree/bindings/arm/sunxi.txt
> index 42941fd..3cb4b94 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.txt
> +++ b/Documentation/devicetree/bindings/arm/sunxi.txt
> @@ -9,4 +9,5 @@ using one of the following compatible strings:
>    allwinner,sun6i-a31
>    allwinner,sun7i-a20
>    allwinner,sun8i-a23
> +  allwinner,sun8i-h3
>    allwinner,sun9i-a80
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index 81502b9..47ac5b4 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -35,7 +35,7 @@ config MACH_SUN7I
>  	select SUN5I_HSTIMER
> =20
>  config MACH_SUN8I
> -	bool "Allwinner A23 (sun8i) SoCs support"
> +	bool "Allwinner A23 / H3 (sun8i) SoCs support"

I'd prefer that we have something similar to sun9i, just mentionning
the family here, instead of an ever-growing list of SoCs.

This used to be easy to maintain, with the new naming scheme, we
already have at least 4 SoCs part of sun8i.

>  	default ARCH_SUNXI
>  	select ARM_GIC
>  	select MFD_SUN6I_PRCM
> diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
> index 1bc811a..bc63748 100644
> --- a/arch/arm/mach-sunxi/sunxi.c
> +++ b/arch/arm/mach-sunxi/sunxi.c
> @@ -67,10 +67,11 @@ MACHINE_END
> =20
>  static const char * const sun8i_board_dt_compat[] =3D {
>  	"allwinner,sun8i-a23",
> +	"allwinner,sun8i-h3",
>  	NULL,
>  };
> =20
> -DT_MACHINE_START(SUN8I_DT, "Allwinner sun8i (A23) Family")
> +DT_MACHINE_START(SUN8I_DT, "Allwinner sun8i (A23/H3) Family")

Same comment here.

Could you also update Documentation/arm/sunxi/README with these infos
(and ideally, updating it with the new SoCs we've heard about) ?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVSec+AAoJEBx+YmzsjxAgKE4P/1RO79GC0EBwYTcWvyMzP4Nf
i0Tl8qP/zCPphPXgfc/HCuDO7W/UxPkjC5b7eTrBxjYaojZMMimscRdXdfVbOron
Xj6DyemzWSv3iQssbxL9kMcz5mclo99ayCwhBWPeCsvgY7e2mlQlXmKhNup90awr
+ilO2YLenkyUi1euJbBkxQuS2c+0CwID1lnYwSGyKZhYNUkorVkA+kjWU+uQrZeQ
g7hXs8xoinMxe9Stn8DNF7o74rn9IUPgMWxsrm6zqSFL9VXFqbPwlQhlQm2GJO0z
WMFggT5+p5xJRJLxoJhI/gLho4uNE/D8OtFRS+xM7SBsmDNpbEW/pJ/EEUGKvWgy
nxR4lhmPsachc5xsXq1LTADrlvriarKSb6vgn/CcEG52XHhjdY/4GXFiaqyJ25LW
qf15F4ocwy1az1ipkxXGXb8TOMRIwvGTmIv3DK8cVGRp0/NGePlbJnHqz70JhW5g
QVSJqBA7oAN2sPA3v3xoURxqAnHH6DKStnhLy2+pISpW97BFXLwYx8ICXLdp2uWa
n+UkdHmDNdiyd2EfH6M4oKwn0pwPCAzgIRUdehu1gogUg8mAJzUJ1P7e12ngWhAZ
nE4MaDSipFIJhxNcshZLgfQHjiVz/DNgXwxC8eCnmmydW8TqmdZGoSmuD06fOzoQ
5aHtPrFkBwnr5gRTlayZ
=w/zV
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
