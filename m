From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 04/11] clk: sunxi-ng: Support separately grouped PLL lock
 status register
Date: Thu, 26 Jan 2017 10:57:33 +0100
Message-ID: <20170126095733.azlzxmz63vxajlen@lukather>
References: <20170124023230.3990-1-wens@csie.org>
 <20170124023230.3990-5-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3psekbt6p5pgqzqx"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170124023230.3990-5-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--3psekbt6p5pgqzqx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 24, 2017 at 10:32:23AM +0800, Chen-Yu Tsai wrote:
> On the Allwinner A80 SoC, the PLL lock status indicators are grouped
> together in a separate register, as opposed to being scattered in each
> PLL's configuration register.
>=20
> Add a flag to support this.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/clk/sunxi-ng/ccu_common.c | 8 ++++++--
>  drivers/clk/sunxi-ng/ccu_common.h | 2 ++
>  2 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/ccu=
_common.c
> index 51d4bac97ab3..3fd0c3331aff 100644
> --- a/drivers/clk/sunxi-ng/ccu_common.c
> +++ b/drivers/clk/sunxi-ng/ccu_common.c
> @@ -25,13 +25,17 @@ static DEFINE_SPINLOCK(ccu_lock);
> =20
>  void ccu_helper_wait_for_lock(struct ccu_common *common, u32 lock)
>  {
> +	void __iomem *addr;
>  	u32 reg;
> =20
>  	if (!lock)
>  		return;
> =20
> -	WARN_ON(readl_relaxed_poll_timeout(common->base + common->reg, reg,
> -					   reg & lock, 100, 70000));
> +	addr =3D common->base + common->reg;
> +	if (common->features & CCU_FEATURE_LOCK_REG)
> +		addr =3D common->base + common->lock_reg;

I'd rather have an else here (but it's really just a nitpick).

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3psekbt6p5pgqzqx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYicgNAAoJEBx+YmzsjxAgP10P/jCWBqzRG2wZ4YYJSzysmrEz
3ay9nJ1k9AZBW3JpqdQ6qWhPnedlNbBxkV1lvneihpiwrapSoHGkCyrccwLpYXSp
SiqBylPObXTkbQ6nLuI3S2ql7ubus9rY3eODkJIpoi/sDx/sIzAFQiNx80UrpDEA
lOseucMvRekn++YLrnl+nf0h4Hx8tXsplUNHrV0DnDlZNenyI83AzdGZN8RN98Yp
vrjvhSTqLnQ1fNSsaYR99c6qutZJZbu6dsEKjmM+/sgnmkxYueMcztISaSdZj0lV
/L+HjUIfT2ziv/6vo4S68r0Mp3qia3mabkiiES1a+JJC6fbQBjas+yMS7Her00zS
vBe1+SYq9Hif4kH6uoqeRplURozoe2RC9ZUUhXZ8oK9dGH0RV5QqO9mj9+/IVrS0
+XtHqpafxOpBRlm848WL1n7tpsauYihkcuGQrBl2VUjXMRjE31ettegtcCEWia6L
ehcgbBAUaS8HUpx6tRQHukdIntA3x4aezvfiGrD4AHEGfbLQYemRARqioLBc93Ek
/141HPccvaQX8mxM9IwLarXfy5RGBaUH3u/0q3pt3YclKxSPlHTHZuZSBNX5xnfk
Q+FRm9FlHvj3IyMgQ79Drwh7ybZta8oKF3DMzw/r8d38hAEOeE4KQd9UvQPDZoKN
TK+QvifTfEcRthsnfgMJ
=Vznr
-----END PGP SIGNATURE-----

--3psekbt6p5pgqzqx--
