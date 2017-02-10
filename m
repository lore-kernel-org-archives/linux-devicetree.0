From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 2/2] dmaengine: Add DW AXI DMAC driver
Date: Fri, 10 Feb 2017 11:36:06 +0530
Message-ID: <20170210060606.GO19244@localhost>
References: <1485358457-22957-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1485358457-22957-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1485358457-22957-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, linux-snps-arc@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 25, 2017 at 06:34:17PM +0300, Eugeniy Paltsev wrote:
> This patch adds support for the DW AXI DMAC controller.
> 
> DW AXI DMAC is a part of upcoming development board from Synopsys.

How different is AXI from DW Synopsys?

Is the spec publicly available?

> +config AXI_DW_DMAC
> +	tristate "Synopsys DesignWare AXI DMA support"
> +	depends on OF && !64BIT

why not 64 bit, can you also add compile test

> +#define AXI_DMA_BUSWIDTHS		  \
> +	(DMA_SLAVE_BUSWIDTH_UNDEFINED	| \

DMA_SLAVE_BUSWIDTH_UNDEFINED??

> +static irqreturn_t dw_axi_dma_intretupt(int irq, void *dev_id)
> +{
> +	struct axi_dma_chip *chip = dev_id;
> +
> +	/* Disable DMAC inerrupts. We'll enable them in the tasklet */
> +	axi_dma_irq_disable(chip);
> +
> +	tasklet_schedule(&chip->dw->tasklet);

This is very inefficient, we would want to submit next txn here and not in
tasklet

> +static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
> +{
> +	struct virt_dma_desc *vd;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&chan->vc.lock, flags);
> +	if (unlikely(axi_chan_is_hw_enable(chan))) {
> +		dev_err(chan2dev(chan), "BUG: %s catched DWAXIDMAC_IRQ_DMA_TRF, but channel not idle!\n",
> +			axi_chan_name(chan));
> +		axi_chan_disable(chan);
> +	}
> +
> +	/* The completed descriptor currently is in the head of vc list */
> +	vd = vchan_next_desc(&chan->vc);
> +	/* Remove the completed descriptor from issued list before completing */
> +	list_del(&vd->node);
> +	vchan_cookie_complete(vd);

this should be called from irq handler


> +static int dw_remove(struct platform_device *pdev)
> +{
> +	struct axi_dma_chip *chip = platform_get_drvdata(pdev);
> +	struct dw_axi_dma *dw = chip->dw;
> +	struct axi_dma_chan *chan, *_chan;
> +	u32 i;
> +
> +	axi_dma_irq_disable(chip);
> +	for (i = 0; i < dw->hdata->nr_channels; i++) {
> +		axi_chan_disable(&chip->dw->chan[i]);
> +		axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
> +	}
> +	axi_dma_disable(chip);
> +
> +	tasklet_kill(&dw->tasklet);
> +
> +	list_for_each_entry_safe(chan, _chan, &dw->dma.channels,
> +			vc.chan.device_node) {
> +		list_del(&chan->vc.chan.device_node);
> +		tasklet_kill(&chan->vc.task);
> +	}

very nice :)

But please freeup irq as well

> +module_platform_driver(dw_driver);
> +
> +static int __init dw_init(void)
> +{
> +	return platform_driver_register(&dw_driver);
> +}
> +subsys_initcall(dw_init);

why subsys_initcall??

> +/* Common registers offset */
> +#define DMAC_ID			0x000 // R DMAC ID
> +#define DMAC_COMPVER		0x008 // R DMAC Component Version
> +#define DMAC_CFG		0x010 // R/W DMAC Configuration
> +#define DMAC_CHEN		0x018 // R/W DMAC Channel Enable
> +#define DMAC_CHEN_L		0x018 // R/W DMAC Channel Enable 00-31
> +#define DMAC_CHEN_H		0x01C // R/W DMAC Channel Enable 32-63
> +#define DMAC_INTSTATUS		0x030 // R DMAC Interrupt Status
> +#define DMAC_COMMON_INTCLEAR	0x038 // W DMAC Interrupt Clear
> +#define DMAC_COMMON_INTSTATUS_ENA 0x040 // R DMAC Interrupt Status Enable
> +#define DMAC_COMMON_INTSIGNAL_ENA 0x048 // R/W DMAC Interrupt Signal Enable
> +#define DMAC_COMMON_INTSTATUS	0x050 // R DMAC Interrupt Status
> +#define DMAC_RESET		0x058 // R DMAC Reset Register1

DMAC is a generic term, AX_DMAC and no C99 style comment, checkpatch would
have cribbed

Use BITS and GENMASK here

> +
> +/* DMA channel registers offset */
> +#define CH_SAR			0x000 // R/W Chan Source Address
> +#define CH_DAR			0x008 // R/W Chan Destination Address
> +#define CH_BLOCK_TS		0x010 // R/W Chan Block Transfer Size
> +#define CH_CTL			0x018 // R/W Chan Control
> +#define CH_CTL_L		0x018 // R/W Chan Control 00-31
> +#define CH_CTL_H		0x01C // R/W Chan Control 32-63
> +#define CH_CFG			0x020 // R/W Chan Configuration
> +#define CH_CFG_L		0x020 // R/W Chan Configuration 00-31
> +#define CH_CFG_H		0x024 // R/W Chan Configuration 32-63
> +#define CH_LLP			0x028 // R/W Chan Linked List Pointer
> +#define CH_STATUS		0x030 // R Chan Status
> +#define CH_SWHSSRC		0x038 // R/W Chan SW Handshake Source
> +#define CH_SWHSDST		0x040 // R/W Chan SW Handshake Destination
> +#define CH_BLK_TFR_RESUMEREQ	0x048 // W Chan Block Transfer Resume Req
> +#define CH_AXI_ID		0x050 // R/W Chan AXI ID
> +#define CH_AXI_QOS		0x058 // R/W Chan AXI QOS
> +#define CH_SSTAT		0x060 // R Chan Source Status
> +#define CH_DSTAT		0x068 // R Chan Destination Status
> +#define CH_SSTATAR		0x070 // R/W Chan Source Status Fetch Addr
> +#define CH_DSTATAR		0x078 // R/W Chan Destination Status Fetch Addr
> +#define CH_INTSTATUS_ENA	0x080 // R/W Chan Interrupt Status Enable
> +#define CH_INTSTATUS		0x088 // R/W Chan Interrupt Status
> +#define CH_INTSIGNAL_ENA	0x090 // R/W Chan Interrupt Signal Enable
> +#define CH_INTCLEAR		0x098 // W Chan Interrupt Clear

Same here

-- 
~Vinod
