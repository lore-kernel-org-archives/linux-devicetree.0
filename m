From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: ARM: gic_arch_extn (Was: [PATCH v3] irqchip: mmp: add dt
	support for wakeup)
Date: Thu, 5 Dec 2013 09:49:31 +0000
Message-ID: <20131205094931.GB4360@n2100.arm.linux.org.uk>
References: <1386159214-31483-1-git-send-email-zhangwm@marvell.com> <alpine.DEB.2.02.1312042234190.30673@ionos.tec.linutronix.de> <alpine.DEB.2.02.1312042347350.30673@ionos.tec.linutronix.de> <20131205005216.GA4360@n2100.arm.linux.org.uk> <alpine.DEB.2.02.1312050157550.30673@ionos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1312050157550.30673-3cz04HxQygjZikZi3RtOZ1XZhhPuCNm+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Neil Zhang <zhangwm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 05, 2013 at 03:12:55AM +0100, Thomas Gleixner wrote:
> Russell,
> 
> On Thu, 5 Dec 2013, Russell King - ARM Linux wrote:
> > On Thu, Dec 05, 2013 at 01:41:53AM +0100, Thomas Gleixner wrote:
> > > @all who feel responsible for gic_arch_extn
> > > 
> > > On Wed, 4 Dec 2013, Thomas Gleixner wrote:
> > > > I'm going to reply in a separate mail on this, because you have
> > > > brought this to my attention, but you are not responsible in the first
> > > > place for this brainfart.
> > > 
> > > Who came up with that gic_arch_extn concept in the first place?
> > 
> > If you'd spend more time reviewing IRQ patches then maybe you'd catch
> > this at review time.  So please stop your rediculous whinging when
> > most of the problem is your own lack of time.
> 
> I'm not a native english speaker, so I want to make sure in the first
> place that you meant:
> 
>     "ridiculous whingeing" 
> 
> Assumed that you meant that, let me ridicule you a bit.
> 
> The gic_arch_extn concept got merged with:
> 
>     commit d7ed36a4ea84e3a850f9932e2058ceef987d1acd
>     Author: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
>     Date:   Wed Mar 2 08:03:22 2011 +0100
> 
>     ARM: 6777/1: gic: Add hooks for architecture specific extensions
> 
>     <SNIP>
> 
>     Cc: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
>     Signed-off-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
>     Acked-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
>     Tested-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
>     Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> 
>     ---
>     arch/arm/common/gic.c		|   47 ++++++++++++....
>     arch/arm/include/asm/hardware/gic.h |    1
> 
> The patch in question was never cc'ed to me and you merged it on your
> own.
> 
> So now you have the chuzpe to blame me for that, just because this
> code moved to drivers/irqchip with
> 
>      commit 81243e444c6e9d1625073e4a3d3bc244c8a545f0
>      Author: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>      Date:   Tue Nov 20 21:21:40 2012 -0600
> 
>      irqchip: Move ARM GIC to drivers/irqchip
>     
> almost two years later?
> 
> The code move neither exempts you from the responsibility of merging
> it nor does it imply a retroactive responsibility for me to review all
> patches which went into that code prior to the move.

And neither does it give you permission to send such an idiotic and
rediculous email.

I'm not going to do anything about it because "Thomas Glexiner" has
suddenly decided he doesn't like it.

As for your definition of "hotpath", you're really screwed on that
because you don't seem to understand what is or isn't the hotpath in
this code.

So there's not much point discussing this with you until you:

(a) calm down
(b) analyse it properly and work out the frequency under which each
class of IRQ (those >= 32 and those < 32) call into these functions.

To put it bluntly, you're wrong.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
