From: Joe.C <srv_yingjoe.chen@mediatek.com>
Subject: Re: [PATCH] [RFC] Using hierarchy irqdomian to implement MTK intpol.
Date: Thu, 25 Sep 2014 10:16:57 +0800
Message-ID: <1411611417.21763.56.camel@mtksdaap41>
References: <1411574696-1881-1-git-send-email-srv_yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1411574696-1881-1-git-send-email-srv_yingjoe.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jiang Liu <jiang.liu@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Boris BREZILLON <boris.brezillon@free-electrons.com>, Russell King <linux@arm.linux.org.uk>, yingjoe.chen@gmail.com, yh.chen@mediatek.com, nathan.chung@mediatek.com, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, hc.yen@mediatek.com, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


Jiang,

Please consider merge the following 2 changes into your next round.

On Thu, 2014-09-25 at 00:04 +0800, Joe.C wrote:
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index e285f3a..01e852b 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -467,7 +467,7 @@ unsigned int irq_create_of_mapping(struct of_phandle_args *irq_data)
>  	struct irq_domain *domain;
>  	irq_hw_number_t hwirq;
>  	unsigned int type = IRQ_TYPE_NONE;
> -	unsigned int virq;
> +	int virq;
>  
>  	domain = irq_data->np ? irq_find_host(irq_data->np) : irq_default_domain;
>  	if (!domain) {
> @@ -493,8 +493,8 @@ unsigned int irq_create_of_mapping(struct of_phandle_args *irq_data)
>  	else
>  #endif
>  		virq = irq_create_mapping(domain, hwirq);
> -	if (!virq)
> -		return virq;
> +	if (virq <= 0)
> +		return 0;
>  
>  	/* Set type if specified and different than the current one */
>  	if (type != IRQ_TYPE_NONE &&

irq_of_parse_and_map()/of_irq_to_resource() expect
irq_create_of_mapping() to return 0 when fail. Return error code will
cause of_irq_to_resource crash.


> @@ -716,20 +716,20 @@ const struct irq_domain_ops irq_domain_simple_ops = {
>  };
>  EXPORT_SYMBOL_GPL(irq_domain_simple_ops);
>  
> -static int irq_domain_alloc_descs(int virq, unsigned int nr_irqs,
> +static int irq_domain_alloc_descs(int virq, unsigned int cnt,
>  				  irq_hw_number_t hwirq, int node)
>  {
>  	unsigned int hint;
>  
>  	if (virq >= 0) {
> -		virq = irq_alloc_descs(virq, virq, nr_irqs, node);
> +		virq = irq_alloc_descs(virq, virq, cnt, node);
>  	} else {
>  		hint = hwirq % nr_irqs;
>  		if (hint == 0)
>  			hint++;
> -		virq = irq_alloc_descs_from(hint, nr_irqs, node);
> +		virq = irq_alloc_descs_from(hint, cnt, node);
>  		if (virq <= 0 && hint > 1)
> -			virq = irq_alloc_descs_from(1, nr_irqs, node);
> +			virq = irq_alloc_descs_from(1, cnt, node);
>  	}
>  
>  	return virq;

This come from irq_create_mapping(), the original code is using global
nr_irqs. Change to match original behavior.

Joe.C
