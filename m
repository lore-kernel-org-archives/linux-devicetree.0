From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/2] DT: marvell,mmp2: add more TWSI controllers
Date: Sat, 3 Nov 2018 20:05:47 +0100
Message-ID: <20181103190547.GD31179@amd>
References: <20180917113947.12626-1-lkundrak@v3.sk>
 <20180917113947.12626-3-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="fXStkuK2IQBfcDe+"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180917113947.12626-3-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Eric Miao <eric.y.miao@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org


--fXStkuK2IQBfcDe+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2018-09-17 13:39:47, Lubomir Rintel wrote:
> I've gotten the base addresses, clocks and interrupts from an rusty and o=
ld
> out-of-tree driver. I haven't actually checked against the datasheet, sin=
ce
> that one is reserved for the Marvell inner circle.
>=20
> Tested with an accelerometer on TWSI6 on an OLPC XO 1.75 machine.
>=20
> Cc: Eric Miao <eric.y.miao@gmail.com>
> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Acked-by: Pavel Machek <pavel@ucw.cz>

> ---
>  arch/arm/boot/dts/mmp2.dtsi | 49 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/mmp2.dtsi b/arch/arm/boot/dts/mmp2.dtsi
> index 47e5b63339d1..2bd4e94501ce 100644
> --- a/arch/arm/boot/dts/mmp2.dtsi
> +++ b/arch/arm/boot/dts/mmp2.dtsi
> @@ -232,6 +232,55 @@
>  				status =3D "disabled";
>  			};
> =20
> +			twsi3: i2c@d4032000 {
> +				compatible =3D "mrvl,mmp-twsi";
> +				reg =3D <0xd4032000 0x1000>;
> +				interrupt-parent =3D <&intcmux17>;
> +				interrupts =3D <1>;
> +				clocks =3D <&soc_clocks MMP2_CLK_TWSI2>;
> +				resets =3D <&soc_clocks MMP2_CLK_TWSI2>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				status =3D "disabled";
> +			};
> +
> +			twsi4: i2c@d4033000 {
> +				compatible =3D "mrvl,mmp-twsi";
> +				reg =3D <0xd4033000 0x1000>;
> +				interrupt-parent =3D <&intcmux17>;
> +				interrupts =3D <2>;
> +				clocks =3D <&soc_clocks MMP2_CLK_TWSI3>;
> +				resets =3D <&soc_clocks MMP2_CLK_TWSI3>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				status =3D "disabled";
> +			};
> +
> +
> +			twsi5: i2c@d4033800 {
> +				compatible =3D "mrvl,mmp-twsi";
> +				reg =3D <0xd4033800 0x1000>;
> +				interrupt-parent =3D <&intcmux17>;
> +				interrupts =3D <3>;
> +				clocks =3D <&soc_clocks MMP2_CLK_TWSI4>;
> +				resets =3D <&soc_clocks MMP2_CLK_TWSI4>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				status =3D "disabled";
> +			};
> +
> +			twsi6: i2c@d4034000 {
> +				compatible =3D "mrvl,mmp-twsi";
> +				reg =3D <0xd4034000 0x1000>;
> +				interrupt-parent =3D <&intcmux17>;
> +				interrupts =3D <4>;
> +				clocks =3D <&soc_clocks MMP2_CLK_TWSI5>;
> +				resets =3D <&soc_clocks MMP2_CLK_TWSI5>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				status =3D "disabled";
> +			};
> +
>  			rtc: rtc@d4010000 {
>  				compatible =3D "mrvl,mmp-rtc";
>  				reg =3D <0xd4010000 0x1000>;

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--fXStkuK2IQBfcDe+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvd8YsACgkQMOfwapXb+vIjGwCeMZt0dhUno/tmNVOF0yEU3Yyo
I+IAoIr7T+2NzyjuZ1o4mF+UqrtjLTo/
=/WmS
-----END PGP SIGNATURE-----

--fXStkuK2IQBfcDe+--
