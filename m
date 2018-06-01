From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/3] dts: sunxi: A64: Add PWM controllers
Date: Fri, 1 Jun 2018 11:18:16 +0200
Message-ID: <20180601091816.klmc3nfzynxprcso@flea>
References: <20180601062901.8052-1-anarsoul@gmail.com>
 <20180601062901.8052-3-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3027162258446581028=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180601062901.8052-3-anarsoul@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============3027162258446581028==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pkmxg4nbidpasivo"
Content-Disposition: inline


--pkmxg4nbidpasivo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 31, 2018 at 11:29:00PM -0700, Vasily Khoruzhick wrote:
> From: Andre Przywara <andre.przywara@arm.com>
>=20
> The Allwinner A64 SoC features two PWM controllers, which are fully
> compatible to the one used in the A13 and H3 chips.
>=20
> Add the nodes for the devices (one for the "normal" PWM, the other for
> the one in the CPUS domain) and the pins their outputs are connected to.
>=20
> On the A64 the "normal" PWM is muxed together with one of the MDIO pins
> used to communicate with the Ethernet PHY, so it won't be usable on many
> boards. But the Pinebook laptop uses this pin for controlling the LCD
> backlight.
>=20
> On Pine64 the CPUS PWM pin however is routed to the "RPi2" header,
> at the same location as the PWM pin on the RaspberryPi.
>=20
> [vasily: fixed comment message as requested by Stefan Bruens]
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Tested-by: Vasily Khoruzhick <anarsoul@gmail.com> on Pinebook (only the "=
normal" PWM)
> Tested-by: Harald Geyer <harald@ccbib.org> on Teres-I (only the "normal" =
PWM)

Same thing, you should have your SoB there. And I'm not sure the
Tested-by format is valid. This information would be better in the
commit log itself.

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
> index b5e903ccf0ec..e94bfa8477f6 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -365,6 +365,11 @@
>  				bias-pull-up;
>  			};
> =20
> +			pwm_pin: pwm_pin {
> +				pins =3D "PD22";
> +				function =3D "pwm";
> +			};
> +

Is there multiple options for that muxing? If not, add it to the PWM
node by default.

>  			rmii_pins: rmii_pins {
>  				pins =3D "PD10", "PD11", "PD13", "PD14", "PD17",
>  				       "PD18", "PD19", "PD20", "PD22", "PD23";
> @@ -630,6 +635,15 @@
>  			#interrupt-cells =3D <3>;
>  		};
> =20
> +		pwm: pwm@1c21400 {
> +			compatible =3D "allwinner,sun50i-a64-pwm",
> +				     "allwinner,sun5i-a13-pwm";
> +			reg =3D <0x01c21400 0x400>;
> +			clocks =3D <&osc24M>;
> +			#pwm-cells =3D <3>;
> +			status =3D "disabled";
> +		};
> +
>  		rtc: rtc@1f00000 {
>  			compatible =3D "allwinner,sun6i-a31-rtc";
>  			reg =3D <0x01f00000 0x54>;
> @@ -667,6 +681,15 @@
>  			#size-cells =3D <0>;
>  		};
> =20
> +		r_pwm: pwm@1f03800 {
> +			compatible =3D "allwinner,sun50i-a64-pwm",
> +				     "allwinner,sun5i-a13-pwm";
> +			reg =3D <0x01f03800 0x400>;
> +			clocks =3D <&osc24M>;
> +			#pwm-cells =3D <3>;
> +			status =3D "disabled";
> +		};
> +
>  		r_pio: pinctrl@1f02c00 {
>  			compatible =3D "allwinner,sun50i-a64-r-pinctrl";
>  			reg =3D <0x01f02c00 0x400>;
> @@ -687,6 +710,11 @@
>  				pins =3D "PL8", "PL9";
>  				function =3D "s_i2c";
>  			};
> +
> +			r_pwm_pin: pwm {
> +				pins =3D "PL10";
> +				function =3D "s_pwm";
> +			};

Ditto.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--pkmxg4nbidpasivo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsRD1cACgkQ0rTAlCFN
r3Q4cg//YTqjq4kjfHCaqk88e6wHovbC83rbz6EnPBvM35ZcCsO/kZv7QMuaFDqF
CKRXEs0PvPG/La6XZ5JIKrd1nzqnvX3Whz+8+QpHLZDi6F6wxek6ZfogmHl1hgEF
mwnKUhDzvmyG+d99CkPN0pugtPR+dj7GQrJmm4CVSJmHapUd7QqYVubRtAhgdOpt
pPRBjl5Q7aTpM+1QOYEVuHrbxXsrJxHDEw8oz5BmCHlMTD251cFs7AsxtgXxF7SS
7GtXIhEC2PTBB82RDkxn+cFSmcWDTnJvaKQaVIk7kq22qsBZQt5O6SB2aVNvmkI7
NxSuzXMwxC9OErwR7mBTx8OerUqSaPBScudgoD4XOFQaqcOaxevMh9LLkLqZmHJJ
4IT//Q0VO4VaRoHWjS53KYzv16cGLTF/wPkkZthfoK18turL9eyc4D5xnA72ofDl
Yb7LdXFJj/W1VpG281ooWRnPAe0ySrxu6JWZfQn0ehBfcgj/Ani+gSb5n8D002kt
iLsmZhR6DAq65hebzvTO7QKaSAeqJqx+B6Qih0yBVcGTPcnUzstUylgxFakmWI3B
BZb2Q/SCmipg9UUdEbbwqxYaHkemGG8NmYah1ZWUQLZSrKsA3TruB+dwBHRTb/9E
y3/dCVq7uORoXc0XxL746DJI3+LY0klBXqPfY+5FcGTJHiZ9wiI=
=p1wK
-----END PGP SIGNATURE-----

--pkmxg4nbidpasivo--


--===============3027162258446581028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3027162258446581028==--
