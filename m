From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 3/3] dma: add Qualcomm Technologies HIDMA channel driver
Date: Wed, 4 Nov 2015 19:44:42 +0200
Message-ID: <CAHp75Vc65zSXXEgHHoxRsap5+HEuRzjH24xnXQWmsFXpB=h4tQ@mail.gmail.com>
References: <1446444460-21600-1-git-send-email-okaya@codeaurora.org>
	<1446444460-21600-4-git-send-email-okaya@codeaurora.org>
	<CAHp75VdBy+_ZYfg6PqyfwMfLa6Sr6nVX_PqkQERc4h7X7b4VCQ@mail.gmail.com>
	<56394C37.4060603@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56394C37.4060603-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dmaengine <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 4, 2015 at 2:07 AM, Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On 11/3/2015 5:10 AM, Andy Shevchenko wrote:
>> On Mon, Nov 2, 2015 at 8:07 AM, Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:

>>> +static void hidma_issue_pending(struct dma_chan *dmach)
>>> +{
>>
>>
>> Wrong. It should actually start the transfer. tx_submit() just puts
>> the descriptor to a queue.
>>
> Depends on the design.
>
> I started from the Freescale driver (mpc512x_dma.c). It follows the same
> model.
>
> I'll just drop the same comment into this code too.
>
>
> /*
> * We are posting descriptors to the hardware as soon as
> * they are ready, so this function does nothing.
> */

So, the Freescale driver was written before change went effective. I
guess in 2011 DMA Engine drivers should use issue pending.
Please, refactor since this behaviour is expected.

>>> +/*
>>> + * Submit descriptor to hardware.
>>> + * Lock the PM for each descriptor we are sending.
>>> + */
>>> +static dma_cookie_t hidma_tx_submit(struct dma_async_tx_descriptor *txd)
>>> +{
>>> +       struct hidma_chan *mchan = to_hidma_chan(txd->chan);
>>> +       struct hidma_dev *dmadev = mchan->dmadev;
>>> +       struct hidma_desc *mdesc;
>>> +       unsigned long irqflags;
>>> +       dma_cookie_t cookie;
>>> +
>>> +       if (!hidma_ll_isenabled(dmadev->lldev))
>>> +               return -ENODEV;
>>> +
>>> +       pm_runtime_get_sync(dmadev->ddev.dev);
>>
>>
>> No point to do it here. It should be done on the function that
>> actually starts the transfer (see issue pending).
>>
> comment above

See above as well.

>>> +static int hidma_probe(struct platform_device *pdev)
>>> +{
>>> +       struct hidma_dev *dmadev;
>>> +       int rc = 0;
>>> +       struct resource *trca_resource;
>>> +       struct resource *evca_resource;
>>> +       int chirq;
>>> +       int current_channel_index = atomic_read(&channel_ref_count);
>>> +

>>> +       /* Set DMA mask to 64 bits. */
>>> +       rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>>> +       if (rc) {
>>> +               dev_warn(&pdev->dev, "unable to set coherent mask to
>>> 64");
>>> +               rc = dma_set_mask_and_coherent(&pdev->dev,
>>> DMA_BIT_MASK(32));
>>> +       }
>>> +       if (rc)
>>> +               goto dmafree;

Maybe move these two lines inside previous condition?

>>> +
>>> +       dmadev->lldev = hidma_ll_init(dmadev->ddev.dev,
>>> +                               dmadev->nr_descriptors, dmadev->dev_trca,
>>> +                               dmadev->dev_evca, dmadev->evridx);
>>> +       if (!dmadev->lldev) {
>>> +               rc = -EPROBE_DEFER;
>>> +               goto dmafree;
>>> +       }
>>> +
>>> +       rc = devm_request_irq(&pdev->dev, chirq, hidma_chirq_handler, 0,
>>> +                             "qcom-hidma", &dmadev->lldev);
>>
>>
>> Better to use request_irq().
>>
>
> why? I thought we favored managed functions over standalone functions in
> simplify the exit path.

IRQ is slightly different in workflow. In most cases, unfortunately,
there is no achievement by devm_ variant.
At least I know two for now. One of them is DMA Engine slave drivers,
though I didn't notice if you are using tasklet's here.
Otherwise it's okay.

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
