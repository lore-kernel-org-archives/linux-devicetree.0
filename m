From: "Hans J. Koch" <hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 2/2] uio: add an of_genirq driver
Date: Sun, 14 Jun 2009 21:23:59 +0200
Message-ID: <20090614192359.GG3639@local>
References: <1244765062-14144-1-git-send-email-w.sang@pengutronix.de>
	<1244765062-14144-3-git-send-email-w.sang@pengutronix.de>
	<20090614122136.GD3639@local>
	<20090614171406.GA1010@pengutronix.de>
	<20090614183357.GE3639@local>
	<20090614190533.GA7387@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090614190533.GA7387-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, "Hans J. Koch" <hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 14, 2009 at 09:05:33PM +0200, Wolfram Sang wrote:
> 
> > Anyway, 0 is a valid IRQ number, so it cannot be used as "no irq".
> 
> May I point you to this thread?
> 
> http://lkml.org/lkml/2005/11/21/221

Linus is just plain wrong in this 4 year old mail.

> 
> (The issue comes up once in a while as some archs still use NO_IRQ, some with
> 0 some with -1)
> 
> > > 	if (uioinfo->irq == NO_IRQ)
> > > 		uioinfo->irq = UIO_IRQ_NONE;
> > 
> > Sorry for my ignorance, but what is NO_IRQ? If I do a
> > 
> > grep -r NO_IRQ include/
> > 
> > I get nothing.
> 
> Try a 'cd arch' before that :)

no such luck in arch/x86/ ...

> 
> > Well, you claim it's a false positive. So far, you did not get any responses,
> > AFAICS. I tend to agree with you, but I'd like to avoid patches that don't
> > pass checkpatch.pl, whatever the reason. Either the false positive gets
> > confirmed and fixed, or you should fix your patch.
> 
> Well, I assume that issues regarding checkpatch do not have the highest
> priority (especially while the merge-window is open), which is understandable.
> Fixing this bug (I take any bets that this is one ;)) might not be so trivial,
> as modifying $Attributes can easily have lots of side-effects.
> 
> Now, all this does not matter much, as the objections Grant raised are valid
> and there might be a totally different outcome to bind devices to UIO. But at
> least, we have some code to discuss...

OK, I'm looking forward to your next version.

Thanks,
Hans


> 
> Regards,
> 
>    Wolfram
> 
> -- 
> Pengutronix e.K.                           | Wolfram Sang                |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
