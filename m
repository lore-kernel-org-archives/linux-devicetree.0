From: "Hans J. Koch" <hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 2/2] uio: add an of_genirq driver
Date: Mon, 15 Jun 2009 01:45:46 +0200
Message-ID: <20090614234546.GJ3639@local>
References: <1244765062-14144-1-git-send-email-w.sang@pengutronix.de>
	<1244765062-14144-3-git-send-email-w.sang@pengutronix.de>
	<20090614122136.GD3639@local>
	<20090615001207.1829e7b5@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090615001207.1829e7b5-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, "Hans J. Koch" <hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 15, 2009 at 12:12:07AM +0100, Alan Cox wrote:
> > > +	if (!uioinfo->irq)
> > > +		uioinfo->irq = UIO_IRQ_NONE;
> > 
> > Please don't do this. It's inconsistent if all other UIO drivers require
> > people to use UIO_IRQ_NONE and you also allow zero. UIO_IRQ_NONE was
> > introduced because 0 may be a legal interrupt number on some platforms.
> 
> Zero is not a valid IRQ number in the kernel (except in arch specific
> depths). IRQ numbers are also *unsigned* so -1 isn't a safe definition.

The above uioinfo->irq is a signed long.

> 
> Zero means no IRQ. If any old UIO code is assuming otherwise it wants
> fixing.

It doesn't. It won't complain about IRQ 0 and will pass it on to
request_irq, which will probably fail if it is as you say.

I did it that way because I saw IRQ 0 in /proc/interrupts on every PC...

> 
> It is the job of the platform to map a physical IRQ 0 to some other
> representation if it exists outside of arch specific code.

Funny.

> This was
> decided some years ago and a large part of the kernel simply doesn't
> support any notion of a real IRQ 0.

Can you tell me the reason for that decision or point me to some ml archive?

Thanks,
Hans

> 
> Alan
