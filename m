From: chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v5 4/5] xhci: mediatek: support MTK xHCI host controller
Date: Wed, 19 Aug 2015 19:21:13 +0800
Message-ID: <1439983273.11157.1.camel@mhfsdcap03>
References: <1438950644-27290-1-git-send-email-chunfeng.yun@mediatek.com>
 <1438950644-27290-5-git-send-email-chunfeng.yun@mediatek.com>
 <55D1F8B7.9060306@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <55D1F8B7.9060306-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi
On Mon, 2015-08-17 at 18:07 +0300, Mathias Nyman wrote:
> Hi
> 
> On 07.08.2015 15:30, Chunfeng Yun wrote:
> > MTK xhci host controller defines some extra SW scheduling
> > parameters for HW to minimize the scheduling effort for
> > synchronous and interrupt endpoints. The parameters are
> > put into reseved DWs of slot context and endpoint context
> >
> >
> 
> ...
> 
> > + * The TD size is the number of max packet sized packets remaining in the TD
> > + * (including this TRB), right shifted by 10.
> > + * It must fit in bits 21:17, so it can't be bigger than 31.
> > + */
> > +u32 xhci_mtk_td_remainder_quirk(unsigned int td_running_total,
> > +	unsigned trb_buffer_length, struct urb *urb)
> > +{
> > +	u32 max = 31;
> > +	int remainder, td_packet_count, packet_transferred;
> > +	unsigned int td_transfer_size = urb->transfer_buffer_length;
> > +	unsigned int maxp;
> > +
> > +	maxp = GET_MAX_PACKET(usb_endpoint_maxp(&urb->ep->desc));
> > +
> > +	/* 0 for the last TRB */
> > +	if (td_running_total + trb_buffer_length == td_transfer_size)
> > +		return 0;
> > +
> > +	packet_transferred = td_running_total / maxp;
> > +	td_packet_count = DIV_ROUND_UP(td_transfer_size, maxp);
> > +	remainder = td_packet_count - packet_transferred;
> > +
> > +	if (remainder > max)
> > +		return max << 17;
> > +	else
> > +		return remainder << 17;
> > +}
> 
> I started looking at this xhci_mtk_td_remainder() function, one
> of the places this patch touches the existing xhci code.
> 
> The remainder functions in xhci are already bit too messy, and
> adding one more function which does almost the same thing makes
> it even messier.
> 
> For example queuing a bulk transfer will end up like this:
> 
> >   		/* Set the TRB length, TD size, and interrupter fields. */
> >   		if (xhci->hci_version < 0x100) {
> > -			remainder = xhci_td_remainder(
> > +			if (xhci->quirks & XHCI_MTK_HOST) {
> > +				remainder = xhci_mtk_td_remainder_quirk(
> > +					running_total, trb_buff_len, urb);
> > +			} else {
> > +				remainder = xhci_td_remainder(
> >   					urb->transfer_buffer_length -
> >   					running_total);
> > +			}
> >   		} else {
> >   			remainder = xhci_v1_0_td_remainder(running_total,
> >   					trb_buff_len, total_packet_count, urb,
> 
> and similar for isoc and control transfers.
> 
> I'll see if I can simplify the existing remainder calculations into one function, then it should
> be enough to just add something like this into it:
> 
> if (xhci->quirks & XHCI_MTK_HOST)
> 	trb_buff_len = 0;
>   	
> This way we can skip all the extra hassle that comes with a new exported quirk function
> 
> Is the Mediatek xhci really a xHCI 0.96 or older controller? (hci_version < 0x100)
> Not a xHCI 1.0 or 1.1 ?
> 
It is xHCI 0.96, but add some feature of xHCI 1.0

Thanks a lot

> -Mathias
