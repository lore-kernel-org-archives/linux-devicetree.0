From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v6 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Tue, 30 Sep 2014 12:03:42 +0200
Message-ID: <3366285.QN2R3CQNzG@wuerfel>
References: <1411468088-5702-1-git-send-email-antoine.tenart@free-electrons.com> <1411468088-5702-8-git-send-email-antoine.tenart@free-electrons.com> <20140930001206.GA11657@peterchendt>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140930001206.GA11657@peterchendt>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 30 September 2014 08:12:07 Peter Chen wrote:
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
> My suggestion:
> 
> - call dma_coerce_mask_and_coherent(&dev->dev, DMA_BIT_MASK(32)) for both 
> dt and non-dt

No, as I explained before, hardcoding the dma mask is always wrong, don't
do that. Call dma_set_mask_and_coherent and check the return value.
It's not wrong to do that for both DT and ATAGS.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
