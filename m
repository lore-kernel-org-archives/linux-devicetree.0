From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 3/3] clk: sunxi: Add sun8i PLL audio support
Date: Sun, 10 Apr 2016 02:53:22 -0700
Message-ID: <20160410095322.GZ4227@lukather>
References: <cover.1459358017.git.moinejf@free.fr>
 <8ba2e0d78c70ea4c54fb25969956fc31674df612.1459358017.git.moinejf@free.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NJ5+aVN4Egd/eJfU"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8ba2e0d78c70ea4c54fb25969956fc31674df612.1459358017.git.moinejf@free.fr>
Sender: linux-clk-owner@vger.kernel.org
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Emilio Lopez <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@csie.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--NJ5+aVN4Egd/eJfU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 30, 2016 at 06:57:16PM +0200, Jean-Francois Moine wrote:
> Add the PLL type which is used by the sun8i family for audio.
>=20
> Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
>  drivers/clk/sunxi/clk-sunxi.c                     | 48 +++++++++++++++++=
++++++
>  2 files changed, 49 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Document=
ation/devicetree/bindings/clock/sunxi.txt
> index ff93aee..917d4aa 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> @@ -10,6 +10,7 @@ Required properties:
>  	"allwinner,sun4i-a10-pll1-clk" - for the main PLL clock and PLL4
>  	"allwinner,sun6i-a31-pll1-clk" - for the main PLL clock on A31
>  	"allwinner,sun8i-a23-pll1-clk" - for the main PLL clock on A23
> +	"allwinner,sun8i-pll2-clk" - for the audio PLL clock

You should mention the name of the first SoC that introduced it.

>  	"allwinner,sun6i-a31-pll3-clk" - for the video PLL clock
>  	"allwinner,sun9i-a80-pll4-clk" - for the peripheral PLLs on A80
>  	"allwinner,sun4i-a10-pll5-clk" - for the PLL5 clock
> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
> index 270f2a9..7386141 100644
> --- a/drivers/clk/sunxi/clk-sunxi.c
> +++ b/drivers/clk/sunxi/clk-sunxi.c
> @@ -1130,6 +1130,54 @@ CLK_OF_DECLARE(sun6i_pll6, "allwinner,sun6i-a31-pl=
l6-clk",
>  	       sun6i_pll6_clk_setup);
> =20
>  /*
> + * sun8i pll2
> + *
> + * rate =3D parent_rate / (m + 1) * (n + 1) / (p + 1);

                         ^ I'm guessing it's a "*" instead?

> + */
> +static void sun8i_pll2_factors(struct factors_request *req)
> +{
> +	unsigned long n, m;
> +
> +	/* set p =3D 4 so that pll2 =3D pll2x8 / 8 */
> +	req->p =3D 4 - 1;
> +	rational_best_approximation(req->rate,
> +				req->parent_rate / 4,
> +				1 << 7, 1 << 5, &n, &m);
> +	req->rate =3D req->parent_rate / m * n / 4;
> +	req->m =3D m - 1;
> +	req->n =3D n - 1;
> +}
> +
> +static void sun8i_pll2_recalc(struct factors_request *req)
> +{
> +	req->rate =3D req->parent_rate / (req->m + 1) * (req->n + 1) /
> +						(req->p + 1);
> +}
> +
> +static const struct clk_factors_config sun8i_pll2_config =3D {
> +	.mshift =3D 0,
> +	.mwidth =3D 5,
> +	.nshift =3D 8,
> +	.nwidth =3D 7,
> +	.pshift =3D 16,
> +	.pwidth =3D 4,
> +};
> +
> +static const struct factors_data sun8i_pll2_data __initconst =3D {
> +	.enable =3D 31,
> +	.table =3D &sun8i_pll2_config,
> +	.getter =3D sun8i_pll2_factors,
> +	.recalc =3D sun8i_pll2_recalc,
> +};
> +
> +static void __init sun8i_pll2_setup(struct device_node *node)
> +{
> +	sunxi_factors_clk_setup(node, &sun8i_pll2_data);
> +}
> +CLK_OF_DECLARE(sun8i_pll2, "allwinner,sun8i-pll2-clk",
> +	       sun8i_pll2_setup);

How do you plan on supporting the multiple pll2 output?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--NJ5+aVN4Egd/eJfU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXCiKSAAoJEBx+YmzsjxAg/XIQAIWR2mWfXIFmYjk11PSvXO7g
UiPAGN/65qT7PZThWClaflrtwWdLCJMW9pDbF42Y2agusqmzRCyxN1qj7FSbtnQn
6EnhZf5O4OFBtOsmEzCi2mlFhMxi+Ep9bCM3SSAMsPCuyYnNshYBQMmpwrUltsXW
oTpLqxM3dvir8CSd+PFE620HXKNT469U2rPr8xQMkU7raIl8lGQ+8YrMWB6EBLxn
LN5SBjqOMFNWP398zjH4208mAxYcc8Z/VdetLl4VyKBB214l58wvCvmfLeJoMYOx
ZQb4X4Qsu2i48L7ZfvcGF9Tuic9G6PbrQBtS1NHQaNyJq/qX5iVaTd4mq5WtgqEB
NGp1S43DogiJXWJfAF8xVAU8pxswqNC71cypgxV8kBaZXnFVPZxniCXZkRBr2i7p
SKGk4CsXk3Ivr/hs0HpuvjAOVUSmUSYrrM5DcoP5TlEoK0YZgKjm8R4+JejVhcIw
4aK3sAOBcx+YZIq0mDXr4qLl7w1XJLD+NBQw0Fq7FnrScY8+BLv232FryNEkiXBj
VS5uMhQFBM9gwxCTxYk8U+Yz2pTY3cw31VeUkPiWYWY/ArDDa6fA7iEfV2oGsyNz
IzvPV+DyyA9VRHhUH3sBi/JWeLcBdViLHhgU8TfvmyG5ax17H8tbkD4Sr/f0J5Jn
v4dyn3LXT97LYg5hplhf
=TgMR
-----END PGP SIGNATURE-----

--NJ5+aVN4Egd/eJfU--
