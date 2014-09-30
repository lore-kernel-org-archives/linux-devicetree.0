From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 7/7] ARM: dts: sun6i: Add required ahb1 clock parent
 and rates for dma controller
Date: Tue, 30 Sep 2014 17:55:33 +0200
Message-ID: <20140930155533.GP4081@lukather>
References: <1411807795-6575-1-git-send-email-wens@csie.org>
 <1411807795-6575-8-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="N5iGxCIPT7YMRg16"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411807795-6575-8-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--N5iGxCIPT7YMRg16
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 27, 2014 at 04:49:55PM +0800, Chen-Yu Tsai wrote:
> The DMA controller requires AHB1 bus clock to be clocked from PLL6.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun6i-a31.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a=
31.dtsi
> index caf879d..d7845d3 100644
> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
> @@ -353,6 +353,11 @@
>  			clocks =3D <&ahb1_gates 6>;
>  			resets =3D <&ahb1_rst 6>;
>  			#dma-cells =3D <1>;
> +
> +			/* DMA controller requires AHB1 clocked from PLL6 */
> +			assigned-clocks =3D <&ahb1>;
> +			assigned-clock-parents =3D <&pll6 0>;
> +			assigned-clock-rates =3D <200000000>;

Again, I don't think we need the rate change, and that it's the right
place to put it.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--N5iGxCIPT7YMRg16
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUKtJ1AAoJEBx+YmzsjxAgD5IQAIQYqScXNY4fSETDqzVF8yU4
Kz/KAEV2nVMdXgDlnC5his+AbGqg/XVrSmac2Mu4bqMN/UCb1BUpWkFyWNulayPW
SLvQFuiEOAXHLGv6gpRjihCKf8KeGK468sgwcw2j4riTAPMxEFh0y0GOL/59IF3g
CWqiW8H2vnP6J/6H89/Brm8xOnLk9nInyytgXQ4W1Clj9Ltrp1VQ0bRST1JPTMUl
9TiMnEp3PaqQMC7c2pr3ayKcV2jRaEud74O28CFfCnmsvu85Pzp/xSzK76mP8Atn
xNG1HI6kWh1oXD4eDuqLvJ0c5jDgYaDJc0s7jVoQk5753dEvdOu9HFG0mxvBmWXh
SwbKMoncev6cQugpRSCQ4rBR8jTF6VbQDj/IkN1gwxixr0caMfSsfhbBnwejMmwM
kcX1sn2a0xPZnCj92oT76a+hqQ1WC6/1jiSg/fKuoZAs6DdOnkWTgcT3uHb4iwCU
WytQSWB0KViS6bk8eZRp8M2s1omokiTdUEW3MXvIoMv9WyolyZHjRjWm1MDjAkEX
1PLkOIupwDr9RK3irIcc/9IwPnyLrjUfwnZSZnXbIg402yc9ikFXj2roXMb2Joh6
Lryjc1F72cdNjGroYlbL8QDE+j3kJiYu5CjBJF/Gv87APF+TsccbN7as+4EJgOZ3
hbt5rOXl62517bnR2XXm
=LZ1o
-----END PGP SIGNATURE-----

--N5iGxCIPT7YMRg16--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
