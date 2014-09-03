From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 2/2] Documentation: bcm7120-l2: Add Broadcom BCM7120-style
 L2 binding
Date: Wed, 3 Sep 2014 14:13:02 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1409031410580.3333@nanos>
References: <1409265326-7579-1-git-send-email-f.fainelli@gmail.com> <1409265326-7579-3-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409265326-7579-3-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

You forgot to CC the device tree dudes. We want an ack on the bindings
before they materialize in Linus tree.

Thanks,

	tglx

On Thu, 28 Aug 2014, Florian Fainelli wrote:

> This patch adds the Device Tree binding document for the Broadcom
> BCM7120-style Set-top-box Level 2 interrupt controller hardware.
> 
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../interrupt-controller/brcm,bcm7120-l2-intc.txt  | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7120-l2-intc.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7120-l2-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7120-l2-intc.txt
> new file mode 100644
> index 000000000000..3818ffed7347
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7120-l2-intc.txt
> @@ -0,0 +1,44 @@
> +Broadcom BCM7120-style Level 2 interrupt controller
> +
> +Required properties:
> +
> +- compatible: should be "brcm,bcm7120-l2-intc"
> +- reg: specifies the base physical address and size of the registers
> +- interrupt-controller: identifies the node as an interrupt controller
> +- #interrupt-cells: specifies the number of cells needed to encode an interrupt
> +  source, should be 1.
> +- interrupt-parent: specifies the phandle to the parent interrupt controller
> +  this one is cascaded from
> +- interrupts: specifies the interrupt line(s) in the interrupt-parent domain
> +  to be used for cascading
> +- brcm,int-map-mask: 32-bits bit mask describing how the interrupts at this level
> +  map to their respective parents. Should match exactly the number of interrupts
> +  specified in the 'interrupts' property.
> +
> +Optional properties:
> +
> +- interrupt-names: if present, the litteral names for the parent interrupts
> +  specified in the 'interrupts' property.
> +
> +- brcm,irq-can-wake: if present, this means the L2 controller can be used as a
> +  wakeup source for system suspend/resume.
> +
> +- brcm,int-fwd-mask: if present, a 32-bits bit mask describing the interrupts
> +  which need to be enabled in this controller to flow to the higher level
> +  interrupt controller. This is typically needed for the UARTs interrupts to
> +  flow through the top-level interrupt controller (e.g: ARM GIC on ARM-based
> +  platforms).
> +
> +Example:
> +
> +irq0_intc: interrupt-controller@f0406800 {
> +	compatible = "brcm,bcm7120-l2-intc";
> +	interrupt-parent = <&intc>;
> +	#interrupt-cells = <1>;
> +	reg = <0xf0406800 0x8>;
> +	interrupt-controller;
> +	interrupts = <0x0 0x42 0x0>, <0x0 0x40 0x0>;
> +	interrupt-names = "upg_main", "upg_bsc";
> +	brcm,int-map-mask = <0xeb8>, <0x140>;
> +	brcm,int-fwd-mask = <0x7>;
> +};
> -- 
> 1.9.1
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
