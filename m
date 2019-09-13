From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: gpio: Add binding document for xylon
 logicvc-gpio
Date: Fri, 13 Sep 2019 15:36:29 +0100
Message-ID: <5d7ba96d.1c69fb81.59623.6c9f@mx.google.com>
References: <20190910152855.111588-1-paul.kocialkowski@bootlin.com>
 <20190910152855.111588-2-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190910152855.111588-2-paul.kocialkowski@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 10, 2019 at 05:28:54PM +0200, Paul Kocialkowski wrote:
> The Xylon LogiCVC display controller exports some GPIOs, which are
> exposed as a dedicated driver.
> 
> This introduces the associated device-tree bindings documentation.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../bindings/gpio/xylon,logicvc-gpio.txt      | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.txt

Please consider using the new DT schema format.

> 
> diff --git a/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.txt b/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.txt
> new file mode 100644
> index 000000000000..4835659cb90b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.txt
> @@ -0,0 +1,48 @@
> +Xylon LogiCVC GPIO controller
> +
> +The Xylon LogiCVC is a display controller that contains a number of GPIO pins,
> +meant to be used for controlling display-related signals.
> +
> +In practice, the GPIOs can be used for any purpose they might be needed for.
> +
> +The controller exposes GPIOs from the display and power control registers,
> +which are mapped by the driver as follows:
> +- GPIO[4:0] (display control) mapped to index 0-4
> +- EN_BLIGHT (power control) mapped to index 5
> +- EN_VDD (power control) mapped to index 6
> +- EN_VEE (power control) mapped to index 7
> +- V_EN (power control) mapped to index 8
> +
> +The driver was implemented and tested for version 3.02.a of the controller,
> +but should be compatible with version 4 as well.
> +
> +Required properties:
> +- compatible: Should contain "xylon,logicvc-3.02.a-gpio".
> +- gpio-controller: Marks the device node as a gpio controller.
> +- #gpio-cells: Should be 2. The first cell is the pin number and
> +  the second cell is used to specify the gpio polarity:
> +    0 = Active high,
> +    1 = Active low.

No need to define these standard flags again here.

> +- gpio,syscon-dev: Syscon phandle representing the logicvc instance.

Don't need this. It's the parent.

> +
> +Example:
> +
> +	logicvc: logicvc@43c00000 {
> +		compatible = "syscon", "simple-mfd";

This device needs a device specific compatible. These 2 alone are not 
desired.

Please define everything that's in the chip as much as you can. 

> +		reg = <0x43c00000 0x6000>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		logicvc_gpio: display-gpio@40 {

Use standard node names: gpio@40

You may not even need a child node here. It depends on what other child 
nodes you have and whether they have their own DT resources.

> +			compatible = "xylon,logicvc-3.02.a-gpio";
> +			reg = <0x40 0x40>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio,syscon-dev = <&logicvc>;
> +		};
> +	};
> +
> +Note: the device-tree node should either be declared as a child of the logicvc
> +syscon node or the syscon node should be precised with the gpio,syscon-dev
> +property. Both are shown in the example above.

Why? Just pick one and a child node is the preference.

> -- 
> 2.23.0
> 
