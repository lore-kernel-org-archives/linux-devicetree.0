From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/2] pwm: sun4i: Add Allwinner H3 support
Date: Thu, 25 Aug 2016 22:51:38 +0200
Message-ID: <20160825205138.GI32598@lukather>
References: <1472107494-20740-1-git-send-email-woogyom.kim@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2xeD/fx0+7k8I/QN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1472107494-20740-1-git-send-email-woogyom.kim@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Milo Kim <woogyom.kim@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--2xeD/fx0+7k8I/QN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Milo,

Remember to use get_maintainers to send your patches, you missed a few
mailing lists (linux-arm-kernel, for example), developpers (Alexandre
Belloni, the original author of the driver) and maintainers (Linus
Walleij for the pinctrl changes).

On Thu, Aug 25, 2016 at 03:44:53PM +0900, Milo Kim wrote:
> According to the latest datasheet (v1.2), H3 has single PWM channel.
> H3 PWM controller has same register layout as sun4i driver, so it works=
=20
> by adding H3 specific data.
> And the second PWM channel is not supported, so the pinctrl function is r=
emoved.
>=20
> Datasheet:
>   http://linux-sunxi.org/File:Allwinner_H3_Datasheet_V1.2.pdf

That should be in your cover letter, but not in your commit log. A
commit log is here forever, this link will very likely not.

>=20
> Test environment:
>   Tested on Nano Pi M1 board, but PA5 pin is assigned for UART0.
>   So the debug console should be changed to other port like UART1.
>=20
>   Ex)
> 	aliases {
> 		serial0 =3D &uart1;
> 	};
>=20
> 	&uart1 {
>         	pinctrl-names =3D "default";
> 	        pinctrl-0 =3D <&uart1_pins_a>;
>         	status =3D "okay";
> 	};

That should be part of your cover letter too.

> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Milo Kim <woogyom.kim@gmail.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-sun4i.txt |  1 +
>  arch/arm/boot/dts/sun8i-h3.dtsi                     | 15 +++++++++++++++
>  drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c            |  1 -
>  drivers/pwm/pwm-sun4i.c                             |  9 +++++++++

Please split these changes into several patches:

>  4 files changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-sun4i.txt b/Docume=
ntation/devicetree/bindings/pwm/pwm-sun4i.txt
> index cf6068b..f1cbeef 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-sun4i.txt
> +++ b/Documentation/devicetree/bindings/pwm/pwm-sun4i.txt
> @@ -6,6 +6,7 @@ Required properties:
>      - "allwinner,sun5i-a10s-pwm"
>      - "allwinner,sun5i-a13-pwm"
>      - "allwinner,sun7i-a20-pwm"
> +    - "allwinner,sun8i-h3-pwm"
>    - reg: physical base address and length of the controller's registers
>    - #pwm-cells: should be 3. See pwm.txt in this directory for a descrip=
tion of
>      the cells format.
> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3=
=2Edtsi
> index b44bc48..3a965fb 100644
> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> @@ -512,6 +512,13 @@
>  				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
>  			};
> =20
> +			pwm0_pin_a: pwm0@0 {
> +				allwinner,pins =3D "PA5";
> +				allwinner,function =3D "pwm0";
> +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +

One to add the new pin...

>  			uart0_pins_a: uart0@0 {
>  				allwinner,pins =3D "PA4", "PA5";
>  				allwinner,function =3D "uart0";
> @@ -585,6 +592,14 @@
>  			interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> =20
> +		pwm: pwm@01c21400 {
> +			compatible =3D "allwinner,sun8i-h3-pwm";
> +			reg =3D <0x01c21400 0x8>;
> +			clocks =3D <&osc24M>;
> +			#pwm-cells =3D <3>;
> +			status =3D "disabled";
> +		};
> +

=2E.. one to add the controller node ...

>  		uart0: serial@01c28000 {
>  			compatible =3D "snps,dw-apb-uart";
>  			reg =3D <0x01c28000 0x400>;
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c b/drivers/pinctrl/s=
unxi/pinctrl-sun8i-h3.c
> index 11760bb..087f231 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c
> @@ -60,7 +60,6 @@ static const struct sunxi_desc_pin sun8i_h3_pins[] =3D {
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "sim"),		/* PWREN */
> -		  SUNXI_FUNCTION(0x3, "pwm1"),

=2E.. one to remove the pinctrl pin ...

>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 6)),	/* PA_EINT6 */
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 7),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
> index 03a99a5..b0803f6 100644
> --- a/drivers/pwm/pwm-sun4i.c
> +++ b/drivers/pwm/pwm-sun4i.c
> @@ -284,6 +284,12 @@ static const struct sun4i_pwm_data sun4i_pwm_data_a2=
0 =3D {
>  	.npwm =3D 2,
>  };
> =20
> +static const struct sun4i_pwm_data sun4i_pwm_data_h3 =3D {
> +	.has_prescaler_bypass =3D true,
> +	.has_rdy =3D true,
> +	.npwm =3D 1,
> +};
> +
>  static const struct of_device_id sun4i_pwm_dt_ids[] =3D {
>  	{
>  		.compatible =3D "allwinner,sun4i-a10-pwm",
> @@ -298,6 +304,9 @@ static const struct of_device_id sun4i_pwm_dt_ids[] =
=3D {
>  		.compatible =3D "allwinner,sun7i-a20-pwm",
>  		.data =3D &sun4i_pwm_data_a20,
>  	}, {
> +		.compatible =3D "allwinner,sun8i-h3-pwm",
> +		.data =3D &sun4i_pwm_data_h3,
> +	}, {

=2E.. and one to add the H3 support in the driver.

It looks good otherwise, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--2xeD/fx0+7k8I/QN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXv1paAAoJEBx+YmzsjxAg3rgQAISuAi+cDxZiagHoPlix01nM
D8oEZm2kdoNvYv+SW9KskeWCsudpx5mnBfZs0i2ridXXV1PWDOCVjL+OK1dIhNGm
u9hhIX3t3AmlJB24SAXBewLS0lxFwiet55uMf/SPF7B6HbswSF6fnPEWon4bzbU3
mkhVBk6+ZfhhHNLNCZ1SVqsGiZdK3VetdTwxZmHtKG+fsiocXrFY1Pwk7HswVuuZ
wZajBFiUV9o2Pafu0HdMQvqAHfaqA7JW6VSKUf1LE65pOEO3f9YPi79IdXT5L3x9
AvAoSbHvvbV1+PHW881YVvcPWZ6M+tliBxAOjaK+Yr17jnsmwfGSK8cNq+/GKEy/
c2vD5mQBGA5tf/MQDCdeZcKu95qAePHiQuujy2PeQIFW0Km+KFkZXUXaFdOdEzRV
lonwIbEwSXUWvB29BYYVVWrTTrI1ERU88aLrrlq/Ph4SDpDbfIWQXLGuyNpyjkq0
8VcAo+FkDQcWF74FN5tsRUS94NjSrZRDGfPUd0R+KffI5kA85wk4a/Zj4QByEge2
AOIUwFLbaBS27QInrufV9su0wxOql8LRjxFFtpM2TPM5GUsf3XPKHVSeFjjb7EFP
9YJlTm8dgBDeRZz6XLiU4xosZJn1R2LSV+mRNzxscGZq6sv1lc+iU9B3tyB4xs7j
BVb+KsJWzEMbHBIyefjB
=ncF6
-----END PGP SIGNATURE-----

--2xeD/fx0+7k8I/QN--
