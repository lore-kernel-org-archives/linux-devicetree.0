From: "Hans J. Koch" <hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 2/2] uio: add an of_genirq driver
Date: Sun, 14 Jun 2009 20:33:57 +0200
Message-ID: <20090614183357.GE3639@local>
References: <1244765062-14144-1-git-send-email-w.sang@pengutronix.de>
	<1244765062-14144-3-git-send-email-w.sang@pengutronix.de>
	<20090614122136.GD3639@local>
	<20090614171406.GA1010@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090614171406.GA1010-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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

On Sun, Jun 14, 2009 at 07:14:06PM +0200, Wolfram Sang wrote:
> Hello Hans,
> 
> > > +	uioinfo->irq = irq_of_parse_and_map(op->node, 0);
> > > +	if (!uioinfo->irq)
> > > +		uioinfo->irq = UIO_IRQ_NONE;
> > 
> > Please don't do this. It's inconsistent if all other UIO drivers require
> > people to use UIO_IRQ_NONE and you also allow zero. UIO_IRQ_NONE was
> > introduced because 0 may be a legal interrupt number on some platforms.
> 
> Yes, well, the '0' vs. 'NO_IRQ' thing is still not fully sorted out AFAIK.

A "cat /proc/interrupts" on any common x86 PC shows you that IRQ 0 is used
there. OK, it's unlikely someone wants to write a UIO driver for that one,
but that might be different on other platforms.
Anyway, 0 is a valid IRQ number, so it cannot be used as "no irq".

> But you are possibly right here, as long as irq_of_parse_and_map does return
> NO_IRQ, I should explicitly check for it, like this:
> 
> 	if (uioinfo->irq == NO_IRQ)
> 		uioinfo->irq = UIO_IRQ_NONE;

Sorry for my ignorance, but what is NO_IRQ? If I do a

grep -r NO_IRQ include/

I get nothing.

> 
> > > +/* Match table for of_platform binding */
> > > +static const struct of_device_id __devinitconst uio_of_genirq_match[] = {
> > 
> > checkpatch.pl complains about that. Please check.
> 
> Did that, it is a false positive. See here:
> 
> http://lkml.indiana.edu/hypermail/linux/kernel/0906.1/02780.html

Well, you claim it's a false positive. So far, you did not get any responses,
AFAICS. I tend to agree with you, but I'd like to avoid patches that don't
pass checkpatch.pl, whatever the reason. Either the false positive gets
confirmed and fixed, or you should fix your patch.

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
