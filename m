From: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] gpio: dwapb: Use human understandable gpio numbering.
Date: Thu, 2 Jul 2015 17:21:47 +0200
Message-ID: <20150702152147.GA10111@localhost.localdomain>
References: <cover.1435777856.git.rcochran@linutronix.de>
 <d6b5ce85a17164970d454583560e07f7aed7b8ca.1435777856.git.rcochran@linutronix.de>
 <5594E9F6.7040701@linutronix.de>
 <20150702142601.GB9349@localhost.localdomain>
 <55954B17.3020303@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55954B17.3020303-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 02, 2015 at 04:30:47PM +0200, Sebastian Andrzej Siewior wrote:
> On 07/02/2015 04:26 PM, Richard Cochran wrote:
> > On Thu, Jul 02, 2015 at 09:36:22AM +0200, Sebastian Andrzej Siewior wrote:
> >> If you are in a specific SoC you could do
> >> 	base = of_alias_get_id(np, "gpio") * num_of_gpio_per_chip
> >> and get consistent numbers / sane.
> > 
> > And what about /sys/class/gpio ?
> 
> What about it?

The poor users of that interface cannot use "of_alias_get_id" as you suggest.

> > (Other gpio controllers are doing that, too, BTW.)
> 
> I'm not saying that you should not do so. There is _no_ generic binding
> for this and this is what I suggest.

I can surely change "snps,base" to something like "gpio-base" as a
generic binding.  Would that be better?

I expected to find the base number as a standard property, but I'm no
DT expert, and I have learned not to question it.

Thanks,
Richard
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
