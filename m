Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:48808 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754380Ab3HVVIS (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 22 Aug 2013 17:08:18 -0400
Message-ID: <52167DBC.8040105@wwwdotorg.org>
Date: Thu, 22 Aug 2013 15:08:12 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] gpio: interrupt consistency check for OF GPIO IRQs
References: <1377092334-770-1-git-send-email-larsi@wh2.tu-dresden.de> <1507189.CRWvzVJqTV@flatron> <521548E3.6010703@wwwdotorg.org> <201308221101.30316.poeschel@lemonage.de>
In-Reply-To: <201308221101.30316.poeschel@lemonage.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Lars Poeschel <larsi@wh2.tu-dresden.de>, grant.likely@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, ian.campbell@citrix.com, galak@codeaurora.org, pawel.moll@arm.com, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Enric Balletbo i Serra <eballetbo@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, Balaji T K <balajitk@ti.com>, Tony Lindgren <tony@atomide.com>, Jon Hunter <jgchunter@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On 08/22/2013 03:01 AM, Lars Poeschel wrote:
> On Thursday 22 August 2013 at 01:10:27, Stephen Warren wrote:
>> On 08/21/2013 03:49 PM, Tomasz Figa wrote:
>>>> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c

>>>> +			 */
>>>> +			if (irq_domain && irq_domain->ops->xlate)
>>>> +				irq_domain->ops->xlate(irq_domain, gcn,
>>>> +						       intspec + i, intsize,
>>>> +						       &hwirq, &type);
>>>> +			else
>>>> +				hwirq = intspec[0];
>>>
>>> Is it a correct fallback when irq_domain is NULL?
>>
>> Indeed this fallback is dangerous. The /only/ way to parse an IRQ
>> specifier is with binding-specific knowledge, which is obtained by
>> calling irq_domain->ops->xlate(). If the IRQ domain can't be found, this
>> operation simply has to be deferred; we can't just guess and hope.
> 
> At least the of irq mapping code make this assumption also: 
> kernel/irq/irqdomain.c:483
> It should be valid for us here too.
> The additional assumption that I made is that if irq_domain == NULL (not 
> only xlate), that we can use intspec[0] either.

OK, I guess it's likely this won't cause any additional issue then. I
suspect most IRQ domains use within the context of device tree already
provide an explicit xlate op anyway; for example irq_domain_simple_ops
points at the default irq_domain_xlate_onetwocell.

>>>> +
>>>> +			hwirq = be32_to_cpu(hwirq);
>>>
>>> Is this conversion correct? I don't think hwirq could be big endian
>>> here (unless running on a big endian CPU).
>>
>> I think that should be inside the else branch above.
> 
> No it has to be in both branches as it is. Device tree data is big endian. 
> The conversion is converting big endian data (from device tree in both 
> cases) to cpu endianess and not coverting TO big endian.
> My test machine is a arm in little endian mode and it provided wrong values 
> if I did not do the conversion.
> What I am a bit unsure about is if the xlate function is expecting the 
> intspec pointer to point to big endian device tree data or data already 
> converted to cpu endianess. For the standard xlate functions 
> irq_domain_xlate_[one|two|onetwo]cell it does not matter.

The xlate function assumes that data is already converted to CPU-endian.
See:

irq_of_parse_and_map() ->
    of_irq_map_one() ->
        of_irq_map_raw() ->
            out_irq->specifier[i] = of_read_number(intspec +i, 1);
    irq_create_of_mapping()

(of_read_number does the be32_to_cpu() internally)
