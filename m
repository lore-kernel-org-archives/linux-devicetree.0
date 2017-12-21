From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] dt/bindings: Add bindings for Layerscape external
 irqs
Date: Thu, 21 Dec 2017 16:44:00 -0600
Message-ID: <20171221224400.26hq6rqjrj6oefqt@rob-hp-laptop>
References: <1512743580-15358-1-git-send-email-rasmus.villemoes@prevas.dk>
 <1513758631-19909-1-git-send-email-rasmus.villemoes@prevas.dk>
 <1513758631-19909-2-git-send-email-rasmus.villemoes@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1513758631-19909-2-git-send-email-rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andy Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 20, 2017 at 09:30:30AM +0100, Rasmus Villemoes wrote:
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
> ---
>  .../interrupt-controller/fsl,ls-extirq.txt         | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt
> new file mode 100644
> index 000000000000..7e4680866364
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt
> @@ -0,0 +1,37 @@
> +* Freescale Layerscape external IRQs
> +
> +Some Layerscape SOCs (LS1021A, LS1043A, LS1046A) support inverting
> +the polarity of certain external interrupt lines.
> +
> +Required properties:
> +- compatible: should be "fsl,<soc-name>-extirq", e.g. "fsl,ls1021a-extirq".
> +- interrupt-controller: Identifies the node as an interrupt controller
> +- #interrupt-cells: Use the same format as specified by GIC in arm,gic.txt.
> +- interrupt-parent: phandle of GIC.
> +- syscon: phandle of Supplemental Configuration Unit (scfg) and offset
> +  to the INTPCR register.
> +- interrupts: Specifies the mapping to interrupt numbers in the parent
> +  interrupt controller. Interrupts are mapped one-to-one to parent
> +  interrupts.
> +
> +Optional properties:
> +- bit-reverse: This boolean property should be set on the LS1021A if

fsl,bit-reverse

> +  the SCFGREVCR register has been set to all-ones (which is usually
> +  the case), meaning that all reads and writes of SCFG registers are
> +  implicitly bit-reversed. Other compatible platforms do not have such
> +  a register.
> +
> +Example:
> +	extirq: extirq {

Node name should still be "interrupt-controller".

> +		compatible = "fsl,ls1021a-extirq";
> +		#interrupt-cells = <3>;
> +		interrupt-controller;
> +		interrupt-parent = <&gic>;
> +		syscon = <&scfg 0x1ac>;
> +		interrupts = <163 164 165 167 168 169>;
> +		bit-reverse;
> +	};
> +
> +
> +	interrupts-extended = <&gic GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&extirq GIC_SPI 1 IRQ_TYPE_LEVEL_LOW>;
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
