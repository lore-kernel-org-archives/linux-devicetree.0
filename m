From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCHv2 1/8] dt-bindings: mfd: Add Altera Arria10 System
 Resource Chip bindings
Date: Fri, 10 Jun 2016 15:47:48 +0100
Message-ID: <20160610144748.GG1537@dell>
References: <1464889948-28793-1-git-send-email-tthayer@opensource.altera.com>
 <1464889948-28793-2-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1464889948-28793-2-git-send-email-tthayer@opensource.altera.com>
Sender: linux-gpio-owner@vger.kernel.org
To: tthayer@opensource.altera.com
Cc: linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 02 Jun 2016, tthayer@opensource.altera.com wrote:

> From: Thor Thayer <tthayer@opensource.altera.com>
>=20
> The Altera Arria10 Devkit System Resource chip is a Multi-Function
> Device with a GPIO expander.
>=20
> This patch adds documentation for the Altera A10-SR DT bindings.
>=20
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
> v2  Addition of IRQ controller bindings.
>     Removal of hw_mon sub-device.
> ---
>  .../devicetree/bindings/mfd/altera-a10sr.txt       |   46 ++++++++++=
++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/altera-a10s=
r.txt

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/altera-a10sr.txt b=
/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> new file mode 100644
> index 0000000..ea151f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> @@ -0,0 +1,46 @@
> +* Altera Arria10 Development Kit System Resource Chip
> +
> +Required parent device properties:
> +- compatible		: "altr,a10sr"
> +- spi-max-frequency	: Maximum SPI frequency.
> +- reg			: The SPI Chip Select address for the Arria10
> +			  System Resource chip
> +- interrupt-parent	: The parent interrupt controller.
> +- interrupts		: The interrupt line the device is connected to.
> +- interrupt-controller	: Marks the device node as an interrupt contr=
oller.
> +- #interrupt-cells	: The number of cells to describe an IRQ, should =
be 2.
> +			    The first cell is the IRQ number.
> +			    The second cell is the flags, encoded as trigger
> +			    masks from ../interrupt-controller/interrupts.txt.
> +
> +The A10SR consists of these sub-devices:
> +
> +Device                   Description
> +------                   ----------
> +a10sr_gpio               GPIO Controller
> +
> +Arria10 GPIO
> +Required Properties:
> +- compatible        : Should be "altr,a10sr-gpio"
> +- gpio-controller   : Marks the device node as a GPIO Controller.
> +- #gpio-cells       : Should be two.  The first cell is the pin numb=
er and
> +                      the second cell is used to specify flags.
> +                      See ../gpio/gpio.txt for more information.
> +
> +Example:
> +
> +        resource-manager@0 {
> +		compatible =3D "altr,a10sr";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <100000>;
> +		interrupt-parent =3D <&portb>;
> +		interrupts =3D <5 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
> +
> +		a10sr_gpio: gpio-controller {
> +			compatible =3D "altr,a10sr-gpio";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +		};
> +	};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
