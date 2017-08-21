From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 2/2] ARM: sunxi: add support for R40 SoC
Date: Mon, 21 Aug 2017 11:34:05 +0200
Message-ID: <20170821093405.n4bum7j6nswnv6wr@flea.lan>
References: <20170820052957.34597-1-icenowy@aosc.io>
 <20170820052957.34597-2-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rbnlt567ienflvt7"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170820052957.34597-2-icenowy@aosc.io>
Sender: linux-doc-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--rbnlt567ienflvt7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Aug 20, 2017 at 01:29:57PM +0800, Icenowy Zheng wrote:
> Allwinner R40 is a new SoC, with Quad Core Cortex-A7 and peripherals
> like A20.
>=20
> Add support for it.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  Documentation/arm/sunxi/README                  | 6 ++++++
>  Documentation/devicetree/bindings/arm/sunxi.txt | 1 +
>  arch/arm/mach-sunxi/sunxi.c                     | 1 +
>  3 files changed, 8 insertions(+)
>=20
> diff --git a/Documentation/arm/sunxi/README b/Documentation/arm/sunxi/REA=
DME
> index d7b1f016bd62..4fa836782e46 100644
> --- a/Documentation/arm/sunxi/README
> +++ b/Documentation/arm/sunxi/README
> @@ -75,6 +75,12 @@ SunXi family
>          + Datasheet
>            http://linux-sunxi.org/File:Allwinner_V3s_Datasheet_V1.0.pdf
> =20
> +      - Allwinner R40 (sun8i)
> +        + Datasheet
> +          https://github.com/tinalinux/docs/raw/r40-v1.y/R40_Datasheet_V=
1.0.pdf
> +        + User Manual
> +          https://github.com/tinalinux/docs/raw/r40-v1.y/Allwinner_R40_U=
ser_Manual_V1.0.pdf
> +

Please sort it by alphabetical order.

>      * Quad ARM Cortex-A15, Quad ARM Cortex-A7 based SoCs
>        - Allwinner A80
>          + Datasheet
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentat=
ion/devicetree/bindings/arm/sunxi.txt
> index f35c6ada5a65..e4beec3d9ad3 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.txt
> +++ b/Documentation/devicetree/bindings/arm/sunxi.txt
> @@ -14,6 +14,7 @@ using one of the following compatible strings:
>    allwinner,sun8i-a83t
>    allwinner,sun8i-h2-plus
>    allwinner,sun8i-h3
> +  allwinner-sun8i-r40
>    allwinner,sun8i-v3s
>    allwinner,sun9i-a80
>    allwinner,sun50i-a64
> diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
> index 7ab353fb25f2..311e6c4fc4f4 100644
> --- a/arch/arm/mach-sunxi/sunxi.c
> +++ b/arch/arm/mach-sunxi/sunxi.c
> @@ -66,6 +66,7 @@ static const char * const sun8i_board_dt_compat[] =3D {
>  	"allwinner,sun8i-h2-plus",
>  	"allwinner,sun8i-h3",
>  	"allwinner,sun8i-v3s",
> +	"allwinner,sun8i-r40",

And same thing here.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--rbnlt567ienflvt7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZmqkNAAoJEBx+YmzsjxAgN5oQAKmHyrfbuf2XFTcFZePiTSxl
t2uTv0JM7sas8ZUju6bR6bFm6HlDmT8/+UsByhvfQszVs2GtBYtQVTxbfppjJHym
VYdyUvezbg9t+SmOjL4HhNEQtf8vsncvpIXGJAT5zuTbNajkDSCvwuARgIoSDnbc
LRovjkamARhQOAdV1IsgH48EXP83z+ErdWl1PsMyBGNHjViSNfdXysC4UdD3mTKd
s634cRmLDI6XfJY7UcsNToHoFkIPNR7TAdOWRnpX6FTC+QyS8kH03SpOj+K5Y46u
FJf3bsco8jQYrAIArBPgEv+zcwITcej4Zst1VgqjoeiJ8DpAwNJHWxn7Asksuw9+
+ReJtuPNb7SVlARN4WuUVfY5NOycQjwUy1y+FNPD+gkWUeL97PxN2UV4aJ0AQK+s
yVRiaZQmD4A9pQI9IJVaKQ780VPpQfvgOgRLWsqz6aekY8Ge+Qf+hcl7rMQYPic0
qmDasT18euipIovY1LQ9OOjsEPsE+9192DO7ingT9usPHZsGDqQyU16kS9P9F/Bu
9sCpfNultkUOTXrFlisyFTHYWvGn4NzR7kXpc9P/FUV+etJItUVYBCQkKEG92uJD
OhRYLpVTgO+KwLqRuWbpfBoRUOFZjmStbBw5PgpM0/KM0GT+jmQ5VMShoOdZxDpg
ubYy0XPXPEVuK89uiIae
=z5px
-----END PGP SIGNATURE-----

--rbnlt567ienflvt7--
