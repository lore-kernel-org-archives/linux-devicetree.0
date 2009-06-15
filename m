From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 2/2] uio: add an of_genirq driver
Date: Mon, 15 Jun 2009 19:45:39 +1000
Message-ID: <1245059139.12400.4.camel@pasglop>
References: <1244765062-14144-1-git-send-email-w.sang@pengutronix.de>
	<1244765062-14144-3-git-send-email-w.sang@pengutronix.de>
	<20090614122136.GD3639@local>
	<20090615001207.1829e7b5@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
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
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, "Hans J. Koch" <hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2009-06-15 at 00:12 +0100, Alan Cox wrote:
> > > +	if (!uioinfo->irq)
> > > +		uioinfo->irq = UIO_IRQ_NONE;
> > 
> > Please don't do this. It's inconsistent if all other UIO drivers require
> > people to use UIO_IRQ_NONE and you also allow zero. UIO_IRQ_NONE was
> > introduced because 0 may be a legal interrupt number on some platforms.
> 
> Zero is not a valid IRQ number in the kernel (except in arch specific
> depths). IRQ numbers are also *unsigned* so -1 isn't a safe definition.
> 
> Zero means no IRQ. If any old UIO code is assuming otherwise it wants
> fixing.
> 
> It is the job of the platform to map a physical IRQ 0 to some other
> representation if it exists outside of arch specific code. This was
> decided some years ago and a large part of the kernel simply doesn't
> support any notion of a real IRQ 0.

Right, and powerpc complies with that rule, so 0 is fine for us.

Cheers,
Ben.
