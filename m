From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 2/2] dt/bindings: Add bindings for Layerscape external
 irqs
Date: Fri, 27 Sep 2019 11:11:18 -0500
Message-ID: <20190927161118.GA19333@bogus>
References: <20190923101513.32719-1-kurt@linutronix.de>
 <20190923101513.32719-3-kurt@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190923101513.32719-3-kurt@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Kurt Kanzenbach <kurt@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Rasmus Villemoes <rasmus.villemoes@prevas.dk>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 23, 2019 at 12:15:13PM +0200, Kurt Kanzenbach wrote:
> From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> 
> This adds Device Tree binding documentation for the external interrupt
> lines with configurable polarity present on some Layerscape SOCs.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
> ---
> 
> Changes since v5:
> 
>  - Add #address-cells and #size-cells to parent
>  - Mention LS2088A and the ISC unit

Repeating some of my lost comments from v2 2 years ago...

> 
> .../interrupt-controller/fsl,ls-extirq.txt    | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt
> new file mode 100644
> index 000000000000..7b53f9cc8019
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt
> @@ -0,0 +1,47 @@
> +* Freescale Layerscape external IRQs
> +
> +Some Layerscape SOCs (LS1021A, LS1043A, LS1046A, LS2088A) support
> +inverting the polarity of certain external interrupt lines.
> +
> +The device node must be a child of the node representing the
> +Supplemental Configuration Unit (SCFG) or the Interrupt Sampling
> +Control (ISC) Unit.
> +
> +Required properties:
> +- compatible: should be "fsl,<soc-name>-extirq", e.g. "fsl,ls1021a-extirq".
> +- interrupt-controller: Identifies the node as an interrupt controller
> +- #interrupt-cells: Must be 2. The first element is the index of the
> +  external interrupt line. The second element is the trigger type.
> +- interrupt-parent: phandle of GIC.
> +- reg: Specifies the Interrupt Polarity Control Register (INTPCR) in the SCFG.
> +- fsl,extirq-map: Specifies the mapping to interrupt numbers in the parent
> +  interrupt controller. Interrupts are mapped one-to-one to parent
> +  interrupts.

This should be an 'interrupt-map' instead.

> +
> +Optional properties:
> +- fsl,bit-reverse: This boolean property should be set on the LS1021A
> +  if the SCFGREVCR register has been set to all-ones (which is usually
> +  the case), meaning that all reads and writes of SCFG registers are
> +  implicitly bit-reversed. Other compatible platforms do not have such
> +  a register.

Couldn't you just read that register and tell?

Does this apply to only the extirq register or all of scfg?

> +
> +Example:
> +	scfg: scfg@1570000 {
> +		compatible = "fsl,ls1021a-scfg", "syscon";
> +		#address-cells = <1>;
> +		#size-cells = <0>;

As the child node(s) are memory mapped, this should not be 0. And you 
need 'ranges'.

> +		...
> +		extirq: interrupt-controller {
> +			compatible = "fsl,ls1021a-extirq";
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			interrupt-parent = <&gic>;
> +			reg = <0x1ac>;
> +			fsl,extirq-map = <163 164 165 167 168 169>;
> +			fsl,bit-reverse;
> +		};
> +	};
> +
> +
> +	interrupts-extended = <&gic GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&extirq 1 IRQ_TYPE_LEVEL_LOW>;
> -- 
> 2.20.1
> 
