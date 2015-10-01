From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH linux-next v11 2/3] mfd: devicetree: add bindings for
 Atmel Flexcom
Date: Thu, 1 Oct 2015 12:55:59 +0100
Message-ID: <20151001115559.GT3214@x1>
References: <cover.1443431309.git.cyrille.pitchen@atmel.com>
 <377681c95dc91d6fc1d2c7b012ed8a71f7565e80.1443431309.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <377681c95dc91d6fc1d2c7b012ed8a71f7565e80.1443431309.git.cyrille.pitchen@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com, alexandre.belloni@free-electrons.com, sameo@linux.intel.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, akpm@linux-foundation.org
List-Id: devicetree@vger.kernel.org

On Mon, 28 Sep 2015, Cyrille Pitchen wrote:

> This patch documents the DT bindings for the Atmel Flexcom which will=
 be
> introduced by sama5d2x SoCs. These bindings will be used by the actua=
l
> Flexcom driver to be sent in another patch.
>=20
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> ---
>  .../devicetree/bindings/mfd/atmel-flexcom.txt      | 63 ++++++++++++=
++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/atmel-flexc=
om.txt

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt =
b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
> new file mode 100644
> index 000000000000..692300117c64
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
> @@ -0,0 +1,63 @@
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
> +- atmel,flexcom-mode:	Should be one of the following values:
> +			- <1> for USART
> +			- <2> for SPI
> +			- <3> for I2C
> +
> +Required child:
> +A single available child device of type matching the "atmel,flexcom-=
mode"
> +property.
> +
> +The phandle provided by the clocks property of the child is the same=
 as one for
> +the Flexcom parent.
> +
> +For other properties, please refer to the documentations of the resp=
ective
> +device:
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
> +	atmel,flexcom-mode =3D <2>;
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

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
