From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] clk: sunxi: Add sun6i/8i PLL video support
Date: Sun, 10 Apr 2016 02:50:06 -0700
Message-ID: <20160410095006.GY4227@lukather>
References: <cover.1459358017.git.moinejf@free.fr>
 <e63499f789971b8c45a0ae5e90bd127371cbcf19.1459358017.git.moinejf@free.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yPlaimQd/TpiYx8R"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e63499f789971b8c45a0ae5e90bd127371cbcf19.1459358017.git.moinejf-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--yPlaimQd/TpiYx8R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 30, 2016 at 06:50:43PM +0200, Jean-Francois Moine wrote:
> Add the PLL type which is used by the sun6i/8i families for video display.
>=20
> Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
>  drivers/clk/sunxi/clk-sunxi.c                     | 65 +++++++++++++++++=
++++++
>  2 files changed, 66 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Document=
ation/devicetree/bindings/clock/sunxi.txt
> index 8c0fda8..ff93aee 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> @@ -10,6 +10,7 @@ Required properties:
>  	"allwinner,sun4i-a10-pll1-clk" - for the main PLL clock and PLL4
>  	"allwinner,sun6i-a31-pll1-clk" - for the main PLL clock on A31
>  	"allwinner,sun8i-a23-pll1-clk" - for the main PLL clock on A23
> +	"allwinner,sun6i-a31-pll3-clk" - for the video PLL clock
>  	"allwinner,sun9i-a80-pll4-clk" - for the peripheral PLLs on A80
>  	"allwinner,sun4i-a10-pll5-clk" - for the PLL5 clock
>  	"allwinner,sun4i-a10-pll6-clk" - for the PLL6 clock
> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
> index 0581e1b..270f2a9 100644
> --- a/drivers/clk/sunxi/clk-sunxi.c
> +++ b/drivers/clk/sunxi/clk-sunxi.c
> @@ -23,6 +23,7 @@
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/log2.h>
> +#include <linux/rational.h>
> =20
>  #include "clk-factors.h"
> =20
> @@ -1129,6 +1130,70 @@ CLK_OF_DECLARE(sun6i_pll6, "allwinner,sun6i-a31-pl=
l6-clk",
>  	       sun6i_pll6_clk_setup);
> =20
>  /*
> + * sun6i pll3
> + *
> + * if (p =3D=3D 0) rate =3D k ? 270MHz : 297MHz
> + * else rate =3D parent_rate / (m + 1) * (n + 1);
> + */
> +static void sun6i_pll3_factors(struct factors_request *req)
> +{
> +	unsigned long n, m;
> +
> +	if (req->rate =3D=3D 270000000) {
> +		req->m =3D 0;
> +		req->p =3D 0;
> +		req->k =3D 0;
> +	} else if (req->rate =3D=3D 297000000) {
> +		req->m =3D 0;
> +		req->p =3D 0;
> +		req->k =3D 1;
> +	} else {
> +		rational_best_approximation(req->rate,
> +					req->parent_rate,
> +					1 << 7, 1 << 4, &n, &m);
> +		req->rate =3D req->parent_rate / m * n;
> +		req->p =3D 1;
> +		req->m =3D m - 1;
> +		req->n =3D n - 1;
> +	}
> +}
> +
> +static void sun6i_pll3_recalc(struct factors_request *req)
> +{
> +	if (req->p)
> +		req->rate =3D req->parent_rate / (req->m + 1) * (req->n + 1);
> +	else if (req->k)
> +		req->rate =3D 270000000;
> +	else
> +		req->rate =3D 297000000;
> +}
> +
> +static const struct clk_factors_config sun6i_pll3_config =3D {
> +	.mshift =3D 0,
> +	.mwidth =3D 4,
> +	.nshift =3D 8,
> +	.nwidth =3D 7,
> +	.pshift =3D 24,	/* mode selection fractional / integer */
> +	.pwidth =3D 1,
> +	.kshift =3D 25,	/* fraction 270 / 297 MHz */
> +	.kwidth =3D 1,
> +};

That's not what p and k are.

Please add extra parameters to deal with fractional rates in the
clk_factors_config (like an extra bit + an array with the two rate
exposed.

That way, you can also deal with it in the core, instead of doing a
hack.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--yPlaimQd/TpiYx8R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXCiHOAAoJEBx+YmzsjxAgj/IP/i23VU2JjuMHcqkBCkk+6L3+
B77AD4x+7y2gkQYi0+LzzAhrAfrkyq47Ot6wuxi9OsjVYm0/EPodAdzjeJdBI8Aq
RhwFKUOHW2ICb0RqwnCgIbFa/VG0sz3YhJq+un0hIjrHGPhd0chrRuhdin3uOQth
00cvNTGl0KYGDVNaPqjgRriOd4WQvkFdE/5ObvAKhGxCa2Kd7VFBZyBYuPAwck8a
e8T0tsoqSHRdLKItErU+h+U6PAoNKv3fMc+nDmktbIcxwpPRy8tvbPGCu/x1XmfH
kBiYrnZq+FBg7q3ruFDgzPBaoRFby2EQQz7NplgXSpUIJWdtT0FNWzTFVXxwzB/P
wnCqZ5juJIqjq08VW0tcCfs9qxQDANexOTwrLijfgsrGFJ7MJ8KiKAio/xEdZm8d
bRLipbY/lc1GaBg26Yp6vxHJGRedhG5UsjSJhIkXomIGrNCZ0D7iBnzrCIoz8Kop
URjv6qUCJbO0dFQYhsD8BxIGws0uc0h8wfBghMdpHJrQQmOEtb7+IAuUaL9WTZof
edMGP++PgnOmeiKq+FKJxersq1dcILmARv3KjVB3Z4eL6r+5Ft9awzK2WQ8HUrYa
msGK2nQhnh72KNIAar3aYPGv6FcFLwJnh/NVBoy28HADfal/hoCq3a363No3JrDX
moV3OWJE2dAAHczc3GPw
=3MIA
-----END PGP SIGNATURE-----

--yPlaimQd/TpiYx8R--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
