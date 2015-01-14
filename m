From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH v2 1/5] irqchip: add dumb demultiplexer implementation
Date: Wed, 14 Jan 2015 11:36:09 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1501141110190.5526@nanos>
References: <1421174781-4340-1-git-send-email-boris.brezillon@free-electrons.com> <1421174781-4340-2-git-send-email-boris.brezillon@free-electrons.com> <CAL_JsqJ5DSo6jmAuHPDdV6pMca8BVbg5V-GZ5=2qu96_QYXMtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJ5DSo6jmAuHPDdV6pMca8BVbg5V-GZ5=2qu96_QYXMtQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 13 Jan 2015, Rob Herring wrote:
> On Tue, Jan 13, 2015 at 12:46 PM, Boris Brezillon
> <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Some interrupt controllers are multiplexing several peripheral IRQs on
> > a single interrupt line.
> > While this is not a problem for most IRQs (as long as all peripherals
> > request the interrupt with IRQF_SHARED flag set), multiplexing timers and
> > other type of peripherals will generate a WARNING (mixing IRQF_NO_SUSPEND
> > and !IRQF_NO_SUSPEND is prohibited).
> >
> > Create a dumb irq demultiplexer which simply forwards interrupts to all
> > peripherals (exactly what's happening with IRQ_SHARED) but keep a unique
> > irq number for each peripheral, thus preventing the IRQF_NO_SUSPEND
> > and !IRQF_NO_SUSPEND mix on a given interrupt.
> 
> This really seems like a work-around for how IRQF_SHARED works. It

It's a workaround for a short coming of IRQF_SHARED.

IRQF_SHARED has a massive short coming versus suspend and wakeup
interrupts. If one of the demultiplexed interrupts is a valid wakeup
source then we have no sane way to express this with IRQF_SHARED
simply because the drivers need to be aware whether they run on stupid
or well designed hardware.

> seems like what is really desired is just per handler disabling. It is

So you want a magic API like disable/enable_irq_action()?

Certainly not.

You'd open just another can of worms which will bring us abuse and
hard to debug problems because driver writers think it's a good idea
to use it for random purposes.

Aside of that it would add another conditional into the interrupt
delivery hotpath which is not desired either.

> fragile in that devices can deadlock the system if the drivers don't
> disable the interrupt source before calling disable_irq. But unlike

Any misdesigned driver can do that for you.

> IRQF_SHARED, there is nothing explicit in the driver indicating it is
> designed to work properly with a shared interrupt line.

IRQF_SHARED is a pretty bad indicator. Look at all the drivers which
slap this flag onto request_irq() and have no single line of code
which makes sure that the driver would ever work on a shared line.

If it's just for annotational purposes, we can add a new IRQF flag,
which is required to request such a interrupt line.

> I see no reason to accept this into DT either. We already can support
> shared lines and modeling an OR gate as an interrupt controller is
> pointless.

It's absolutely not pointless.

All attempts to work around that have resulted in horrible bandaids so
far. That's why I guided Boris to implement this dummy demultiplexing
mechanism. It solves the problem at hand nicely without adding nasty
hackarounds into the suspend/resume code and inflicting platform
knowledge on multi-platform device drivers.

If you have a proper solution for the problem at hand which

   - avoids the demux dummy

   - works straight forward with suspend/resume/wakeup

   - does not add horrible new APIs

   - does not add conditionals to the interrupt hotpath

   - does not inflict platform knowledge about interrupt chip details
     on drivers

then I'm happy to take it.

But as long as you can't come up with anything sane, the demux dummy
is the best solution for this problem we've seen so far.

Thanks,

	tglx
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
