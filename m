From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 04/12] MIPS: GIC: Move MIPS_GIC_IRQ_BASE into platform irq.h
Date: Mon, 01 Sep 2014 10:34:30 +0200
Message-ID: <3341001.1Jsp173xyM@wuerfel>
References: <1409350479-19108-1-git-send-email-abrestic@chromium.org> <6179185.bNbDBEC6tl@wuerfel> <CAL1qeaEEo6-LZz3Kex7oPUfz=Z56nvKoDnqu051rGhhi3ZFTDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaEEo6-LZz3Kex7oPUfz=Z56nvKoDnqu051rGhhi3ZFTDQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jeffrey Deans <jeffrey.deans-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sunday 31 August 2014 11:54:04 Andrew Bresticker wrote:
> On Sat, Aug 30, 2014 at 12:57 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Friday 29 August 2014 15:14:31 Andrew Bresticker wrote:
> >> Define a generic MIPS_GIC_IRQ_BASE which is suitable for Malta and
> >> the upcoming Danube board in <mach-generic/irq.h>.  Since Sead-3 is
> >> different and uses a MIPS_GIC_IRQ_BASE equal to the CPU IRQ base (0),
> >> define its MIPS_GIC_IRQ_BASE in <mach-sead3/irq.h>.
> >>
> >> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >>
> >
> > Why do you actually have to hardwire an IRQ base? Can't you move
> > to the linear irqdomain code for DT based MIPS systems yet?
> 
> Neither Malta nor SEAD-3 use device-tree for interrupts yet, so they
> still require a hard-coded IRQ base.  For boards using device-tree, I
> stuck with a legacy IRQ domain as it allows most of the existing GIC
> irqchip code to be reused.

I see. Note that we now have irq_domain_add_simple(), which should
do the right think in either case: use a legacy domain when a 
nonzero base is provided for the old boards, but use the simple
domain when probed from DT without an irq base.

This makes the latter case more memory efficient (it avoids
allocating the irq descriptors for every possibly but unused
IRQ number) and helps ensure that you don't accidentally rely
on hardcoded IRQ numbers for the DT based machines, which would
be considered a bug.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
