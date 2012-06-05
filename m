From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v3 03/12] usb: ehci-hcd: notify phy when connect change
Date: Tue, 5 Jun 2012 17:03:17 +0200
Message-ID: <201206051703.17691.marex@denx.de>
References: <Pine.LNX.4.44L0.1206051025540.1542-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1206051025540.1542-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Alan Stern,

> On Tue, 5 Jun 2012, Alexander Shishkin wrote:
> > Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org> writes:
> > > It still has below limitations:
> > > - it does not work for multi-phy ehci
> > > - the best place is after debounce, but I can't get
> > > 
> > >   phy there
> > > 
> > > Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > 
> > Alan, are you ok with this?
> > 
> > > ---
> > > 
> > >  drivers/usb/host/ehci-hcd.c |   14 ++++++++++++++
> > >  1 files changed, 14 insertions(+), 0 deletions(-)
> > > 
> > > diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
> > > index b100f5f..8c39a7a 100644
> > > --- a/drivers/usb/host/ehci-hcd.c
> > > +++ b/drivers/usb/host/ehci-hcd.c
> > > @@ -928,6 +928,20 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
> > > 
> > >  			pstatus = ehci_readl(ehci,
> > >  			
> > >  					 &ehci->regs->port_status[i]);
> > > 
> > > +			/* FIXME:
> > > +			 * - it does not work for multi-phy ehci
> > > +			 * - the best place is after debounce, but I can't get
> > > +			 *   phy there
> > > +			 */
> > > +			if ((pstatus & PORT_CSC) && ehci->transceiver) {
> 
> Do the tests in the opposite order and add "unlikely":
> 
> 			if (unlikely(ehci->transceiver &&
> 					(pstatus & PORT_CSC)) {
> 
> That way it will fail more quickly on systems where it doesn't apply or
> for unaffected ports.

Does this unlikely() have any effect on ARM/MIPS/PPC, where this chipidea IP is 
used ? Or is there some x86 device sporting this IP too?

> > > +				if (pstatus & PORT_CONNECT)
> > > +					usb_phy_notify_connect(
> > > +						ehci->transceiver, i);
> > > +				else
> > > +					usb_phy_notify_disconnect(
> > > +						ehci->transceiver, i);
> > > +			}
> > > +
> > > 
> > >  			if (pstatus & PORT_OWNER)
> > >  			
> > >  				continue;
> > >  			
> > >  			if (!(test_bit(i, &ehci->suspended_ports) &&
> 
> Otherwise it's okay.
> 
> Alan Stern

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
