From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/3] arm64: allwinner: a64: add R_I2C controller
Date: Fri, 1 Jun 2018 11:16:31 +0200
Message-ID: <20180601091631.wqctilk55fcmggwv@flea>
References: <20180601062901.8052-1-anarsoul@gmail.com>
 <20180601062901.8052-2-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0143548669247530775=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180601062901.8052-2-anarsoul@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org


--===============0143548669247530775==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k24vbqrve37r4vcc"
Content-Disposition: inline


--k24vbqrve37r4vcc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 31, 2018 at 11:28:59PM -0700, Vasily Khoruzhick wrote:
> From: Icenowy Zheng <icenowy@aosc.io>
>=20
> Allwinner A64 has a I2C controller, which is in the R_ MMIO zone and has
> two groups of pinmuxes on PL bank, so it's called R_I2C.
>=20
> Add support for this I2C controller and the pinmux which doesn't conflict
> with RSB.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

You should have your SoB there.

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
> index 1b2ef28c42bd..b5e903ccf0ec 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -46,6 +46,7 @@
>  #include <dt-bindings/clock/sun8i-r-ccu.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/reset/sun50i-a64-ccu.h>
> +#include <dt-bindings/reset/sun8i-r-ccu.h>
> =20
>  / {
>  	interrupt-parent =3D <&gic>;
> @@ -655,6 +656,17 @@
>  			#reset-cells =3D <1>;
>  		};
> =20
> +		r_i2c: i2c@1f02400 {
> +			compatible =3D "allwinner,sun6i-a31-i2c";

You should add an a64 compatible here

> +			reg =3D <0x01f02400 0x400>;
> +			interrupts =3D <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&r_ccu CLK_APB0_I2C>;
> +			resets =3D <&r_ccu RST_APB0_I2C>;
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
>  		r_pio: pinctrl@1f02c00 {
>  			compatible =3D "allwinner,sun50i-a64-r-pinctrl";
>  			reg =3D <0x01f02c00 0x400>;
> @@ -670,6 +682,11 @@
>  				pins =3D "PL0", "PL1";
>  				function =3D "s_rsb";
>  			};
> +
> +			r_i2c_pins_a: i2c-a {
> +				pins =3D "PL8", "PL9";
> +				function =3D "s_i2c";
> +			};

This should be ordered by alphabetical order

If this is the only muxing option, you can also add it to the i2c DT
node.

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--k24vbqrve37r4vcc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsRDuMACgkQ0rTAlCFN
r3SDsA/8DcKlAa8QvslDjfpwykKHuhw2vvAxid+2QIuJZ9mb46p6/pd0YE7q57VP
Ve3BcQdejgJ2jCn187ChtIp7kHAVaL2t8iT/nYARMKTG1FXreFYy8hqyvA4y0+Ba
hM3yZQMPxWf+P7eIlXm3PyBz2znrpYFa3ZnHtQu8inpH1495Qep1x40i4germNDH
xptu6Zo3YeUHtL9dAWm9ur428kvm86DUJfU9SXNbggBjmnbR1V09W8OsbIkcbhG/
zdADXQrzU5vx0WBZW3dk0mJXnP1RuIjFl1y1eQdxjFKpkJAnINZA8UoCFXoXwie6
Y3wXBupnwKQqItlYW2xneBnPHW1M2NN24TxbTHdjqHlshm14hn7vbwMyJliW1ypl
56LCwFW4bDistpc0y4h+I8nOfJaWeS+pTF35F/cdhbZGRRtOJtxk9XhXNFlqKUEa
08nI5o1SIhjSsLqM2D3q/EfrMYVBoRUIIzni/LalD+2breNCG92NtTWmgo/itbhp
YBiE+rkfjxSQDzoXKgKH4XVMYm/WVsmWMH32giP1vrimZN5rBuIXf6N9QPcQYCo9
e2YI+A/QVV1UERdWP/WuWb7Nd4lF9bxmhOQE7EId55iUNOwi3QbXvklqGI+mEdD5
dv2IwKPOTWnCN0CK46X3g5z5YFfdaaZSLhLVhb33aRddCjz7Tpo=
=+hd+
-----END PGP SIGNATURE-----

--k24vbqrve37r4vcc--


--===============0143548669247530775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0143548669247530775==--
