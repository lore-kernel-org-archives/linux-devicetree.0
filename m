From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] dma: Add Xilinx zynqmp dma engine driver support
Date: Sun, 23 Aug 2015 19:38:23 +0530
Message-ID: <20150823140823.GA13546@localhost>
References: <1438831173-8761-1-git-send-email-punnaia@xilinx.com>
 <1438831173-8761-2-git-send-email-punnaia@xilinx.com>
 <20150820061312.GA13546@localhost>
 <CAGnW=BaU__+B2uAK=qpV3QP60SqSUxx-kgJVs0t42K0fqTxL0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGnW=BaU__+B2uAK=qpV3QP60SqSUxx-kgJVs0t42K0fqTxL0g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: punnaiah choudary kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Punnaiah Choudary <kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 20, 2015 at 12:01:27PM +0530, punnaiah choudary kalluri wrote:
> On Thu, Aug 20, 2015 at 11:43 AM, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> > On Thu, Aug 06, 2015 at 08:49:33AM +0530, Punnaiah Choudary Kalluri wrote:
> >
> >> +     list_for_each_entry_safe(desc, next, &chan->done_list, node) {
> >> +             dma_async_tx_callback callback;
> >> +             void *callback_param;
> >> +
> >> +             list_del(&desc->node);
> >> +
> >> +             callback = desc->async_tx.callback;
> >> +             callback_param = desc->async_tx.callback_param;
> >> +             if (callback) {
> >> +                     if (in_interrupt())
> >> +                             spin_unlock_bh(&chan->lock);
> >> +                     else
> >> +                             spin_unlock(&chan->lock);
> >
> > This looks bad!
> > Why would callback be called from different context. It should only be
> > invoked from your tasklet
> 
> During the terminate call, driver need to clean up the existing BDs so that time
> this function will be called from the thread or process context in
> addition to the
> tasklet context.
> 
> DO you have any suggestion here ?

Yes you need to terminate but you don't need to invoke user for terminate
flow. It is not expected.
Terminate flow expect youu to clean the channels

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
