From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] irqchip: add support for LS1021A external interrupt lines
Date: Tue, 12 Dec 2017 17:28:39 -0600
Message-ID: <20171212232839.yy3jtn6amktqjo4g@rob-hp-laptop>
References: <48d2d08c-c57a-ce49-5958-0fd5ad4a2dc7@arm.com>
 <1512743580-15358-1-git-send-email-rasmus.villemoes@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1512743580-15358-1-git-send-email-rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 08, 2017 at 03:33:00PM +0100, Rasmus Villemoes wrote:
> The LS1021A allows inverting the polarity of six interrupt lines
> IRQ[0:5] via the scfg_intpcr register, effectively allowing
> IRQ_TYPE_LEVEL_LOW and IRQ_TYPE_EDGE_FALLING for those. We just need to
> check the type, set the relevant bit in INTPCR accordingly, and fixup
> the type argument before calling the GIC's irq_set_type.
> 
> In fact, the power-on-reset value of the INTPCR register is so that all
> six lines have their polarity inverted. Hence any hardware connected to
> those lines is unusable without this: If the line is indeed active low,
> the generic GIC code will reject an irq spec with IRQ_TYPE_LEVEL_LOW,
> while if the line is active high, we must obviously disable the polarity
> inversion before unmasking the interrupt.
> 
> I suspect other layerscape SOCs may have something similar, but I have
> neither hardware nor documentation.
> 
> Since we only need to keep a single pointer in the chip_data (the syscon
> regmap), the code could be a little simpler by dropping the struct
> extirq_chip_data and just store the regmap directly - but I don't know
> if I do need to add a lock or something else to the chip_data, so for
> this RFC I've kept the struct.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
> ---
> Marc, Alexander, thanks a lot for your hints. This is what I came up
> with, mostly just copy-pasted from the mtk-sysirq case. I've tested
> that it works as expected on my board.
> 
>  .../interrupt-controller/fsl,ls1021a-extirq.txt    |  19 +++

Please split to separate patch.

>  drivers/irqchip/Makefile                           |   1 +
>  drivers/irqchip/irq-ls1021a.c                      | 157 +++++++++++++++++++++
>  3 files changed, 177 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,ls1021a-extirq.txt
>  create mode 100644 drivers/irqchip/irq-ls1021a.c
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls1021a-extirq.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls1021a-extirq.txt
> new file mode 100644
> index 000000000000..53b04b6e1a80
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls1021a-extirq.txt
> @@ -0,0 +1,19 @@
> +* Freescale LS1021A external IRQs
> +
> +The LS1021A supports inverting the polarity of six external interrupt lines.
> +
> +Required properties:
> +- compatible: should be "fsl,ls1021a-extirq"
> +- interrupt-controller: Identifies the node as an interrupt controller
> +- #interrupt-cells: Use the same format as specified by GIC in arm,gic.txt.
> +- interrupt-parent: phandle of GIC.
> +- syscon: phandle of Supplemental Configuration Unit (scfg).

Can this be a child of that node instead?

> +
> +Example:
> +		extirq: interrupt-controller@15701ac {

Unit-address without reg is not valid. Building with W=1 will tell you 
this.

> +			compatible = "fsl,ls1021a-extirq";
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			interrupt-parent = <&gic>;
> +			syscon = <&scfg>;
> +		};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
