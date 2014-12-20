From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] mfd: cottula: add cottula board
Date: Sat, 20 Dec 2014 10:43:48 +0100
Message-ID: <8761d68xm3.fsf@free.fr>
References: <1418598606-21352-1-git-send-email-robert.jarzmik@free.fr>
	<4307800.p21Sk5E3dV@wuerfel> <877fxsapds.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <877fxsapds.fsf-GANU6spQydw@public.gmane.org> (Robert Jarzmik's message of "Mon, 15
	Dec 2014 16:45:03 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org> writes:

> Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:
>
>> On Monday 15 December 2014 00:10:06 Robert Jarzmik wrote:
>>> +
>>> +       platform_set_drvdata(pdev, cot);
>>> +       cot->gpio0 = gpiod_get(&pdev->dev, "lubbock_irq", 0);
>>> +       if (IS_ERR(cot->gpio0)) {
>>> +               dev_err(&pdev->dev, "Couldn't request GPIO : ret = %d\n", ret);
>>> +               return PTR_ERR(cot->gpio0);
>>> +       }
>>> +       cot->irq = gpiod_to_irq(cot->gpio0);
>>> +       if (cot->irq < 0)
>>> +               return cot->irq;
>>> +
>>> +       cot->irqdomain =
>>> +               irq_domain_add_linear(pdev->dev.of_node, COTTULA_NB_IRQ,
>>> +                                     &cottula_irq_domain_ops, cot);
>>> +       if (!cot->irqdomain)
>>> +               return -ENODEV;
>>> +
>>> +       ret = 0;
>>> +       if (base_irq)
>>> +               ret = irq_create_strict_mappings(cot->irqdomain, base_irq, 0,
>>> +                                                COTTULA_NB_IRQ);
>>> 
>>
>> This looks a bit ambiguous: You get a GPIO line for the purpose of the
>> IRQ nesting but don't use the GPIO otherwise, and you pass the device's
>> own irq domain start as an IORESOURCE_IRQ resource.
>>
>> For consistency between DT and ATAGS based uses, and with similar DT
>> based drivers, I would instead recommend passing the parent irq (from
>> the GPIO) as an IORESOURCE_IRQ resource instead of a gpio lookup,
>> and passing the base_irq as platform_data for the ATAGS case.

Hi Arnd,

I thought again about the GPIO.

I put in the "gpiod_get()" call to ensure proper ordering between the gpio
probing and this driver probing. It ensured that this driver's probe will be
defered until the gpio driver is probed, which is the main purpose of this
patch (commit message).

If I pass an irq from the machine code, I loose this guarantee, don't I ?

Cheers.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
