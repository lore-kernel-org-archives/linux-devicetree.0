From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: gpio: max3191x: Document new driver
Date: Tue, 22 Aug 2017 19:48:47 -0500
Message-ID: <20170823004847.jmkb53xtdmmn6vtf@rob-hp-laptop>
References: <cover.1503319573.git.lukas@wunner.de>
 <7fe7636eecba238d57ab6178cfa3f6b7deca98f1.1503319573.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7fe7636eecba238d57ab6178cfa3f6b7deca98f1.1503319573.git.lukas@wunner.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Lukas Wunner <lukas@wunner.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 21, 2017 at 03:12:00PM +0200, Lukas Wunner wrote:
> Add device tree bindings for Maxim MAX3191x industrial serializer.
> 
> Cc: Mathias Duckeck <m.duckeck@kunbus.de>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  .../devicetree/bindings/gpio/gpio-max3191x.txt     | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-max3191x.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-max3191x.txt b/Documentation/devicetree/bindings/gpio/gpio-max3191x.txt
> new file mode 100644
> index 000000000000..18182ecaa199
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-max3191x.txt
> @@ -0,0 +1,37 @@
> +GPIO driver for Maxim MAX3191x industrial serializer
> +
> +Required properties:
> + - compatible:		"maxim,max31910", "maxim,max31911", "maxim,max31912",
> +			"maxim,max31913", "maxim,max31953", "maxim,max31963"

One valid combination per line please.

> + - gpio-controller:	Marks the device node as a GPIO controller.
> + - #gpio-cells: 	Should be two. For consumer use see gpio.txt.
> +
> +Optional properties:
> + - maxim,nchips:	Number of chips in the daisy-chain (default is 1).
> + - modesel-gpios:	GPIO pins to configure modesel of each chip.
> +			The number of GPIOs must be equal to "maxim,nchips".
> + - fault-gpios: 	GPIO pins to read undervoltage fault of each chip.
> + - db0-gpios:		GPIO pins to configure debounce of each chip.
> + - db1-gpios:		GPIO pins to configure debounce of each chip.

Perhaps an array db-gpios with 2 entries.

These gpios all need a vendor prefix.

> + - maxim,modesel:	Mode to use if hardwired (and thus not selectable
> +			through GPIOs): 0 for 16-bit mode, 1 for 8-bit mode.

Make this a boolean and define the default when not present (and 
modesel-gpios not present).

> + - maxim,no-vcc24v:	Boolean, whether the chips are powered through 5VOUT
> +			instead of VCC24V.

Use the regulator binding here?

> +
> +For other required and optional properties of SPI slave nodes please refer to
> +../spi/spi-bus.txt.
> +
> +Example:
> +	gpio@0 {
> +		compatible = "maxim,max31913";
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		modesel-gpios = <&gpio2 23>;
> +		fault-gpios   = <&gpio2 24 GPIO_ACTIVE_LOW>;
> +		db0-gpios     = <&gpio2 25>;
> +		db1-gpios     = <&gpio2 26>;
> +
> +		reg = <0>;

reg usually comes after compatible. Also, reg needs to be documented 
above.

> +		spi-max-frequency = <25000000>;
> +	};
> -- 
> 2.11.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
