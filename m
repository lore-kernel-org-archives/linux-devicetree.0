From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 1/5] Documentation: tps65912: Add DT bindings for the
 TPS65912 PMIC
Date: Tue, 24 Nov 2015 16:25:33 +0000
Message-ID: <20151124162533.GH807@x1>
References: <1447869580-10416-1-git-send-email-afd@ti.com>
 <1447869580-10416-2-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447869580-10416-2-git-send-email-afd@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 18 Nov 2015, Andrew F. Davis wrote:

> The TPS65912 PMIC contains several regulators and a GPIO controller.
> Add bindings for the TPS65912 PMIC.
>=20
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>  Documentation/devicetree/bindings/mfd/tps65912.txt | 50 ++++++++++++=
++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/tps65912.tx=
t

=46or my own reference:
  Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/Documentation/devicetree/bindings/mfd/tps65912.txt b/Doc=
umentation/devicetree/bindings/mfd/tps65912.txt
> new file mode 100644
> index 0000000..717e66d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/tps65912.txt
> @@ -0,0 +1,50 @@
> +* TPS65912 Power Management Integrated Circuit bindings
> +
> +Required properties:
> + - compatible		: Should be "ti,tps65912".
> + - reg			: Slave address or chip select number (I2C / SPI).
> + - interrupt-parent	: The parent interrupt controller.
> + - interrupts		: The interrupt line the device is connected to.
> + - interrupt-controller	: Marks the device node as an interrupt cont=
roller.
> + - #interrupt-cells	: The number of cells to describe an IRQ, should=
 be 2.
> +			    The first cell is the IRQ number.
> +			    The second cell is the flags, encoded as trigger
> +			    masks from ../interrupt-controller/interrupts.txt.
> + - gpio-controller	: Marks the device node as a GPIO Controller.
> + - #gpio-cells		: Should be two.  The first cell is the pin number a=
nd
> +			    the second cell is used to specify flags.
> +			    See ../gpio/gpio.txt for more information.
> + - regulators:		: List of child nodes that specify the regulator
> +			    initialization data. Child nodes must be named
> +			    after their hardware counterparts: dcdc[1-4] and
> +			    ldo[1-10]. Each child nodes is defined using the
> +			    standard binding for regulators.
> +
> +Example:
> +
> +	pmic: tps65912@2d {
> +		compatible =3D "ti,tps65912";
> +		reg =3D <0x2d>;
> +		interrupt-parent =3D <&gpio1>;
> +		interrupts =3D <28 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +
> +		regulators {
> +			dcdc1 {
> +				regulator-name =3D "vdd_core";
> +				regulator-min-microvolt =3D <912000>;
> +				regulator-max-microvolt =3D <1144000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo1 {
> +				regulator-name =3D "ldo1";
> +				regulator-min-microvolt =3D <1900000>;
> +				regulator-max-microvolt =3D <1900000>;
> +			};
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
