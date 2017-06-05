From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Add DT bindings documentation for
 the max7360 mfd driver
Date: Mon, 5 Jun 2017 10:23:43 +0100
Message-ID: <20170605092343.ei5v7dafta6zrzth@dell>
References: <20170602162158.4432-1-valentin_sitdikov@mentor.com>
 <20170602162158.4432-2-valentin_sitdikov@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170602162158.4432-2-valentin_sitdikov@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Valentin Sitdikov <valentin_sitdikov@mentor.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrei Dranitca <Andrei_Dranitca@mentor.com>
List-Id: devicetree@vger.kernel.org

On Fri, 02 Jun 2017, Valentin Sitdikov wrote:

> This patch adds documentation for the max7360 bindings.
> The max7360 is multifunctional device containing GPIO, keypad, PWM and rotary encoder submodules.
> 
> Signed-off-by: Andrei Dranitca <Andrei_Dranitca@mentor.com>
> Signed-off-by: Valentin Sitdikov <valentin_sitdikov@mentor.com>
> ---
>  Documentation/devicetree/bindings/mfd/max7360.txt | 74 +++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/max7360.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/max7360.txt b/Documentation/devicetree/bindings/mfd/max7360.txt
> new file mode 100644
> index 0000000..a38ca9e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/max7360.txt
> @@ -0,0 +1,74 @@
> +* Maxim MAX7360 multi-function device

Multi-Function Device

> +The Maxim MAX7360 is a multifunction device which includes

Multi-Function Device

> +64 key switches, eight LED drivers/GPIOs, PWM intensity control,

s/eight/8/

> +and rotary switch control.
> +
> +Required properties:
> +- compatible: Should be the following: "maxim,max7360"
> +- reg: Specifies the i2c slave address of the max7360 block.

I2C

> +  It can be 0x38, 0x3a, 0x3c or 0x3e IIUC.
> +
> +Optional properties:
> +- interrupt-parent: Specifies the phandle of the interrupt controller to which
> +  the interrupts from MAX7360 are routed to.

Either use a full-stop, or don't, but please do not mix.

> +- interrupts: list of IRQ lines specifiers
> +- interrupt-names: list of "inti" and "intk"
> +- interrupt-controller:  Identifies the device as an interrupt controller.
> +- #interrupt-cells :  Number of cells to encode an interrupt source, shall be 1.

Tab these out.

> +Required properties:
> +- compatible:		Should be the following: "maxim,max7360"
> +- reg:			Specifies the i2c slave address of the max7360 block.
> +  				It can be 0x38, 0x3a, 0x3c or 0x3e IIUC.
> +
> +Optional properties:
> +- interrupt-parent:		Specifies the phandle of the interrupt controller to which
> +  				the interrupts from MAX7360 are routed to.
> +- interrupts: 		list of IRQ lines specifiers
> +- interrupt-names: 		list of "inti" and "intk"
> +- interrupt-controller:  	Identifies the device as an interrupt controller.
> +- #interrupt-cells : 	Number of cells to encode an interrupt source, shall be 1.

Descriptions should *all* start with an upper case character.

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
> +

Remove this line.

> +	};
> +
> +With subnodes:
> +	max7360@38 {
> +		compatible = "maxim,max7360";
> +		reg = <0x38>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <23 IRQ_TYPE_LEVEL_LOW>, <23 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-names = "inti", "intk";
> +		interrupt-controller;
> +		#interrupt-cells = <0x1>;
> +
> +		gpio {
> +			compatible = "maxim,max7360-gpio";
> +			gpio-controller;
> +			#gpio-cells = <0x2>;
> +			interrupt-controller;
> +			#interrupt-cells = <0x2>;
> +			interrupts = <0>;
> +		};
> +
> +		keypad {
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
> +		pwm {
> +			compatible = "maxim,max7360-pwm";
> +			#pwm-cells = <0x2>;
> +		};
> +
> +		rotary-encoder {
> +			compatible = "maxim,max7360-rotary";
> +			interrupts = <2>;
> +		};
> +
> +	};

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
