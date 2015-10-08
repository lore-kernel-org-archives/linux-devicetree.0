From: chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v9 4/5] xhci: mediatek: support MTK xHCI host controller
Date: Thu, 8 Oct 2015 22:38:39 +0800
Message-ID: <1444315119.26198.16.camel@mhfsdcap03>
References: <1443495698-32233-1-git-send-email-chunfeng.yun@mediatek.com>
	 <1443495698-32233-5-git-send-email-chunfeng.yun@mediatek.com>
	 <560D1CA9.1050009@linaro.org> <1444305958.26198.14.camel@mhfsdcap03>
	 <5616616D.3080205@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5616616D.3080205-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2015-10-08 at 13:28 +0100, Daniel Thompson wrote:
> On 08/10/15 13:05, chunfeng yun wrote:
> > Hi,
> > On Thu, 2015-10-01 at 12:44 +0100, Daniel Thompson wrote:
> >> On 29/09/15 04:01, Chunfeng Yun wrote:
> >>> There some vendor quirks for MTK xhci host controller:
> >>> 1. It defines some extra SW scheduling parameters for HW
> >>>     to minimize the scheduling effort for synchronous and
> >>>     interrupt endpoints. The parameters are put into reseved
> >>>     DWs of slot context and endpoint context.
> >>> 2. Its IMODI unit for Interrupter Moderation register is
> >>>     8 times as much as that defined in xHCI spec.
> >>> 3. Its TDS in  Normal TRB defines a number of packets that
> >>>     remains to be transferred for a TD after processing all
> >>>     Max packets in all previous TRBs.
> >>>
> >>> Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >>
> >> I've done some basic soak tests, both with a directly attached USB3 HDD
> >> and, given the extra code to manage isochronous xfer, also with a hub,
> >> disc and two audio interfaces.
> >>
> >> Tested-by: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>
> >>
> >>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> >>> index 57f40a1..243f696 100644
> >>> --- a/drivers/usb/host/xhci-ring.c
> >>> +++ b/drivers/usb/host/xhci-ring.c
> >>> @@ -68,6 +68,7 @@
> >>>    #include <linux/slab.h>
> >>>    #include "xhci.h"
> >>>    #include "xhci-trace.h"
> >>> +#include "xhci-mtk.h"
> >>>
> >>>    /*
> >>>     * Returns zero if the TRB isn't in this segment, otherwise it returns the DMA
> >>> @@ -3044,18 +3045,27 @@ static u32 xhci_td_remainder(struct xhci_hcd *xhci, int transferred,
> >>>    			      struct urb *urb, unsigned int num_trbs_left)
> >>>    {
> >>>    	u32 maxp, total_packet_count;
> >>> +	u32 skip_current_trb = 0;
> >>
> >> A bit of a nitpick but why do we need skip_current_trb? Testing
> >> (xhci->quirks & XHCI_MTK_HOST) twice would make what the code does, and
> >> why, more obvious.
> >>
> > I am not sure which way it is better, so add variable of
> > skip_current_trb to reduce test times.
> 
> I can't imagine either approach impacts performance. However introducing 
> skip_current_trb makes the flow of the branches harder to follow.
> 
> The first branch was a version check and can remain so; we only need to 
> do something special with the quirks because the MTK controller is 0.97 
> but with a few bits added:
> 
>      /* MTK xHCI is mostly 0.97 but contains some features from 1.0 */
>      if (xhci->hci_version < 0x100 && !(xhci->quirks & XHCI_MTK_HOST))
> 	    return ...
> 
> Setting trb_buff_len to zero is accommodating a quirk and this is 
> clearer when we have:
> 
>      /* for MTK xHCI, TD size doesn't include this TRB */
>      if (xhci->quirks & XHCI_MTK_HOST)
> 	    trb_buff_len = 0;
> 
I will revise the code according to your suggestion, thanks

> 
> >> Anyhow with that looked at, and the caveat that I'm not much of USB
> >> expert, you're welcome to add my Reviewed-by: to v10.
> >>
> >
> > Thanks a lot
> 
> No worries.
> 


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
