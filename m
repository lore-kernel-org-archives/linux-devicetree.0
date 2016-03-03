From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6] arm: pxa: support ICP DAS LP-8x4x FPGA irq
Date: Thu, 3 Mar 2016 16:12:32 -0600
Message-ID: <20160303221232.GA29354@rob-hp-laptop>
References: <1450207582-17957-1-git-send-email-ynvich@gmail.com>
 <1456588562-24715-1-git-send-email-ynvich@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456588562-24715-1-git-send-email-ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Feb 27, 2016 at 06:56:01PM +0300, Sergei Ianovich wrote:
> ICP DAS LP-8x4x contains FPGA chip. The chip functions as an interrupt
> source providing 16 additional interrupts among other things. The
> interrupt lines are muxed to a GPIO pin of a 2nd level PXA-GPIO
> interrupt controller. GPIO pins of the 2nd level controller are in turn
> muxed to a CPU interrupt line.
> 
> Until pxa is completely converted to device tree, it is impossible
> to use IRQCHIP_DECLARE() and the irqdomain needs to added manually.
> Drivers for the on-CPU IRQs and GPIO-IRQs are loaded using
> postcore_initcall(). We need to have all irq domain drivers loaded prior
> to DT parsing in order to allow normal initialization of IRQ resources
> with DT.
> 
> Signed-off-by: Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> CC: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> CC: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> CC: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> 
>    v5..v6
>    fixes according to Rob Herring review comments:
>    * drop wildcards in binding and file names
>    * rename alias 'fpga'->'fpga_irq'
> 
>    fixes according to Marc Zyngier review comments:
>    * use writeb/readb not iowrite8/ioread8
>    * redefine 2nd mask using inversion on 1st
>    * add comments
> 
>    v4..v5
>    * constify struct of_device_id
>    * drop irq number from handler signature
> 
>    v3.2..v4
>    * move DTS binding to a different patch (8/21)
> 
>    v3.1..v3.2
>    fixes to apply Linus Walleij's "Reviewed-by":
>    * add kerneldoc comment for state container struct
>    * rename irq -> hwirq for clarity
>    * drop overzealous error checks from the hotpaths
> 
>    v3..v3.1
>    fixes according to Linus Walleij review comments:
>    * update commit message
>    * use state container instead of global variables
>    * get hardware irq nums from irq_data, don't calculate them
>    * use BIT() macro
>    * add defines for system irq register masks
>    * replace cycle control variable with break
>    * use better names for resource variables
>    * add a linear domain instead of a legacy one
>    * use irq_create_mapping() instead of irq_alloc_desc()
> 
>    v2..v3
>    * no changes (except number 09/16 -> 11/21)
> 
>    v0..v2
>    * extract irqchip and move to drivers/irqchip/
>    * use device tree
>    * use devm helpers where possible
> ---
>  .../interrupt-controller/icpdas-lp8x4x-irq.txt     |  49 ++++
>  drivers/irqchip/Kconfig                            |   5 +
>  drivers/irqchip/Makefile                           |   1 +
>  drivers/irqchip/irq-lp8841.c                       | 246 +++++++++++++++++++++
>  4 files changed, 301 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/icpdas-lp8x4x-irq.txt
>  create mode 100644 drivers/irqchip/irq-lp8841.c
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/icpdas-lp8x4x-irq.txt b/Documentation/devicetree/bindings/interrupt-controller/icpdas-lp8x4x-irq.txt
> new file mode 100644
> index 0000000..a72109b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/icpdas-lp8x4x-irq.txt
> @@ -0,0 +1,49 @@
> +ICP DAS LP-8841 FPGA Interrupt Controller
> +
> +ICP DAS LP-8841 contains FPGA chip. The chip functions as a interrupt
> +source providing 16 additional interrupts among other things.
> +
> +Required properties:
> +- compatible : should be "icpdas,lp8x4x-irq"

You've still got wildcards here. Seems to be an oversight as the example 
and code have "icpdas,lp8841-irq".

> +
> +- reg: physical base address of the controller and length of memory mapped
> +  region.
> +
> +- interrupt-controller : identifies the node as an interrupt controller
> +
> +- #interrupt-cells : should be 1
> +
> +- interrupts : should provide interrupt
> +
> +Optional properties:
> +
> +- interrupt-parent : should provide a link to interrupt controller either
> +		     explicitly and implicitly from a parent node
> +
> +Example:
> +
> +fpgairq: irq@9006 {

Still not right... interrupt-controller@9006

> +	compatible = "icpdas,lp8841-irq";
> +	reg = <0x9006 0x16>;
> +	interrupt-parent = <&gpio>;
> +	interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> +	#interrupt-cells = <1>;
> +	interrupt-controller;
> +	status = "okay";
> +};
> +
> +serial@9050 {
> +	compatible = "icpdas,lp8841-uart";
> +	reg =  <0x9050 0x10
> +		0x9030 0x02>;
> +	interrupts = <13>;
> +	status = "okay";
> +};
> +
> +serial@9060 {
> +	compatible = "icpdas,lp8841-uart";
> +	reg =  <0x9060 0x10
> +		0x9032 0x02>;
> +	interrupts = <14>;
> +	status = "okay";
> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
