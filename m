From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/4] usb: atmel_usba_udc: mask status with enabled irqs
Date: Mon, 15 Dec 2014 18:02:39 +0100
Message-ID: <20141215180239.05037dcd@bbrezillon>
References: <1418648588-17872-1-git-send-email-boris.brezillon@free-electrons.com>
	<1418648588-17872-5-git-send-email-boris.brezillon@free-electrons.com>
	<548EE2DA.6050408@cogentembedded.com>
	<063D6719AE5E284EB5DD2968C1650D6D1CA0CE20@AcuExch.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <063D6719AE5E284EB5DD2968C1650D6D1CA0CE20-VkEWCZq2GCInGFn1LkZF6NBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Laight <David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org>
Cc: 'Sergei Shtylyov' <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On Mon, 15 Dec 2014 13:34:56 +0000
David Laight <David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org> wrote:

> From: Sergei Shtylyov
> > Hello.
> > 
> > On 12/15/2014 4:03 PM, Boris Brezillon wrote:
> > 
> > > Avoid interpreting useless status flags when we're not waiting for such
> > > events by masking the status variable with the interrupt enabled register
> > > value.
> > 
> > > Reported-by: Patrice VILCHEZ <patrice.vilchez-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> > > Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > > ---
> > >   drivers/usb/gadget/udc/atmel_usba_udc.c | 6 +++++-
> > >   1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > > diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
> > > index 55c8dde..bc3a532 100644
> > > --- a/drivers/usb/gadget/udc/atmel_usba_udc.c
> > > +++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
> > > @@ -1612,12 +1612,14 @@ static irqreturn_t usba_udc_irq(int irq, void *devid)
> > >
> > >   	spin_lock(&udc->lock);
> > >
> > > -	status = usba_readl(udc, INT_STA);
> > > +	status = usba_readl(udc, INT_STA) & usba_readl(udc, INT_ENB);
> > >   	DBG(DBG_INT, "irq, status=%#08x\n", status);
> > >
> > >   	if (status & USBA_DET_SUSPEND) {
> > >   		toggle_bias(udc, 0);
> > >   		usba_writel(udc, INT_CLR, USBA_DET_SUSPEND);
> > > +		usba_writel(udc, INT_ENB,
> > > +			    usba_readl(udc, INT_ENB) | USBA_WAKE_UP);
> > >   		udc->bias_pulse_needed = true;
> > >   		DBG(DBG_BUS, "Suspend detected\n");
> > >   		if (udc->gadget.speed != USB_SPEED_UNKNOWN
> > > @@ -1631,6 +1633,8 @@ static irqreturn_t usba_udc_irq(int irq, void *devid)
> > >   	if (status & USBA_WAKE_UP) {
> > >   		toggle_bias(udc, 1);
> > >   		usba_writel(udc, INT_CLR, USBA_WAKE_UP);
> > > +		usba_writel(udc, INT_ENB,
> > > +			    usba_readl(udc, INT_ENB) & ~USBA_WAKE_UP);
> > >   		DBG(DBG_BUS, "Wake Up CPU detected\n");
> > >   	}
> > 
> >     Looks like t make sense to read the INT_ENB register into a separate
> > variable, to save on extra reads?
> 
> 
> Better still remember the written value in one of the structures so
> that it doesn't have to be read at all.

Hmm, I'm getting back to this suggestion.
While I definitely understand why I should use a local variable to
store INT_ENB value in usba_udc_irq, I don't see the point of mirroring
INT_EN status in an udc struct field (after all, INT_EN will always
contain the value we previously set).
Is this a performance concern ?

Regards,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
