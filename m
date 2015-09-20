From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/3] Documentation: tps65912: Add DT bindings for the
 TPS65912 PMIC
Date: Sun, 20 Sep 2015 05:16:30 +0100
Message-ID: <20150920041630.GE3039@x1>
References: <1442339861-30300-1-git-send-email-afd@ti.com>
 <1442339861-30300-2-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1442339861-30300-2-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 15 Sep 2015, Andrew F. Davis wrote:

> The TPS65912 PMIC contains several regulators and a GPIO controller.
> Add bindings for the TPS65912 PMIC.
>=20
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>  .../devicetree/bindings/gpio/gpio-tps65912.txt     | 17 +++++++++
>  Documentation/devicetree/bindings/mfd/tps65912.txt | 43 ++++++++++++=
++++++++++
>  .../bindings/regulator/tps65912-regulator.txt      | 32 ++++++++++++=
++++
>  3 files changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tps65=
912.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/tps65912.tx=
t
>  create mode 100644 Documentation/devicetree/bindings/regulator/tps65=
912-regulator.txt
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-tps65912.txt=
 b/Documentation/devicetree/bindings/gpio/gpio-tps65912.txt
> new file mode 100644
> index 0000000..f65370b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-tps65912.txt
> @@ -0,0 +1,17 @@
> +* TPS65912 GPIO controller bindings

Suggest s/controller/Controller/

> +Required properties:
> + - compatible : Should be "ti,tps65912-gpio".
> + - gpio-controller : Marks the device node as a gpio controller.

s/gpio/GPIO/

As above for controller.

> + - #gpio-cells : Should be two.  The first cell is the pin number an=
d
> +     the second cell is used to specify the gpio polarity:
> +       0 =3D active high
> +       1 =3D active low

Best to use the #defines in include/dt-bindings/gpio.

> +Example:
> +
> +	gpio4: tps65912_gpio {
> +		compatible =3D "ti,tps65912-gpio";
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> diff --git a/Documentation/devicetree/bindings/mfd/tps65912.txt b/Doc=
umentation/devicetree/bindings/mfd/tps65912.txt
> new file mode 100644
> index 0000000..081af66
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/tps65912.txt
> @@ -0,0 +1,43 @@
> +* TPS65912 Power Management Integrated Circuit bindings
> +
> +Required properties:
> + - compatible : Should be "ti,tps65912".
> + - reg : Slave address or chip select number (I2C / SPI).
> + - interrupt-parent : The parent interrupt controller.
> + - interrupts : The interrupt line the device is connected to.
> + - interrupt-controller : Marks the device node as an interrupt cont=
roller.
> + - #interrupt-cells: the number of cells to describe an IRQ, this sh=
ould be 2.

s/the/The/

> +     The first cell is the IRQ number.
> +     The second cell is the flags, encoded as the trigger masks from
> +     Documentation/devicetree/bindings/interrupts.txt

No such file.

> +Optional nodes:
> + - Regulators: Documentation/devicetree/bindings/regulator/tps65912-=
regulator.txt
> + - GPIO: Documentation/devicetree/bindings/gpio/gpio-tps65912.txt.

Better to use ../gpio, ../regulator, etc.

"Regulators" and "GPIO" aren't valid node names.

Please be more specific.

> +Example:
> +
> +	pmic: tps65912@2d {
> +		compatible =3D "ti,tps65912";
> +		reg =3D <0x2d>;
> +		interrupt-parent =3D <&gpio1>;
> +		interrupts =3D <28 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
> +
> +		dcdc1: regulator-dcdc1 {
> +			compatible =3D "ti,tps65912-dcdc1";
> +			regulator-name =3D "vdd_core";
> +			regulator-min-microvolt =3D <912000>;
> +			regulator-max-microvolt =3D <1144000>;
> +			regulator-boot-on;
> +			regulator-always-on;
> +		};
> +		...

No need for this.

> +		gpio4: tps65912_gpio {
> +			compatible =3D "ti,tps65912-gpio";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +		};
> +	};
> diff --git a/Documentation/devicetree/bindings/regulator/tps65912-reg=
ulator.txt b/Documentation/devicetree/bindings/regulator/tps65912-regul=
ator.txt
> new file mode 100644
> index 0000000..a417ff7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/tps65912-regulator.=
txt
> @@ -0,0 +1,32 @@
> +* TPS65912 regulator bindings
> +
> +Required properties:
> + - compatible: Should be:
> +   - "ti,tps65912-dcdc1" for DCDC1
> +   - "ti,tps65912-dcdc2" for DCDC2
> +   - "ti,tps65912-dcdc3" for DCDC3
> +   - "ti,tps65912-dcdc4" for DCDC4
> +   - "ti,tps65912-ldo1" for LDO1
> +   - "ti,tps65912-ldo2" for LDO2
> +   - "ti,tps65912-ldo3" for LDO3
> +   - "ti,tps65912-ldo4" for LDO4
> +   - "ti,tps65912-ldo5" for LDO5
> +   - "ti,tps65912-ldo6" for LDO6
> +   - "ti,tps65912-ldo7" for LDO7
> +   - "ti,tps65912-ldo8" for LDO8
> +   - "ti,tps65912-ldo9" for LDO9
> +   - "ti,tps65912-ldo10" for LDO10
> +
> +Optional properties:
> + - Any optional property defined in bindings/regulator/regulator.txt

=2E./regulator/...

> +Example:
> +
> +	xyz: regulator@0 {
> +		compatible =3D "ti,tps65912-dcdc1";
> +		regulator-name =3D "vdd_core";
> +		regulator-min-microvolt =3D <912000>;
> +		regulator-max-microvolt =3D <1144000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
