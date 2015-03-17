From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH_V3 2/3] dma: jz4780: add driver for the Ingenic JZ4780
 DMA controller
Date: Tue, 17 Mar 2015 18:07:36 +0000
Message-ID: <55086D68.1000303@imgtec.com>
References: <1424954614-12589-1-git-send-email-Zubair.Kakakhel@imgtec.com> <1424954614-12589-3-git-send-email-Zubair.Kakakhel@imgtec.com> <20150316104646.GM32683@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150316104646.GM32683-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alex-oucj9GSTHrKwpo/f3jThPQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Thanks for the review.

On 16/03/15 10:46, Vinod Koul wrote:
> On Thu, Feb 26, 2015 at 12:43:33PM +0000, Zubair Lutfullah Kakakhel wrote:
>> +/* Per-channel registers. */
>> +#define JZ_DMA_REG_DSA(n)	(0x00 + (n) * 0x20)
>> +#define JZ_DMA_REG_DTA(n)	(0x04 + (n) * 0x20)
>> +#define JZ_DMA_REG_DTC(n)	(0x08 + (n) * 0x20)
>> +#define JZ_DMA_REG_DRT(n)	(0x0c + (n) * 0x20)
>> +#define JZ_DMA_REG_DCS(n)	(0x10 + (n) * 0x20)
>> +#define JZ_DMA_REG_DCM(n)	(0x14 + (n) * 0x20)
>> +#define JZ_DMA_REG_DDA(n)	(0x18 + (n) * 0x20)
>> +#define JZ_DMA_REG_DSD(n)	(0x1c + (n) * 0x20)
> shouldn't this be a macro rather than copy paste n * 0x20
> 

Done

>> +
>> +#define JZ_DMA_DMAC_DMAE	BIT(0)
>> +#define JZ_DMA_DMAC_AR		BIT(2)
>> +#define JZ_DMA_DMAC_HLT		BIT(3)
>> +#define JZ_DMA_DMAC_FMSC	BIT(31)
>> +
>> +#define JZ_DMA_DRT_AUTO		0x8
> not consistent in BIT?

Its actually 0x01000. instead of just bit.

>> +static struct jz4780_dma_desc *jz4780_dma_desc_alloc(
>> +	struct jz4780_dma_chan *jzchan, unsigned int count,
>> +	enum dma_transaction_type type)
>> +{
>> +	struct jz4780_dma_desc *desc;
>> +
>> +	if (count > JZ_DMA_MAX_DESC)
>> +		return NULL;
>> +
>> +	desc = kzalloc(sizeof(*desc), GFP_ATOMIC);
> GFP_NOWAIT pls
> 
>> +	if (!desc)
>> +		return NULL;
>> +
>> +	desc->desc = dma_pool_alloc(jzchan->desc_pool, GFP_ATOMIC,
> ditto
> 

Done

>> +static uint32_t jz4780_dma_width(enum dma_slave_buswidth width)
>> +{
>> +	switch (width) {
>> +	case DMA_SLAVE_BUSWIDTH_1_BYTE:
>> +		return JZ_DMA_WIDTH_8_BIT;
>> +	case DMA_SLAVE_BUSWIDTH_2_BYTES:
>> +		return JZ_DMA_WIDTH_16_BIT;
> these are same as dmaengine defines so should this be:
> 

These are. The DMA_SLAVE_BUSWIDTH_4_BYTES isn't.

> 	case DMA_SLAVE_BUSWIDTH_1_BYTE:
> 	case DMA_SLAVE_BUSWIDTH_2_BYTES:
> 		return width;
>> +	default:
>> +		return JZ_DMA_WIDTH_32_BIT;
>> +	}
>> +}
>> +
>> +static uint32_t jz4780_dma_transfer_size(unsigned long val, int *ord)
>> +{
>> +	*ord = ffs(val) - 1;
>> +
>> +	/* 8 byte transfer sizes unsupported so fall back on 4. */
> okay falling back is not a good idea, same applies for default in
> jz4780_dma_width(). The slave dma parameters are match with devices, so
> programming something which you dont support, falling back or using defaults
> is not a good idea
> 

How bad of an idea is it and what is a better way?
I see similar stuff in imx-dma and dma-jz4740.

And my jz4740-mmc driver (I add jz4780 support and use it to test this dma driver mainly)
falls back on defaults after it requests a larger transfer size.

>> +	default:
>> +		WARN_ON(1);
>> +		return -1; /* Can never happen. See previous comment */
> -1?? what happened to kernel error codes?
> 

Oops.

>> +	}
>> +}
>> +
>> +static void jz4780_dma_setup_hwdesc(struct jz4780_dma_chan *jzchan,
>> +	struct jz4780_dma_hwdesc *desc, dma_addr_t addr, size_t len)
>> +{
>> +	struct dma_slave_config *config = &jzchan->config;
>> +	uint32_t width, maxburst, tsz;
>> +	int ord;
>> +
>> +	if (config->direction == DMA_MEM_TO_DEV) {
> this is a wrong idea, use the direction from the prep_ call
> 
Done

>> +static enum dma_status jz4780_dma_tx_status(struct dma_chan *chan,
>> +	dma_cookie_t cookie, struct dma_tx_state *txstate)
>> +{
>> +	struct jz4780_dma_chan *jzchan = to_jz4780_dma_chan(chan);
>> +	struct virt_dma_desc *vdesc;
>> +	enum dma_status status;
>> +	unsigned long flags;
>> +
>> +	status = dma_cookie_status(chan, cookie, txstate);
>> +	if (status == DMA_COMPLETE)
> or if the txstate is NULL
> 

Done

> 
> 

Thanks
ZubairLK
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
