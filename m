From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCHv2 02/10] ARM: vic: MULTI_IRQ_HANDLER handler
Date: Wed, 28 Sep 2011 15:39:05 -0500
Message-ID: <20110928203905.GB2838@ponder.secretlab.ca>
References: <1317206507-18867-1-git-send-email-jamie@jamieiles.com>
	<1317206507-18867-3-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1317206507-18867-3-git-send-email-jamie@jamieiles.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, linus.walleij@stericsson.com, marc.zyngier@arm.com, devicetree-discuss@lists.ozlabs.org, rmallon@gmail.com, rob.herring@calxeda.com, hsweeten@visionengravers.com, rajeev-dlh.kumar@st.com, ben-linux@fluff.org, STEricsson_nomadik_linux@list.st.com, linux-arm-kernel@lists.infradead.org, rubini@unipv.it
List-Id: devicetree@vger.kernel.org

On Wed, Sep 28, 2011 at 11:41:39AM +0100, Jamie Iles wrote:
> Add a handler for the VIC that is suitable for MULTI_IRQ_HANDLER
> platforms.  This can replace the ASM entry macros for platforms that use
> the VIC.
> 
> v2:	- allow the handler be used for !CONFIG_OF
> 	- use irq_domain_to_irq()
> 
> Cc: Rob Herring <robherring2@gmail.com>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>
> ---
>  arch/arm/common/vic.c               |   29 +++++++++++++++++++++++++++++
>  arch/arm/include/asm/hardware/vic.h |    4 ++++
>  2 files changed, 33 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/common/vic.c b/arch/arm/common/vic.c
> index 3f9c8f2..71adced 100644
> --- a/arch/arm/common/vic.c
> +++ b/arch/arm/common/vic.c
> @@ -427,3 +427,32 @@ int __init vic_of_init(struct device_node *node, struct device_node *parent)
>  	return -EIO;
>  }
>  #endif /* CONFIG OF */
> +
> +#ifdef CONFIG_MULTI_IRQ_HANDLER
> +static void vic_single_handle_irq(struct vic_device *vic, struct pt_regs *regs)
> +{
> +	u32 stat, irq;
> +	bool handled = false;
> +
> +	while (!handled) {
> +		stat = readl_relaxed(vic->base + VIC_IRQ_STATUS);
> +		if (!stat)
> +			break;
> +
> +		while (stat) {
> +			irq = fls(stat) - 1;
> +			handle_IRQ(irq_domain_to_irq(&vic->domain, irq), regs);
> +			stat &= ~(1 << irq);
> +			handled = true;
> +		}
> +	}

I don't follow why this is written this way.  The way I see it, there
are two conditions:
1) first read will show no irqs pending (!stat), which will break out
   of the outer while() loop.

2) or there will be irqs pending, it will enter the second while()
   loop, which unconditionally sets the handled flag, and causes the
   outer loop to exit immediately after the inner loop exits.

Why isn't it simply written this way:

	stat = readl_relaxed(vic->base + VIC_IRQ_STATUS);
	while (stat) {
		irq = fls(stat) - 1;
		handle_IRQ(irq_domain_to_irq(&vic->domain, irq), regs);
		stat &= ~(1 << irq);
	}

g.
