From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 1/5] clk: sunxi-ng: mux: Add support for mux tables
Date: Tue, 23 Aug 2016 10:53:05 +0200
Message-ID: <20160823085305.GB2598@lukather>
References: <1471248795-17951-1-git-send-email-wens@csie.org>
 <1471248795-17951-2-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1471248795-17951-2-git-send-email-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2016 at 04:13:11PM +0800, Chen-Yu Tsai wrote:
> Some clock muxes have holes, i.e. invalid or unconnected inputs,
> between parent mux values.
>=20
> Add support for specifying a mux table to map clock parents to
> mux values.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
> Changes since v1: none
> ---
>  drivers/clk/sunxi-ng/ccu_mux.c | 12 ++++++++++++
>  drivers/clk/sunxi-ng/ccu_mux.h | 12 ++++++++++--
>  2 files changed, 22 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mu=
x.c
> index 1329b9ab481e..68b32f168a74 100644
> --- a/drivers/clk/sunxi-ng/ccu_mux.c
> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
> @@ -107,6 +107,15 @@ u8 ccu_mux_helper_get_parent(struct ccu_common *comm=
on,
>  	parent =3D reg >> cm->shift;
>  	parent &=3D (1 << cm->width) - 1;
> =20
> +	if (cm->table) {
> +		int num_parents =3D clk_hw_get_num_parents(&common->hw);
> +		int i;
> +
> +		for (i =3D 0; i < num_parents; i++)
> +			if (cm->table[i] =3D=3D parent)
> +				return i;
> +	}
> +
>  	return parent;
>  }
> =20
> @@ -117,6 +126,9 @@ int ccu_mux_helper_set_parent(struct ccu_common *comm=
on,
>  	unsigned long flags;
>  	u32 reg;
> =20
> +	if (cm->table)
> +		index =3D cm->table[index];
> +
>  	spin_lock_irqsave(common->lock, flags);
> =20
>  	reg =3D readl(common->base + common->reg);
> diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mu=
x.h
> index d35ce5e93840..f0078de78712 100644
> --- a/drivers/clk/sunxi-ng/ccu_mux.h
> +++ b/drivers/clk/sunxi-ng/ccu_mux.h
> @@ -6,8 +6,9 @@
>  #include "ccu_common.h"
> =20
>  struct ccu_mux_internal {
> -	u8	shift;
> -	u8	width;
> +	u8		shift;
> +	u8		width;
> +	const u8	*table;
> =20
>  	struct {
>  		u8	index;
> @@ -21,6 +22,13 @@ struct ccu_mux_internal {
>  	} variable_prediv;
>  };
> =20
> +#define SUNXI_CLK_MUX_TABLE(_shift, _width, _table)	\
> +	{						\
> +		.shift	=3D _shift,			\
> +		.width	=3D _width,			\
> +		.table	=3D _table,			\
> +	}
> +
>  #define SUNXI_CLK_MUX(_shift, _width)	\
>  	{					\
>  		.shift	=3D _shift,		\

I'd prefer if you also converted the SUNXI_CLK_MUX to use the MUX
table version.

I've just merged the renaming patch for those macros to be consistent
with the other internal structures macro, so that name will have to be
adjusted..

Thanks,
Maxime

> --=20
> 2.8.1
>=20

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXvA7xAAoJEBx+YmzsjxAgLTwQAI997B67/q3cykuo5jKD7QV0
Hu7qX5G1ZN/QKbl7xPUc+E4LJ4B0Gi+ibBIcU42YEDIDgkCGOXUJsyyN9WO/NM2Q
S48fO/GpvD9SbCQ9s+0aghRtqc8Gy1s5U7+3ooiKe8soH+MFPPhILWv43ucIMqoQ
6nipx3AT0S+F+XgYcg5DiDr33/lqsALp7Kd0z4ZQ+w3+lWLNbAJLJGB9i2yRx6KL
chZyNgRhv2froHT8JBmLlmwKhTmPnl34P7OPuy143a53MCHfQQr2Cob7oNTLRIuX
XjMU2NG129i/EGPjyx2+RZFLpO7qi5MW0VHHUIMyTy/D+6mYqMrCwTSzZz4DyQFI
tLjfaLxUwgmuW8IrO6rqSWwlygmh48iL1445dpeOBj1Mwj2P4h7AQsDM3L54uEQI
wYE6vSIRFEA5EppF2YSRror6WAg0yBRUHwBpKNqO8uVr+gOZSMjnP2Rq7phA63vo
B566FKOw4iAk9LxkkF9k+pWv+mMD5mZahUQbFNcEmdR636x2Nz5mMHaJ7iB7Rtvb
/UUejS6+BL7AkY9VvRMoUgvWV+iesClxPIh+ylBW7okEA25F2JfNbMxdZtHJgk1D
ydASTGe34f+K8XNJjBDgWxJ1BEOWCJn20iKgJzq9wBD+wsVeWajCj4i++JfcHQy1
JJvGbuLte9p6YA+PAkhg
=7jl6
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--
