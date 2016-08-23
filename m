From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 2/5] clk: sunxi-ng: mux: support fixed pre-dividers on
 multiple parents
Date: Tue, 23 Aug 2016 10:55:34 +0200
Message-ID: <20160823085534.GC2598@lukather>
References: <1471248795-17951-1-git-send-email-wens@csie.org>
 <1471248795-17951-3-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8998904910844840861=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1471248795-17951-3-git-send-email-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============8998904910844840861==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qbvjkv9qwOGw/5Fx"
Content-Disposition: inline


--Qbvjkv9qwOGw/5Fx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2016 at 04:13:12PM +0800, Chen-Yu Tsai wrote:
> Some clocks on the A31 have fixed pre-dividers on multiple parents.
> Add support for them.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
> Changes since v1:
>=20
>   - Add field for number of fixed pre-dividers.
> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-h3.c |  9 +++++----
>  drivers/clk/sunxi-ng/ccu_mux.c      |  6 ++++--
>  drivers/clk/sunxi-ng/ccu_mux.h      | 11 +++++++----
>  3 files changed, 16 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c b/drivers/clk/sunxi-ng/c=
cu-sun8i-h3.c
> index 9af359544110..a01298881991 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
> @@ -184,15 +184,16 @@ static SUNXI_CCU_MP_WITH_MUX(apb2_clk, "apb2", apb2=
_parents, 0x058,
>  			     0);
> =20
>  static const char * const ahb2_parents[] =3D { "ahb1" , "pll-periph0" };
> +static const struct ccu_mux_fixed_prediv ahb2_fixed_predivs[] =3D {
> +	{ .index =3D 1, .div =3D 2 },
> +	{ },
> +};
>  static struct ccu_mux ahb2_clk =3D {
>  	.mux		=3D {
>  		.shift	=3D 0,
>  		.width	=3D 1,
> =20
> -		.fixed_prediv	=3D {
> -			.index	=3D 1,
> -			.div	=3D 2,
> -		},
> +		.fixed_predivs	=3D ahb2_fixed_predivs,
>  	},
> =20
>  	.common		=3D {
> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mu=
x.c
> index 68b32f168a74..7b17e0c26b01 100644
> --- a/drivers/clk/sunxi-ng/ccu_mux.c
> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
> @@ -20,6 +20,7 @@ void ccu_mux_helper_adjust_parent_for_prediv(struct ccu=
_common *common,
>  {
>  	u16 prediv =3D 1;
>  	u32 reg;
> +	int i;
> =20
>  	if (!((common->features & CCU_FEATURE_FIXED_PREDIV) ||
>  	      (common->features & CCU_FEATURE_VARIABLE_PREDIV)))
> @@ -32,8 +33,9 @@ void ccu_mux_helper_adjust_parent_for_prediv(struct ccu=
_common *common,
>  	}
> =20
>  	if (common->features & CCU_FEATURE_FIXED_PREDIV)
> -		if (parent_index =3D=3D cm->fixed_prediv.index)
> -			prediv =3D cm->fixed_prediv.div;
> +		for (i =3D 0; i < cm->n_predivs; i++)
> +			if (parent_index =3D=3D cm->fixed_predivs[i].index)
> +				prediv =3D cm->fixed_predivs[i].div;
> =20
>  	if (common->features & CCU_FEATURE_VARIABLE_PREDIV)
>  		if (parent_index =3D=3D cm->variable_prediv.index) {
> diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mu=
x.h
> index f0078de78712..5308b41da22a 100644
> --- a/drivers/clk/sunxi-ng/ccu_mux.h
> +++ b/drivers/clk/sunxi-ng/ccu_mux.h
> @@ -5,15 +5,18 @@
> =20
>  #include "ccu_common.h"
> =20
> +struct ccu_mux_fixed_prediv {
> +	u8	index;
> +	u16	div;
> +};
> +
>  struct ccu_mux_internal {
>  	u8		shift;
>  	u8		width;
>  	const u8	*table;
> =20
> -	struct {
> -		u8	index;
> -		u16	div;
> -	} fixed_prediv;
> +	const struct ccu_mux_fixed_prediv	*fixed_predivs;
> +	u8		n_predivs;

I don't think you're using it anywhere (at least you don't define it
in ahb2_clk, and the extra item in the array will introduce an
off-by-one error.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--Qbvjkv9qwOGw/5Fx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXvA+GAAoJEBx+YmzsjxAgBR8QALnSqFZiLEksLWyb58l8eQhM
ZOlJPuQgjBoHW2HSIZLoTGlnF0ZM9pC2Xq5VR+BmwcOo6mVE+2wQILTBCNdVHZsZ
9FAtV32H7Xd3LAHquQsub35iJJZl+7wfALy0VTjIv/kx1gq+yKb544HhVr67LfpO
0trfiHujtzmAKHha23fJsowolFnvtDFYfBFKRl+jV2wgMN4SouLaB58UqSrZJGeK
3G3lW3BR6tjZneyZFMKRMUNYCsZuNcukUXFMv6c/8I1GW7bcVM2VsWh1bc+kdb6c
wzSaSyLIEgRkGDZ7U6YJrIqiXmsQmdXbbAcaptDVeHvTzLUh5QVFT5jfCA7pve5D
my2P/gkTvSwHripsPimG4rRLQXQfROtzdPi3o2EIrrb9ScVNolX63c9SjSI/fVrG
AjjbEdWYzFk7bJdWm/W4uMPfw7qliF7HTIJ7CkPbmd6lWBpo1GVMxfOjJbnU0ZE7
cBrpzu9aZhf/EpCJ2FTcDrGyNERS3b33pAFYsZVr+mWbRGHoCxXZCPhgUf7dTGi1
lLH5ynA87o296G47104BiWRKbvLWh/F0sk5NQ5s1WrOQLaJ+2MyZcpMyk9aVrkab
VlQiyKVIlcYjQXu3mPZqkO71C5vZD3L8eGY048aVLfwtWVzOy3kvLBms5V4G9Jjy
8znNncKEpUyuYgqsxv9K
=vuFp
-----END PGP SIGNATURE-----

--Qbvjkv9qwOGw/5Fx--


--===============8998904910844840861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8998904910844840861==--
