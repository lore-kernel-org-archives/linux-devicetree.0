From: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH 07/14] DEVICETREE: Add bindings for PIC32 pin control and
 GPIO
Date: Tue, 8 Dec 2015 15:13:36 -0700
Message-ID: <56675610.9020907@microchip.com>
References: <1448065205-15762-1-git-send-email-joshua.henderson@microchip.com>
 <1448065205-15762-8-git-send-email-joshua.henderson@microchip.com>
 <20151122214700.GA26203@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151122214700.GA26203@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Andrei Pistirica <andrei.pistirica-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 11/22/2015 02:47 PM, Rob Herring wrote:
> On Fri, Nov 20, 2015 at 05:17:19PM -0700, Joshua Henderson wrote:
>> From: Andrei Pistirica <andrei.pistirica-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>>
>> Document the devicetree bindings for PINCTRL and GPIO found on Microchip
>> PIC32 class devices. This also adds a header defining related port and
>> peripheral pin select functionality.
>>
>> Signed-off-by: Andrei Pistirica <andrei.pistirica-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>> Signed-off-by: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>> ---
>>  .../bindings/gpio/microchip,pic32-gpio.txt         |   33 ++
>>  .../bindings/pinctrl/microchip,pic32-pinctrl.txt   |  100 +++++
>>  include/dt-bindings/pinctrl/pic32mzda.h            |  404 ++++++++++++++++++++
>>  3 files changed, 537 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gpio/microchip,pic32-gpio.txt
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
>>  create mode 100644 include/dt-bindings/pinctrl/pic32mzda.h
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/microchip,pic32-gpio.txt b/Documentation/devicetree/bindings/gpio/microchip,pic32-gpio.txt
>> new file mode 100644
>> index 0000000..f6eeb2f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/microchip,pic32-gpio.txt
>> @@ -0,0 +1,33 @@
>> +* Microchip PIC32 GPIO devices (PIO).
>> +
>> +Required properties:
>> + - compatible: "microchip,pic32-gpio"
> 
> This should have a chip specific compatible string.
> 

Will change to "microchip,pic32mzda-gpio".

>> + - reg: Base address and length for the device.
>> + - interrupts: The port interrupt shared be all pins.
>> + - gpio-controller: Marks the port as GPIO controller.
>> + - #gpio-cells: Two. The first cell is the pin number and
>> +   the second cell is unused.
>> + - interrupt-controller: Marks the device node as an interrupt controller.
>> + - #interrupt-cells: Two. The first cell is the GPIO number and second cell
>> +   is used to specify the trigger type:
>> +	PIC32_PIN_CN_RISING	: low-to-high edge triggered.
>> +	PIC32_PIN_CN_FALLING	: high-to-low edge triggered.
>> +	PIC32_PIN_CN_BOTH	: low-to-high and high-to-low edges triggered.
> 
> Can't you use the standard flags?
> 

Yes. This will be changed.

>> +
>> +Note:
>> + - If gpio-ranges is missing, then all the pins (32) related to the gpio bank
>> +   are enabled.
>> +
>> +Example:
>> +	pioA: gpio@1f860000 {
>> +		compatible = "microchip,pic32-gpio";
>> +		reg = <0x1f860000 0x24>;
>> +		interrupts = <PORTA_INPUT_CHANGE_INTERRUPT
>> +				DEFAULT_INT_PRI IRQ_TYPE_LEVEL_HIGH>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +		interrupt-controller;
>> +		#interrupt-cells = <2>;
>> +		gpio-ranges = <&pic32_pinctrl 0 0 32>;
>> +		clocks = <&PBCLK4>;
>> +	};
>> diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
>> new file mode 100644
>> index 0000000..7cf4167
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
>> @@ -0,0 +1,100 @@
>> +* Microchip PIC32 Pinmux device.
>> +
>> +Please refer to pinctrl-bindings.txt for details of the pinctrl properties and
>> +common bindings.
>> +
>> +PIC32 'pin configuration node' is a node of a group of pins which can be
>> +used for a specific device or function. This node represents configuraions of
>> +single pins or a pairs of mux and related configuration.
>> +
>> +Required properties for pic32 device:
>> + - compatible: "microchip,pic32-pinctrl", "microchip,pic32mz-pinctrl"
> 
> Is this both or either one. For both, it should be most specific first.
> 

This is a mistake. Will change to only "microchip,pic32mzda-pinctrl".

> 
>> + - reg: Base address and length for pps:in and pps:out registers.
>> +
>> +Properties for 'pin configuration node':
>> + - pic32,pins: each entry consists of 3 intergers and represents the mux and
>> +   config settings for one pin. The first integer represent the remappable pin,
>> +   the second represent the peripheral pin and the last the configuration.
>> +   The format is pic32,pins = <PIC32_RP_'dir'_'pin'
>> +   PIC32_PP_'dir'_'peripherl-pin' PIC32_PIN_CONF_'config'>. The configurations
>> +   are divided in 2 classes: IN and OUT and each in 4 buckets. Each entry must
>> +   contains items from the same class and bucket, otherwise the driver will
>> +   notify an error and the initialization will fail.
>> + - pic32,single-pins: each entry consists of 3 intergers and represents a pin
>> +   (that is not remappable) and related configuraion. The format is
>> +   pic32,single-pins = <PORT_'x' 'pin' PIC32_PIN_CONF_'config'>. Each port has
>> +   32 pins and please refer to chip documentation for details of remappable
>> +   pins.
>> +
>> +Available pin configurations (refer to dt-bindings/pinctrl/pic32.h):
>> +	PIC32_PIN_CONF_NONE	: no configuration (default).
>> +	PIC32_PIN_CONF_OD	: indicate this pin need a open-drain (no direction).
>> +	PIC32_PIN_CONF_OD_OUT	: indicate this pin need a open-drain out.
>> +	PIC32_PIN_CONF_PU	: indicate this pin need a pull up (no direction).
>> +	PIC32_PIN_CONF_PU_IN	: indicate this pin need a pull up in.
>> +	PIC32_PIN_CONF_PD	: indicate this pin need a pull down (no direction).
>> +	PIC32_PIN_CONF_PD_IN	: indicate this pin need a pull down input.
>> +	PIC32_PIN_CONF_AN	: indicate this pin as analogic (no direction).
>> +	PIC32_PIN_CONF_AN_IN	: indicate this pin as analogic input.
>> +	PIC32_PIN_CONF_DG	: indicate this pin as digital (no direction).
>> +	PIC32_PIN_CONF_DG_IN	: indicate this pin as digital input.
>> +	PIC32_PIN_CONF_DG_OUT	: indicate this pin as digital output.
>> +
>> +NOTEs:
>> +1. The pins functions nods are defined under pic32 pinctrl node. The function's
>> +   pin groups are defined under functions node.
>> +2. Each pin group can have both pic32,pins and pic32,single-pins properties to
>> +   specify re-mappable or non-remappable pins with related mux and configs or
>> +   at least one.
>> +3. Each pin configuration node can have a phandle and devices can set pins
>> +   configurations by referring to the phandle of that pin configuration node.
>> +4. The pinctrl bindings are listed in dt-bindings/pinctrl/pic32.h.
>> +5. The gpio controller must be described in the pinctrl simple-bus.
>> +
>> +Example:
>> +pinctrl@1f800000{
>> +	#address-cells = <1>;
>> +	#size-cells = <1>;
>> +	compatible = "microchip,pic32-pinctrl", "simple-bus";
>> +	ranges;
>> +	reg = <0x1f801404 0x3c>, /* in  */
>> +	      <0x1f801538 0x57>; /* out */
>> +
>> +	pioA: gpio@1f860000 {
>> +		compatible = "microchip,pic32-gpio";
> 
> The gpio controller is a sub-function of the pinctrl? That doesn't 
> really seem to be the case based on the addresses.
> 

PIC32MZDA has a group of hardware registers that only handles assigning
functions to pins.  We have related this set of hardware registers to a
pinctrl node.  Separately, each bank of pins has its own set of registers
that handle setting input, output, pullup, gpio interrupts, etc.  We have
mapped each of those banks to gpio-controller nodes.  However, the
functionality in hardware for pinmux and pinconf spans both the pinctrl
and gpio node registers. It seems that there is overlap in hardware with
functionality that seems to usually be considered somewhat separate
definitions in standard bindings which is the source of some confusion.

We can make the gpio-controller and pinctrl nodes siblings, but they are
still tightly related. Does the following working example make more sense?

pic32_pinctrl: pinctrl@1f801400{
	#address-cells = <1>;
	#size-cells = <1>;
	compatible = "microchip,pic32mzda-pinctrl";
	reg = <0x1f801400 0x400>;
	clocks = <&PBCLK1>;
};

gpio0: gpio0@1f860000 {
	compatible = "microchip,pic32mzda-gpio";
	reg = <0x1f860000 0x100>;
	interrupts = <118 IRQ_TYPE_LEVEL_HIGH>;
	#gpio-cells = <2>;
	gpio-controller;
	interrupt-controller;
	#interrupt-cells = <2>;
	clocks = <&PBCLK4>;
	gpio-ranges = <&pic32_pinctrl 0 0 16>;
};

gpio1: gpio1@1f860100 {
	compatible = "microchip,pic32mzda-gpio";
	reg = <0x1f860100 0x100>;
	interrupts = <119 IRQ_TYPE_LEVEL_HIGH>;
	#gpio-cells = <2>;
	gpio-controller;
	interrupt-controller;
	#interrupt-cells = <2>;
	clocks = <&PBCLK4>;
	gpio-ranges = <&pic32_pinctrl 0 16 16>;
};

>> +		reg = <0x1f860000 0x24>;
>> +		gpio-controller;
>> +	};
>> +
>> +	/* functions */
>> +	sw1 {
>> +		pinctrl_sw1: sw1-0 {
>> +			pic32,single-pins = <PORT_B 12 PIC32_PIN_CONF_PULLUP>;
> 
> Why isn't this using standard pinctrl properties?
> 

There is no technical reason other than it was based off of existing
bindings in the kernel, albeit, non-standard ones.  This will be reworked
to use standard bindings, with a couple additional microchip, properties
for digital and analog. The following example is the target:

pinctrl_uart2: uart2_0 {
	uart2-tx {
		pins = "G9";
		function = "U2TX";
		microchip,digital;
	};
	uart2-rx {
		pins = "B0";
		function = "U2RX";
		microchip,digital;
	};
};

pinctrl_adc1: adc1_0 {
	pins = "A10";
	microchip,analog-level;
	input-enable;
};


>> +		};
>> +	};
>> +
>> +	uart1 {
>> +		pinctrl_uart1: uart1-0 {
>> +			pic32,pins =
>> +				<PIC32_RP_OUT_RPG7 PIC32_PP_OUT_U1TX PIC32_PIN_CONF_NONE
>> +				 PIC32_RP_IN_RPG8 PIC32_PP_IN_U1RX PIC32_PIN_CONF_NONE>;
>> +		};
>> +	};
>> +};

Thanks for your time,
Josh

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
