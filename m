From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/5] irqchip: add dumb demultiplexer implementation
Date: Wed, 14 Jan 2015 09:22:35 +0100
Message-ID: <20150114092235.032dc986@bbrezillon>
References: <1421174781-4340-1-git-send-email-boris.brezillon@free-electrons.com>
	<1421174781-4340-2-git-send-email-boris.brezillon@free-electrons.com>
	<CAL_JsqJ5DSo6jmAuHPDdV6pMca8BVbg5V-GZ5=2qu96_QYXMtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJ5DSo6jmAuHPDdV6pMca8BVbg5V-GZ5=2qu96_QYXMtQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, 13 Jan 2015 21:26:42 -0600
Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

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
> seems like what is really desired is just per handler disabling.

Like what I proposed here [1] ?

> It is
> fragile in that devices can deadlock the system if the drivers don't
> disable the interrupt source before calling disable_irq.

Not exactly deadlock since spurious interrupt detection is implemented,
but yes, things won't work as expected.

> But unlike
> IRQF_SHARED, there is nothing explicit in the driver indicating it is
> designed to work properly with a shared interrupt line.
> 
> I see no reason to accept this into DT either. We already can support
> shared lines and modeling an OR gate as an interrupt controller is
> pointless.

Okay, I guess I'll let DT and irq maintainers decide what is preferable
here (I already spent much time than I first expected to remove this
warning in a proper way).

Best Regards,

Boris

[1]https://lkml.org/lkml/2014/12/15/552

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
