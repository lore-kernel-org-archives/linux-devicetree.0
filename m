From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/7] ARM: dts: sun4i: Add A10 NAND controller pin
 definitions
Date: Thu, 9 Jun 2016 00:04:54 +0200
Message-ID: <20160608220454.GM14179@lukather>
References: <1465208664-9366-1-git-send-email-mamlinav@gmail.com>
 <1465208664-9366-2-git-send-email-mamlinav@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8G1nIWD3RY794FAy"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465208664-9366-2-git-send-email-mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--8G1nIWD3RY794FAy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 06, 2016 at 01:24:18PM +0300, Aleksei Mamlin wrote:
> From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> Define the NAND controller pin configs.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun4i-a10.dtsi | 80 ++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 80 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a=
10.dtsi
> index a9c3190..146a08db 100644
> --- a/arch/arm/boot/dts/sun4i-a10.dtsi
> +++ b/arch/arm/boot/dts/sun4i-a10.dtsi
> @@ -1144,6 +1144,86 @@
>  				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
>  				allwinner,pull =3D <SUN4I_PINCTRL_PULL_UP>;
>  			};
> +
> +			nand_pins_a: nand_base0@0 {
> +				allwinner,pins =3D "PC0", "PC1", "PC2",
> +						"PC5", "PC8", "PC9", "PC10",
> +						"PC11", "PC12", "PC13", "PC14",
> +						"PC15", "PC16";
> +				allwinner,function =3D "nand0";
> +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			nand_cs0_pins_a: nand_cs@0 {
> +				allwinner,pins =3D "PC4";
> +				allwinner,function =3D "nand0";
> +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			nand_cs1_pins_a: nand_cs@1 {
> +				allwinner,pins =3D "PC3";
> +				allwinner,function =3D "nand0";
> +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			nand_cs2_pins_a: nand_cs@2 {
> +				allwinner,pins =3D "PC17";
> +				allwinner,function =3D "nand0";
> +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			nand_cs3_pins_a: nand_cs@3 {
> +				allwinner,pins =3D "PC18";
> +				allwinner,function =3D "nand0";
> +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			nand_cs4_pins_a: nand_cs@4 {
> +				allwinner,pins =3D "PC19";
> +				allwinner,function =3D "nand0";
> +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			nand_cs5_pins_a: nand_cs@5 {
> +				allwinner,pins =3D "PC20";
> +				allwinner,function =3D "nand0";
> +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			nand_cs6_pins_a: nand_cs@6 {
> +				allwinner,pins =3D "PC21";
> +				allwinner,function =3D "nand0";
> +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			nand_cs7_pins_a: nand_cs@7 {
> +				allwinner,pins =3D "PC22";
> +				allwinner,function =3D "nand0";
> +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			nand_rb0_pins_a: nand_rb@0 {
> +				allwinner,pins =3D "PC6";
> +				allwinner,function =3D "nand0";
> +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			nand_rb1_pins_a: nand_rb@1 {
> +				allwinner,pins =3D "PC7";
> +				allwinner,function =3D "nand0";
> +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +			};

We usually enable only the pin groups that are actually used by some
board to avoid bloating the DT too much.

And the nodes should be sorted alphabetically.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--8G1nIWD3RY794FAy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXWJaGAAoJEBx+YmzsjxAgPkgP/jr1IX8RRP/zWarTJyKVuwpr
RSaHDLA9uyWRuWVEzsg5zvHWVklmXiEViHRyHuLKJ/bP3TN/Q3GItliD1LNF/BdI
BIjIsSKV7TA+TDFJHjwqv8IyynFgrzHvg02z5hjJEDi61vCqYwJ+ZgH4c9Mjm1QU
t4yf9BQZitvXbXAAMVN9p4+9XYhhFiAUPncWSHevxQkqrr/3kRfvfNjCD681iGUN
nbifotorcvc8v/6kLbgTU7NcnENdG6vXCa67yxipLchHlB8zk07OE0vpJqdrVSKW
oTQH/sFXBy1NbZ59KcWzoQE7h5ZwQCJlszk2DzZH9Gio4AgCGAlyVzqD2cMYhcWl
TbMCUb7jPahrz/4nljfG3q+V0lDEA7uODq2c+wy+bjIcyJ1cbieTwy0a6aZXEI7j
NKfBkdroSFq7cTLWESI93tLrt3/+17F42Wk9DCZFIkVdILDEBFww9q/sg/xGHqma
WUYyT69Cylc6qdtF5hwNfICxFRR3KLlqsK4Pz3SLsXsb73eq/TzGgHCuyibmxjw3
uj8pOgiX+S2TDZ0kMJR+GumS8OUtw3r+9P5PVrJ4b3Vyq+/+FK1Uhy1IBE/jRLPj
Ix889cflc25cWjuZO2sO6DD9HBWSxQpozEUus8R1M0MYu7fGvVr+Scjl+LlFVNal
Xh4clefwlaLwkqi4fn9S
=tLVn
-----END PGP SIGNATURE-----

--8G1nIWD3RY794FAy--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
