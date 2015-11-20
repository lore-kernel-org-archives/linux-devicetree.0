From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] devicetree: add binding for Sigma Designs SMP86xx
 interrupt controller
Date: Fri, 20 Nov 2015 10:23:04 -0600
Message-ID: <20151120162304.GA28663@rob-hp-laptop>
References: <1447958026-3015-1-git-send-email-mans@mansr.com>
 <1447958026-3015-2-git-send-email-mans@mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447958026-3015-2-git-send-email-mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 19, 2015 at 06:33:45PM +0000, Mans Rullgard wrote:
> This adds a binding for the secondary interrupt controller in
> Sigma Designs SMP86xx and SMP87xx chips.
> 
> Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
> ---
>  .../interrupt-controller/sigma,smp8642-intc.txt    | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sigma,smp8642-intc.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sigma,smp8642-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/sigma,smp8642-intc.txt
> new file mode 100644
> index 0000000..f82cddf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sigma,smp8642-intc.txt
> @@ -0,0 +1,47 @@
> +Sigma Designs SMP86xx/SMP87xx secondary interrupt controller
> +
> +Required properties:
> +- compatible: should be "sigma,smp8642-intc"
> +- reg: physical address of MMIO region
> +- interrupt-parent: phandle of parent interrupt controller
> +- interrupt-controller: boolean
> +
> +One child node per control block with properties:
> +- sigma,reg-offset: offset of registers from main base address

Your driver defines these offsets too.

Do you expect to have many different variations here? If not, I would 
get rid of all the child nodes and just hard code it in the driver.

You could also simply do:

sigma,reg-offset = <0x0 0x100 0x300>;

> +- interrupt-controller: boolean
> +- #interrupt-cells: should be <2>, interrupt index and flags per interrupts.txt
> +- interrupts: interrupt spec of primary interrupt controller
> +- label: (optional) name for display purposes

NAK. Interrupt controllers are not really visible to users. Think of 
physical labels on things like connectors or LEDs.

> +
> +Example:
> +
> +intc: interrupt-controller@6e000 {
> +	compatible = "sigma,smp8642-intc";
> +	reg = <0x6e000 0x400>;
> +	interrupt-parent = <&gic>;
> +	interrupt-controller;
> +
> +	irq0: irq0 {
> +		sigma,reg-offset = <0x000>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> +		label = "IRQ0";
> +	};
> +
> +	irq1: irq1 {
> +		sigma,reg-offset = <0x100>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> +		label = "IRQ1";
> +	};
> +
> +	irq2: irq2 {
> +		sigma,reg-offset = <0x300>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> +		label = "IRQ2";
> +	};
> +};
> -- 
> 2.6.3
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
