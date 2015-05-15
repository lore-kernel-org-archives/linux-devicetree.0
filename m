From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH v6 04/12] irqchip: vf610-mscm: support NVIC parent
Date: Fri, 15 May 2015 22:29:50 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1505152229360.4225@nanos>
References: <1431203982-13217-1-git-send-email-stefan@agner.ch> <1431203982-13217-5-git-send-email-stefan@agner.ch> <alpine.DEB.2.11.1505151237531.4225@nanos> <6af49d55159182668c21480e0fbaa85c@agner.ch>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6af49d55159182668c21480e0fbaa85c-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 15 May 2015, Stefan Agner wrote:

> On 2015-05-15 12:39, Thomas Gleixner wrote:
> > On Sat, 9 May 2015, Stefan Agner wrote:
> >> -	irq_chip_unmask_parent(data);
> >> +	if (parent->chip->irq_enable)
> >> +		parent->chip->irq_enable(parent);
> >> +	else
> >> +		parent->chip->irq_unmask(parent);
> > 
> > Why are you not creating irq_chip_enable_parent() which would have
> > been the proper function anyway?
> > 
> 
> Will add that...
> 
> Btw, have you had a chance to look at 1/12? I added a helper there too

Yes 1/12 is fine ...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
