From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 02/15] ARM: sunxi: dt: document pinctrl clock related
 properties
Date: Wed, 9 Apr 2014 16:45:03 +0200
Message-ID: <20140409144502.GD28585@lukather>
References: <1397051478-4113-1-git-send-email-boris.brezillon@free-electrons.com>
 <1397051478-4113-3-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0IvGJv3f9h+YhkrH"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1397051478-4113-3-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-doc-owner@vger.kernel.org
To: Boris BREZILLON <boris.brezillon@free-electrons.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Mike Turquette <mturquette@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--0IvGJv3f9h+YhkrH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 09, 2014 at 03:51:05PM +0200, Boris BREZILLON wrote:
> Document clocks and clock-names properties for the pinctrl driver.
>=20
> Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt | =
4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pi=
nctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinct=
rl.txt
> index 0e7e9a1..b3e5c30 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.t=
xt
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.t=
xt
> @@ -15,6 +15,10 @@ Required properties:
>    "allwinner,sun7i-a20-pinctrl"
>  - reg: Should contain the register physical address and length for the
>    pin controller.
> +- clocks: Should contain a list of gate clk needed by the pin controller
> +- clock-names: Should at least contain "pio_clk" which is used by the
> +  base pin controller. In case of sun6i-a31 SoC, this property should
> +  also contain the "pioL_clk" string.

You should probably mention that these two should be in the same
order.

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--0IvGJv3f9h+YhkrH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTRVzuAAoJEBx+YmzsjxAgfuoP/RKmFGjXuFFVas7B0vV2vaRD
JHfPJV3s3FmzozHtCkHc7BGcwwqPfcsbYmPjMH7p7Iwin7BepQwt/ITXN3h5XwaT
aJFvzVP/ATz5MFqzjHw7dBaNRQihUIWVBAmkzNkci8vIQhqJzopDabQSUS08jQ1v
4vpuaSRAlC/p69XoSjSG1NO6avakD3vXVqmpNZznLOzxyXKXYB4HUcKgjrGBTld6
OP5jalg0zQUewQ8ZIFumvULjwsHMP6paVHTPG2TyQKngU4MPrr3rH0EDwfBRZYVS
F05q1hM19yzuKEKegKRs7OZF8NWX2JlFAsKWNqYx5NwVexBxqzBYXANG7uT8OdXE
yNFKuEKbQJZ8axnnhGPpVPe5cRYe+MWaws3bJr33iFmQ0EnVX6m/T5REqbX0uccd
ndlLvEqsdskba++xML76QDGrEZ3W9sFQ0SCdkljrEPAVq/gEWsjo9L4MnNyvUAEf
n+ER6mpsM+aP2CesqjYuM4oNWO5ZSvbZjgYqe20iNwNVBRZMTFpmQMtrxjk5m60C
4ryx8WtVetYZW9QNHDdqAxNFqeRE7l1CBBtszJ8miXeb76cWC1OUEf3d29br8tFr
ZeQ+woKgpBJWJq+XCKkd91vIgOrAPUSbYqAOcWXt7VWxJZrnB9W6PcDhkDQa6ktv
ApzKyz4u/gAhJSCts9fg
=feGF
-----END PGP SIGNATURE-----

--0IvGJv3f9h+YhkrH--
