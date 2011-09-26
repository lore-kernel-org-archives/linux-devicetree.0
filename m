From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: gic: add OF based initialization
Date: Mon, 26 Sep 2011 15:49:11 -0500
Message-ID: <4E80E547.2080004@gmail.com>
References: <1316550244-3655-1-git-send-email-robherring2@gmail.com>
	<1316550244-3655-4-git-send-email-robherring2@gmail.com>
	<20110926195704.GD9194@gallagher>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110926195704.GD9194@gallagher>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/26/2011 02:57 PM, Jamie Iles wrote:
> Hi Rob,
> 
> On Tue, Sep 20, 2011 at 03:24:04PM -0500, Rob Herring wrote:
> [...]
>> +int __init gic_of_init(struct device_node *node, struct device_node *parent)
>> +{
>> +	void __iomem *cpu_base;
>> +	void __iomem *dist_base;
>> +	int irq;
>> +	struct irq_domain *domain = &gic_data[gic_cnt].domain;
>> +
>> +	if (WARN_ON(!node))
>> +		return -ENODEV;
>> +
>> +	dist_base = of_iomap(node, 0);
>> +	WARN(!dist_base, "unable to map gic dist registers\n");
>> +
>> +	cpu_base = of_iomap(node, 1);
>> +	WARN(!cpu_base, "unable to map gic cpu registers\n");
>> +
>> +	domain->nr_irq = gic_irq_count(dist_base);
>> +	/* subtract off SGIs. Also subtract off PPIs for secondary GICs */
>> +	if (parent)
>> +		domain->nr_irq -= 32;
>> +	else
>> +		domain->nr_irq -= 16;
>> +
>> +	domain->irq_base = irq_alloc_descs(-1, 16, domain->nr_irq, numa_node_id());
> 
> The way I understand irq_alloc_descs() (probably not very well) is that 
> having the irq parameter < 0 and the from parameter 16 means that it 
> needs to find domain->nr_irq descs starting from at least 16.  But if 
> the base is greater than 16, does this still work with the gic entry 
> macros as they are?

No, but that would only happen if a platform calls irq_alloc_descs prior
to this code. The root controller must be initialized first (for other
reasons as well). There are no calls to irq_alloc_descs in arch/arm.

With the MULTI_IRQ GIC support Marc Z is working on, we could make the
GIC irq mapping be completely dynamic. Although, there's probably not
much reason to do so for the root controller.

Rob
