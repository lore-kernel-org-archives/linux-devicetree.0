From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 1/3] Documentation: tps65086: Add DT bindings for the
 TPS65086 PMIC
Date: Wed, 27 Jan 2016 07:28:58 +0000
Message-ID: <20160127072858.GF3368@x1>
References: <1453737012-3130-1-git-send-email-afd@ti.com>
 <1453737012-3130-2-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453737012-3130-2-git-send-email-afd@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 25 Jan 2016, Andrew F. Davis wrote:

> The TPS65086 PMIC contains several regulators and a GPO controller.
> Add bindings for the TPS65086 PMIC.
>=20
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/tps65086.txt | 55 ++++++++++++=
++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/tps65086.tx=
t

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/tps65086.txt b/Doc=
umentation/devicetree/bindings/mfd/tps65086.txt
> new file mode 100644
> index 0000000..d370561
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/tps65086.txt
> @@ -0,0 +1,55 @@
> +* TPS65086 Power Management Integrated Circuit (PMIC) bindings
> +
> +Required properties:
> + - compatible		: Should be "ti,tps65086".
> + - reg			: I2C slave address.
> + - interrupt-parent	: Phandle to the parent interrupt controller.
> + - interrupts		: The interrupt line the device is connected to.
> + - interrupt-controller	: Marks the device node as an interrupt cont=
roller.
> + - #interrupt-cells	: The number of cells to describe an IRQ, should=
 be 2.
> +			    The first cell is the IRQ number.
> +			    The second cell is the flags, encoded as trigger
> +			    masks from ../interrupt-controller/interrupts.txt.
> + - gpio-controller      : Marks the device node as a GPIO Controller=
=2E
> + - #gpio-cells          : Should be two.  The first cell is the pin =
number and
> +                            the second cell is used to specify flags=
=2E
> +                            See ../gpio/gpio.txt for more informatio=
n.
> + - regulators:          : List of child nodes that specify the regul=
ator
> +                            initialization data. Child nodes must be=
 named
> +                            after their hardware counterparts: buck[=
1-6],
> +                            ldoa[1-3], swa1, swb[1-2], and vtt. Each=
 child
> +                            node is defined using the standard bindi=
ng for
> +                            regulators and the optional regulator pr=
operties
> +                            defined below.
> +
> +Optional regulator properties:
> + - ti,regulator-step-size-25mv	: This is applicable for buck[1,2,6],=
 set this
> +				    if the regulator is factory set with a 25mv
> +				    step voltage mapping.
> + - ti,regulator-decay		: This is applicable for buck[1-6], set this =
if
> +				    the output needs to decay, default is for
> +				    the output to slew down.
> +
> +Example:
> +
> +	pmic: tps65086@5e {
> +		compatible =3D "ti,tps65086";
> +		reg =3D <0x5e>;
> +		interrupt-parent =3D <&gpio1>;
> +		interrupts =3D <28 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +
> +		regulators {
> +			buck1 {
> +				regulator-name =3D "vcc1";
> +				regulator-min-microvolt =3D <1600000>;
> +				regulator-max-microvolt =3D <1600000>;
> +				regulator-boot-on;
> +				ti,regulator-decay;
> +				ti,regulator-step-size-25mv;
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
