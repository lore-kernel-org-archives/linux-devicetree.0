From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: at91: dt: sama5d4: add ssc nodes
Date: Wed, 4 Mar 2015 15:11:00 +0100
Message-ID: <54F71274.8020805@atmel.com>
References: <1422859907-14881-1-git-send-email-voice.shen@atmel.com> <1422859907-14881-2-git-send-email-voice.shen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422859907-14881-2-git-send-email-voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 02/02/2015 07:51, Bo Shen a =E9crit :
> Add SSC 0 and 1 nodes.
>=20
> Signed-off-by: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
>=20
>  arch/arm/boot/dts/sama5d4.dtsi | 70 ++++++++++++++++++++++++++++++++=
++++++++++
>  1 file changed, 70 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5=
d4.dtsi
> index b94995d..0b3e5f4 100644
> --- a/arch/arm/boot/dts/sama5d4.dtsi
> +++ b/arch/arm/boot/dts/sama5d4.dtsi
> @@ -66,6 +66,8 @@
>  		tcb0 =3D &tcb0;
>  		tcb1 =3D &tcb1;
>  		i2c2 =3D &i2c2;
> +		ssc0 =3D &ssc0;
> +		ssc1 =3D &ssc1;
>  	};
>  	cpus {
>  		#address-cells =3D <1>;
> @@ -793,6 +795,24 @@
>  				clock-names =3D "mci_clk";
>  			};
> =20
> +			ssc0: ssc@f8008000 {
> +				compatible =3D "atmel,at91sam9g45-ssc";
> +				reg =3D <0xf8008000 0x4000>;
> +				interrupts =3D <48 IRQ_TYPE_LEVEL_HIGH 0>;
> +				pinctrl-names =3D "default";
> +				pinctrl-0 =3D <&pinctrl_ssc0_tx &pinctrl_ssc0_rx>;
> +				dmas =3D <&dma1
> +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
> +					| AT91_XDMAC_DT_PERID(26))>,
> +				       <&dma1
> +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
> +					| AT91_XDMAC_DT_PERID(27))>;
> +				dma-names =3D "tx", "rx";
> +				clocks =3D <&ssc0_clk>;
> +				clock-names =3D "pclk";
> +				status =3D "disabled";
> +			};
> +
>  			spi0: spi@f8010000 {
>  				#address-cells =3D <1>;
>  				#size-cells =3D <0>;
> @@ -941,6 +961,24 @@
>  				status =3D "disabled";
>  			};
> =20
> +			ssc1: ssc@fc014000 {
> +				compatible =3D "atmel,at91sam9g45-ssc";
> +				reg =3D <0xfc014000 0x4000>;
> +				interrupts =3D <49 IRQ_TYPE_LEVEL_HIGH 0>;
> +				pinctrl-names =3D "default";
> +				pinctrl-0 =3D <&pinctrl_ssc1_tx &pinctrl_ssc1_rx>;
> +				dmas =3D <&dma1
> +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
> +					| AT91_XDMAC_DT_PERID(28))>,
> +				       <&dma1
> +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
> +					| AT91_XDMAC_DT_PERID(29))>;
> +				dma-names =3D "tx", "rx";
> +				clocks =3D <&ssc1_clk>;
> +				clock-names =3D "pclk";
> +				status =3D "disabled";
> +			};
> +
>  			tcb1: timer@fc020000 {
>  				compatible =3D "atmel,at91sam9x5-tcb";
>  				reg =3D <0xfc020000 0x100>;
> @@ -1295,6 +1333,38 @@
>  						atmel,pins =3D <AT91_PIOE 0 AT91_PERIPH_C AT91_PINCTRL_NONE>;	=
/* conflicts with A0/NBS0, MCI0_CDB */
>  					};
>  				};
> +
> +				ssc0 {
> +					pinctrl_ssc0_tx: ssc0_tx {
> +						atmel,pins =3D
> +							<AT91_PIOB 27 AT91_PERIPH_B AT91_PINCTRL_NONE	/* PB27 periph =
B TK0 */
> +							 AT91_PIOB 31 AT91_PERIPH_B AT91_PINCTRL_NONE	/* PB31 periph =
B TF0 */
> +							 AT91_PIOB 28 AT91_PERIPH_B AT91_PINCTRL_NONE>;	/* PB28 perip=
h B TD0 */
> +					};
> +
> +					pinctrl_ssc0_rx: ssc0_rx {
> +						atmel,pins =3D
> +							<AT91_PIOB 26 AT91_PERIPH_B AT91_PINCTRL_NONE	/* PB26 periph =
B RK0 */
> +							 AT91_PIOB 30 AT91_PERIPH_B AT91_PINCTRL_NONE	/* PB30 periph =
B RF0 */
> +							 AT91_PIOB 29 AT91_PERIPH_B AT91_PINCTRL_NONE>;	/* PB29 perip=
h B RD0 */
> +					};
> +				};
> +
> +				ssc1 {
> +					pinctrl_ssc1_tx: ssc1_tx {
> +						atmel,pins =3D
> +							<AT91_PIOC 19 AT91_PERIPH_B AT91_PINCTRL_NONE	/* PC19 periph =
B TK1 */
> +							 AT91_PIOC 20 AT91_PERIPH_B AT91_PINCTRL_NONE	/* PC20 periph =
B TF1 */
> +							 AT91_PIOC 21 AT91_PERIPH_B AT91_PINCTRL_NONE>;	/* PC21 perip=
h B TD1 */
> +					};
> +
> +					pinctrl_ssc1_rx: ssc1_rx {
> +						atmel,pins =3D
> +							<AT91_PIOC 24 AT91_PERIPH_B AT91_PINCTRL_NONE	/* PC24 periph =
B RK1 */
> +							 AT91_PIOC 22 AT91_PERIPH_B AT91_PINCTRL_NONE	/* PC22 periph =
B RF1 */
> +							 AT91_PIOC 23 AT91_PERIPH_B AT91_PINCTRL_NONE>;	/* PC23 perip=
h B RD1 */
> +					};
> +				};

Nit: I modified these 2 nodes:
1/ sort alphabetically
2/ removed the "PC22 periph B" part of the comment with is not needed.

No need to re-send.
Thanks, bye.


>  			};
> =20
>  			aic: interrupt-controller@fc06e000 {
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
