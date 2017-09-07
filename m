From: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] dma: sprd: Add Spreadtrum DMA driver
Date: Thu, 7 Sep 2017 10:48:41 +0800
Message-ID: <CAMz4kuJ-mhVDYcK2SYBWb6rZ56GNTsKK9c5fSoeOHHzd31xBCQ@mail.gmail.com>
References: <b7bea49d254da89c43baf2ae02858bf67c59fd1d.1503995645.git.baolin.wang@spreadtrum.com>
 <20e9e7ca9b46eabf48cf3fc68fcb0aae47071dc9.1503995645.git.baolin.wang@spreadtrum.com>
 <20170905042348.GN3053@localhost> <20170905114842.GA24350@spreadtrum.com> <20170906162231.GR3053@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170906162231.GR3053@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vinod,

On 7 September 2017 at 00:22, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Sep 05, 2017 at 07:48:43PM +0800, Baolin Wang wrote:
>
>> > > +/* DMA global registers definition */
>> > > +#define DMA_GLB_PAUSE                    0x0
>> > > +#define DMA_GLB_FRAG_WAIT                0x4
>> > > +#define DMA_GLB_REQ_PEND0_EN             0x8
>> > > +#define DMA_GLB_REQ_PEND1_EN             0xc
>> > > +#define DMA_GLB_INT_RAW_STS              0x10
>> > > +#define DMA_GLB_INT_MSK_STS              0x14
>> > > +#define DMA_GLB_REQ_STS                  0x18
>> > > +#define DMA_GLB_CHN_EN_STS               0x1c
>> > > +#define DMA_GLB_DEBUG_STS                0x20
>> > > +#define DMA_GLB_ARB_SEL_STS              0x24
>> > > +#define DMA_GLB_CHN_START_CHN_CFG1       0x28
>> > > +#define DMA_GLB_CHN_START_CHN_CFG2       0x2c
>> > > +#define DMA_CHN_LLIST_OFFSET             0x10
>> > > +#define DMA_GLB_REQ_CID_OFFSET           0x2000
>> > > +#define DMA_GLB_REQ_CID(uid)             (0x4 * ((uid) - 1))
>> >
>> > namespaced properly please, here and rest..
>>
>> Could you elaborate which name need to named properly?
>> I guess DMA_GLB_REQ_CID is not very clear, can I change
>> to DMA_GLB_REQ_UID(uid) which is used to define the UID
>> registers?
>
> I meant something like:
>
> SPRD_DMA_xxxx
>
> DMA_GLB is very generic term and might cause collisions in future so lets
> make these future proof..

Make sense.

>
>> > > +static int sprd_dma_enable(struct sprd_dma_dev *sdev)
>> > > +{
>> > > + int ret;
>> > > +
>> > > + ret = clk_prepare_enable(sdev->clk);
>> > > + if (ret)
>> > > +         return ret;
>> > > +
>> > > + if (!IS_ERR(sdev->ashb_clk))
>> >
>> > that looks odd, can you explain this?
>>
>> Since the ashb_clk is optional and only for AGCP DMA controller,
>> so here we add one condition to check if the ashb_clk need enable.
>
> it be worth documenting this..

OK.

>
>> > > +static void sprd_dma_free_chan_resources(struct dma_chan *chan)
>> > > +{
>> > > + struct sprd_dma_chn *schan = to_sprd_dma_chan(chan);
>> > > + unsigned long flags;
>> > > +
>> > > + spin_lock_irqsave(&schan->vc.lock, flags);
>> > > + sprd_dma_stop(schan);
>> > > + spin_unlock_irqrestore(&schan->vc.lock, flags);
>> > > +
>> > > + vchan_free_chan_resources(&schan->vc);
>> > > + pm_runtime_put_sync(chan->device->dev);
>> >
>> > why put_sync()
>>
>> Since we will get pm counter to resume DMA when allocating resources, then
>> we should put pm counter in sprd_dma_free_chan_resources() to try to suspend
>> DMA if the pm counter is 0.
>
> runtime_pm part is fine, you could have used pm_runtime_put(), why the
> sync() variant here...

After checking again, I agree pm_runtime_put() is enough here and I
will fix it in next version.

>>
>> >
>> > > +static enum dma_status sprd_dma_tx_status(struct dma_chan *chan,
>> > > +                                   dma_cookie_t cookie,
>> > > +                                   struct dma_tx_state *txstate)
>> > > +{
>> > > + struct sprd_dma_chn *schan = to_sprd_dma_chan(chan);
>> > > + unsigned long flags;
>> > > + enum dma_status ret;
>> > > +
>> > > + ret = dma_cookie_status(chan, cookie, txstate);
>> > > +
>> > > + spin_lock_irqsave(&schan->vc.lock, flags);
>> > > + txstate->residue = sprd_dma_get_dst_addr(schan);
>> >
>> > I dont think this is correct, the residue needs to be read only for current
>> > cookie and the query might be for one which is not even submitted
>>
>> We have one scenario for our audio driver, the audio driver need to get
>> the destination address to check if their transfer is done in no irq mode.
>
> Yes but for the descriptor requested but not any. Audio maybe working as
> period count maybe lesser...
>
>> > > +static int sprd_dma_probe(struct platform_device *pdev)
>> > > +{
>> > > + struct device_node *np = pdev->dev.of_node;
>> > > + struct sprd_dma_dev *sdev;
>> > > + struct sprd_dma_chn *dma_chn;
>> > > + struct resource *res;
>> > > + u32 chn_count;
>> > > + int ret, i;
>> > > +
>> > > + ret = of_property_read_u32(np, "#dma-channels", &chn_count);
>> > > + if (ret) {
>> > > +         dev_err(&pdev->dev, "get dma channels count failed\n");
>> > > +         return ret;
>> > > + }
>> > > +
>> > > + sdev = devm_kzalloc(&pdev->dev, (sizeof(*sdev) +
>> > > +                     (sizeof(struct sprd_dma_chn) * chn_count)),
>> > > +                     GFP_KERNEL);
>> > > + if (!sdev)
>> > > +         return -ENOMEM;
>> > > +
>> > > + sdev->clk = devm_clk_get(&pdev->dev, "enable");
>> > > + if (IS_ERR(sdev->clk)) {
>> > > +         dev_err(&pdev->dev, "get enable clock failed\n");
>> > > +         return PTR_ERR(sdev->clk);
>> > > + }
>> > > +
>> > > + /* ashb clock is optional for AGCP DMA */
>> > > + sdev->ashb_clk = devm_clk_get(&pdev->dev, "ashb_eb");
>> > > + if (IS_ERR(sdev->ashb_clk))
>> > > +         dev_warn(&pdev->dev, "no optional ashb eb clock\n");
>> > > +
>> > > + sdev->irq = platform_get_irq(pdev, 0);
>> > > + if (sdev->irq > 0) {
>> > > +         ret = devm_request_irq(&pdev->dev, sdev->irq, dma_irq_handle,
>> > > +                                0, "sprd_dma", (void *)sdev);
>> >
>> > so after this your driver should be able to handle the urq, are you ready
>> > for that, I think not
>>
>> We have one no irq mode for audio driver, our DMA driver do not need do handle
>> the irq, and audio driver can get the destination address to check if their
>> transfer is done.
>
> ?? you are adding interrupt handler!

Sorry for confusing. This driver is not only for one DMA controller,
we can have 3 DMA controllers for different usage, moreover we can
have irq mode or no irq mode for different cases, in irq mode the DMA
interrupt handler need handle the descriptors when transfer is done.
But in no irq mode for our audio driver special case, which is used to
save system power without DMA interrupts resume system, in this
scenario we do not need complete descriptors by DMA handler.

>
>> > > +static int sprd_dma_remove(struct platform_device *pdev)
>> > > +{
>> > > + struct sprd_dma_dev *sdev = platform_get_drvdata(pdev);
>> > > + int ret;
>> > > +
>> > > + ret = pm_runtime_get_sync(&pdev->dev);
>> > > + if (ret < 0)
>> > > +         return ret;
>> > > +
>> > > + dma_async_device_unregister(&sdev->dma_dev);
>> > > + sprd_dma_disable(sdev);
>> >
>> > and irq is not freed, how do you guarantee that irqs are not scheduled
>> > anymore and all tasklets running have completed and cant be further
>> > scheduled?
>>
>> Since we request irq by devm_xxx() API, which means the irq can be freed
>> automatically when removing the DMA driver.
>
> no, thats buggy. you should explictly, a) kill the tasklet b) free irq

OK.

>
>> > > +static int __init sprd_dma_init(void)
>> > > +{
>> > > + return platform_driver_register(&sprd_dma_driver);
>> > > +}
>> > > +arch_initcall_sync(sprd_dma_init);
>> > > +
>> > > +static void __exit sprd_dma_exit(void)
>> > > +{
>> > > + platform_driver_unregister(&sprd_dma_driver);
>> > > +}
>> > > +module_exit(sprd_dma_exit);
>> >
>> > module_platform_driver() pls
>>
>> Since our SPI will depend on DMA driver, but I will try to set module_init
>> level.
>
> ah okay, i missed that. Btw with defer probe I don't think we should have
> that issue

Yes. Will fix that. Thanks for your comments.

-- 
Baolin.wang
Best Regards
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
