From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH linux-next v9 2/3] mfd: devicetree: add bindings for Atmel
 Flexcom
Date: Thu, 3 Sep 2015 17:56:59 +0200
Message-ID: <55E86DCB.3040805@atmel.com>
References: <cover.1441118159.git.cyrille.pitchen@atmel.com>
 <90fa2e0ded92567a29c996658153d833aaa5e411.1441118159.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <90fa2e0ded92567a29c996658153d833aaa5e411.1441118159.git.cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 01/09/2015 16:46, Cyrille Pitchen a =E9crit :
> This patch documents the DT bindings for the Atmel Flexcom which will=
 be
> introduced by sama5d2x SoCs. These bindings will be used by the actua=
l
> Flexcom driver to be sent in another patch.
>=20
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Acked-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Acked-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

After all, this approach is far more simple and obvious than the use of
the "reg" property, so coming back to this "atmel,flexcom-mode" option
make a lot of sense.

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Bye,


> ---
>  .../devicetree/bindings/mfd/atmel-flexcom.txt      | 67 ++++++++++++=
++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/atmel-flexc=
om.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt =
b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
> new file mode 100644
> index 000000000000..fc3511e41542
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
> @@ -0,0 +1,67 @@
> +* Device tree bindings for Atmel Flexcom (Flexible Serial Communicat=
ion Unit)
> +
> +The Atmel Flexcom is just a wrapper which embeds a SPI controller, a=
n I2C
> +controller and an USART. Only one function can be used at a time and=
 is chosen
> +at boot time according to the device tree.
> +
> +Required properties:
> +- compatible:		Should be "atmel,sama5d2-flexcom"
> +- reg:			Should be the offset/length value for Flexcom dedicated
> +			I/O registers (without USART, TWI or SPI registers).
> +- clocks:		Should be the Flexcom peripheral clock from PMC.
> +- #address-cells:	Should be <1>
> +- #size-cells:		Should be <1>
> +- ranges:		Should be one range for the full I/O register region
> +			(including USART, TWI and SPI registers).
> +- atmel,flexcom-mode:	Should be one of the 3 following macros as def=
ined in
> +			include/dt-bindings/mfd/atmel-flexcom.h:
> +			- ATMEL_FLEXCOM_MODE_USART for USART
> +			- ATMEL_FLEXCOM_MODE_SPI for SPI
> +			- ATMEL_FLEXCOM_MODE_TWI for I2C
> +
> +Required child:
> +a single child device of type matching the "atmel,flexcom-mode" prop=
erty.
> +
> +The reg property of this child should be:
> +- <0x200 0x200> for USART
> +- <0x400 0x200> for SPI
> +- <0x600 0x200> for I2C
> +
> +The phandle provided by the clocks property of the child is the same=
 as one for
> +the Flexcom parent.
> +
> +Other properties remain unchanged. See documentation of the respecti=
ve device:
> +- ../serial/atmel-usart.txt
> +- ../spi/spi_atmel.txt
> +- ../i2c/i2c-at91.txt
> +
> +Example:
> +
> +flexcom@f8034000 {
> +	compatible =3D "atmel,sama5d2-flexcom";
> +	reg =3D <0xf8034000 0x200>;
> +	clocks =3D <&flx0_clk>;
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +	ranges =3D <0x0 0xf8034000 0x800>;
> +	atmel,flexcom-mode =3D <ATMEL_FLEXCOM_MODE_SPI>;
> +
> +	spi@400 {
> +		compatible =3D "atmel,at91rm9200-spi";
> +		reg =3D <0x400 0x200>;
> +		interrupts =3D <19 IRQ_TYPE_LEVEL_HIGH 7>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_flx0_default>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		clocks =3D <&flx0_clk>;
> +		clock-names =3D "spi_clk";
> +		atmel,fifo-size =3D <32>;
> +
> +		mtd_dataflash@0 {
> +			compatible =3D "atmel,at25f512b";
> +			reg =3D <0>;
> +			spi-max-frequency =3D <20000000>;
> +		};
> +	};
> +};
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
