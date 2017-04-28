From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] Add DT bindings documentation for the max7360 mfd
 driver
Date: Fri, 28 Apr 2017 14:23:06 -0500
Message-ID: <20170428192306.v2stmd5to3qmrb2e@rob-hp-laptop>
References: <20170425081557.13941-1-valentin_sitdikov@mentor.com>
 <20170425081557.13941-2-valentin_sitdikov@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170425081557.13941-2-valentin_sitdikov-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Valentin Sitdikov <valentin_sitdikov-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrei Dranitca <Andrei_Dranitca-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 25, 2017 at 11:15:56AM +0300, Valentin Sitdikov wrote:

dt-bindings: mfd: ... for subject.

And you need a commit msg.

> Signed-off-by: Valentin Sitdikov <valentin_sitdikov-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Andrei Dranitca <Andrei_Dranitca-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/max7360.txt | 72 +++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/max7360.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/max7360.txt b/Documentation/devicetree/bindings/mfd/max7360.txt
> new file mode 100644
> index 0000000..359073a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/max7360.txt
> @@ -0,0 +1,72 @@
> +* Maxim MAX7360 multi-function device
> +
> +The Maxim MAX7360 is a multifunction device which includes
> +64 key switches, eight LED drivers/GPIOs, PWM intensity control,
> +and rotary switch control.
> +
> +Required properties:
> +- compatible: Should be the following: "maxim,max7360"
> +- reg: Specifies the i2c slave address of the max7360 block. It can be 0x38, 0x3a, 0x3c or 0x3e IIUC.
> +
> +Optional properties:
> +- interrupt-parent: Specifies the phandle of the interrupt controller to which
> +  the interrupts from MAX7360 are routed to.
> +- interrupt-names: might be "int-shared" or list of "inti" and "intk"

I don't see anything in the datasheet about shared irq. If you connect 
both lines together on a board, just repeat the same connection.

> +- interrupt-controller:  Identifies the device as an interrupt controller.
> +- #interrupt-cells :  Number of cells to encode an interrupt source, shall be 1.
> +
> +Examples:
> +
> +Without subnodes:
> +	max7360@38 {
> +		compatible = "maxim,max7360";
> +		reg = <0x38>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-names = "int-shared";
> +		interrupt-controller;
> +		#interrupt-cells = <0x1>;
> +
> +	};
> +
> +With subnodes:
> +	max7360@38 {
> +		compatible = "maxim,max7360";
> +		reg = <0x38>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-names = "int-shared";
> +		interrupt-controller;
> +		#interrupt-cells = <0x1>;
> +
> +		max7360_gpio: max7360_gpio@0 {

Use generic names and no unit address when no reg prop:

gpio {

> +			compatible = "maxim,max7360-gpio";
> +			gpio-controller;
> +			#gpio-cells = <0x2>;
> +			interrupt-controller;
> +			#interrupt-cells = <0x2>;
> +			interrupts = <0>;
> +		};
> +
> +		max7360_keypad {

keypad {

> +			compatible = "maxim,max7360-keypad";
> +			maxim,debounce_reg = /bits/ 8 <0xef>;
> +			maxim,ports_reg = /bits/ 8 <0xae>;
> +			linux,keymap = < MATRIX_KEY(0, 0, KEY_F5)
> +					 MATRIX_KEY(1, 0, KEY_F4) >;
> +			keypad,num-rows = <2>;
> +			keypad,num-columns = <1>;
> +			interrupts = <1>;
> +		};
> +
> +		max7360_pwm: max7360_pwm {

pwm {

> +			compatible = "maxim,max7360-pwm";
> +			#pwm-cells = <0x2>;
> +		};
> +
> +		max7360_rotary_encoder {

rotary-encoder {

> +			compatible = "maxim,max7360-rotary";
> +			interrupts = <2>;
> +		};
> +
> +	};
> -- 
> 2.9.3
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
