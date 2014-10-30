From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V2 02/15] sh: Eliminate unused irq_reg_{readl,writel} accessors
Date: Thu, 30 Oct 2014 11:48:18 +0100
Message-ID: <1879572.mbc2eHiUuo@wuerfel>
References: <1414635488-14137-1-git-send-email-cernekee@gmail.com> <2294092.AHz8W66sEP@wuerfel> <alpine.DEB.2.11.1410301142010.5308@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1410301142010.5308@nanos>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, lethal-M7jkjyW5wf5g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 30 October 2014 11:43:00 Thomas Gleixner wrote:
> On Thu, 30 Oct 2014, Arnd Bergmann wrote:
> 
> > On Wednesday 29 October 2014 19:17:55 Kevin Cernekee wrote:
> > > Defining these macros way down in arch/sh/.../irq.c doesn't cause
> > > kernel/irq/generic-chip.c to use them.  As far as I can tell this code
> > > has no effect.
> > > 
> > > Signed-off-by: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > 
> > Actually it overrides the 32-bit accessors with 16-bit accessors,
> > which does seem intentional and certainly has an effect.
> 
> Not really. Neither arch/sh/boards/mach-se/7343/irq.c nor
> arch/sh/boards/mach-se/7722/irq.c actually use
> irq_reg_readl/writel. They simply define it.

Ah, that makes things easier. I looked at the commits that introduced
them, and even then they were unused. Probably an artifact from an
earlier version of the patch which did not get merged.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
