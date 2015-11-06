From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 1/5] Documentation: tps65912: Add DT bindings for the
 TPS65912 PMIC
Date: Fri, 6 Nov 2015 14:36:55 -0600
Message-ID: <20151106203655.GA4950@rob-hp-laptop>
References: <1446244088-28281-1-git-send-email-afd@ti.com>
 <1446244088-28281-2-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1446244088-28281-2-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 30, 2015 at 05:28:04PM -0500, Andrew F. Davis wrote:
> The TPS65912 PMIC contains several regulators and a GPIO controller.
> Add bindings for the TPS65912 PMIC.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>  .../devicetree/bindings/gpio/gpio-tps65912.txt     | 16 +++++++
>  Documentation/devicetree/bindings/mfd/tps65912.txt | 51 ++++++++++++++++++++++
>  .../bindings/regulator/tps65912-regulator.txt      | 28 ++++++++++++
>  3 files changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tps65912.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/tps65912.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/tps65912-regulator.txt

Acked-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-tps65912.txt b/Documentation/devicetree/bindings/gpio/gpio-tps65912.txt
> new file mode 100644
> index 0000000..ba8d633
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-tps65912.txt
> @@ -0,0 +1,16 @@
> +* TPS65912 GPIO Controller bindings
> +
> +Required properties:
> + - compatible		: Should be "ti,tps65912-gpio".
> + - gpio-controller	: Marks the device node as a GPIO Controller.
> + - #gpio-cells		: Should be two.  The first cell is the pin number and
> +			    the second cell is used to specify flags.
> +			    See ../gpio/gpio.txt for more information.
> +
> +Example:
> +
> +	gpio4: gpio {
> +		compatible = "ti,tps65912-gpio";
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> diff --git a/Documentation/devicetree/bindings/mfd/tps65912.txt b/Documentation/devicetree/bindings/mfd/tps65912.txt
> new file mode 100644
> index 0000000..65426b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/tps65912.txt
> @@ -0,0 +1,51 @@
> +* TPS65912 Power Management Integrated Circuit bindings
> +
> +Required properties:
> + - compatible		: Should be "ti,tps65912".
> + - reg			: Slave address or chip select number (I2C / SPI).
> + - interrupt-parent	: The parent interrupt controller.
> + - interrupts		: The interrupt line the device is connected to.
> + - interrupt-controller	: Marks the device node as an interrupt controller.
> + - #interrupt-cells	: The number of cells to describe an IRQ, this should be 2.
> +			    The first cell is the IRQ number.
> +			    The second cell is the flags, encoded as the trigger masks from
> +			    ../interrupt-controller/interrupts.txt.
> +
> +Additional nodes defined in:
> + - Regulators: ../regulator/tps65912-regulator.txt
> + - GPIO: ../gpio/gpio-tps65912.txt.
> +
> +Example:
> +
> +	pmic: tps65912@2d {
> +		compatible = "ti,tps65912";
> +		reg = <0x2d>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +
> +		regulators {
> +			compatible = "ti,tps65912-regulator";
> +
> +			dcdc1 {
> +				regulator-name = "vdd_core";
> +				regulator-min-microvolt = <912000>;
> +				regulator-max-microvolt = <1144000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo1 {
> +				regulator-name = "ldo1";
> +				regulator-min-microvolt = <1900000>;
> +				regulator-max-microvolt = <1900000>;
> +			};
> +		};
> +
> +		gpio4: gpio {
> +			compatible = "ti,tps65912-gpio";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +	};
> diff --git a/Documentation/devicetree/bindings/regulator/tps65912-regulator.txt b/Documentation/devicetree/bindings/regulator/tps65912-regulator.txt
> new file mode 100644
> index 0000000..b81973d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/tps65912-regulator.txt
> @@ -0,0 +1,28 @@
> +* TPS65912 regulator bindings
> +
> +Required properties:
> + - compatible		: Should be "ti,tps65912-regulator".
> + - list of regulators provided by this controller, must be named
> +     after their hardware counterparts: dcdc[1-4] and ldo[1-10].
> +
> +Each regulator is defined using the standard binding for regulators.
> +
> +Example:
> +
> +	regulator {
> +		compatible = "ti,tps65912-regulator";
> +
> +		dcdc1 {
> +			regulator-name = "vdd_core";
> +			regulator-min-microvolt = <912000>;
> +			regulator-max-microvolt = <1144000>;
> +			regulator-boot-on;
> +			regulator-always-on;
> +		};
> +
> +		ldo1 {
> +			regulator-name = "ldo1";
> +			regulator-min-microvolt = <1900000>;
> +			regulator-max-microvolt = <1900000>;
> +		};
> +	};
> -- 
> 1.9.1
> 
