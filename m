From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] irqchip: add Broadcom Set Top Box Level-2
 interrupt controller
Date: Fri, 23 May 2014 13:36:04 -0700
Message-ID: <CAGVrzcYk9Py_PWeW+jRgMg6NNioVkVVWmdSebnB9f139tt23cg@mail.gmail.com>
References: <1400776606-22427-1-git-send-email-f.fainelli@gmail.com>
 <1400776606-22427-2-git-send-email-f.fainelli@gmail.com> <alpine.DEB.2.02.1405231047050.9995@ionos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1405231047050.9995-3cz04HxQygjZikZi3RtOZ1XZhhPuCNm+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2014-05-22 18:51 GMT-07:00 Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>:
> On Thu, 22 May 2014, Florian Fainelli wrote:
>> +static void brcmstb_l2_intc_irq_handle(unsigned int irq, struct irq_desc *desc)
>> +{
>> +     struct brcmstb_l2_intc_data *b = irq_desc_get_handler_data(desc);
>> +     struct irq_chip *chip = irq_get_chip(irq);
>
> irq_desc_get_chip() is what you want here. irq_get_chip() is doing a
> full lookop of desc, which is silly as you have desc already.

Thanks, is there anything else that needs fixing before I submit a v3? Thanks!
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
