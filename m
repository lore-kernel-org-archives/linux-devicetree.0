From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/2] mfd: devicetree: add bindings for Atmel Flexcom
Date: Tue, 21 Jul 2015 10:09:10 +0100
Message-ID: <20150721090910.GG3061@x1>
References: <cover.1434967670.git.cyrille.pitchen@atmel.com>
 <337ab4936bd6ec2f24c42e2f8f363df21f491a02.1434967670.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <337ab4936bd6ec2f24c42e2f8f363df21f491a02.1434967670.git.cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 22 Jun 2015, Cyrille Pitchen wrote:

> This patch documents the DT bindings for the Atmel Flexcom which will=
 be
> introduced by sama5d2x SoCs. These bindings will be used by the actua=
l Flexcom
> driver to be sent in another patch.
>=20
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Acked-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Acked-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  .../devicetree/bindings/mfd/atmel-flexcom.txt      | 58 ++++++++++++=
++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/atmel-flexc=
om.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt =
b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
> new file mode 100644
> index 0000000..38f0e43
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
> @@ -0,0 +1,58 @@
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
> +- compatible: "atmel,sama5d2-flexcom"
> +- reg: shall be the offset/length value for Flexcom dedicated I/O re=
gisters
> +  (without USART, TWI or SPI registers).
> +- clocks: shall be the Flexcom peripheral clock from PMC.
> +- #address-cells: should be <1>
> +- #size-cells: should be <1>
> +- ranges: one range for the full I/O register region (including USAR=
T, TWI and
> +  SPI registers)
> +- atmel,flexcom-mode: shall be a string among { "spi", "usart", "i2c=
", "twi" }.
> +  "i2c" and "twi" are synonymous.

Please use a numerical value instead.  You can then define it in
include/dt-bindings/*

This is only required if you supply more than one child node.  Is that
the plan?  I ask because you only have one child node in the example
below.

This document is pretty hard to read.  Please line everything up
nicely, so it's easy on the eye:

- compatible: 	      "atmel,sama5d2-flexcom"
- reg: 		      shall be the offset/length value for Flexcom dedicated I=
/O registers
  		      (without USART, TWI or SPI registers).
- clocks: 	      shall be the Flexcom peripheral clock from PMC.
- #address-cells:     should be <1>
- #size-cells: 	      should be <1>
- ranges: 	      one range for the full I/O register region (including =
USART, TWI and
  		      SPI registers)
- atmel,flexcom-mode: shall be a string among { "spi", "usart", "i2c", =
"twi" }.
  		      "i2c" and "twi" are synonymous.

> +Required child:
> +a child device of type matching the "atmel,flexcom-mode" property.
> +The reg property of this child should be:
> +- <0x200 0x200> for USART
> +- <0x400 0x200> for SPI
> +- <0x600 0x200> for I2C
> +
> +The phandle provided by the clocks property of the child is the same=
 as one for
> +the Flexcom parent.
> +Other properties remain unchanged. See documentation of the respecti=
ve device.

Please point to the other documentation.

=2E./uart/<blah>
=2E./spi/<blah>
=2E./i2c/<blah>

> +Example:
> +
> +flx0: flexcom@f8034000 {

What references this node?  If nothing, then you can remove the label.

> +	compatible =3D "atmel,sama5d2-flexcom";
> +	reg =3D <0xf8034000 0x200>;
> +	clocks =3D <&flx0_clk>;
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +	ranges =3D <0x0 0xf8034000 0x800>;
> +	atmel,flexcom-mode =3D "spi";
> +
> +	spi@f8034400 {
> +		compatible =3D "atmel,at91rm9200-spi";
> +		reg =3D <0x400 0x200>;
> +		interrupts =3D <19 IRQ_TYPE_LEVEL_HIGH 7>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_flx0_ioset1>;
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
