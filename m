From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/7] clk: sunxi: Implement A31 PLL6 as a divs clock
 for 2x output
Date: Tue, 30 Sep 2014 17:39:57 +0200
Message-ID: <20140930153957.GM4081@lukather>
References: <1411807795-6575-1-git-send-email-wens@csie.org>
 <1411807795-6575-3-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="P9KQiUGMzYCFwWCN"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411807795-6575-3-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--P9KQiUGMzYCFwWCN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Sep 27, 2014 at 04:49:50PM +0800, Chen-Yu Tsai wrote:
> Some clock modules on the A31 use PLL6x2 as one of their inputs.
> This patch changes the PLL6 implementation for A31 to a divs clock,
> i.e. clock with multiple outputs that have different dividers.
> The first output will be the normal PLL6 output, and the second
> will be PLL6x2.
>=20
> This patch fixes the PLL6 N factor in the clock driver, and removes
> any /2 dividers in the PLL6 factors clock part. The N factor counts
> from 1 to 32, mapping to values 0 to 31, as shown in the A31 manual.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |  5 ++--
>  drivers/clk/sunxi/clk-sunxi.c                     | 28 +++++++++++++----=
------
>  2 files changed, 19 insertions(+), 14 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Document=
ation/devicetree/bindings/clock/sunxi.txt
> index d3a5c3c..0d84f4b 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> @@ -59,8 +59,9 @@ Required properties for all clocks:
>  	multiplexed clocks, the list order must match the hardware
>  	programming order.
>  - #clock-cells : from common clock binding; shall be set to 0 except for
> -	"allwinner,*-gates-clk", "allwinner,sun4i-pll5-clk" and
> -	"allwinner,sun4i-pll6-clk" where it shall be set to 1
> +	the following compatibles where it shall be set to 1:
> +	"allwinner,*-gates-clk", "allwinner,sun4i-pll5-clk",
> +	"allwinner,sun4i-pll6-clk", "allwinner, sun6i-a31-pll6-clk"
                                               ^ Drop this extra space

And you're still not documenting what outputs you might have on pll6,
and what the extra argument correspond to.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--P9KQiUGMzYCFwWCN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUKs7NAAoJEBx+YmzsjxAgdBAP/25CeQl0zdWmG0hOKa7NeMsv
6dR+6bVeIkWgCEkjDc2U+rCiYg4UUGyyAxRroewODtXf6Akj6DzGq03iQKQ4y3en
WVDHor1rLmMReT6f2dKKMHV0mVIq2jITUD2HZfp/dyW6TynZxhdWlpoY/Oh9OkPc
iYTsYNFw+tAO8hFe7odTFcuDXGHD9Ev5p+6qf9Y0JbNZPENUnsZGnr75A+hwumIt
hIlx3mtsTtI4EKv4UbMdypD2gcSq9CWBQPLqmK58IYTOp8wyHGubfHcMPl05/Qpn
1KyCtNOeMXZ3wK+aAk8slwHnLV6WpchLcCllvKEugL3BPbm37YT3QqK6TD3qHLIn
RQJcIOrV/txXsYlLIDlUDGQ3CryaWnXBCQAIilrgVXVFE4eJ2a6LIMRCbVePjzkO
tryUjrTzeA6+mJBu8nLEGpgWAJM7qn4DwggQzIOFMxfMyTsMLWVj4mBqmk5giYED
VF+BP9BKfYqMEHNZx6tC14vmcazXEjH4ybKxPKxMazZTGJ43URGah763WD32nkrm
Nj8FcLdoiEnYnoSGBA1b8CaZRUd0NNPMC30jL9kAw2XD0tSPp+FHkgvgk35XaLwC
Ecqh18nlpjERg2iaDLct9ym7OpE0ptpeh3ta16s5eWRF7rwdpxj1k520HHKfLlR8
lr8yQrhJd4c7jwen1bDr
=th7g
-----END PGP SIGNATURE-----

--P9KQiUGMzYCFwWCN--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
