From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 2/5] clk: sunxi: Add USB clock register defintions
Date: Fri, 7 Feb 2014 15:44:41 +0100
Message-ID: <20140207144441.GK3192@lukather>
References: <1391783553-8096-1-git-send-email-hdegoede@redhat.com>
 <1391783553-8096-3-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/0P/MvzTfyTu5j9Q"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB37C2OLQKGQEZPX4X3Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1391783553-8096-3-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--/0P/MvzTfyTu5j9Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 07, 2014 at 03:32:30PM +0100, Hans de Goede wrote:
> From: Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> Add register definitions for the usb-clk register found on sun4i, sun5i a=
nd
> sun7i SoCs.
>=20
> Signed-off-by: Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |  5 +++++
>  drivers/clk/sunxi/clk-sunxi.c                     | 12 ++++++++++++
>  2 files changed, 17 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Document=
ation/devicetree/bindings/clock/sunxi.txt
> index 27f19f1..e368a86c 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> @@ -38,6 +38,8 @@ Required properties:
>  	"allwinner,sun4i-mod0-clk" - for the module 0 family of clocks
>  	"allwinner,sun7i-a20-out-clk" - for the external output clocks
>  	"allwinner,sun7i-a20-gmac-clk" - for the GMAC clock module on A20/A31
> +	"allwinner,sun4i-usb-clk" - for usb gates + resets on A10 / A20

I know I asked you otherwise, but since we're moving to sun4i-a10-*
compatibles, can you do it here too ? :)

Thanks!
Maxime

> +	"allwinner,sun5i-a13-usb-clk" - for usb gates + resets on A13
> =20
>  Required properties for all clocks:
>  - reg : shall be the control register address for the clock.
> @@ -54,6 +56,9 @@ Required properties for all clocks:
>  For "allwinner,sun7i-a20-gmac-clk", the parent clocks shall be fixed rate
>  dummy clocks at 25 MHz and 125 MHz, respectively. See example.
> =20
> +And "allwinner,*-usb-clk" clocks also require:
> +- reset-cells : shall be set to 1
> +
>  Clock consumers should specify the desired clocks they use with a
>  "clocks" phandle cell. Consumers that are using a gated clock should
>  provide an additional ID in their clock property. This ID is the
> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
> index 1e15e4c..3ba1402 100644
> --- a/drivers/clk/sunxi/clk-sunxi.c
> +++ b/drivers/clk/sunxi/clk-sunxi.c
> @@ -910,6 +910,16 @@ static const struct gates_data sun4i_ahb_gates_data =
__initconst =3D {
>  	.mask =3D {0x7F77FFF, 0x14FB3F},
>  };
> =20
> +static const struct gates_data sun4i_usb_gates_data __initconst =3D {
> +	.mask =3D {0x1C0},
> +	.reset_mask =3D 0x07,
> +};
> +
> +static const struct gates_data sun5i_a13_usb_gates_data __initconst =3D {
> +	.mask =3D {0x140},
> +	.reset_mask =3D 0x03,
> +};
> +
>  static const struct gates_data sun5i_a10s_ahb_gates_data __initconst =3D=
 {
>  	.mask =3D {0x147667e7, 0x185915},
>  };
> @@ -1257,6 +1267,8 @@ static const struct of_device_id clk_gates_match[] =
__initconst =3D {
>  	{.compatible =3D "allwinner,sun6i-a31-apb1-gates-clk", .data =3D &sun6i=
_a31_apb1_gates_data,},
>  	{.compatible =3D "allwinner,sun7i-a20-apb1-gates-clk", .data =3D &sun7i=
_a20_apb1_gates_data,},
>  	{.compatible =3D "allwinner,sun6i-a31-apb2-gates-clk", .data =3D &sun6i=
_a31_apb2_gates_data,},
> +	{.compatible =3D "allwinner,sun4i-usb-clk", .data =3D &sun4i_usb_gates_=
data,},
> +	{.compatible =3D "allwinner,sun5i-a13-usb-clk", .data =3D &sun5i_a13_us=
b_gates_data,},
>  	{}
>  };
> =20
> --=20
> 1.8.4.2
>=20

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--/0P/MvzTfyTu5j9Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJS9PFYAAoJEBx+YmzsjxAgndkQAJKcmO7LqK95r8EFwJTnUurK
c4bZS7o94xR/psHEgBih+ds5QOBQDGK0QAYNDEMtTSlGdMOWCs6U3q5U7Eg2BqSy
yds3F8kQuepqJvmq4Jd1+1y8w8yXtBBv5LrbCncq+vOGGL41pMBTqWEnG6pWT1Oq
qIQF8+1Xk+JcBItxa2AAgsyumcs8CEujS65UDo5KdOOTcjBJToBsjC7916I7r9hJ
pRuTakOU0rbRb8gJzP1+1sqz1C/9BQbKhu0DHVO4NofmGtzXokhX0jFCDnIVqooq
enTAxOiA/FPo80ZmbD0MSNyDBWJ8vK/EcYMpJLCXMb5w+marA/aCfptZPAZMpc00
hCm3mH8NIXf5YImMQCPZtvU8D4OFcE4MQ/+HvG+OxsR9tAeWf+OrTI/rIn/kZ8iy
6QNHxG1LZh2C0yKw25oAMVC5fEax47JzwlETEnLp0JcJh6jF3yI3xetOGwD7mTEk
GxfZFPthzjGx2hyo6hejLaflWY3PIiXi4Iv+MXpm1LVJ4rRsT9f+h7eSoemD2QDd
0Yo1bjIeCPWS1sRcGjQfsd13v7RPZLnI0tkRcFAPYzaNdBXYX+1hkEA9uhOJKGxh
VBLbGttuqzb3jrbfRSJBaC96PuaDcfJS+WFr0DQx0nwjdu1koT/X0llWe6pZ6B6w
mIW17qCu99djP4Os/BTh
=xk9H
-----END PGP SIGNATURE-----

--/0P/MvzTfyTu5j9Q--
