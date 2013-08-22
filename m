Return-Path: <devicetree-owner@vger.kernel.org>
Received: from smtp1.goneo.de ([212.90.139.80]:37264 "EHLO smtp1.goneo.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752077Ab3HVJBj (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Thu, 22 Aug 2013 05:01:39 -0400
From: Lars Poeschel <poeschel@lemonage.de>
Subject: Re: [PATCH v2] gpio: interrupt consistency check for OF GPIO IRQs
Date: Thu, 22 Aug 2013 11:01:30 +0200
References: <1377092334-770-1-git-send-email-larsi@wh2.tu-dresden.de> <1507189.CRWvzVJqTV@flatron> <521548E3.6010703@wwwdotorg.org>
In-Reply-To: <521548E3.6010703@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201308221101.30316.poeschel@lemonage.de>
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Lars Poeschel <larsi@wh2.tu-dresden.de>, grant.likely@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, ian.campbell@citrix.com, galak@codeaurora.org, pawel.moll@arm.com, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Enric Balletbo i Serra <eballetbo@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, Balaji T K <balajitk@ti.com>, Tony Lindgren <tony@atomide.com>, Jon Hunter <jgchunter@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Thursday 22 August 2013 at 01:10:27, Stephen Warren wrote:
> On 08/21/2013 03:49 PM, Tomasz Figa wrote:
> >> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> >> 
> >> +static void of_gpio_scan_irq_lines(const struct device_node *const
> >> 
> >> +		for (i = 0; i < intlen; i += intsize) {
> >> +			/*
> >> +			 * Find out the local IRQ number. This corresponds to
> >> +			 * the GPIO line offset for a GPIO chip.
> > 
> > I'm still not convinced that this assumption is correct. This code
> > will behave erraticaly in cases where it is not true, requesting
> > innocent GPIO pins.

Do you have an idea how we can destroy your doubts?
Either irq_chips nor irq_domains provide some sort of translation function 
for this.
Is there a driver in the kernel that has different gpio- vs. irq-namespaces 
where I can have a look at? How does platform code solve this translation? 
The irq_to_gpio functions in include/linux/gpio.h seem deprecated. They 
just return -EINVAL.
For me it seems, that there is no such device inside the kernel yet. 
Correct me if I'm wrong. If such a device comes to surface, we're in 
trouble. We will need some device-specific translation function then.
Is it the time to introduce an additional pointer for such a function now 
and nobody uses it? Or wait until such a device arises and introduce the 
pointer then?

> >> +			 */
> >> +			if (irq_domain && irq_domain->ops->xlate)
> >> +				irq_domain->ops->xlate(irq_domain, gcn,
> >> +						       intspec + i, intsize,
> >> +						       &hwirq, &type);
> >> +			else
> >> +				hwirq = intspec[0];
> > 
> > Is it a correct fallback when irq_domain is NULL?
> 
> Indeed this fallback is dangerous. The /only/ way to parse an IRQ
> specifier is with binding-specific knowledge, which is obtained by
> calling irq_domain->ops->xlate(). If the IRQ domain can't be found, this
> operation simply has to be deferred; we can't just guess and hope.

At least the of irq mapping code make this assumption also: 
kernel/irq/irqdomain.c:483
It should be valid for us here too.
The additional assumption that I made is that if irq_domain == NULL (not 
only xlate), that we can use intspec[0] either.

> >> +
> >> +			hwirq = be32_to_cpu(hwirq);
> > 
> > Is this conversion correct? I don't think hwirq could be big endian
> > here (unless running on a big endian CPU).
> 
> I think that should be inside the else branch above.

No it has to be in both branches as it is. Device tree data is big endian. 
The conversion is converting big endian data (from device tree in both 
cases) to cpu endianess and not coverting TO big endian.
My test machine is a arm in little endian mode and it provided wrong values 
if I did not do the conversion.
What I am a bit unsure about is if the xlate function is expecting the 
intspec pointer to point to big endian device tree data or data already 
converted to cpu endianess. For the standard xlate functions 
irq_domain_xlate_[one|two|onetwo]cell it does not matter.
