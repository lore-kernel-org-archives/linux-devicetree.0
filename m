From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/5] clk: sunxi: Add USB clock register defintions
Date: Mon, 27 Jan 2014 15:43:49 +0100
Message-ID: <20140127144349.GJ3867@lukather>
References: <1390426587-16287-1-git-send-email-hdegoede@redhat.com>
 <1390426587-16287-3-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jQIvE3yXcK9X9HBh"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB37BTGLQKGQEG5ZWUCQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1390426587-16287-3-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--jQIvE3yXcK9X9HBh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

Mostly looking good, but I have a few comments below.

On Wed, Jan 22, 2014 at 10:36:24PM +0100, Hans de Goede wrote:
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
> index 79c7197..8bccb6a 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> @@ -37,6 +37,8 @@ Required properties:
>  	"allwinner,sun6i-a31-apb2-gates-clk" - for the APB2 gates on A31
>  	"allwinner,sun4i-mod0-clk" - for the module 0 family of clocks
>  	"allwinner,sun7i-a20-out-clk" - for the external output clocks
> +	"allwinner,sun4i-usb-gates-clk" - for usb gates + resets on A10 / A20
> +	"allwinner,sun5i-a13-usb-gates-clk" - for usb gates + resets on A13

Maybe we can just remove the gates from there? Even though they are
gates, they are also (a bit) more than that.

>  Required properties for all clocks:
>  - reg : shall be the control register address for the clock.
> @@ -49,6 +51,9 @@ Required properties for all clocks:
>  Additionally, "allwinner,*-gates-clk" clocks require:
>  - clock-output-names : the corresponding gate names that the clock contr=
ols
> =20
> +And "allwinner,*-usb-gates-clk" clocks also require:
> +- reset-cells : shall be set to 1
> +

You should also document what value we should put in the cells, and
where to refer to to find the right one.

>  Clock consumers should specify the desired clocks they use with a
>  "clocks" phandle cell. Consumers that are using a gated clock should
>  provide an additional ID in their clock property. This ID is the
> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
> index f1a147c..18cbc3c 100644
> --- a/drivers/clk/sunxi/clk-sunxi.c
> +++ b/drivers/clk/sunxi/clk-sunxi.c
> @@ -813,6 +813,16 @@ static const struct gates_data sun4i_ahb_gates_data =
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

I guess that means that we will have the OHCI0 gate declared with
<&...-gates-clk 6>, while it's actually the first gate for this clock?

Maybe introducing an offset field in the gates_data would be a good
idea, so that we always start from indexing the gates from 0 in the DT?

>  static const struct gates_data sun5i_a10s_ahb_gates_data __initconst =3D=
 {
>  	.mask =3D {0x147667e7, 0x185915},
>  };
> @@ -1159,6 +1169,8 @@ static const struct of_device_id clk_gates_match[] =
__initconst =3D {
>  	{.compatible =3D "allwinner,sun6i-a31-apb1-gates-clk", .data =3D &sun6i=
_a31_apb1_gates_data,},
>  	{.compatible =3D "allwinner,sun7i-a20-apb1-gates-clk", .data =3D &sun7i=
_a20_apb1_gates_data,},
>  	{.compatible =3D "allwinner,sun6i-a31-apb2-gates-clk", .data =3D &sun6i=
_a31_apb2_gates_data,},
> +	{.compatible =3D "allwinner,sun4i-usb-gates-clk", .data =3D &sun4i_usb_=
gates_data,},
> +	{.compatible =3D "allwinner,sun5i-a13-usb-gates-clk", .data =3D &sun5i_=
a13_usb_gates_data,},
>  	{}
>  };

Thanks a lot!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--jQIvE3yXcK9X9HBh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJS5nClAAoJEBx+YmzsjxAgzkcP/1Q9ItXzQ427wA2tfeqnppoC
dEltye/ntPgWmldsZg2T+tcFYB5bqex70FW5zwZbt9MJYvm+qZ/Dzgr8aa8JXhk0
HaKYYrdp2642JMwAwPZVWrOM/MgxhShKd4y4TfxtI2JuuMpIsM714EYlB4A4plsL
mq5UZ6ghVU42i+TglqDj+irfDaZnvVyxxD1LQmlAQhKTZQHyA3ti4viZmCM5T33s
7i1nH+xO87fA3wA8YstGcSiR/qrRLQfXsc1nJQSusLPl973OJdShvxugNKPiG7u+
hSBqOCuqOVtdmtAOx9y0KXQfaiCD3Oih2IdvzOcu6ECguZz5IYWoCSnIbcq7R+ol
Pv0RkQ56JOkCzFtjSwvM3HiNylF8Ia44He4KGmszkeucXSrLFY6Gjz3VTraT3Nzf
zK5mQQBEk80DmoJH5PISBsNVN7+g/5oY0+/jvQTpyTzggaN5GS9TtCSKIgHcLVIo
dJCM6ehb+UPrL95LIkHUpVzqexvhJtqBwNVeIlcnKefB8aTpm+S9bYnCYLuaGiQg
VHINC4mWpbrq4nvALMTMM6ZPBZTmXFiY7Hj2q5GxnU8gfW7FbT5H+JTqJpF+nMEV
XWAzvMpZTniepyTkKdR2IZeAMzwUX6hnFyT+Su5TdaaVjGR+ud008HFaYQbVqLqV
i8VhtE9aTZqYXi4w1Z1+
=Ns7i
-----END PGP SIGNATURE-----

--jQIvE3yXcK9X9HBh--
