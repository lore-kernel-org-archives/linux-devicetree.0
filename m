From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V5 REPOST] mfd: add support for ams AS3722 PMIC
Date: Fri, 6 Jun 2014 16:28:40 +0100
Message-ID: <20140606152840.GV24240@lee--X1>
References: <1382427526-2390-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1382427526-2390-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: sameo@linux.intel.com, broonie@kernel.org, linus.walleij@linaro.org, akpm@linux-foundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, rob.herring@calxeda.com, mark.rutland@arm.com, pawel.moll@arm.com, swarren@wwwdotorg.org, rob@landley.net, ijc+devicetree@hellion.org.uk, grant.likely@linaro.org, Florian Lobmaier <florian.lobmaier@ams.com>
List-Id: devicetree@vger.kernel.org

Laxman,

This patch has already been applied, but ...

> The ams AS3722 is a compact system PMU suitable for mobile phones,
> tablets etc. It has 4 DC/DC step-down regulators, 3 DC/DC step-down
> controller, 11 LDOs, RTC, automatic battery, temperature and
> over-current monitoring, 8 GPIOs, ADC and a watchdog.
>=20
> Add MFD core driver for the AS3722 to support core functionality.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Signed-off-by: Florian Lobmaier <florian.lobmaier@ams.com>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Stephen Warren <swarren@nvidia.com>
> ---

[...]

> diff --git a/Documentation/devicetree/bindings/mfd/as3722.txt b/Docum=
entation/devicetree/bindings/mfd/as3722.txt
> new file mode 100644
> index 0000000..fc2191e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/as3722.txt
> @@ -0,0 +1,194 @@
> +* ams AS3722 Power management IC.
> +
> +Required properties:
> +-------------------
> +- compatible: Must be "ams,as3722".
> +- reg: I2C device address.
> +- interrupt-controller: AS3722 has internal interrupt controller whi=
ch takes the
> +  interrupt request from internal sub-blocks like RTC, regulators, G=
PIOs as well
> +  as external input.
> +- #interrupt-cells: Should be set to 2 for IRQ number and flags.
> +  The first cell is the IRQ number. IRQ numbers for different interr=
upt source
> +  of AS3722 are defined at dt-bindings/mfd/as3722.h
> +  The second cell is the flags, encoded as the trigger masks from bi=
nding document
> +	interrupts.txt, using dt-bindings/irq.
> +
> +Optional submodule and their properties:
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Pinmux and GPIO:
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Device has 8 GPIO pins which can be configured as GPIO as well as th=
e special IO
> +functions.
> +
> +Please refer to pinctrl-bindings.txt in this directory for details o=
f the
> +common pinctrl bindings used by client devices, including the meanin=
g of the
> +phrase "pin configuration node".
> +
> +Following are properties which is needed if GPIO and pinmux function=
ality
> +is required:
> +    Required properties:
> +    -------------------
> +	- gpio-controller: Marks the device node as a GPIO controller.
> +	- #gpio-cells: Number of GPIO cells. Refer to binding document
> +			gpio/gpio.txt
> +
> +    Optional properties:
> +    --------------------
> +	Following properties are require if pin control setting is required
> +	at boot.
> +	- pinctrl-names: A pinctrl state named "default" be defined, using =
the
> +		bindings in pinctrl/pinctrl-binding.txt.
> +	- pinctrl[0...n]: Properties to contain the phandle that refer to
> +		different nodes of pin control settings. These nodes represents
> +		the pin control setting of state 0 to state n. Each of these
> +		nodes contains different subnodes to represents some desired
> +		configuration for a list of pins. This configuration can
> +		include the mux function to select on those pin(s), and
> +		various pin configuration parameters, such as pull-up,
> +		open drain.
> +
> +		Each subnode have following properties:
> +		Required properties:
> +		    - pins: List of pins. Valid values of pins properties are:
> +				gpio0, gpio1, gpio2, gpio3, gpio4, gpio5,
> +				gpio6, gpio7
> +
> +		Optional properties:
> +			function, bias-disable, bias-pull-up, bias-pull-down,
> +			bias-high-impedance, drive-open-drain.
> +
> +			Valid values for function properties are:
> +				gpio, interrupt-out, gpio-in-interrupt,
> +				vsup-vbat-low-undebounce-out,
> +				vsup-vbat-low-debounce-out,
> +				voltage-in-standby, oc-pg-sd0, oc-pg-sd6,
> +				powergood-out, pwm-in, pwm-out, clk32k-out,
> +				watchdog-in, soft-reset-in
> +
> +Regulators:
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Device has multiple DCDC and LDOs. The node "regulators" is require =
if regulator
> +functionality is needed.
> +
> +Following are properties of regulator subnode.
> +
> +    Optional properties:
> +    -------------------
> +	The input supply of regulators are the optional properties on the
> +	regulator node. The input supply of these regulators are provided
> +	through following properties:
> +		vsup-sd2-supply: Input supply for SD2.
> +		vsup-sd3-supply: Input supply for SD3.
> +		vsup-sd4-supply: Input supply for SD4.
> +		vsup-sd5-supply: Input supply for SD5.
> +		vin-ldo0-supply: Input supply for LDO0.
> +		vin-ldo1-6-supply: Input supply for LDO1 and LDO6.
> +		vin-ldo2-5-7-supply: Input supply for LDO2, LDO5 and LDO7.
> +		vin-ldo3-4-supply: Input supply for LDO3 and LDO4.
> +		vin-ldo9-10-supply: Input supply for LDO9 and LDO10.
> +		vin-ldo11-supply: Input supply for LDO11.
> +
> +    Optional sub nodes for regulators:
> +    ---------------------------------
> +	The subnodes name is the name of regulator and it must be one of:
> +	sd[0-6], ldo[0-7], ldo[9-11]
> +
> +	Each sub-node should contain the constraints and initialization
> +	information for that regulator. See regulator.txt for a description
> +	of standard properties for these sub-nodes.
> +	Additional optional custom properties  are listed below.
> +		ams,ext-control: External control of the rail. The option of
> +			this properties will tell which external input is
> +			controlling this rail. Valid values are 0, 1, 2 ad 3.
> +			0: There is no external control of this rail.
> +			1: Rail is controlled by ENABLE1 input pin.
> +			2: Rail is controlled by ENABLE2 input pin.
> +			3: Rail is controlled by ENABLE3 input pin.
> +			Missing this property on DT will be assume as no
> +			external control. The external control pin macros
> +			are defined @dt-bindings/mfd/as3722.h
> +
> +		ams,enable-tracking: Enable tracking with SD1, only supported
> +			by LDO3.
> +
> +Example:
> +--------
> +#include <dt-bindings/mfd/as3722.h>
> +...
> +ams3722 {
> +	compatible =3D "ams,as3722";
> +	reg =3D <0x48>;
> +
> +	interrupt-parent =3D <&intc>;
> +	interrupt-controller;
> +	#interrupt-cells =3D <2>;
> +
> +	gpio-controller;
> +	#gpio-cells =3D <2>;
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&as3722_default>;
> +
> +	as3722_default: pinmux {
> +			gpio0 {
> +				pins =3D "gpio0";
> +				function =3D "gpio";
> +				bias-pull-down;
> +			};
> +
> +			gpio1_2_4_7 {
> +				pins =3D "gpio1", "gpio2", "gpio4", "gpio7";
> +				function =3D "gpio";
> +				bias-pull-up;
> +			};
> +
> +			gpio5 {
> +				pins =3D "gpio5";
> +				function =3D "clk32k_out";
> +			};
> +	}
> +
> +	regulators {
> +			vsup-sd2-supply =3D <...>;
> +			...
> +
> +			sd0 {
> +				regulator-name =3D "vdd_cpu";
> +				regulator-min-microvolt =3D <700000>;
> +				regulator-max-microvolt =3D <1400000>;
> +				regulator-always-on;
> +				ams,ext-control =3D <2>;
> +			};
> +
> +			sd1 {
> +				regulator-name =3D "vdd_core";
> +				regulator-min-microvolt =3D <700000>;
> +				regulator-max-microvolt =3D <1400000>;
> +				regulator-always-on;
> +				ams,ext-control =3D <1>;
> +			};
> +
> +			sd2 {
> +				regulator-name =3D "vddio_ddr";
> +				regulator-min-microvolt =3D <1350000>;
> +				regulator-max-microvolt =3D <1350000>;
> +				regulator-always-on;
> +			};
> +
> +			sd4 {
> +				regulator-name =3D "avdd-hdmi-pex";
> +				regulator-min-microvolt =3D <1050000>;
> +				regulator-max-microvolt =3D <1050000>;
> +				regulator-always-on;
> +			};
> +
> +			sd5 {
> +				regulator-name =3D "vdd-1v8";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-always-on;
> +			};
> +			....
> +	};
> +};

[...]

> +static int as3722_i2c_of_probe(struct i2c_client *i2c,
> +			struct as3722 *as3722)
> +{
> +	struct device_node *np =3D i2c->dev.of_node;
> +	struct irq_data *irq_data;
> +
> +	if (!np) {
> +		dev_err(&i2c->dev, "Device Tree not found\n");
> +		return -EINVAL;
> +	}
> +
> +	irq_data =3D irq_get_irq_data(i2c->irq);
> +	if (!irq_data) {
> +		dev_err(&i2c->dev, "Invalid IRQ: %d\n", i2c->irq);
> +		return -EINVAL;
> +	}
> +
> +	as3722->en_intern_int_pullup =3D of_property_read_bool(np,
> +					"ams,enable-internal-int-pullup");
> +	as3722->en_intern_i2c_pullup =3D of_property_read_bool(np,
> +					"ams,enable-internal-i2c-pullup");

These are still not documented.  Can you please do so?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
