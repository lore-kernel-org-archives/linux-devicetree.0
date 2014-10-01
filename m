From: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH v6 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Wed, 1 Oct 2014 06:35:58 +0000
Message-ID: <abb0c775ec2549e3abb0a2218b4eef98@BN1PR0301MB0772.namprd03.prod.outlook.com>
References: <1411468088-5702-1-git-send-email-antoine.tenart@free-electrons.com>
 <3366285.QN2R3CQNzG@wuerfel> <20140930123933.GA25395@peterchendt>
 <10249326.XCThPmSrfL@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <10249326.XCThPmSrfL@wuerfel>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org" <zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org" <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

 
> Subject: Re: [PATCH v6 07/12] usb: chipidea: add a usb2 driver for ci13xxx
> 
> On Tuesday 30 September 2014 20:39:34 Peter Chen wrote:
> > Thanks, Arnd. I had not thought setting dma mask is so complicated,
> > yes, it should check the return value, two things to confirm:
> >
> > - dma_coerce_mask_and_coherent or dma_set_mask_and_coherent, the
> only
> > difference of these two API is the first one do "dev->dma_mask = &dev-
> >coherent_dma_mask;"
> > The reason you suggest choosing dma_set_mask_and_coherent is you do
> > not want assign dev->dma_mask?
> 
> No, that is just the current definition on ARM32 with
> CONFIG_ARCH_MULTIPLATFORM, and that is going to change soon to be DT
> aware.
> dma_set_mask_and_coherent() is supposed to check whether the platform
> can support the respective mask and return an error if it cannot.
> 
> > - The second parameter for dma_set_mask_and_coherent is
> > DMA_BIT_MASK(32), is it ok?
> >
> > I just a little confused of what's the operation is "hardcoding the dma mask"?
> 
> dma_coerce_mask_and_coherent() will hardcode the dma mask and override
> whatever the platform says is necessary.
> 

So, we should use dma_set_mask_and_coherent() in most of cases in device driver,
and use dma_coerce_mask_and_coherent() only  when the device's dma_mask is wrong?

Peter

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
