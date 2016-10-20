From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: sun8i: Add SPI controller node in H3
Date: Thu, 20 Oct 2016 17:44:42 +0200
Message-ID: <20161020154442.m2lphzwfabjacw5t@lukather>
References: <20161019134608.12850-1-woogyom.kim@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="m6ajs7xwiliiosjt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161019134608.12850-1-woogyom.kim@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Milo Kim <woogyom.kim@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--m6ajs7xwiliiosjt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Milo,

On Wed, Oct 19, 2016 at 10:46:08PM +0900, Milo Kim wrote:
> H3 supports two SPI controllers. Four pins (MOSI, MISO, SCLK, SS) are
> configured through the pinctrl subsystem. It is almost same as A31 SPI
> except buffer size, so those DT properties are reusable.
>=20
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Milo Kim <woogyom.kim@gmail.com>

Ideally, this would be part of your serie to add the H3 support to the
spi driver. This way, you make it explicit that there is a dependency
between the two, and it's easier for us :)

> ---
>  arch/arm/boot/dts/sun8i-h3.dtsi | 46 +++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 46 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3=
=2Edtsi
> index 75a8654..c38b028 100644
> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> @@ -381,6 +381,20 @@
>  				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
>  			};
> =20
> +			spi0_pins: spi0 {
> +				allwinner,pins =3D "PC0", "PC1", "PC2", "PC3";
> +				allwinner,function =3D "spi0";
> +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			spi1_pins: spi1 {
> +				allwinner,pins =3D "PA15", "PA16", "PA14", "PA13";
> +				allwinner,function =3D "spi1";
> +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +

This needs to be in a separate patch

>  			uart0_pins_a: uart0@0 {
>  				allwinner,pins =3D "PA4", "PA5";
>  				allwinner,function =3D "uart0";
> @@ -425,6 +439,38 @@
>  			clocks =3D <&osc24M>;
>  		};
> =20
> +		spi0: spi@01c68000 {
> +			compatible =3D "allwinner,sun8i-h3-spi";
> +			reg =3D <0x01c68000 0x1000>;
> +			interrupts =3D <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_SPI0>, <&ccu CLK_SPI0>;
> +			clock-names =3D "ahb", "mod";
> +			dmas =3D <&dma 23>, <&dma 23>;
> +			dma-names =3D "rx", "tx";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&spi0_pins>;
> +			resets =3D <&ccu RST_BUS_SPI0>;
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		spi1: spi@01c69000 {
> +			compatible =3D "allwinner,sun8i-h3-spi";
> +			reg =3D <0x01c69000 0x1000>;
> +			interrupts =3D <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_SPI1>, <&ccu CLK_SPI1>;
> +			clock-names =3D "ahb", "mod";
> +			dmas =3D <&dma 24>, <&dma 24>;
> +			dma-names =3D "rx", "tx";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&spi1_pins>;
> +			resets =3D <&ccu RST_BUS_SPI1>;
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--m6ajs7xwiliiosjt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYCOZmAAoJEBx+YmzsjxAgpskQALIauy2uMU+xi0M5vwAK1xNZ
QegI0i802tHLe+nXyMhu88P2A/toYnfL323AYx51lgMg2BilNizc9bvETKJLWOnI
2k5R9qVNuAk7d42tZEeX6lYjc0jD1gPNR+SkjxavRha16hUAMKsCn3VtIaSyo8dY
3qtlVA6BlU+xj3vinatQVpRWNmgeJ0bDUViF1uI6JemSNIJi0yjaTbJVaiJLfQGL
c6Opke6DJl78K5V9nW9Jt1xx3Bk/UPSO1AVQTJPY1nx/knFwvKhUO790xjVSRLHw
5fpMKYLb0Lo4260ymV+356YjbZyrvd9GR4xFfoqLTIadQNLHs4YO2PlsUZkhN/UY
ivoy09RHdaLafNQvwLxEkd55a9IoUPvpFTBzwfpTXKCRIZj+0LGW72lRZaEAI8OL
CvzpqwYa0idvp1ZSelicP7QqbqxCgd6cVcAbKeChqDZw3BVFyKtHWdgw1gE+q7kP
wO7r4pt8JsKVjcQmHVWAy5dcsBKOV/FVHhZgKv2AtRkSu1h6sPfjvX3yggbiSBEs
NP0pCTcgX0ZWiS+w1+w14If+XappW4V11F1TEcxG1rZY2OkbQdksMpEdMkF0Jd8m
CEf76ZpDcWfyXpISy5N8WUT9eOzar1IY9Jad7QyYSpbNjATeGgYO16QFIcPp8ej0
zwPlmb94hATwQTc8G8JS
=z9Nz
-----END PGP SIGNATURE-----

--m6ajs7xwiliiosjt--
