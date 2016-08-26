From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i-h3: Add UART1 pinctrl
Date: Fri, 26 Aug 2016 09:10:56 +0200
Message-ID: <20160826071056.GA10545@lukather>
References: <1472107494-20740-1-git-send-email-woogyom.kim@gmail.com>
 <1472107494-20740-2-git-send-email-woogyom.kim@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1472107494-20740-2-git-send-email-woogyom.kim@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Milo Kim <woogyom.kim@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Milo,

On Thu, Aug 25, 2016 at 03:44:54PM +0900, Milo Kim wrote:
> In H3, PA5 can be used as PWM and UART0. If the PWM is used, the console
> UART should be moved to other port.
> This patch enables UART1 pinctrl to support this case.
>=20
> 	PA5: PWM
> 	PG6, PG7: debug console
>=20
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Milo Kim <woogyom.kim@gmail.com>
> ---
>  arch/arm/boot/dts/sun8i-h3.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3=
=2Edtsi
> index 3a965fb..fdb6801 100644
> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> @@ -526,6 +526,13 @@
>  				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
>  			};
> =20
> +			uart1_pins_a: uart1@0 {
> +				allwinner,pins =3D "PG6", "PG7";
> +				allwinner,function =3D "uart1";
> +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +

Our policy is that we don't introduce new pinctrl nodes that are not
used by any board to avoid bloating the DT too much with unused nodes.

If you have a board using it, please submit that change as well.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXv+t/AAoJEBx+YmzsjxAg1bUP/2/LxqkrQiSRil/0liHNXest
i1N155/tlH5tJdVmKtjGrbVsVcUGKkvwzomiOn5E1Mmi1bELG0yR/cZa4F5Cxo6i
tY0E1gacELQjz1V+h+diCohVhyxOkvEmhkeYxl7OYmycoxF0OEm9YlAbJQe3ogFZ
LQFcs13RgoUeStrHAFTSBPBlEdfmLtS0JdwhMLzUSjFxVfNJeRuI779t+01SyfMp
XZySWYx7zA86JpvXFZnngnR+VpBDarC97OFfXpWKAdTsihfb85ng5Oznfp1GAJab
CkDjBp2sDtz+CRc1cmCqmuuQaOFtok+oCwKbkat2+hchgjVVvTK48/nDecb6WZbf
mD7MUFtdJMtzrDYGmPshuNbIXLrnBPOeQxE+//ELkdYcJsvO1UnHopUsCU9gd9D7
1W4xRNbfU276PLzgiH/6tRYMViw03vFVznhkBRfhEcXqcW442QSYQ0t749rpV1XK
0907onsyAotH8Cj0oOMdmXVS36ZE0lJlzjnd37u6BJnVpAUJ9+UWOXVtBanL4vCA
onmoNdepFpMQFxi52tJ1cuXPo2MVcXi7hkIzccHZQUouTWWLWNpRaiRhUGdpvv3M
MKqP2x8PFHStNvMLDze4SgCnoKupLkJ7oqqVdnMfs6IZZ6h53sB700TBVtlI8BGz
bkZzllle4ZFhtrbZF1M9
=5Wnd
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
