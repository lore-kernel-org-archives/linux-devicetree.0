From: Jonathan Cameron <jic23-tko9wxEg+fIOOJlXag/Snyp2UmYkHbXO@public.gmane.org>
Subject: Re: "Generic" MMIO ADC
Date: Fri, 30 Jun 2017 14:53:19 +0100
Message-ID: <20170630145319.20ec3696@jic23.retrosnub.co.uk>
References: <b60def9a-45dc-bf97-e059-abbe105648b2@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b60def9a-45dc-bf97-e059-abbe105648b2-Oq418RWZeHk@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
Cc: "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 30 Jun 2017 10:44:42 +0200
Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org> wrote:

> ﻿I'm writing an IIO driver for a custom IP, which is pretty simple:
> 
> - Map the registers to memory and register IRQ routine
> - To start acquisition, write a value to the config register
> - On interrupt, read data register, push it into queue
> - To stop, write another value to config.
> 
> Would it be useful to provide this as a generic driver in Linux, so that you 
> can provide the config register and data register offsets and values in the 
> devicetree? That would make it work on a lot of similar project without 
> everyone coding the same thing.

Hi Mike,

I've brought in the devicetree bindings maintainers and list as well on this
discussion because in many ways it's more about the strategy on bindings
than the actual driver...  Also Linus Walleij for any experience handing
the gpio-mmio driver which strikes me as fairly similar in aim.

To the driver question, yes absolutely this would be a good thing to have.
The majority of ADCs out there are irritatingly more complex than what
you have.  Everyone seems to feel obliged to put in their own 'special
sauce'. 

As for bindings, there are two options, either we

1) As you suggest push all differences between different parts into the
bindings.  Note we'll still need a compatible list in the driver.
So this is something like gpio-mmio.c

2) Do something similar to the irq generic_chip (CONFIG_GENERIC_IRQ)
infrastructure and actually have very slim wrapper drivers around a
library.   That allows those elements that are constrained by the
hardware to not need specifying in device tree bindings.

> 
> And a related question: Is there a driver that's close to this?
I can't immediately think of one, but it's possible that one
of the SoC ADC drivers is simple enough to describe this way.

So Mark / Rob.  You guys have experience with how the bindings
worked out for each approach.  Which do you prefer?
Either approach is fine with me.

Mike, perhaps you have an initial cut of some bindings that might
help the discussion to move along?

Jonathan


> 
> 
> Kind regards,
> 
> Mike Looijmans
> System Expert
> 
> TOPIC Products
> Materiaalweg 4, NL-5681 RJ Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans-yhtFebqMsb9it5bFGTN0CAC/G2K4zDHf@public.gmane.org
> Website: www.topicproducts.com
> 
> Please consider the environment before printing this e-mail
> 
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
