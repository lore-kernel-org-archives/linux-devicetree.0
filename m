From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 05/15] irqchip: mips-gic: register IRQ domain with
 MIPS_GIC_IRQ_BASE
Date: Fri, 22 May 2015 17:27:02 +0000
Message-ID: <20150522172702.GC19834@io.lakedaemon.net>
References: <1432309875-9712-1-git-send-email-paul.burton@imgtec.com>
 <1432309875-9712-6-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1432309875-9712-6-git-send-email-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, May 22, 2015 at 04:51:04PM +0100, Paul Burton wrote:
> On Malta, some IRQs are still referenced by hardcoded numbers relative
> to MIPS_GIC_IRQ_BASE. When gic_init is called to register the GIC
> without using device tree the irqbase argument allows this base to be
> used. When the GIC is probed using device tree however the base is not
> specified. This leads to conflicts between the GIC interrupts and other
> interrupt controllers.
> 
> TODO: convert Malta (& SEAD3) to drop the hardcoded numbers instead

This will never be seen again. :-P  Why not just go ahead and do it as separate
patch(es) in this series?

thx,

Jason.

> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> ---
> 
>  drivers/irqchip/irq-mips-gic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
> index 57f09cb..697f340 100644
> --- a/drivers/irqchip/irq-mips-gic.c
> +++ b/drivers/irqchip/irq-mips-gic.c
> @@ -858,7 +858,7 @@ static int __init gic_of_init(struct device_node *node,
>  		write_gcr_gic_base(gic_base | CM_GCR_GIC_BASE_GICEN_MSK);
>  	gic_present = true;
>  
> -	__gic_init(gic_base, gic_len, cpu_vec, 0, node);
> +	__gic_init(gic_base, gic_len, cpu_vec, MIPS_GIC_IRQ_BASE, node);
>  
>  	return 0;
>  }
> -- 
> 2.4.1
> 
