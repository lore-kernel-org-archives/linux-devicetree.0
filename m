From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 3/5] irqchip: Add DT binding doc for the virtual irq
 demuxer chip
Date: Wed, 11 Feb 2015 16:03:17 +0100
Message-ID: <20150211160317.6d6c64e5@bbrezillon>
References: <1422527620-8308-1-git-send-email-boris.brezillon@free-electrons.com>
	<2982569.CIWvqghzfx@vostro.rjw.lan>
	<20150211144345.GL9154@leverpostej>
	<2437801.56xPyk3atd@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2437801.56xPyk3atd-sKB8Sp2ER+y1GS7QM15AGw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 11 Feb 2015 16:17:20 +0100
"Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org> wrote:

> On Wednesday, February 11, 2015 02:43:45 PM Mark Rutland wrote:
> > [...]
> > 
> > > > > > > +static irqreturn_t __handle_irq_event_percpu(unsigned int irq, struct irqaction *action)
> > > > > > > +{
> > > > > > > +	/*
> > > > > > > +	 * During suspend we must not call potentially unsafe irq handlers.
> > > > > > > +	 * See suspend_suspendable_actions.
> > > > > > > +	 */
> > > > > > > +	if (unlikely(action->flags & IRQF_NO_ACTION))
> > > > > > > +		return IRQ_NONE;
> > > > > > 
> > > > > > Thomas was trying to avoid any new conditional code in the interrupt
> > > > > > handling path, that's why I added a suspended_action list in my
> > > > > > proposal.
> > > > > > Even if your 'unlikely' statement make things better I'm pretty sure it
> > > > > > adds some latency.
> > > > > 
> > > > > I can see that we don't want to add more code here to keep things
> > > > > clean/pure, but I find it hard to believe that a single bit test and
> > > > > branch (for data that should be hot in the cache) are going to add
> > > > > measurable latency to a path that does pointer chasing to get to the
> > > > > irqaction in the first place. I could be wrong though, and I'm happy to
> > > > > benchmark.
> > > > 
> > > > Again, I don't have enough experience to say this is (or isn't)
> > > > impacting irq handling latency, I'm just reporting what Thomas told me.
> > > > 
> > > > > 
> > > > > It would be possible to go for your list shuffling approach here while
> > > > > still keeping the flag internal and all the logic hidden away in
> > > > > kernel/irq/pm.c. I wasn't sure how actions could be manipulated during
> > > > > suspend, which made me wary of moving them to a separate list.
> > > > 
> > > > Moving them to a temporary list on suspend and restoring them on
> > > > resume should not be a problem.
> > > > The only drawback I see is that actions might be reordered after the
> > > > first resume (anyway, relying on shared irq action order is dangerous
> > > > IMHO).
> > > 
> > > We considered doing that too and saw some drawbacks (in addition to the
> > > reordering of actions you've mentioned).  It added just too much complexity
> > > to the IRQ suspend-resume code.
> > > 
> > > I, personally, would be fine with adding an IRQ flag to silence the
> > > warning mentioned by Alexandre.  Something like IRQD_TIMER_SHARED that would
> > > be set automatically if someone requested IRQF_TIMER | IRQF_SHARED.
> > > 
> > > Thoughts?
> > 
> > Even if the timer driver does that, we still require the other handlers
> > sharing the line to do the right thing across suspend, no? So either
> > their actions need to be masked at suspend time, or the handlers need to
> > detect when they're called during suspend and return early.
> 
> Well, the issue at hand is about things that share an IRQ with a timer AFAICS.
> 
> That is odd enough already and I'd say everyone in that situation needs to
> be prepared to take the pain (including having to check if the device is not
> suspended in their interrupt handlers).
> 
> And quite frankly they need to do that already, because we've never suspended
> timer IRQs.
> 
> > So for the flag at request time approach to work, all the drivers using
> > the interrupt would have to flag they're safe in that context.
> 
> Something like IRQF_"I can share the line with a timer" I guess?  That wouldn't
> hurt and can be checked at request time even.
> 
> > I'm not averse to having that (only a few drivers shuold be affected and
> > we can sanity check them now).
> 
> Right.

Okay, if everyone agrees on this solution, then I'm fine with that too
(even if I'm a bit disappointed to have spent so much time on this
problem to eventually end-up with a simple IRQF_SHARED_TIMER flag :-().


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
