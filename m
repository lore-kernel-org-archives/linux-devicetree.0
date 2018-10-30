From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings/interrupt-controller: rzn1: Add RZ/N1
 gpio irq mux binding
Date: Tue, 30 Oct 2018 18:04:20 -0500
Message-ID: <20181030230420.GA25133@bogus>
References: <20181030104438.27827-1-phil.edworthy@renesas.com>
 <20181030104438.27827-2-phil.edworthy@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181030104438.27827-2-phil.edworthy@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 30, 2018 at 10:44:37AM +0000, Phil Edworthy wrote:
> Add device binding documentation for the Renesas RZ/N1 GPIO interrupt
> multiplexer.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> ---
> v2:
>  - Use interrupt-map to allow the GPIO controller info to be specified
>    as part of the irq.
>  - Don't show status in binding examples.
>  - Don't show the soc/board split in binding doc.
> ---
>  .../interrupt-controller/renesas,rzn1-mux.txt | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rzn1-mux.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzn1-mux.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzn1-mux.txt
> new file mode 100644
> index 000000000000..0b4ba27c00ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzn1-mux.txt
> @@ -0,0 +1,92 @@
> +* Renesas RZ/N1 GPIO Interrupt Multiplexer
> +
> +On Renesas RZ/N1 devices, there are several GPIO Controllers each with a number
> +of interrupt outputs. All of the interrupts from the GPIO Controllers are passed
> +to the GPIO Interrupt Multiplexer, which selects a sub-set of the interrupts to

s/sub-set/subset/

> +pass onto the system interrupt controller.
> +
> +A single node in the device tree is used to describe the GPIO IRQ Muxer.
> +
> +Required properties:
> +- compatible: SoC-specific compatible string "renesas,<soc-specific>-gpioirqmux"
> +  followed by "renesas,rzn1-gpioirqmux" as fallback. The SoC-specific compatible
> +  strings must be one of:
> +	"renesas,r9a06g032-gpioirqmux" for RZ/N1D
> +	"renesas,r9a06g033-gpioirqmux" for RZ/N1S
> +- interrupt-controller: Identifies the node as an interrupt controller.
> +- #interrupt-cells: should be <1>. The meaning of the cells is the input
> +   interrupt index, 0 to 95.
> +- reg: Base address and size of GPIO IRQ Muxer registers.
> +- interrupts: This is a list of interrupt specifiers. Each interrupt consists of
> +   three numbers that represent:
> +     - (a) the index of the GPIO Interrupt Multiplexer output interrupt (0..7)
> +     - (b) the index of the GPIO Controller input interrupt (0..2)
> +     - (c) the interrupt index of the GPIO Controller input interrupt (0..31).
> +- interrupt-parent: A phandle for a local node that specifies an interrupt-map.
> +   The interrupt-map node must specify #interrupt-cells = <3>, and an
> +   interrupt-map property. The interrupt-map is used to translate the interrupt
> +   specifier to the output interrupts. It is used in conjunction with an
> +   interrupt-map-mask property to mask (b) and (c) from the interrupt specifier
> +   so that essentially there is a direct map from (a) to the output interrupt.
> +   Therefore (b) and (c) can be used to determine the interrupt source and
> +   configure the hardware accordingly. For information on interrupts,
> +   see Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> +
> +Example:
> +
> +	The following is an example for the RZ/N1D SoC.

This looks a bit strange...

> +
> +	gpioirqmux: gpioirqmux@51000480 {
> +		compatible = "renesas,r9a06g032-gpioirqmux",
> +				"renesas,rzn1-gpioirqmux";
> +		reg = <0x51000480 0x20>;
> +

> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +		interrupt-parent = <&gpioirqmux_map>;
> +		interrupts =
> +			<0 1 17>,	/* gpio1a 17 */
> +			<1 1 24>,	/* gpio1a 24 */
> +			<2 1 26>;	/* gpio1a 26 */

Remove all these and...

> +
> +		gpioirqmux_map: gpioirqmux-map {

Move everything in this node up a level.

> +			#interrupt-cells = <3>;

This should be 1.

Or perhaps 2 cells if you need the GPIO controller index (cell 2 above). 
But is that numbering really meaningful to the GPIO irq mux or does it 
just have Nx32 inputs? #interrupt-cells should be defined based on the 
GPIO irq mux, not what it is connected to. You could always have a 
single linear number space and mask out bits to get banks if you need 
to.

> +			#address-cells = <0>;
> +			interrupt-map-mask = <7 0 0>;

Then 1 cell here, but the mask should be 31.

> +			interrupt-map =
> +				<0 0 0 &gic GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,

Then this should be:

<17 &gic GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>

> +				<1 0 0 &gic GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,

<24 &gic GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>

If I understand what you are trying to do. :)

If the 0-7 numbering and mapping to the downstream numbering was 
important (i.e. the 1 combined with 1 and 24 in the interrupts 
property), then you can use the index of the interrupt-map entries for 
that.

> +				<2 0 0 &gic GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
> +				<3 0 0 &gic GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
> +				<4 0 0 &gic GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> +				<5 0 0 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> +				<6 0 0 &gic GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> +				<7 0 0 &gic GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;

These all seem to be unused?

> +		};
> +	};
> +
> +	gpio1: gpio@5000c000 {
> +		compatible = "snps,dw-apb-gpio";
> +		reg = <0x5000c000 0x80>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clock-names = "bus";
> +		clocks = <&sysctrl R9A06G032_HCLK_GPIO1>;
> +
> +		gpio1a: gpio-controller@0 {
> +			compatible = "snps,dw-apb-gpio-port";
> +			bank-name = "gpio1a";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			snps,nr-gpios = <32>;
> +			reg = <0>;
> +
> +			interrupt-controller;
> +			interrupt-parent = <&gpioirqmux>;
> +			interrupts =   < 0  1  2  3  4  5  6  7
> +					 8  9 10 11 12 13 14 15
> +					16 17 18 19 20 21 22 23
> +					24 25 26 27 28 29 30 31 >;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> -- 
> 2.17.1
> 
