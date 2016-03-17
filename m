From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4 02/13] clk: sunxi: add ahb1 clock for A83T
Date: Thu, 17 Mar 2016 11:40:42 +0100
Message-ID: <20160317104042.GK30977@lukather>
References: <1458144276-31108-1-git-send-email-vishnupatekar0510@gmail.com>
 <1458144276-31108-3-git-send-email-vishnupatekar0510@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nWEzmRaGLXxZdI3i"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1458144276-31108-3-git-send-email-vishnupatekar0510@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: robh+dt@kernel.org, corbet@lwn.net, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, emilio@elopez.com.ar, jenskuske@gmail.com, hdegoede@redhat.com, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, mturquette@baylibre.com, sboyd@codeaurora.org, patchesrdh@mveas.com, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--nWEzmRaGLXxZdI3i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2016 at 12:04:25AM +0800, Vishnu Patekar wrote:
> AHB1 on A83T is similar to ahb1 on A31, except parents are different.
> clock index 0b1x is PLL6.
>=20
> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
> Acked-by: Chen-Yu Tsai <wens@csie.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
>  drivers/clk/sunxi/clk-sunxi.c                     | 76 +++++++++++++++++=
++++++
>  2 files changed, 77 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Document=
ation/devicetree/bindings/clock/sunxi.txt
> index 834436f..cba9fe55 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> @@ -30,6 +30,7 @@ Required properties:
>  	"allwinner,sun6i-a31-ar100-clk" - for the AR100 on A31
>  	"allwinner,sun9i-a80-cpus-clk" - for the CPUS on A80
>  	"allwinner,sun6i-a31-ahb1-clk" - for the AHB1 clock on A31
> +	"allwinner,sun8i-a83t-ahb1-clk" - for the AHB1 clock on A83T
>  	"allwinner,sun8i-h3-ahb2-clk" - for the AHB2 clock on H3
>  	"allwinner,sun6i-a31-ahb1-gates-clk" - for the AHB1 gates on A31
>  	"allwinner,sun8i-a23-ahb1-gates-clk" - for the AHB1 gates on A23
> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
> index 91de0a0..a7aab65 100644
> --- a/drivers/clk/sunxi/clk-sunxi.c
> +++ b/drivers/clk/sunxi/clk-sunxi.c
> @@ -344,6 +344,67 @@ static void sun6i_ahb1_recalc(struct factors_request=
 *req)
>  	req->rate >>=3D req->p;
>  }
> =20
> +#define SUN8I_A83T_AHB1_PARENT_PLL6	2
> +/**
> + * sun8i_a83t_get_ahb_factors() - calculates m, p factors for AHB
> + * AHB rate is calculated as follows
> + * rate =3D parent_rate >> p
> + *
> + * if parent is pll6, then
> + * parent_rate =3D pll6 rate / (m + 1)
> + */
> +
> +static void sun8i_a83t_get_ahb1_factors(struct factors_request *req)
> +{
> +	u8 div, calcp, calcm =3D 1;
> +
> +	/*
> +	 * clock can only divide, so we will never be able to achieve
> +	 * frequencies higher than the parent frequency
> +	 */
> +	if (req->parent_rate && req->rate > req->parent_rate)
> +		req->rate =3D req->parent_rate;
> +
> +	div =3D DIV_ROUND_UP(req->parent_rate, req->rate);
> +
> +	/* calculate pre-divider if parent is pll6 */
> +	if (req->parent_index >=3D SUN8I_A83T_AHB1_PARENT_PLL6) {
> +		if (div < 4)
> +			calcp =3D 0;
> +		else if (div / 2 < 4)
> +			calcp =3D 1;
> +		else if (div / 4 < 4)
> +			calcp =3D 2;
> +		else
> +			calcp =3D 3;
> +
> +		calcm =3D DIV_ROUND_UP(div, 1 << calcp);
> +	} else {
> +		calcp =3D __roundup_pow_of_two(div);
> +		calcp =3D calcp > 3 ? 3 : calcp;
> +	}
> +
> +	req->rate =3D (req->parent_rate / calcm) >> calcp;
> +	req->p =3D calcp;
> +	req->m =3D calcm - 1;
> +}
> +
> +/**
> +* sun8i_a83t_ahb1_recalc() - calculates AHB clock rate from m, p factors=
 and
> +*			 parent index
> +*/
> +static void sun8i_a83t_ahb1_recalc(struct factors_request *req)
> +{
> +	req->rate =3D req->parent_rate;
> +
> +/* apply pre-divider first if parent is pll6 */

The comment indentation is wrong

> +	if (req->parent_index >=3D SUN6I_AHB1_PARENT_PLL6)

And this is not the right define you're using.

I still believe that duplicating the same logic just because of
different dividers is not the way to go.

You could solve that easily by adding a table for the muxes, and
associate it with parents and dividers, that you could store in
clk_factors.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--nWEzmRaGLXxZdI3i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW6omqAAoJEBx+YmzsjxAg+IkP/2n5+5I/Z4nyp7elRujuyzaE
2f3QCOY+7UOtYv0/LfUIjKujFD5ygm7RlpeIRjXVGBBErWrkvB5Nx1xe6X1IooGb
X+10yJZe4ryQgn923+FasXa2BQxgHw38M5tfub8FBmxxru74lxrpkhDax7fI402l
Blm9oucHEtK71F8E53x8+UUg35i0Zxf7c1iFIndDeBd4KQL5zgVd2lmjNFU4oKn1
Y+ZQd8bDfuaioWmVFXEiN1HHtzE2s5qjbyZtt2pvX0bv5a0U470O7v+o9/jCvfs2
PzRpy0vLbnUxwDXT/vyrL/Ntk8/ZK5HpVlJukSITNGWr7IbqSPefY+OdCgyjjymZ
h7LLCmDUjV7bCKIHUFivE9ahFqTC6xIVw8MQEkJkymsfCvK9zKBH9bezTjAwucCK
EWWnJwxNVTs9lI9vjSJhXtNuxSUToVyS3vO4KEPAY4BXoDh+iF58g5voQ8Vx2kCs
cmeMaeB08SdFJpxNgdvh12IwMiggow6r9aunpKN2eZuxvIaAwsfGnxJMs+yJKeC3
Gh/amdLJ4fQ7qfdHNCxStiAehkJKwgA5jxfjKK8x9Rvw2gwSG2I7/qGv2GUbWMFF
VqxN2SEpc5fbfnfl/A7sTeAnx2vLGIiBA21qe0Jq5JtcId80bXlx/h2u/fY4YTnS
083HDY2FJEsMZurPv22F
=dNXR
-----END PGP SIGNATURE-----

--nWEzmRaGLXxZdI3i--
