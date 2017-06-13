From: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Add DT bindings documentation for
 the max7360 mfd driver
Date: Tue, 13 Jun 2017 16:28:52 +0300
Message-ID: <a476aafe-a75f-35bb-bfff-fc73a7f862cc@mentor.com>
References: <20170613122051.6061-1-valentin_sitdikov@mentor.com>
 <20170613122051.6061-2-valentin_sitdikov@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170613122051.6061-2-valentin_sitdikov-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Valentin Sitdikov <valentin_sitdikov-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrei Dranitca <Andrei_Dranitca-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Valentin,

On 06/13/2017 03:20 PM, Valentin Sitdikov wrote:
> This patch adds documentation for the max7360 bindings.
> The max7360 is Multi-functional Device containing gpio,
> keypad, pwm and rotary encoder submodules.
> 
> Signed-off-by: Andrei Dranitca <Andrei_Dranitca-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Valentin Sitdikov <valentin_sitdikov-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/max7360.txt | 74 +++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/max7360.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/max7360.txt b/Documentation/devicetree/bindings/mfd/max7360.txt
> new file mode 100644
> index 0000000..c2ceaf9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/max7360.txt
> @@ -0,0 +1,74 @@
> +* Maxim MAX7360 Multi-function Device
> +
> +The Maxim MAX7360 is a Multi-function Device which includes
> +64 key switches, 8 LED drivers/GPIOs, PWM intensity control,
> +and rotary switch control.
> +
> +Required properties:
> +- compatible:	Should be the following: "maxim,max7360".
> +- reg:		Specifies the I2C slave address of the max7360 block.
> +		  It can be 0x38, 0x3a, 0x3c or 0x3e IIUC.

"IIUC" note is highly undesirable ;)

> +
> +Optional properties:
> +- interrupt-parent:	Specifies the phandle of the interrupt controller to
> +			  which the interrupts from MAX7360 are routed to.
> +- interrupts:		List of IRQ lines specifiers.
> +- interrupt-names:	List of "inti" and "intk".
> +- interrupt-controller:	Identifies the device as an interrupt controller.
> +- #interrupt-cells :	Number of cells to encode an interrupt source,
> +			  shall be 1.
> +
> +Examples:
> +
> +Without subnodes:
> +	max7360@38 {
> +		compatible = "maxim,max7360";
> +		reg = <0x38>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <23 IRQ_TYPE_LEVEL_LOW>, <23 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-names = "inti", "intk";
> +		interrupt-controller;
> +		#interrupt-cells = <0x1>;
> +	};

Can you drop the example above? It does not bring any new information.

> +
> +With subnodes:
> +	max7360@38 {

Commonly for device node names generic/device class names are utilized,
however I can not suggest what name is better.

> +		compatible = "maxim,max7360";
> +		reg = <0x38>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <23 IRQ_TYPE_LEVEL_LOW>, <23 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-names = "inti", "intk";
> +		interrupt-controller;
> +		#interrupt-cells = <0x1>;

For #*-cells properties plese specify plain integers, #interrupt-cells = <1>;

> +
> +		gpio {
> +			compatible = "maxim,max7360-gpio";
> +			gpio-controller;
> +			#gpio-cells = <0x2>;

Please use a plain integer.

> +			interrupt-controller;
> +			#interrupt-cells = <0x2>;

Please use a plain integer.

> +			interrupts = <0>;
> +		};
> +
> +		keypad {
> +			compatible = "maxim,max7360-keypad";
> +			maxim,debounce_reg = /bits/ 8 <0xef>;
> +			maxim,ports_reg = /bits/ 8 <0xae>;

Here I'd rather suggest

1) use 32-bit values,
2) rename properties by replacing underscore by a hyphen.

> +			linux,keymap = < MATRIX_KEY(0, 0, KEY_F5)
> +					 MATRIX_KEY(1, 0, KEY_F4) >;
> +			keypad,num-rows = <2>;
> +			keypad,num-columns = <1>;
> +			interrupts = <1>;
> +		};
> +
> +		pwm {
> +			compatible = "maxim,max7360-pwm";
> +			#pwm-cells = <0x2>;

Please use a plain integer.

> +		};
> +
> +		rotary-encoder {
> +			compatible = "maxim,max7360-rotary";
> +			interrupts = <2>;
> +		};
> +

Please drop an empty line above.

> +	};
> 

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
