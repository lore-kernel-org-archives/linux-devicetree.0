From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 1/2] mfd: devicetree: add bindings for Atmel Flexcom
Date: Thu, 23 Jul 2015 08:35:01 +0100
Message-ID: <20150723073501.GU3061@x1>
References: <cover.1437558598.git.cyrille.pitchen@atmel.com>
 <bfff43813c2dc0a265bb644a87dcdd5fe58fc3e3.1437558598.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <bfff43813c2dc0a265bb644a87dcdd5fe58fc3e3.1437558598.git.cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 22 Jul 2015, Cyrille Pitchen wrote:

> This patch documents the DT bindings for the Atmel Flexcom which will=
 be
> introduced by sama5d2x SoCs. These bindings will be used by the actua=
l
> Flexcom driver to be sent in another patch.
>=20
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
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
> index 000000000000..87a366b95ecf
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
> +- compatible:		"atmel,sama5d2-flexcom"
> +- reg:			shall be the offset/length value for Flexcom dedicated
> +			I/O registers (without USART, TWI or SPI registers).
> +- clocks:		shall be the Flexcom peripheral clock from PMC.
> +- #address-cells:	should be <1>
> +- #size-cells:		should be <1>
> +- ranges:		one range for the full I/O register region (including
> +			USART, TWI and SPI registers).
> +
> +Required child:
> +a single available child for the serial controller to enable.

Not a fan of uppercase characters I see.

Nevertheless, documentation looks fine and doesn't introduce any new
properties, which we like.

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> +One of the following substrings must be found inside the compatible =
property of
> +this child to enable the right serial controller:
> +- "-usart"
> +- "-spi"
> +- "-i2c"
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
> +
> +	spi@f8034400 {
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

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
