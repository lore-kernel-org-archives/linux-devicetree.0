From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4 03/13] clk: sunxi: Add APB1 clock for A83T
Date: Thu, 17 Mar 2016 11:41:24 +0100
Message-ID: <20160317104124.GL30977@lukather>
References: <1458144276-31108-1-git-send-email-vishnupatekar0510@gmail.com>
 <1458144276-31108-4-git-send-email-vishnupatekar0510@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GDLQamdgIxhPcIwq"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1458144276-31108-4-git-send-email-vishnupatekar0510@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: robh+dt@kernel.org, corbet@lwn.net, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, emilio@elopez.com.ar, jenskuske@gmail.com, hdegoede@redhat.com, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, mturquette@baylibre.com, sboyd@codeaurora.org, patchesrdh@mveas.com, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--GDLQamdgIxhPcIwq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2016 at 12:04:26AM +0800, Vishnu Patekar wrote:
> APB1 is similar to sun4i-a10-apb0-clk, except different dividers.
>=20
> This adds support for apb1 on A83T.
>=20
> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
>  drivers/clk/sunxi/clk-sunxi.c                     | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Document=
ation/devicetree/bindings/clock/sunxi.txt
> index cba9fe55..291d366 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> @@ -51,6 +51,7 @@ Required properties:
>  	"allwinner,sun8i-h3-apb0-gates-clk" - for the APB0 gates on H3
>  	"allwinner,sun9i-a80-apb0-gates-clk" - for the APB0 gates on A80
>  	"allwinner,sun4i-a10-apb1-clk" - for the APB1 clock
> ++	"allwinner,sun8i-a83t-apb1-clk" - for the APB1 clock on A83T

There's one '+' too many

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--GDLQamdgIxhPcIwq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW6onUAAoJEBx+YmzsjxAg2EwP/0xt7aSDsenIcLIibB9u5qn6
f1UG1xsLX9v4HQxUu7B8x1NmdgoM0htl6cLgntX0d3nV4jjadjRf/K0eUw/1V2XT
WpWRD+WbTmrPaSzuibSzAenuIOQSOYMj9IJqbZpswjH3oBhyi9/hGwga6FDPXeAK
duF5bo3Z10WfWi7P6/1/mnJ1aMRwwUskfg1ryZihH8AL91B+nLMGRvK7nR+aBZwv
7wMuTeQmER1ymWaf3iVt4hPAHHPoohOhAvHDFz4hy8XsOZuC4ti2sMuvQcV90IS/
fWWeEYTmMJYBF37l/2Z1Y//6Q1NhGIVRUNUmat01F3uYKRpMCSGM+JwVejLoyuZQ
oFtp/RHuQpP6AGwzlJY/2YYeuJJPeXoEST+k6wgH4snDRiTIVYi4JCKnX3RtRgtk
5DM5UoBJ5cyIIKQmas76HXVIdhuRjxNqPfKAKSTBDQ5FeT7tpBOhAF5mCJHzoGqn
WkkVeGIaPZAQcXV80GRi2cczpSjnR1v+5CKlmJafWaBdBWZ/KTa8tx7P1Ow0iYxP
8xCePI2G6HM4S7Z+Ns3YxFnxjg5D1KH5MvN4ZIVypbADL2p+Gtm+3pafexlI2iZW
fvtOEc1k6/g+CYNE+HLq+DOy9A2xtaXn3VJSUnL7CpgTIjIhkRDrCjdzPpP8DfGy
Bbj0oSU9tyHG6u8XWfWZ
=nXWR
-----END PGP SIGNATURE-----

--GDLQamdgIxhPcIwq--
