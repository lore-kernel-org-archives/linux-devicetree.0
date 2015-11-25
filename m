From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 19/19] irqchip/mips-gic: Add new DT property to
 reserve IPIs
Date: Wed, 25 Nov 2015 10:09:11 -0600
Message-ID: <20151125160849.GA21688@rob-hp-laptop>
References: <1448453217-3874-1-git-send-email-qais.yousef@imgtec.com>
 <1448453217-3874-20-git-send-email-qais.yousef@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448453217-3874-20-git-send-email-qais.yousef@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Qais Yousef <qais.yousef@imgtec.com>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, jiang.liu@linux.intel.com, ralf@linux-mips.org, linux-mips@linux-mips.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 25, 2015 at 12:06:57PM +0000, Qais Yousef wrote:
> The new property will allow to specify the range of GIC hwirqs to use for IPIs.
> 
> This is an optinal property. We preserve the previous behaviour of allocating
> the last 2 * gic_vpes if it's not specified or DT is not supported.
> 
> Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>
> Cc: devicetree@vger.kernel.org

Acked-by: Rob Herring <robh@kernel.org>

> 
> ---
>  .../devicetree/bindings/interrupt-controller/mips-gic.txt    |  7 +++++++
>  drivers/irqchip/irq-mips-gic.c                               | 12 ++++++++++--
>  2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt b/Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
> index aae4c384ee1f..173595305e26 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
> @@ -23,6 +23,12 @@ Optional properties:
>  - mti,reserved-cpu-vectors : Specifies the list of CPU interrupt vectors
>    to which the GIC may not route interrupts.  Valid values are 2 - 7.
>    This property is ignored if the CPU is started in EIC mode.
> +- mti,reserved-ipi-vectors : Specifies the range of GIC interrupts that are
> +  reserved for IPIs.
> +  It accepts 2 values, the 1st is the starting interrupt and the 2nd is the size
> +  of the reserved range.
> +  If not specified, the driver will allocate the last 2 * number of VPEs in the
> +  system.
>  
>  Required properties for timer sub-node:
>  - compatible : Should be "mti,gic-timer".
> @@ -44,6 +50,7 @@ Example:
>  		#interrupt-cells = <3>;
>  
>  		mti,reserved-cpu-vectors = <7>;
> +		mti,reserved-ipi-vectors = <40 8>;
>  
>  		timer {
>  			compatible = "mti,gic-timer";
> diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
> index c7043a15253b..659fe734d1b7 100644
> --- a/drivers/irqchip/irq-mips-gic.c
> +++ b/drivers/irqchip/irq-mips-gic.c
> @@ -945,6 +945,7 @@ static void __init __gic_init(unsigned long gic_base_addr,
>  			      struct device_node *node)
>  {
>  	unsigned int gicconfig;
> +	unsigned int v[2];
>  
>  	gic_base = ioremap_nocache(gic_base_addr, gic_addrspace_size);
>  
> @@ -1013,8 +1014,15 @@ static void __init __gic_init(unsigned long gic_base_addr,
>  
>  	gic_ipi_domain->bus_token = DOMAIN_BUS_IPI;
>  
> -	/* Make the last 2 * NR_CPUS available for IPIs */
> -	bitmap_set(ipi_resrv, gic_shared_intrs - 2 * gic_vpes, 2 * gic_vpes);
> +	if (node &&
> +	    !of_property_read_u32_array(node, "mti,reserved-ipi-vectors", &v, 2)) {
> +		bitmap_set(ipi_resrv, v[0], v[1]);
> +	} else {
> +		/* Make the last 2 * gic_vpes available for IPIs */
> +		bitmap_set(ipi_resrv,
> +			   gic_shared_intrs - 2 * gic_vpes,
> +			   2 * gic_vpes);
> +	}
>  
>  	gic_basic_init();
>  }
> -- 
> 2.1.0
> 
