From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] Add initial SX3000b platform related documentation to
 document tree
Date: Tue, 28 Mar 2017 19:55:09 -0500
Message-ID: <20170329005509.z7pa6rp5kt5xftg4@rob-hp-laptop>
References: <AM4PR0201MB21799759E18C64A7032A2C3EE43C0@AM4PR0201MB2179.eurprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM4PR0201MB21799759E18C64A7032A2C3EE43C0@AM4PR0201MB2179.eurprd02.prod.outlook.com>
Sender: linux-doc-owner@vger.kernel.org
To: Amit Kama IL <Amit.Kama@satixfy.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 22, 2017 at 05:59:49AM +0000, Amit Kama IL wrote:
> Add initial SX3000b platform related documentation to document tree:
>  - Vendor prefix
>  - Platform binding documentation
>  - Interrupt Controller Unit binding documentation.

Probably should be 3 patches. Preferred subject prefix is "dt-bindings: 
..."

> 
> Signed-off-by: Amit Kama <amit.kama@staixfy.com>
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/satixfy-icu.txt b/Documentation/devicetree/bindings/interrupt-controller/satixfy-icu.txt
> index 0000000..1893393
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/satixfy-icu.txt
> @@ -0,0 +1,47 @@
> +Satixfy SX3000B Interrupt Controller Unit (ICU)
> +
> +The ICU routes HW interrupts from the inter-module fabric to the
> +processor. For the MIPS interaptive, all interrupts are then routed

interaptive or interaptiv? I see both in the doc.


> +to the GIC.
> +
> +Required properties:
> +- compatible : Should be "satixfy,icu".

icu is fairly generic sounding. Should be satixfy,sx3000b-icu.

> +- reg - must be present and equal <0x1D4D0000 0x1C0>
> +- interrupt-controller : Identifies the node as an interrupt controller
> +- #interrupt-cells : Specifies the number of cells needed to encode an
> +  interrupt specifier.  Should be 1 - the GIC interrupt number
> +- interrupt-parent - Currently only the MIPS GIC is supported, so
> +<&gic> must be specified as parent
> +- interrupts : in interrupt parent form. For GIC it's
> +<GIC_SHARED x IRQ_TYPE_EDGE_RISING> where x is the interrupt number
> +allocated for ICU in GIC.
> +
> +
> +
> +
> +
> +Example:
> +
> +	icu: interrupt-controller@1d4d0000 {
> +		compatible = "sx,icu";
> +		reg = <0x1D4D0000 0x1C0>;

lowercase

> +
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SHARED 25 IRQ_TYPE_EDGE_RISING>;
> +	};
> +
> +	uart0: uart@1D4D09C0 {

serial@1d4d09c0

> +		compatible = "ns16550a";
> +		reg = <0x1D4D09C0 0x100>;

lowercase

> +
> +		interrupt-parent = <&icu>;
> +		interrupts = <3>;
> +
> +		clock-frequency = <270000000>;
> +
> +		reg-shift = <2>;
> +		reg-io-width = <4>;
> +	};
> diff --git a/Documentation/devicetree/bindings/mips/satixfy/sx3000b.txt b/Documentation/devicetree/bindings/mips/satixfy/sx3000b.txt
> index 0000000..7cae67b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/satixfy/sx3000b.txt
> @@ -0,0 +1,37 @@
> +Satixfy SX3000b SoC
> +=========================
> +
> +Required properties:
> +--------------------
> + - compatible: Must include "satixfy,sx3000".

The "b" in SX3000b is not significant?

> +
> +CPU nodes:
> +----------
> +A "cpus" node is required.  Required properties:
> + - #address-cells: Must be 1.
> + - #size-cells: Must be 0.
> +A CPU sub-node is also required for at least CPU 0.  Since the topology may
> +be probed via CPS, it is not necessary to specify secondary CPUs.  Required
> +properties:
> + - device_type: Must be "cpu".
> + - compatible: Must be "mti,interaptiv".
> + - reg: CPU number.
> + - clocks: Must include the CPU clock.  See ../../clock/clock-bindings.txt for
> +   details on clock bindings.
> +Example:
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "mti,interaptiv";
> +			clocks	= <&ext>;
> +			reg = <0>;
> +		};
> +	};
> +
> +Interrupt controllers:
> +----------------------
> +Two nodes are required:
> + - mips,gic - MIPS Global Interrupt Controller - see Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
> + - satixfy,icu - SX3000b SoC Interrupt Controller Unit - see Documentation/devicetree/bindings/interrupt-controller/satixfy-icu.txt
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index ec0bfb9..76819dd
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -261,6 +261,7 @@ rockchip	Fuzhou Rockchip Electronics Co., Ltd
>  samsung	Samsung Semiconductor
>  samtec	Samtec/Softing company
>  sandisk	Sandisk Corporation
> +satixfy Satixfy Technologies Ltd
>  sbs	Smart Battery System
>  schindler	Schindler
>  seagate	Seagate Technology PLC
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
