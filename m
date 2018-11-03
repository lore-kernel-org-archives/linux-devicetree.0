From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 3/4] ARM: mmp2: initialize clocks before the timer
Date: Sat, 3 Nov 2018 20:15:47 +0100
Message-ID: <20181103191547.GI31179@amd>
References: <20180918205455.25464-1-lkundrak@v3.sk>
 <20180918205455.25464-4-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="+ZmrHH5cGjskQnY1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180918205455.25464-4-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Miao <eric.y.miao@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Russell King <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org


--+ZmrHH5cGjskQnY1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2018-09-18 22:54:54, Lubomir Rintel wrote:
> The timer shall enable its clock.
>=20
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Acked-by: Pavel Machek <pavel@ucw.cz>
=20
> ---
>  arch/arm/mach-mmp/mmp2-dt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/mach-mmp/mmp2-dt.c b/arch/arm/mach-mmp/mmp2-dt.c
> index 0341359b24a4..50c5e8b5be3d 100644
> --- a/arch/arm/mach-mmp/mmp2-dt.c
> +++ b/arch/arm/mach-mmp/mmp2-dt.c
> @@ -26,8 +26,8 @@ static void __init mmp_init_time(void)
>  #ifdef CONFIG_CACHE_TAUROS2
>  	tauros2_init(0);
>  #endif
> -	mmp_dt_init_timer();
>  	of_clk_init(NULL);
> +	mmp_dt_init_timer();
>  }
> =20
>  static const char *const mmp2_dt_board_compat[] __initconst =3D {

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--+ZmrHH5cGjskQnY1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvd8+MACgkQMOfwapXb+vKB8wCfR6iixVLOwKITRqelci8noeHb
Iz8An1Rs/FWPLM/Vhb6ccbVfDvqTmmjF
=PBu+
-----END PGP SIGNATURE-----

--+ZmrHH5cGjskQnY1--
