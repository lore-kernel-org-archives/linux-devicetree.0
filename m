From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v3 2/2] dma: sprd: Add Spreadtrum DMA driver
Date: Tue, 26 Sep 2017 04:02:52 +0800
Message-ID: <CAMz4kuK-4Op0+zk4=V8h-8K+oKR+AnsyvV9mwJbP3xNUMpw9Fg@mail.gmail.com>
References: <69228f2ae8af7cff6b2a5e75503a08bd756a0d5e.1504777856.git.baolin.wang@spreadtrum.com>
 <6225db538d6f22c608da89520576669784a82e1e.1504777856.git.baolin.wang@spreadtrum.com>
 <20170925094759.GB30097@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170925094759.GB30097@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Baolin Wang <baolin.wang@spreadtrum.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Vinod,

On 25 September 2017 at 17:47, Vinod Koul <vinod.koul@intel.com> wrote:
> On Thu, Sep 07, 2017 at 06:00:04PM +0800, Baolin Wang wrote:
>
>> +static void sprd_dma_chn_update(struct sprd_dma_chn *schan, u32 reg,
>> +                             u32 mask, u32 val)
>
> right justfied pls

I have made these to right justified, but I do not know why it looks
like in this email. I checked the patch in patchwork[1], it already
right justified. But I will check again to make sure they are right
justified.

[1] https://patchwork.kernel.org/patch/9942025/

>
>> +static void sprd_dma_clear_int(struct sprd_dma_chn *schan)
>> +{
>> +     u32 mask = SPRD_DMA_INT_MASK << SPRD_DMA_INT_CLR_OFFSET;
>> +     u32 val = SPRD_DMA_INT_MASK << SPRD_DMA_INT_CLR_OFFSET;
>
> both seems same..?

Yes, I will save one line here in next version.

>
>> +
>> +     sprd_dma_chn_update(schan, SPRD_DMA_CHN_INTC, mask, val);
>
> do you need local values here, we can just call sprd_dma_chn_update() with
> the mask and values!

Sine I want to keep this function to make things clear when users can
know what is going on from the function name. But if you think they
are redundant, I will remove these local values in next version.

>
> Also looking at thus shoulnt SPRD_DMA_INT_MASK bits be defined for the bits
> we have in spec, if so why are we shifting then, perhpas u should redo the
> clear routine to pass mask, shift, bits..?
>
> Same comment for this and others

OK.

>
>> +static enum dma_int_type sprd_dma_get_int_type(struct sprd_dma_chn *schan)
>> +{
>> +     u32 intc_sts = readl(schan->chn_base + SPRD_DMA_CHN_INTC) &
>> +                    SPRD_DMA_CHN_INT_STS;
>
> right justfied

OK.

>
>> +static enum dma_request_mode sprd_dma_get_req_type(struct sprd_dma_chn *schan)
>> +{
>> +     u32 frag_reg = readl(schan->chn_base + SPRD_DMA_CHN_FRG_LEN);
>> +     u32 req_type = (frag_reg >> SPRD_DMA_REQ_MODE_OFFSET) &
>> +                    SPRD_DMA_REQ_MODE_MASK;
>> +
>> +     switch (req_type) {
>> +     case 0:
>> +             return SPRD_DMA_FRAG_REQ;
>
> which is 0
>
>> +
>> +     case 1:
>> +             return SPRD_DMA_BLK_REQ;
>
> and 1 and so on so why the coonversion?
>
> you can do:
>
>         switch (req_type) {
>         case 0:
>         case 1:
>         case 2:
>         case 3:
>                 return req_type;
>         default:
>                 return SPRD_DMA_FRAG_REQ;

Make sense.

>
>> +
>> +     case 2:
>> +             return SPRD_DMA_TRANS_REQ;
>> +
>> +     case 3:
>> +             return SPRD_DMA_LIST_REQ;
>> +
>> +     default:
>> +             return SPRD_DMA_FRAG_REQ;
>> +     }
>> +}
>> +     if ((src_step != 0 && des_step != 0) || (src_step | des_step) == 0) {
>> +             fix_en = 0;
>> +     } else {
>> +             fix_en = 1;
>> +             if (src_step)
>> +                     fix_mode = 1;
>> +             else
>> +                     fix_mode = 0;
>> +     }
>> +
>> +     hw->frg_len = datawidth << SPRD_DMA_SRC_DATAWIDTH_OFFSET |
>> +             datawidth << SPRD_DMA_DES_DATAWIDTH_OFFSET |
>> +             req_mode << SPRD_DMA_REQ_MODE_OFFSET |
>> +             fix_mode << SPRD_DMA_FIX_SEL_OFFSET |
>> +             fix_en << SPRD_DMA_FIX_SEL_EN |
>> +             (fragment_len & SPRD_DMA_FRG_LEN_MASK);
>> +     hw->blk_len = block_len & SPRD_DMA_BLK_LEN_MASK;
>> +
>> +     hw->intc = SPRD_DMA_CFG_ERR_INT_EN;
>
> empty line here please

OK.

>
>> +     switch (irq_mode) {
>> +     case SPRD_DMA_NO_INT:
>> +             break;
>
> no handling?

Yes, we do not need to set any irq type enabled here.

>
>> +     case SPRD_DMA_FRAG_INT:
>> +             hw->intc |= SPRD_DMA_FRAG_INT_EN;
>> +             break;
>
> empty line after break helps readablity

OK. I will check the whole file.

>
>> +     case SPRD_DMA_BLK_INT:
>> +             hw->intc |= SPRD_DMA_BLK_INT_EN;
>> +             break;
>> +     case SPRD_DMA_BLK_FRAG_INT:
>> +             hw->intc |= SPRD_DMA_BLK_INT_EN | SPRD_DMA_FRAG_INT_EN;
>> +             break;
>> +     case SPRD_DMA_TRANS_INT:
>> +             hw->intc |= SPRD_DMA_TRANS_INT_EN;
>> +             break;
>> +     case SPRD_DMA_TRANS_FRAG_INT:
>> +             hw->intc |= SPRD_DMA_TRANS_INT_EN | SPRD_DMA_FRAG_INT_EN;
>> +             break;
>> +     case SPRD_DMA_TRANS_BLK_INT:
>> +             hw->intc |= SPRD_DMA_TRANS_INT_EN | SPRD_DMA_BLK_INT_EN;
>> +             break;
>> +     case SPRD_DMA_LIST_INT:
>> +             hw->intc |= SPRD_DMA_LIST_INT_EN;
>> +             break;
>> +     case SPRD_DMA_CFGERR_INT:
>> +             hw->intc |= SPRD_DMA_CFG_ERR_INT_EN;
>> +             break;
>> +     default:
>> +             dev_err(sdev->dma_dev.dev, "invalid irq mode\n");
>> +             return -EINVAL;
>
> [snip]
>
>> +struct dma_async_tx_descriptor *sprd_dma_prep_dma_memcpy(struct dma_chan *chan,
>> +                                                      dma_addr_t dest,
>> +                                                      dma_addr_t src,
>> +                                                      size_t len,
>> +                                                      unsigned long flags)
>> +{
>> +     struct sprd_dma_chn *schan = to_sprd_dma_chan(chan);
>> +     struct sprd_dma_desc *sdesc;
>> +     int ret;
>> +
>> +     sdesc = kzalloc(sizeof(struct sprd_dma_desc), GFP_NOWAIT);
>
> sizeof(*sdesc) pls

OK.

>
>> +     ret = dma_async_device_register(&sdev->dma_dev);
>> +     if (ret < 0) {
>> +             dev_err(&pdev->dev, "register dma device failed:%d\n", ret);
>> +             goto err_register;
>> +     }
>> +
>> +     sprd_dma_info.dma_cap = sdev->dma_dev.cap_mask;
>> +     ret = of_dma_controller_register(np, of_dma_simple_xlate,
>> +                                      &sprd_dma_info);
>> +     if (ret)
>> +             goto err_of_register;
>> +
>> +     pm_runtime_put_sync(&pdev->dev);
>
> why put_sync, i though you didnt want these?

Sorry, I missing this and I will fix this in next version. Thanks for
your commnets.

-- 
Baolin.wang
Best Regards
