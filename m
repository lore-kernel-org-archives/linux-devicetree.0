From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 1/2] gpio: dwapb: Use human understandable gpio numbering.
Date: Thu, 02 Jul 2015 17:54:29 +0200
Message-ID: <55955EB5.4090400@linutronix.de>
References: <cover.1435777856.git.rcochran@linutronix.de> <d6b5ce85a17164970d454583560e07f7aed7b8ca.1435777856.git.rcochran@linutronix.de> <5594E9F6.7040701@linutronix.de> <20150702142601.GB9349@localhost.localdomain> <55954B17.3020303@linutronix.de> <20150702152147.GA10111@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150702152147.GA10111-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/02/2015 05:21 PM, Richard Cochran wrote:
> On Thu, Jul 02, 2015 at 04:30:47PM +0200, Sebastian Andrzej Siewior wrote:
>> On 07/02/2015 04:26 PM, Richard Cochran wrote:
>>> On Thu, Jul 02, 2015 at 09:36:22AM +0200, Sebastian Andrzej Siewior wrote:
>>>> If you are in a specific SoC you could do
>>>> 	base = of_alias_get_id(np, "gpio") * num_of_gpio_per_chip
>>>> and get consistent numbers / sane.
>>>
>>> And what about /sys/class/gpio ?
>>
>> What about it?
> 
> The poor users of that interface cannot use "of_alias_get_id" as you suggest.

You do that in the driver. The only problem with that is that the
synopsys controller can have between one and four banks and a bank can
have 1-32 GPIOs if I remember correctly. That means you can't have a
static number of GPIOs like others do.
Therefore I think a starting property is the only way and I would
prefer a generic one.

What confuses me a little: Why is there a snps,nr-gpios property?
Doesn't the snps' IP-Core expose this information?

> Thanks,
> Richard
> 
Sebastian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
