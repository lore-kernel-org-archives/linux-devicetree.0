From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V2 3/3] dma: add Qualcomm Technologies HIDMA channel
 driver
Date: Wed, 4 Nov 2015 21:22:45 -0500
Message-ID: <563ABD75.5080608@codeaurora.org>
References: <1446444460-21600-1-git-send-email-okaya@codeaurora.org>
 <1446444460-21600-4-git-send-email-okaya@codeaurora.org>
 <CAHp75VdBy+_ZYfg6PqyfwMfLa6Sr6nVX_PqkQERc4h7X7b4VCQ@mail.gmail.com>
 <56394C37.4060603@codeaurora.org>
 <CAHp75Vc65zSXXEgHHoxRsap5+HEuRzjH24xnXQWmsFXpB=h4tQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vc65zSXXEgHHoxRsap5+HEuRzjH24xnXQWmsFXpB=h4tQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: dmaengine <dmaengine@vger.kernel.org>, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


>> /*
>> * We are posting descriptors to the hardware as soon as
>> * they are ready, so this function does nothing.
>> */
>
> So, the Freescale driver was written before change went effective. I
> guess in 2011 DMA Engine drivers should use issue pending.
> Please, refactor since this behaviour is expected.
>

done

>>>> +/*
>>>> + * Submit descriptor to hardware.
>>>> + * Lock the PM for each descriptor we are sending.
>>>> + */
>>>> +static dma_cookie_t hidma_tx_submit(struct dma_async_tx_descriptor *txd)
>>>> +{
>>>> +       struct hidma_chan *mchan = to_hidma_chan(txd->chan);
>>>> +       struct hidma_dev *dmadev = mchan->dmadev;
>>>> +       struct hidma_desc *mdesc;
>>>> +       unsigned long irqflags;
>>>> +       dma_cookie_t cookie;
>>>> +
>>>> +       if (!hidma_ll_isenabled(dmadev->lldev))
>>>> +               return -ENODEV;
>>>> +
>>>> +       pm_runtime_get_sync(dmadev->ddev.dev);
>>>
>>>
>>> No point to do it here. It should be done on the function that
>>> actually starts the transfer (see issue pending).
>>>
>> comment above
>
> See above as well.

done

>
>>>> +static int hidma_probe(struct platform_device *pdev)
>>>> +{
>>>> +       struct hidma_dev *dmadev;
>>>> +       int rc = 0;
>>>> +       struct resource *trca_resource;
>>>> +       struct resource *evca_resource;
>>>> +       int chirq;
>>>> +       int current_channel_index = atomic_read(&channel_ref_count);
>>>> +
>
>>>> +       /* Set DMA mask to 64 bits. */
>>>> +       rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>>>> +       if (rc) {
>>>> +               dev_warn(&pdev->dev, "unable to set coherent mask to
>>>> 64");
>>>> +               rc = dma_set_mask_and_coherent(&pdev->dev,
>>>> DMA_BIT_MASK(32));
>>>> +       }
>>>> +       if (rc)
>>>> +               goto dmafree;
>
> Maybe move these two lines inside previous condition?

ok

>
>>>> +
>>>> +       dmadev->lldev = hidma_ll_init(dmadev->ddev.dev,
>>>> +                               dmadev->nr_descriptors, dmadev->dev_trca,
>>>> +                               dmadev->dev_evca, dmadev->evridx);
>>>> +       if (!dmadev->lldev) {
>>>> +               rc = -EPROBE_DEFER;
>>>> +               goto dmafree;
>>>> +       }
>>>> +
>>>> +       rc = devm_request_irq(&pdev->dev, chirq, hidma_chirq_handler, 0,
>>>> +                             "qcom-hidma", &dmadev->lldev);
>>>
>>>
>>> Better to use request_irq().
>>>
>>
>> why? I thought we favored managed functions over standalone functions in
>> simplify the exit path.
>
> IRQ is slightly different in workflow. In most cases, unfortunately,
> there is no achievement by devm_ variant.
> At least I know two for now. One of them is DMA Engine slave drivers,
> though I didn't notice if you are using tasklet's here.
> Otherwise it's okay.
>
I'm keeping it as it is for maintenance reasons.

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
