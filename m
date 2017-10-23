From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v4 2/2] dma: sprd: Add Spreadtrum DMA driver
Date: Mon, 23 Oct 2017 15:12:20 +0800
Message-ID: <CAMz4ku+VtxucSdCckCTeHd7k1ystBt1SiuQTrrHkwm68RGV=fQ@mail.gmail.com>
References: <84d9f80ce9853ae8441ef91e8701ba516db8f697.1507612144.git.baolin.wang@spreadtrum.com>
 <6c3036ce14d776452bd8526c0ea9541880a43541.1507612144.git.baolin.wang@spreadtrum.com>
 <20171023064409.GE936@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171023064409.GE936@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Baolin Wang <baolin.wang@spreadtrum.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Vinod,

On 23 October 2017 at 14:44, Vinod Koul <vinod.koul@intel.com> wrote:
> On Tue, Oct 10, 2017 at 01:23:01PM +0800, Baolin Wang wrote:
>> +++ b/drivers/dma/sprd-dma.c
>> @@ -0,0 +1,988 @@
>> +/*
>> + * Copyright (C) 2017 Spreadtrum Communications Inc.
>> + *
>> + * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>
> MIT? See comment for MODULE_LICENSE

Ah, sorry for the copy-paste error, I will remove MIT in next version.

>
>> +/* SPRD_DMA_CHN_CFG register definition */
>> +#define SPRD_DMA_CHN_EN                      BIT(0)
>> +#define SPRD_DMA_WAIT_BDONE          24
>
> 24 decimal? Why not BIT or GENMASK?

This is one offset, we can not use BIT or GENMASK, maybe I should
change the macro as SPRD_DMA_WAIT_BDONE_OFFSET.

>
>> +#define SPRD_DMA_DONOT_WAIT_BDONE    1
>
> BIT()

This is one value for config register to choose if should wait BDONE,
we can not use BIT() to define the value, since the value should be 0
or 1.

>
>> +static void sprd_dma_chn_update(struct sprd_dma_chn *schan, u32 reg,
>> +                             u32 mask, u32 val)
>> +{
>> +     u32 orig = readl(schan->chn_base + reg);
>> +     u32 tmp;
>> +
>> +     tmp = orig & ~mask;
>> +     tmp |= val & mask;
>
> how about:
>
>         tmp = (orig & ~mask) | val;

OK.

>> +
>> +     writel(tmp, schan->chn_base + reg);
>> +}
>
> ...
>
>> +static enum sprd_dma_int_type sprd_dma_get_int_type(struct sprd_dma_chn *schan)
>> +{
>> +     u32 intc_sts = readl(schan->chn_base + SPRD_DMA_CHN_INTC) &
>> +                    SPRD_DMA_CHN_INT_STS;
>> +
>> +     switch (intc_sts) {
>> +     case SPRD_DMA_CFGERR_INT_STS:
>> +             return SPRD_DMA_CFGERR_INT;
>> +
>> +     case SPRD_DMA_LIST_INT_STS:
>> +             return SPRD_DMA_LIST_INT;
>> +
>> +     case SPRD_DMA_TRSC_INT_STS:
>> +             return SPRD_DMA_TRANS_INT;
>> +
>> +     case SPRD_DMA_BLK_INT_STS:
>> +             return SPRD_DMA_BLK_INT;
>> +
>> +     case SPRD_DMA_FRAG_INT_STS:
>> +             return SPRD_DMA_FRAG_INT;
>> +
>> +     default:
>> +             return SPRD_DMA_NO_INT;
>
> should we not log this as error and say we are falling back?

OK. I will add to print errors and check this abnormal interrupt type
in sprd_dma_check_trans_done().

>
>> +static void sprd_dma_free_chan_resources(struct dma_chan *chan)
>> +{
>> +     struct sprd_dma_chn *schan = to_sprd_dma_chan(chan);
>> +     unsigned long flags;
>> +
>> +     spin_lock_irqsave(&schan->vc.lock, flags);
>> +     sprd_dma_stop(schan);
>
> shouldn't the channel be stopped already?

No. We should disable the channel, unset the device uid and clear all
interrupts.

>
>> +static enum dma_status sprd_dma_tx_status(struct dma_chan *chan,
>> +                                       dma_cookie_t cookie,
>> +                                       struct dma_tx_state *txstate)
>> +{
>> +     struct sprd_dma_chn *schan = to_sprd_dma_chan(chan);
>> +     struct virt_dma_desc *vd;
>> +     unsigned long flags;
>> +     enum dma_status ret;
>> +     u32 pos;
>> +
>> +     ret = dma_cookie_status(chan, cookie, txstate);
>> +
>> +     spin_lock_irqsave(&schan->vc.lock, flags);
>> +     vd = vchan_find_desc(&schan->vc, cookie);
>> +     if (vd) {
>
> pls check txstate being valid. No point continuing if that is not valid

Sure.

>
>> +struct dma_async_tx_descriptor *sprd_dma_prep_dma_memcpy(struct dma_chan *chan,
>> +                                                      dma_addr_t dest,
>> +                                                      dma_addr_t src,
>> +                                                      size_t len,
>> +                                                      unsigned long flags)
>
> the argument can be moved to two line, it will help readablity.

OK.

>
>> +static int sprd_dma_probe(struct platform_device *pdev)
>> +{
>> +     struct device_node *np = pdev->dev.of_node;
>> +     struct sprd_dma_dev *sdev;
>> +     struct sprd_dma_chn *dma_chn;
>> +     struct resource *res;
>> +     u32 chn_count;
>> +     int ret, i;
>> +
>> +     ret = of_property_read_u32(np, "#dma-channels", &chn_count);
>
> why not device_property_read_u32()?

Yes, will change it.

>
>> +     if (ret) {
>> +             dev_err(&pdev->dev, "get dma channels count failed\n");
>> +             return ret;
>> +     }
>> +
>> +     sdev = devm_kzalloc(&pdev->dev, sizeof(*sdev) +
>> +                         sizeof(*dma_chn) * chn_count,
>> +                         GFP_KERNEL);
>> +     if (!sdev)
>> +             return -ENOMEM;
>> +
>> +     sdev->clk = devm_clk_get(&pdev->dev, "enable");
>> +     if (IS_ERR(sdev->clk)) {
>> +             dev_err(&pdev->dev, "get enable clock failed\n");
>> +             return PTR_ERR(sdev->clk);
>> +     }
>> +
>> +     /* ashb clock is optional for AGCP DMA */
>> +     sdev->ashb_clk = devm_clk_get(&pdev->dev, "ashb_eb");
>> +     if (IS_ERR(sdev->ashb_clk))
>> +             dev_warn(&pdev->dev, "no optional ashb eb clock\n");
>> +
>> +     /*
>> +      * We have three DMA controllers: AP DMA, AON DMA and AGCP DMA. For AGCP
>> +      * DMA controller, it can do not request the irq to save system power
>
> it can or do not, either would make sense but not both

Yes, will modify the comments here.

>
>> +      * without resuming system by DMA interrupts. Thus the DMA interrupts
>> +      * property should be optional.
>> +      */
>> +     sdev->irq = platform_get_irq(pdev, 0);
>> +     if (sdev->irq > 0) {
>> +             ret = devm_request_irq(&pdev->dev, sdev->irq, dma_irq_handle,
>> +                                    0, "sprd_dma", (void *)sdev);
>> +             if (ret < 0) {
>> +                     dev_err(&pdev->dev, "request dma irq failed\n");
>> +                     return ret;
>> +             }
>> +     } else {
>> +             dev_warn(&pdev->dev, "no interrupts for the dma controller\n");
>> +     }
>> +
>> +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +     sdev->glb_base = devm_ioremap_nocache(&pdev->dev, res->start,
>> +                                           resource_size(res));
>> +     if (!sdev->glb_base)
>> +             return -ENOMEM;
>> +
>> +     dma_cap_set(DMA_MEMCPY, sdev->dma_dev.cap_mask);
>> +     sdev->total_chns = chn_count;
>> +     sdev->dma_dev.chancnt = chn_count;
>> +     INIT_LIST_HEAD(&sdev->dma_dev.channels);
>> +     INIT_LIST_HEAD(&sdev->dma_dev.global_node);
>> +     sdev->dma_dev.dev = &pdev->dev;
>> +     sdev->dma_dev.device_alloc_chan_resources = sprd_dma_alloc_chan_resources;
>> +     sdev->dma_dev.device_free_chan_resources = sprd_dma_free_chan_resources;
>> +     sdev->dma_dev.device_tx_status = sprd_dma_tx_status;
>> +     sdev->dma_dev.device_issue_pending = sprd_dma_issue_pending;
>> +     sdev->dma_dev.device_prep_dma_memcpy = sprd_dma_prep_dma_memcpy;
>> +     sdev->dma_dev.device_pause = sprd_dma_pause;
>> +     sdev->dma_dev.device_resume = sprd_dma_resume;
>> +     sdev->dma_dev.device_terminate_all = sprd_dma_terminate_all;
>> +
>> +     for (i = 0; i < chn_count; i++) {
>> +             dma_chn = &sdev->channels[i];
>> +             dma_chn->chn_num = i;
>> +             dma_chn->cur_desc = NULL;
>> +             /* get each channel's registers base address. */
>> +             dma_chn->chn_base = (void __iomem *)
>> +                     ((unsigned long)sdev->glb_base +
>
> the casts look pretty bad here, why are we casting it this way?

I think I can remove the casting here to make it clear.

>
>> +static int __maybe_unused sprd_dma_runtime_resume(struct device *dev)
>> +{
>> +     struct sprd_dma_dev *sdev = dev_get_drvdata(dev);
>> +     int ret;
>> +
>> +     ret = sprd_dma_enable(sdev);
>> +     if (ret) {
>> +             dev_err(sdev->dma_dev.dev, "enable dma failed\n");
>> +             return ret;
>> +     }
>> +
>> +     return 0;
>
> return ret
>
> we can avoid the two returns that way

OK.

>
>> +MODULE_LICENSE("GPL v2");
>
> and here only GPL v2, so which one is correct?

This is correct. Very appreciated for your comments.

-- 
Baolin.wang
Best Regards
