From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 1/5] Documentation: tps65912: Add DT bindings for the
 TPS65912 PMIC
Date: Wed, 18 Nov 2015 15:14:50 -0600
Message-ID: <20151118211450.GA11192@rob-hp-laptop>
References: <1447869580-10416-1-git-send-email-afd@ti.com>
 <1447869580-10416-2-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447869580-10416-2-git-send-email-afd@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 18, 2015 at 11:59:36AM -0600, Andrew F. Davis wrote:
> The TPS65912 PMIC contains several regulators and a GPIO controller.
> Add bindings for the TPS65912 PMIC.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  Documentation/devicetree/bindings/mfd/tps65912.txt | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/tps65912.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/tps65912.txt b/Documentation/devicetree/bindings/mfd/tps65912.txt
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
> + - interrupt-controller	: Marks the device node as an interrupt controller.
> + - #interrupt-cells	: The number of cells to describe an IRQ, should be 2.
> +			    The first cell is the IRQ number.
> +			    The second cell is the flags, encoded as trigger
> +			    masks from ../interrupt-controller/interrupts.txt.
> + - gpio-controller	: Marks the device node as a GPIO Controller.
> + - #gpio-cells		: Should be two.  The first cell is the pin number and
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
> +		compatible = "ti,tps65912";
> +		reg = <0x2d>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		regulators {
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
> +	};
> -- 
> 1.9.1
> 
