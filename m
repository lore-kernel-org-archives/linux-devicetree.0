From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v6 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Tue, 30 Sep 2014 20:39:34 +0800
Message-ID: <20140930123933.GA25395@peterchendt>
References: <1411468088-5702-1-git-send-email-antoine.tenart@free-electrons.com>
 <1411468088-5702-8-git-send-email-antoine.tenart@free-electrons.com>
 <20140930001206.GA11657@peterchendt> <3366285.QN2R3CQNzG@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3366285.QN2R3CQNzG@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 30, 2014 at 12:03:42PM +0200, Arnd Bergmann wrote:
> On Tuesday 30 September 2014 08:12:07 Peter Chen wrote:
> > > +
> > > +     if (dev->of_node) {
> > > +             ret = ci_hdrc_usb2_dt_probe(dev, ci_pdata);
> > > +             if (ret)
> > > +                     goto clk_err;
> > > +     } else {
> > > +             ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> > > +             if (ret)
> > > +                     goto clk_err;
> > > +     }
> > 
> > My suggestion:
> > 
> > - call dma_coerce_mask_and_coherent(&dev->dev, DMA_BIT_MASK(32)) for both 
> > dt and non-dt
> 
> No, as I explained before, hardcoding the dma mask is always wrong, don't
> do that. Call dma_set_mask_and_coherent and check the return value.
> It's not wrong to do that for both DT and ATAGS.
> 

Thanks, Arnd. I had not thought setting dma mask is so complicated, yes, it
should check the return value, two things to confirm:

- dma_coerce_mask_and_coherent or dma_set_mask_and_coherent, the only difference
of these two API is the first one do "dev->dma_mask = &dev->coherent_dma_mask;"
The reason you suggest choosing dma_set_mask_and_coherent is you do not want
assign dev->dma_mask?
- The second parameter for dma_set_mask_and_coherent is DMA_BIT_MASK(32), is it
ok?

I just a little confused of what's the operation is "hardcoding the dma mask"?

-- 
Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
