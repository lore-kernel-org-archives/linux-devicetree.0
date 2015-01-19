From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v3 2/3] mfd: lubbock_io: add lubbock_io board
Date: Mon, 19 Jan 2015 20:09:14 +0100
Message-ID: <87ppaah9k5.fsf@free.fr>
References: <1421406010-14851-1-git-send-email-robert.jarzmik@free.fr>
	<1421406010-14851-2-git-send-email-robert.jarzmik@free.fr>
	<20150119091705.GG21886@x1>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150119091705.GG21886@x1> (Lee Jones's message of "Mon, 19 Jan
	2015 09:17:05 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:

> On Fri, 16 Jan 2015, Robert Jarzmik wrote:
>
>> As a fix, move the gpio0 chained handler setup to a place where we have
>> the guarantee that pxa_gpio_probe() was called before, so that lubbock
>> handler becomes the true IRQ chained handler of GPIO0, demuxing the
>> lubbock IO board interrupts.
>
> How is this guaranteed?
In the following chunk :
	ret = devm_request_irq(&pdev->dev, cot->irq, lubbock_irq_handler,
			       irqflags, dev_name(&pdev->dev), cot);
	if (ret == -ENOSYS)
		return -EPROBE_DEFER;

See __setup_irq(), and see what happens if the irq chip is not set (which
happens on pxa platform when the gpio driver is not registered).

>> + * Lubbock motherboard driver, supporting lubbock (aka. pxa25x) soc board.
>
> Please use uppercase characters i.e. Lubbock, PXA25X, SoC, etc.
OK, your tree, your rules.

> Superfluous '\n'.
Yep.

> Can this be built as a module?
Not in its current form.

> If so, why isn't it a tristate?
See above.

Now the question is : should it be buildable as a module ? I was thinking it
shouldn't because without this driver lubbock becomes a bit useless (most of its
peripherals are on the motherboard).

>> +struct lubbock {
>> +	void __iomem	*base;
>
> Random spacing.
Right.

>> +	pending = readl(cot->base + COT_IRQ_SET_CLR) & cot->irq_mask;
>> +	for_each_set_bit(bit, &pending, LUBBOCK_NB_IRQ)
>> +		generic_handle_irq(irq_find_mapping(cot->irqdomain, bit));
>
> I'd like to see a '\n' here.
OK.

> Again, I'd prefer some separation between code and the return.
>
> (same in all cases below).
OK.
>
>> +	cot = devm_kzalloc(&pdev->dev, sizeof(*cot), GFP_KERNEL);
>> +	if (!cot)
>> +		return -ENOMEM;
>
> '\n' here.
OK.

>> +	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>
> platform_get_irq()?
No. I need the flags.

>> +	if (res) {
>> +		cot->irq = (unsigned int)res->start;
>> +		irqflags = res->flags;
>> +	}
>> +	if (!cot->irq)
>> +		return -ENODEV;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_IRQ, 1);
>
> platform_get_irq()?
Yes, certainly.

>> +	writel(cot->irq_mask, cot->base + COT_IRQ_MASK_EN);
>> +	writel(0, cot->base + COT_IRQ_SET_CLR);
>
> '\n'
OK.
>> +	ret = devm_request_irq(&pdev->dev, cot->irq, lubbock_irq_handler,
>> +			       irqflags, dev_name(&pdev->dev), cot);
>> +	if (ret == -ENOSYS)
>> +		return -EPROBE_DEFER;
>
> I haven't seen anyone do this after devm_request_irq() before.
> Why is it required here?
Explained above.

>
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "Couldn't request main irq : ret = %d\n",
>> +			ret);
>
> I'm not keen on this type of formatting.  Besides the system will
> print out the returned error on failure.
Well, it will print -EINVAL or -ENODEV. When I'll receive an request on the
driver with -ENODEV, how will I know it will come from this request_irq() or
another part of the code ... Well I can remove it if you want, but I think it's
an error.

>> +	cot->irqdomain =
>> +		irq_domain_add_linear(pdev->dev.of_node, LUBBOCK_NB_IRQ,
>> +				      &lubbock_irq_domain_ops, cot);
>
> As a personal preference, I would prefer to see:
>
> 	cot->irqdomain = irq_domain_add_linear(pdev->dev.of_node,
> 					       LUBBOCK_NB_IRQ,
> 					       &lubbock_irq_domain_ops, cot);
Your tree, your rules. OK.

>
>> +	if (!cot->irqdomain)
>> +		return -ENODEV;
>> +
>> +	ret = 0;
>
> 'ret' will be zero here, or we would have returned already.
Good catch. OK.

>> +	if (base_irq)
>> +		ret = irq_create_strict_mappings(cot->irqdomain, base_irq, 0,
>> +						 LUBBOCK_NB_IRQ);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "Couldn't create the irq mapping %d..%d\n",
>> +			base_irq, base_irq + LUBBOCK_NB_IRQ);
>> +		return ret;
>> +	}
>
> Is this solely the check from irq_create_strict_mappings(), therefore
> it should be inside the previous if () { ... }.
As you wish.

>> +	dev_info(&pdev->dev, "base=%p, irq=%d, base_irq=%d\n",
>> +		 cot->base, cot->irq, base_irq);
>
> Please remove this line.
OK.

>> +MODULE_DESCRIPTION("Lubbock driver");
>
> "Lubbock MFD Driver"?
Yes.

>
>> +MODULE_AUTHOR("Robert Jarzmik");
>
> Email.
Sure

Thanks for the review.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
