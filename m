From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/1] add mali r6p2 dt node
Date: Tue, 7 Nov 2017 12:05:39 +0100
Message-ID: <20171107110539.3wrm6uu6ohh6dnuy@flea>
References: <1510049010-5758-1-git-send-email-giulio.benetti@micronovasrl.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mtcpi6zrba4ahvki"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1510049010-5758-1-git-send-email-giulio.benetti@micronovasrl.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Giulio Benetti <giulio.benetti@micronovasrl.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--mtcpi6zrba4ahvki
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 07, 2017 at 11:03:30AM +0100, Giulio Benetti wrote:
> This patch adds device tree mali node compatible with r6p2 utgard kernel =
driver=20
> provided by ARM and patched by maxime ripard on his github.
>=20
> It can be easily used in target.dts with:
>=20
> &mali {
> 	status =3D "okay";
> }
>=20
> then loading mali.ko in user space.
>=20
> Best regards
> Giulio Benetti
> Micronova srl

Again, you should have a proper commit log here.

Moreover, the DT binding itself doesn't have a dependency on the mali
driver version. This is just a description of the hardware so you
shouldn't mention it.

And there's no need for the status =3D "okay" in the board DTS, since
you don't disable it in your patch.

> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  arch/arm/boot/dts/sun7i-a20.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a=
20.dtsi
> index 228c368..e402596 100644
> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> @@ -1216,6 +1216,33 @@
>  			#size-cells =3D <0>;
>  		};
> =20
> +		mali: gpu@1c40000 {
> +			compatible =3D "allwinner,sun8i-a23-mali",

This doesn't make any sense. The A23 went out later, and...

> +				     "allwinner,sun7i-a20-mali", "arm,mali-400";

You're actually using the proper compatible already.

> +			reg =3D <0x01c40000 0x10000>;
> +			interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "gp",
> +					  "gpmmu",
> +					  "pp0",
> +					  "ppmmu0",
> +					  "pp1",
> +					  "ppmmu1",
> +					  "pmu";
> +			clocks =3D <&ccu CLK_AHB_GPU>, <&ccu CLK_GPU>;
> +			clock-names =3D "bus", "core";
> +			resets =3D <&ccu RST_GPU>;
> +			#cooling-cells =3D <2>;

This isn't needed unless you're using thermal throttling, but in this
case you would also need to add the OPPs.

> +
> +			assigned-clocks =3D <&ccu CLK_GPU>;
> +			assigned-clock-rates =3D <381000000>;

And this should be in the driver instead.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mtcpi6zrba4ahvki
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJaAZODAAoJEBx+YmzsjxAggb0QALtmZ36aeE2xppM8JD+HCpcj
n35UmYr/YRxMVza+8V9Ai+3CqfKQxkH737MsxnjkXLaOjdLOuK4e4GKUKXgXBCUF
lf641EWulcDjFTtG7Gx+I8Lp1lNeVXWmjs+6wMwCKAXTbwyQgOjRqsll774LaH5H
emnrB4cN8jLF8uqo8dGsoH6dO9xasw39TndDQT3UBsCl2BDapZhEIAEx9gYO4BH2
DAZ8+UIksyIpUmlbAq5ftUyzA+sVfGF86loj+Y+1IGZCqhilE0JvxI6DbLf4agr6
+xr8F33wUPgIJyd0kLjnsf7I2n/sCN+Ft9ity2Oki9PEpGmZfTEjV9zTTrJJ1MdE
wSGZwrolTdRmneTT+eBXA6PdwR62BNRKutuu2Yg2xkJxiMI+8BqOGY41ObbrXASQ
DHWiRMOWS3NHg4hLfs8dc0VBeQ/EO1BZj5YM3kyZkFmt1nlvnVeE4k68z1SH7e2J
/O3Z3Fgvz974UV/Y/HHOQcJBYby+hIeGBM+oMeg/p7ncHgvRpaWChqUZzd3HasA9
bpSD0WqQE2TqMu3xClt+EEujn/Euar8OLh0u9BxL9B2SDj8tjlQqpF4Rx6OB8Yxk
Z3ahRugS9VD+O3BAyWOto9YidUcBeEcGVt1Ud5Spq6TzAauG7OrC0tYzTMpPU2qm
LiYnoXotevGHe/jyGV4C
=d80L
-----END PGP SIGNATURE-----

--mtcpi6zrba4ahvki--
