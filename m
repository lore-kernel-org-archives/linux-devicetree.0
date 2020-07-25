Return-Path: <SRS0=7Os6=BE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 628CCC433E3
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jul 2020 14:37:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E65420674
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jul 2020 14:37:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ErGZOZGu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgGYOht (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Jul 2020 10:37:49 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33722 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbgGYOht (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 25 Jul 2020 10:37:49 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06PEbV4k059508;
        Sat, 25 Jul 2020 09:37:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595687851;
        bh=FRzI16aqryxFZRgTRPrG78xGGtYEkkhOAFbIFfGAoK0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ErGZOZGu1kzriIzupSQ9zRCf6WHQmSa1yvsTD4GJr2NKcYchcxhzNdfBT9d38OWH2
         z7gtdZiOM/jZfmUreaNu8KBqIzevmaw/RtRPvpxItUJsrBwIg4YivUGXWXPqZEBC8I
         4nbRyJR7nRti3SVOvKFAvqnw0jKCy+hVJS6hPZ28=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06PEbVPO026044
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 25 Jul 2020 09:37:31 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 25
 Jul 2020 09:37:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 25 Jul 2020 09:37:30 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06PEbQkE017944;
        Sat, 25 Jul 2020 09:37:27 -0500
Subject: Re: [PATCH v3 6/9] irqchip/ti-sci-intr: Add support for INTR being a
 parent to INTR
To:     Marc Zyngier <maz@kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>
References: <20200724141837.4542-1-lokeshvutla@ti.com>
 <20200724141837.4542-7-lokeshvutla@ti.com> <871rkzy9i4.wl-maz@kernel.org>
From:   Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <e19a84ff-d990-d87a-1df0-fd5b10654e3a@ti.com>
Date:   Sat, 25 Jul 2020 20:07:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <871rkzy9i4.wl-maz@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 25/07/20 7:36 pm, Marc Zyngier wrote:
> On Fri, 24 Jul 2020 15:18:34 +0100,
> Lokesh Vutla <lokeshvutla@ti.com> wrote:
>>
>> Driver assumes that Interrupt parent to Interrupt router is always GIC.
>> This is not true always and an Interrupt Router can be a parent to
>> Interrupt Router. Update the driver to detect the parent and request the
>> parent irqs accordingly.
>>
>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>> ---
>>  drivers/irqchip/irq-ti-sci-intr.c | 150 ++++++++++++++++++------------
>>  1 file changed, 91 insertions(+), 59 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-ti-sci-intr.c b/drivers/irqchip/irq-ti-sci-intr.c
>> index 59d51a20bbd8..0b73816e77fc 100644
>> --- a/drivers/irqchip/irq-ti-sci-intr.c
>> +++ b/drivers/irqchip/irq-ti-sci-intr.c
>> @@ -17,29 +17,18 @@
>>  #include <linux/of_irq.h>
>>  #include <linux/soc/ti/ti_sci_protocol.h>
>>  
>> -#define TI_SCI_DEV_ID_MASK	0xffff
>> -#define TI_SCI_DEV_ID_SHIFT	16
>> -#define TI_SCI_IRQ_ID_MASK	0xffff
>> -#define TI_SCI_IRQ_ID_SHIFT	0
>> -#define HWIRQ_TO_DEVID(hwirq)	(((hwirq) >> (TI_SCI_DEV_ID_SHIFT)) & \
>> -				 (TI_SCI_DEV_ID_MASK))
>> -#define HWIRQ_TO_IRQID(hwirq)	((hwirq) & (TI_SCI_IRQ_ID_MASK))
>> -#define TO_HWIRQ(dev, index)	((((dev) & TI_SCI_DEV_ID_MASK) << \
>> -				 TI_SCI_DEV_ID_SHIFT) | \
>> -				((index) & TI_SCI_IRQ_ID_MASK))
>> -
>>  /**
>>   * struct ti_sci_intr_irq_domain - Structure representing a TISCI based
>>   *				   Interrupt Router IRQ domain.
>>   * @sci:	Pointer to TISCI handle
>> - * @dst_irq:	TISCI resource pointer representing GIC irq controller.
>> - * @dst_id:	TISCI device ID of the GIC irq controller.
>> + * @out_irqs:	TISCI resource pointer representing INTR irqs.
>> + * @pdev:	Pointer to platform device.
>>   * @type:	Specifies the trigger type supported by this Interrupt Router
>>   */
>>  struct ti_sci_intr_irq_domain {
>>  	const struct ti_sci_handle *sci;
>> -	struct ti_sci_resource *dst_irq;
>> -	u32 dst_id;
>> +	struct ti_sci_resource *out_irqs;
>> +	struct platform_device *pdev;
>>  	u32 type;
>>  };
>>  
>> @@ -70,15 +59,44 @@ static int ti_sci_intr_irq_domain_translate(struct irq_domain *domain,
>>  {
>>  	struct ti_sci_intr_irq_domain *intr = domain->host_data;
>>  
>> -	if (fwspec->param_count != 2)
>> +	if (fwspec->param_count != 1)
>>  		return -EINVAL;
>>  
>> -	*hwirq = TO_HWIRQ(fwspec->param[0], fwspec->param[1]);
>> +	*hwirq = fwspec->param[0];
>>  	*type = intr->type;
>>  
>>  	return 0;
>>  }
>>  
>> +/**
>> + * ti_sci_intr_xlate_irq() - Translate hwirq to parent's hwirq.
>> + * @intr:	IRQ domain corresponding to Interrupt Router
>> + * @irq:	Hardware irq corresponding to the above irq domain
>> + *
>> + * Return parent irq number if translation is available else -ENOENT.
>> + */
>> +static int ti_sci_intr_xlate_irq(struct ti_sci_intr_irq_domain *intr, u32 irq)
>> +{
>> +	struct device_node *np = dev_of_node(&intr->pdev->dev);
>> +	u32 base, pbase, size, len;
>> +	const __be32 *range;
>> +
>> +	range = of_get_property(np, "ti,interrupt-ranges", &len);
>> +	if (!range)
>> +		return irq;
>> +
>> +	for (len /= sizeof(*range); len >= 3; len -= 3) {
>> +		base = be32_to_cpu(*range++);
>> +		pbase = be32_to_cpu(*range++);
>> +		size = be32_to_cpu(*range++);
>> +
>> +		if (base <= irq && irq < base + size)
>> +			return irq - base + pbase;
>> +	}
>> +
>> +	return -ENOENT;
>> +}
>> +
>>  /**
>>   * ti_sci_intr_irq_domain_free() - Free the specified IRQs from the domain.
>>   * @domain:	Domain to which the irqs belong
>> @@ -89,66 +107,77 @@ static void ti_sci_intr_irq_domain_free(struct irq_domain *domain,
>>  					unsigned int virq, unsigned int nr_irqs)
>>  {
>>  	struct ti_sci_intr_irq_domain *intr = domain->host_data;
>> -	struct irq_data *data, *parent_data;
>> -	u16 dev_id, irq_index;
>> +	struct irq_data *data;
>> +	int out_irq;
>>  
>> -	parent_data = irq_domain_get_irq_data(domain->parent, virq);
>>  	data = irq_domain_get_irq_data(domain, virq);
>> -	irq_index = HWIRQ_TO_IRQID(data->hwirq);
>> -	dev_id = HWIRQ_TO_DEVID(data->hwirq);
>> +	out_irq = (uintptr_t)data->chip_data;
>>  
>> -	intr->sci->ops.rm_irq_ops.free_irq(intr->sci, dev_id, irq_index,
>> -					   intr->dst_id, parent_data->hwirq);
>> -	ti_sci_release_resource(intr->dst_irq, parent_data->hwirq);
>> +	intr->sci->ops.rm_irq_ops.free_irq(intr->sci,
>> +					   intr->pdev->id, data->hwirq,
>> +					   intr->pdev->id, out_irq);
>> +	ti_sci_release_resource(intr->out_irqs, out_irq);
>>  	irq_domain_free_irqs_parent(domain, virq, 1);
>>  	irq_domain_reset_irq_data(data);
>>  }
>>  
>>  /**
>> - * ti_sci_intr_alloc_gic_irq() - Allocate GIC specific IRQ
>> + * ti_sci_intr_alloc_parent_irq() - Allocate parent IRQ
>>   * @domain:	Pointer to the interrupt router IRQ domain
>>   * @virq:	Corresponding Linux virtual IRQ number
>>   * @hwirq:	Corresponding hwirq for the IRQ within this IRQ domain
>>   *
>> - * Returns 0 if all went well else appropriate error pointer.
>> + * Returns parent irq if all went well else appropriate error pointer.
>>   */
>> -static int ti_sci_intr_alloc_gic_irq(struct irq_domain *domain,
>> -				     unsigned int virq, u32 hwirq)
>> +static int ti_sci_intr_alloc_parent_irq(struct irq_domain *domain,
>> +					unsigned int virq, u32 hwirq)
>>  {
>>  	struct ti_sci_intr_irq_domain *intr = domain->host_data;
>> +	struct device_node *parent_node;
>>  	struct irq_fwspec fwspec;
>> -	u16 dev_id, irq_index;
>> -	u16 dst_irq;
>> -	int err;
>> -
>> -	dev_id = HWIRQ_TO_DEVID(hwirq);
>> -	irq_index = HWIRQ_TO_IRQID(hwirq);
>> +	u16 out_irq, p_hwirq;
>> +	int err = 0;
>>  
>> -	dst_irq = ti_sci_get_free_resource(intr->dst_irq);
>> -	if (dst_irq == TI_SCI_RESOURCE_NULL)
>> +	out_irq = ti_sci_get_free_resource(intr->out_irqs);
>> +	if (out_irq == TI_SCI_RESOURCE_NULL)
>>  		return -EINVAL;
>>  
>> -	fwspec.fwnode = domain->parent->fwnode;
>> -	fwspec.param_count = 3;
>> -	fwspec.param[0] = 0;	/* SPI */
>> -	fwspec.param[1] = dst_irq - 32; /* SPI offset */
>> -	fwspec.param[2] = intr->type;
>> +	p_hwirq = ti_sci_intr_xlate_irq(intr, out_irq);
>> +	if (p_hwirq < 0)
>> +		goto err_irqs;
>> +
>> +	parent_node = of_irq_find_parent(dev_of_node(&intr->pdev->dev));
>> +	fwspec.fwnode = of_node_to_fwnode(parent_node);
>> +	if (of_property_read_u32(parent_node, "#interrupt-cells",
>> +				 &fwspec.param_count))
>> +		goto err_irqs;
>> +
>> +	if (of_device_is_compatible(parent_node, "arm,gic-v3")) {
>> +		/* Parent is GIC */
>> +		fwspec.param[0] = 0;	/* SPI */
>> +		fwspec.param[1] = p_hwirq - 32; /* SPI offset */
>> +		fwspec.param[2] = intr->type;
> 
> So you pick up param_count from the parent node, but:
> - you don't check that you have indeed at least 3 cells (unlikely to
>   fail, but still)
> - you leave the rest of the param array uninitialised if param_count
>   was > 3, which is allowed by the GICv3 binding.
> 
> This definitely needs fixing.


Initially I was using count for determining the parent, which was wrong then I
moved to compatible and kept the param_count from parent as is. I could just
assign fwspec.count = 3 directly here. WIll fix in v4.

> 
>> +	} else {
>> +		/* Parent is Interrupt Router */
>> +		fwspec.param[0] = p_hwirq;

and count = 1 here.

>> +	}
>>  
>>  	err = irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
>>  	if (err)
>>  		goto err_irqs;
>>  
>> -	err = intr->sci->ops.rm_irq_ops.set_irq(intr->sci, dev_id, irq_index,
>> -						intr->dst_id, dst_irq);
>> +	err = intr->sci->ops.rm_irq_ops.set_irq(intr->sci,
>> +						intr->pdev->id, hwirq,
>> +						intr->pdev->id, out_irq);
>>  	if (err)
>>  		goto err_msg;
>>  
>> -	return 0;
>> +	return p_hwirq;
>>  
>>  err_msg:
>>  	irq_domain_free_irqs_parent(domain, virq, 1);
>>  err_irqs:
>> -	ti_sci_release_resource(intr->dst_irq, dst_irq);
>> +	ti_sci_release_resource(intr->out_irqs, out_irq);
>>  	return err;
>>  }
>>  
>> @@ -168,18 +197,19 @@ static int ti_sci_intr_irq_domain_alloc(struct irq_domain *domain,
>>  	struct irq_fwspec *fwspec = data;
>>  	unsigned long hwirq;
>>  	unsigned int flags;
>> -	int err;
>> +	int err, p_hwirq;
>>  
>>  	err = ti_sci_intr_irq_domain_translate(domain, fwspec, &hwirq, &flags);
>>  	if (err)
>>  		return err;
>>  
>> -	err = ti_sci_intr_alloc_gic_irq(domain, virq, hwirq);
>> -	if (err)
>> -		return err;
>> +	p_hwirq = ti_sci_intr_alloc_parent_irq(domain, virq, hwirq);
>> +	if (p_hwirq < 0)
>> +		return p_hwirq;
>>  
>>  	irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
>> -				      &ti_sci_intr_irq_chip, NULL);
>> +				      &ti_sci_intr_irq_chip,
>> +				      (void *)(uintptr_t)p_hwirq);
>>  
>>  	return 0;
>>  }
>> @@ -214,6 +244,7 @@ static int ti_sci_intr_irq_domain_probe(struct platform_device *pdev)
>>  	if (!intr)
>>  		return -ENOMEM;
>>  
>> +	intr->pdev = pdev;
>>  	ret = of_property_read_u32(dev_of_node(dev), "ti,intr-trigger-type",
>>  				   &intr->type);
>>  	if (ret) {
>> @@ -230,19 +261,18 @@ static int ti_sci_intr_irq_domain_probe(struct platform_device *pdev)
>>  		return ret;
>>  	}
>>  
>> -	ret = of_property_read_u32(dev_of_node(dev), "ti,sci-dst-id",
>> -				   &intr->dst_id);
>> +	ret = of_property_read_u32(dev_of_node(dev), "ti,sci-dev-id",
>> +				   &pdev->id);
> 
> This feels very dodgy. You are hijacking a random field in the
> platform device data structure, which shouldn't be any of your

pdev->id is pretty much unused field today. I was kind of hoping that in future
it can be utilized to populated field with TISCI device IDs in some generic
manner. So thought of using it now.

> business. What was wrong with having a separate field for something
> that is obviously platform specific?

No reason. I could just add a new filed in the intr structure.

Thanks and regards,
Lokesh
