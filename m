From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 02/10] irqchip: mtk-sysirq: extend intpol base to
 arbitrary number
Date: Thu, 9 Feb 2017 09:03:34 +0000
Message-ID: <2079ad73-6d7d-d20f-2945-68ea9fbd9b50@arm.com>
References: <1486383336-16892-1-git-send-email-mars.cheng@mediatek.com>
 <1486383336-16892-3-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1486383336-16892-3-git-send-email-mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Loda Chou <loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jades Shih <jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, My Chuang <my.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chieh-Jay Liu <Chieh-Jay.Liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/02/17 12:15, Mars Cheng wrote:
> Originally driver only supports one base. However, MT6797 has
> more than one bases to configure interrupt polarity. To support
> possible design change, here comes a solution to use arbitrary
> number of bases.
> 
> Signed-off-by: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/irqchip/irq-mtk-sysirq.c |   71 +++++++++++++++++++++++++++-----------
>  1 file changed, 50 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-mtk-sysirq.c b/drivers/irqchip/irq-mtk-sysirq.c
> index 63ac73b..2645706 100644
> --- a/drivers/irqchip/irq-mtk-sysirq.c
> +++ b/drivers/irqchip/irq-mtk-sysirq.c
> @@ -24,7 +24,9 @@
>  
>  struct mtk_sysirq_chip_data {
>  	spinlock_t lock;
> -	void __iomem *intpol_base;
> +	u32 nr_intpol_bases;
> +	void __iomem **intpol_bases;
> +	u32 *intpol_words;
>  };
>  
>  static int mtk_sysirq_set_type(struct irq_data *data, unsigned int type)
> @@ -33,13 +35,15 @@ static int mtk_sysirq_set_type(struct irq_data *data, unsigned int type)
>  	struct mtk_sysirq_chip_data *chip_data = data->chip_data;
>  	u32 offset, reg_index, value;
>  	unsigned long flags;
> -	int ret;
> +	int ret, i;
>  
>  	offset = hwirq & 0x1f;
>  	reg_index = hwirq >> 5;
> +	for (i = 0; reg_index >= chip_data->intpol_words[i]; i++)
> +		reg_index -= chip_data->intpol_words[i];

Two questions:
- What guarantees that two successive regions deal with consecutive
interrupts? For example, if I have region A that deals with interrupts
0-31, what guarantees that region B covers 32-63?
- Given that there is a static relation between a region and a hwirq,
can't you compute this relation at init time, and let set_type be a fast
path?

>  
>  	spin_lock_irqsave(&chip_data->lock, flags);
> -	value = readl_relaxed(chip_data->intpol_base + reg_index * 4);
> +	value = readl_relaxed(chip_data->intpol_bases[i] + reg_index * 4);
>  	if (type == IRQ_TYPE_LEVEL_LOW || type == IRQ_TYPE_EDGE_FALLING) {
>  		if (type == IRQ_TYPE_LEVEL_LOW)
>  			type = IRQ_TYPE_LEVEL_HIGH;
> @@ -49,7 +53,8 @@ static int mtk_sysirq_set_type(struct irq_data *data, unsigned int type)
>  	} else {
>  		value &= ~(1 << offset);
>  	}
> -	writel(value, chip_data->intpol_base + reg_index * 4);
> +
> +	writel(value, chip_data->intpol_bases[i] + reg_index * 4);

Why do you have a writel here, while you're using relaxed accessors
otherwise? Is there anything else that needs to be made visible to the
irqchip?

>  
>  	data = data->parent_data;
>  	ret = data->chip->irq_set_type(data, type);
> @@ -124,8 +129,7 @@ static int __init mtk_sysirq_of_init(struct device_node *node,
>  {
>  	struct irq_domain *domain, *domain_parent;
>  	struct mtk_sysirq_chip_data *chip_data;
> -	int ret, size, intpol_num;
> -	struct resource res;
> +	int ret, size, intpol_num = 0, nr_intpol_bases, i;
>  
>  	domain_parent = irq_find_host(parent);
>  	if (!domain_parent) {
> @@ -133,36 +137,61 @@ static int __init mtk_sysirq_of_init(struct device_node *node,
>  		return -EINVAL;
>  	}
>  
> -	ret = of_address_to_resource(node, 0, &res);
> -	if (ret)
> -		return ret;
> -
>  	chip_data = kzalloc(sizeof(*chip_data), GFP_KERNEL);
>  	if (!chip_data)
>  		return -ENOMEM;
>  
> -	size = resource_size(&res);
> -	intpol_num = size * 8;
> -	chip_data->intpol_base = ioremap(res.start, size);
> -	if (!chip_data->intpol_base) {
> -		pr_err("mtk_sysirq: unable to map sysirq register\n");
> -		ret = -ENXIO;
> -		goto out_free;
> +	if (of_property_read_u32(node, "#intpol-bases", &nr_intpol_bases))
> +		nr_intpol_bases = 1;
> +
> +	chip_data->intpol_words =
> +		kcalloc(nr_intpol_bases, sizeof(u32), GFP_KERNEL);

Please keep the assignment on a single line.

> +	if (!chip_data->intpol_words) {
> +		ret = -ENOMEM;
> +		goto out_free_chip;
> +	}
> +
> +	chip_data->intpol_bases =
> +		kcalloc(nr_intpol_bases, sizeof(void __iomem *), GFP_KERNEL);

Same here.

> +	if (!chip_data->intpol_bases) {
> +		ret = -ENOMEM;
> +		goto out_free_intpol_words;
> +	}
> +
> +	for (i = 0; i < nr_intpol_bases; i++) {
> +		struct resource res;
> +
> +		ret = of_address_to_resource(node, i, &res);
> +		size = resource_size(&res);
> +		intpol_num += size * 8;
> +		chip_data->intpol_words[i] = size / 4;
> +		chip_data->intpol_bases[i] = of_iomap(node, i);
> +		if (ret || !chip_data->intpol_bases[i]) {
> +			pr_err("%s: couldn't map region %d\n",
> +			       node->full_name, i);
> +			ret = -ENODEV;
> +			goto out_free_intpol;
> +		}
>  	}
>  
>  	domain = irq_domain_add_hierarchy(domain_parent, 0, intpol_num, node,
>  					  &sysirq_domain_ops, chip_data);
>  	if (!domain) {
>  		ret = -ENOMEM;
> -		goto out_unmap;
> +		goto out_free_intpol;
>  	}
>  	spin_lock_init(&chip_data->lock);
>  
>  	return 0;
>  
> -out_unmap:
> -	iounmap(chip_data->intpol_base);
> -out_free:
> +out_free_intpol:
> +	for (i = 0; i < nr_intpol_bases; i++)
> +		if (chip_data->intpol_bases[i])
> +			iounmap(chip_data->intpol_bases[i]);
> +	kfree(chip_data->intpol_bases);
> +out_free_intpol_words:
> +	kfree(chip_data->intpol_words);
> +out_free_chip:
>  	kfree(chip_data);
>  	return ret;
>  }
> 

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
