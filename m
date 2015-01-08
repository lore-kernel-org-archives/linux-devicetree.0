From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v2] mfd: lubbock_io: add lubbock_io board
Date: Thu, 08 Jan 2015 20:02:04 +0100
Message-ID: <87y4pd2j0z.fsf@free.fr>
References: <1420324515-7444-1-git-send-email-robert.jarzmik@free.fr>
	<20150108133404.GE10537@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150108133404.GE10537@leverpostej> (Mark Rutland's message of
	"Thu, 8 Jan 2015 13:34:05 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "grant.likely@linaro.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> writes:

> Hi Robert,
>
> Given the addition of an of_device_id table and some (implicit) property
> parsing, this requires a device tree binding document.
Yes, you're right. I'll prepare that.

>> +	ret = devm_request_irq(&pdev->dev, cot->irq, lubbock_irq_handler, 0,
>> +			       dev_name(&pdev->dev), cot);
>> +	if (ret == -ENOSYS)
>> +		return -EPROBE_DEFER;
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "Couldn't request GPIO : ret = %d\n", ret);
>> +		return ret;
>> +	}
>> +	irq_set_irq_type(cot->irq, IRQ_TYPE_EDGE_FALLING);
>
> Shouldn't that be in the interrupt-specifier when using DT?
Maybe. But what about the platform data case ? I think I wanted to express the
multiple-NOR gate binding all incoming level interrupt into the output cot->irq
interrupt line going to GPIO0.

Do you have an idea for the platform data case ?
>> +static const struct of_device_id lubbock_id_table[] = {
>> +	{ .compatible = "marvell,lubbock_io", },

> When PXA25x it was Intel, not Marvell. So I think the vendor prefix
> should be "intel".
>
> Also s/_/-/ in property names and compatible strings please.
Ok for v3.

Thanks for the review.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
