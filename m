From: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v4] usb: ehci-hcd: notify phy when connect change
Date: Wed, 06 Jun 2012 14:27:19 +0300
Message-ID: <87k3zk8yug.fsf@ashishki-desk.ger.corp.intel.com>
References: <1337912665-16615-4-git-send-email-richard.zhao@freescale.com> <1338946190-19105-1-git-send-email-richard.zhao@freescale.com> <87mx4g93tg.fsf@ashishki-desk.ger.corp.intel.com> <20120606110539.GA5566@b20223-02.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120606110539.GA5566-iWYTGMXpHj9ITqJhDdzsOjpauB2SiJktrE5yTffgRl4@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org> writes:

> On Wed, Jun 06, 2012 at 12:39:55PM +0300, Alexander Shishkin wrote:
>> Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org> writes:
>> 
>> > It still has below limitations:
>> > - it does not work for multi-phy ehci
>> > - the best place is after debounce, but I can't get
>> >   phy there
>> >
>> > Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> > ---
>> >  drivers/usb/host/ehci-hcd.c |   15 +++++++++++++++
>> >  1 files changed, 15 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
>> > index b100f5f..724ac471 100644
>> > --- a/drivers/usb/host/ehci-hcd.c
>> > +++ b/drivers/usb/host/ehci-hcd.c
>> > @@ -928,6 +928,21 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
>> >  			pstatus = ehci_readl(ehci,
>> >  					 &ehci->regs->port_status[i]);
>> >  
>> > +			/* FIXME:
>> > +			 * - it does not work for multi-phy ehci
>> > +			 * - the best place is after debounce, but I can't get
>> > +			 *   phy there
>> > +			 */
>> > +			if (unlikely(ehci->transceiver &&
>> > +					(pstatus & PORT_CSC))) {
>> 
>> I don't think you need parens around (pstatus & PORT_CSC), since it
>> should already have higher precedence.
> But it's more readable. Isn't it?

I guess it is.

Regards,
--
Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
