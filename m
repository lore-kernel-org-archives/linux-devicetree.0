From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: ARM: gic_arch_extn (Was: [PATCH v3] irqchip: mmp: add dt
	support for wakeup)
Date: Thu, 5 Dec 2013 00:52:16 +0000
Message-ID: <20131205005216.GA4360@n2100.arm.linux.org.uk>
References: <1386159214-31483-1-git-send-email-zhangwm@marvell.com> <alpine.DEB.2.02.1312042234190.30673@ionos.tec.linutronix.de> <alpine.DEB.2.02.1312042347350.30673@ionos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1312042347350.30673-3cz04HxQygjZikZi3RtOZ1XZhhPuCNm+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Neil Zhang <zhangwm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 05, 2013 at 01:41:53AM +0100, Thomas Gleixner wrote:
> @all who feel responsible for gic_arch_extn
> 
> On Wed, 4 Dec 2013, Thomas Gleixner wrote:
> > I'm going to reply in a separate mail on this, because you have
> > brought this to my attention, but you are not responsible in the first
> > place for this brainfart.
> 
> Who came up with that gic_arch_extn concept in the first place?

If you'd spend more time reviewing IRQ patches then maybe you'd catch
this at review time.  So please stop your rediculous whinging when
most of the problem is your own lack of time.

If you must know, it was introduced by TI to work around the power
management shortcomings of the architecture mandated GIC.  No it doesn't
get called for IPIs, but it damned well needs to be called for normal
IRQs.

At the point it was created, it wasn't clear whether this also applied
to local IRQs.  Since I *no* *longer* have visibility of what SoC stuff
is doing with it, of course it's not going to get fixed when a common
pattern emerges.

So... congratulations, you've found something which can be improved,
which has come to light as the code has evolved and a better
understanding of what is required has been discovered.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
