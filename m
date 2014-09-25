From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v6 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Thu, 25 Sep 2014 09:11:35 +0200
Message-ID: <3696520.MDUrkdjfGZ@wuerfel>
References: <1411468088-5702-1-git-send-email-antoine.tenart@free-electrons.com> <1411468088-5702-8-git-send-email-antoine.tenart@free-electrons.com> <20140925011647.GB3716@peterchendt>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140925011647.GB3716@peterchendt>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 25 September 2014 09:16:48 Peter Chen wrote:
> > +     }
> > +
> > +     if (dev->of_node) {
> > +             ret = ci_hdrc_usb2_dt_probe(dev, ci_pdata);
> > +             if (ret)
> > +                     goto clk_err;
> > +     } else {
> > +             ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> > +             if (ret)
> > +                     goto clk_err;
> > +     }
> 
> Hi Antoine, the above code may not be needed, since get phy and set dma
> mask are common operation, we can do it at core code, the only thing you
> need to do is something like: dev->dma_mask = DMA_BIT_MASK(32).
> 

Certainly not, doing that would be broken for a number of reasons:

- dev->dma_mask is a pointer, a driver should not reassign that
- the device may have been set up for a bus that requires a smaller mask
  that is already set, changing the mask would cause data corruption
- setting just the dma mask but not coherent mask is wrong
- setting the dma mask can fail, e.g. if the mask is smaller than the
  smallest memory zone, so you have to check the return value.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
