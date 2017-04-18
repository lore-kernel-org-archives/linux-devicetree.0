From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 2/2] dmaengine: Add DW AXI DMAC driver
Date: Tue, 18 Apr 2017 15:31:35 +0300
Message-ID: <1492518695.24567.56.camel@linux.intel.com>
References: <1491573855-1039-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
         <1491573855-1039-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491573855-1039-3-git-send-email-Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2017-04-07 at 17:04 +0300, Eugeniy Paltsev wrote:
> This patch adds support for the DW AXI DMAC controller.
> 
> DW AXI DMAC is a part of upcoming development board from Synopsys.
> 
> In this driver implementation only DMA_MEMCPY and DMA_SG transfers
> are supported.

> 

> +++ b/drivers/dma/axi_dma_platform.c
> @@ -0,0 +1,1044 @@
> +/*
> + * Synopsys DesignWare AXI DMA Controller driver.
> + *
> + * Copyright (C) 2017 Synopsys, Inc. (www.synopsys.com)
> + *
> + * This program is free software; you can redistribute it and/or
> modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dmapool.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>

> +#include <linux/of.h>

Are you sure you still need of.h along with depends OF ?

> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>
> +#include <linux/types.h>
> +

> +#include "axi_dma_platform.h"
> +#include "axi_dma_platform_reg.h"

Can't you have this in one header?

> +#include "dmaengine.h"
> +#include "virt-dma.h"

> +#define AXI_DMA_BUSWIDTHS		  \
> +	(DMA_SLAVE_BUSWIDTH_1_BYTE	| \
> +	DMA_SLAVE_BUSWIDTH_2_BYTES	| \
> +	DMA_SLAVE_BUSWIDTH_4_BYTES	| \
> +	DMA_SLAVE_BUSWIDTH_8_BYTES	| \
> +	DMA_SLAVE_BUSWIDTH_16_BYTES	| \
> +	DMA_SLAVE_BUSWIDTH_32_BYTES	| \
> +	DMA_SLAVE_BUSWIDTH_64_BYTES)
> +/* TODO: check: do we need to use BIT() macro here? */

Still TODO? I remember I answered to this on the first round.

> +
> +static inline void
> +axi_dma_iowrite32(struct axi_dma_chip *chip, u32 reg, u32 val)
> +{
> +	iowrite32(val, chip->regs + reg);

Are you going to use IO ports for this IP? I don't think so.
Wouldn't be better to call readl()/writel() instead?

> +}

> +static inline void
> +axi_chan_iowrite64(struct axi_dma_chan *chan, u32 reg, u64 val)
> +{
> +	iowrite32(val & 0xFFFFFFFF, chan->chan_regs + reg);

Useless conjunction.

> +	iowrite32(val >> 32, chan->chan_regs + reg + 4);
> +}

Can your hardware get 8 bytes at once?

For such cases we have iowrite64() for 64-bit kernels

But with readq()/writeq() we have specific helpers to make this pretty,
i.e. lo_hi_readq() / lo_hi_writeq() (or hi_lo_*() variants).

> +static inline void axi_chan_irq_disable(struct axi_dma_chan *chan,
> u32 irq_mask)
> +{
> +	u32 val;
> +

> +	if (likely(irq_mask == DWAXIDMAC_IRQ_ALL)) {
> +		axi_chan_iowrite32(chan, CH_INTSTATUS_ENA,
> DWAXIDMAC_IRQ_NONE);
> +	} else {

I don't see the benefit. (Yes, I see one read-less path, I think it
makes perplexity for nothing here)

> +		val = axi_chan_ioread32(chan, CH_INTSTATUS_ENA);
> +		val &= ~irq_mask;
> +		axi_chan_iowrite32(chan, CH_INTSTATUS_ENA, val);
> +	}
> +}

> +static inline void axi_chan_disable(struct axi_dma_chan *chan)
> +{

> +}
> +
> +static inline void axi_chan_enable(struct axi_dma_chan *chan)
> +{

> +}

> +static u32 axi_chan_get_xfer_width(struct axi_dma_chan *chan,
> dma_addr_t src,
> +				   dma_addr_t dst, size_t len)
> +{
> +	u32 max_width = chan->chip->dw->hdata->m_data_width;

> +	size_t sdl = (src | dst | len);

Redundant parens, redundant temporary variable (you may do this in
place).

> +
> +	return min_t(size_t, __ffs(sdl), max_width);
> +}

> +static void axi_desc_put(struct axi_dma_desc *desc)
> +{
> +	struct axi_dma_chan *chan = desc->chan;
> +	struct dw_axi_dma *dw = chan->chip->dw;
> +	struct axi_dma_desc *child, *_next;
> +	unsigned int descs_put = 0;

> +	list_for_each_entry_safe(child, _next, &desc->xfer_list,
> xfer_list) {

xfer_list looks redundant.
Can you elaborate why virtual channel management is not working for you?

> +		list_del(&child->xfer_list);
> +		dma_pool_free(dw->desc_pool, child, child-
> >vd.tx.phys);
> +		descs_put++;
> +	}

> +}

> +/* Called in chan locked context */
> +static void axi_chan_block_xfer_start(struct axi_dma_chan *chan,
> +				      struct axi_dma_desc *first)
> +{

> +	u32 reg, irq_mask;
> +	u8 lms = 0;

Does it make any sense? It looks like lms is always 0.
Or I miss the source of its value?

> +	u32 priority = chan->chip->dw->hdata->priority[chan->id];

Reversed xmas tree, please.

Btw, are you planning to use priority at all? For now on I didn't see a
single driver (from the set I have checked, like 4-5 of them) that uses
priority anyhow. It makes driver more complex for nothing.

> +
> +	if (unlikely(axi_chan_is_hw_enable(chan))) {
> +		dev_err(chan2dev(chan), "%s is non-idle!\n",
> +			axi_chan_name(chan));
> +
> +		return;
> +	}

> +}

> +static void dma_chan_free_chan_resources(struct dma_chan *dchan)
> +{
> +	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
> +
> +	/* ASSERT: channel hw is idle */
> +	if (axi_chan_is_hw_enable(chan))
> +		dev_err(dchan2dev(dchan), "%s is non-idle!\n",
> +			axi_chan_name(chan));
> +
> +	axi_chan_disable(chan);
> +	axi_chan_irq_disable(chan, DWAXIDMAC_IRQ_ALL);
> +
> +	vchan_free_chan_resources(&chan->vc);
> +
> +	dev_vdbg(dchan2dev(dchan), "%s: %s: descriptor still
> allocated: %u\n",
> +		__func__, axi_chan_name(chan),

Redundant __func__ parameter for debug prints.

> +		atomic_read(&chan->descs_allocated));
> +
> +	pm_runtime_put(chan->chip->dev);
> +}

> +static struct dma_async_tx_descriptor *
> +dma_chan_prep_dma_sg(struct dma_chan *dchan,
> +		     struct scatterlist *dst_sg, unsigned int
> dst_nents,
> +		     struct scatterlist *src_sg, unsigned int
> src_nents,
> +		     unsigned long flags)
> +{
> +	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
> +	struct axi_dma_desc *first = NULL, *desc = NULL, *prev =
> NULL;
> +	size_t dst_len = 0, src_len = 0, xfer_len = 0;
> +	dma_addr_t dst_adr = 0, src_adr = 0;
> +	u32 src_width, dst_width;
> +	size_t block_ts, max_block_ts;
> +	u32 reg;

> +	u8 lms = 0;

Same about lms.

> +
> +	dev_dbg(chan2dev(chan), "%s: %s: sn: %d dn: %d flags: 0x%lx",
> +		__func__, axi_chan_name(chan), src_nents, dst_nents,
> flags);

Ditto for __func__.

> +
> 

> +	if (unlikely(dst_nents == 0 || src_nents == 0))
> +		return NULL;
> +
> +	if (unlikely(dst_sg == NULL || src_sg == NULL))
> +		return NULL;

If we need those checks they should go to dmaengine.h/dmaengine.c.

> +static void axi_chan_list_dump_lli(struct axi_dma_chan *chan,
> +				   struct axi_dma_desc *desc_head)
> +{
> +	struct axi_dma_desc *desc;
> +
> +	axi_chan_dump_lli(chan, desc_head);
> +	list_for_each_entry(desc, &desc_head->xfer_list, xfer_list)
> +		axi_chan_dump_lli(chan, desc);
> +}

> +
> +

Redundant (one) empty line.

> +static void axi_chan_handle_err(struct axi_dma_chan *chan, u32
> status)
> +{

> +	/* WARN about bad descriptor */
> 
> +	dev_err(chan2dev(chan),
> +		"Bad descriptor submitted for %s, cookie: %d, irq:
> 0x%08x\n",
> +		axi_chan_name(chan), vd->tx.cookie, status);
> +	axi_chan_list_dump_lli(chan, vd_to_axi_desc(vd));

As I said earlier dw_dmac is *bad* example of the (virtual channel
based) DMA driver.

I guess you may just fail the descriptor and don't pretend it has been
processed successfully.

> +static int dma_chan_pause(struct dma_chan *dchan)
> +{
> +	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
> +	unsigned long flags;
> +	unsigned int timeout = 20; /* timeout iterations */
> +	int ret = -EAGAIN;
> +	u32 val;
> +
> +	spin_lock_irqsave(&chan->vc.lock, flags);
> +

> +	val = axi_dma_ioread32(chan->chip, DMAC_CHEN);
> +	val |= BIT(chan->id) << DMAC_CHAN_SUSP_SHIFT |
> +	       BIT(chan->id) << DMAC_CHAN_SUSP_WE_SHIFT;
> +	axi_dma_iowrite32(chan->chip, DMAC_CHEN, val);

You have helpers which you don't use. Why?

> +
> +	while (timeout--) {

In such cases I prefer do {} while (); to explicitly show that body goes
at least once.

> +		if (axi_chan_irq_read(chan) &
> DWAXIDMAC_IRQ_SUSPENDED) {
> +			ret = 0;
> +			break;
> +		}
> +		udelay(2);
> +	}
> +
> +	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
> +
> +	chan->is_paused = true;
> +
> +	spin_unlock_irqrestore(&chan->vc.lock, flags);
> +
> +	return ret;
> +}
> +
> +/* Called in chan locked context */
> +static inline void axi_chan_resume(struct axi_dma_chan *chan)
> +{
> +	u32 val;
> +

> +	val = axi_dma_ioread32(chan->chip, DMAC_CHEN);
> +	val &= ~(BIT(chan->id) << DMAC_CHAN_SUSP_SHIFT);
> +	val |=  (BIT(chan->id) << DMAC_CHAN_SUSP_WE_SHIFT);
> +	axi_dma_iowrite32(chan->chip, DMAC_CHEN, val);

Use helper.

> +
> +	chan->is_paused = false;
> +}

> +static int axi_dma_runtime_suspend(struct device *dev)
> +{
> +	struct axi_dma_chip *chip = dev_get_drvdata(dev);
> +

> +	dev_info(dev, "PAL: %s\n", __func__);

Noisy and useless.
We have functional tracer in kernel. Use it.

> +
> +	axi_dma_irq_disable(chip);
> +	axi_dma_disable(chip);
> +
> +	clk_disable_unprepare(chip->clk);
> +
> +	return 0;
> +}
> +
> +static int axi_dma_runtime_resume(struct device *dev)
> +{
> +	struct axi_dma_chip *chip = dev_get_drvdata(dev);
> +	int ret = 0;
> +

> +	dev_info(dev, "PAL: %s\n", __func__);

Ditto.

> +
> +	ret = clk_prepare_enable(chip->clk);
> +	if (ret < 0)
> +		return ret;
> +
> +	axi_dma_enable(chip);
> +	axi_dma_irq_enable(chip);
> +
> +	return 0;
> +}

> +static int dw_probe(struct platform_device *pdev)
> +{
> +	struct axi_dma_chip *chip;
> +	struct resource *mem;
> +	struct dw_axi_dma *dw;
> +	struct dw_axi_dma_hcfg *hdata;
> +	u32 i;
> +	int ret;
> +
> +	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	dw = devm_kzalloc(&pdev->dev, sizeof(*dw), GFP_KERNEL);
> +	if (!dw)
> +		return -ENOMEM;
> +
> +	hdata = devm_kzalloc(&pdev->dev, sizeof(*hdata), GFP_KERNEL);
> +	if (!hdata)
> +		return -ENOMEM;
> +
> +	chip->dw = dw;
> +	chip->dev = &pdev->dev;
> +	chip->dw->hdata = hdata;
> +
> +	chip->irq = platform_get_irq(pdev, 0);
> +	if (chip->irq < 0)
> +		return chip->irq;
> +
> +	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	chip->regs = devm_ioremap_resource(chip->dev, mem);
> +	if (IS_ERR(chip->regs))
> +		return PTR_ERR(chip->regs);
> +
> +	chip->clk = devm_clk_get(chip->dev, NULL);
> +	if (IS_ERR(chip->clk))
> +		return PTR_ERR(chip->clk);
> +
> +	ret = parse_device_properties(chip);
> +	if (ret)
> +		return ret;
> +
> +	dw->chan = devm_kcalloc(chip->dev, hdata->nr_channels,
> +				sizeof(*dw->chan), GFP_KERNEL);
> +	if (!dw->chan)
> +		return -ENOMEM;
> +
> +	ret = devm_request_irq(chip->dev, chip->irq,
> dw_axi_dma_intretupt,
> +			       IRQF_SHARED, DRV_NAME, chip);
> +	if (ret)
> +		return ret;
> +
> +	/* Lli address must be aligned to a 64-byte boundary */
> +	dw->desc_pool = dmam_pool_create(DRV_NAME, chip->dev,
> +					 sizeof(struct axi_dma_desc),
> 64, 0);
> +	if (!dw->desc_pool) {
> +		dev_err(chip->dev, "No memory for descriptors dma
> pool\n");
> +		return -ENOMEM;
> +	}
> +
> +	INIT_LIST_HEAD(&dw->dma.channels);
> +	for (i = 0; i < hdata->nr_channels; i++) {
> +		struct axi_dma_chan *chan = &dw->chan[i];
> +
> +		chan->chip = chip;
> +		chan->id = (u8)i;
> +		chan->chan_regs = chip->regs + COMMON_REG_LEN + i *
> CHAN_REG_LEN;
> +		atomic_set(&chan->descs_allocated, 0);
> +
> +		chan->vc.desc_free = vchan_desc_put;
> +		vchan_init(&chan->vc, &dw->dma);
> +	}
> +
> +	/* Set capabilities */
> +	dma_cap_set(DMA_MEMCPY, dw->dma.cap_mask);
> +	dma_cap_set(DMA_SG, dw->dma.cap_mask);
> +
> +	/* DMA capabilities */
> +	dw->dma.chancnt = hdata->nr_channels;
> +	dw->dma.src_addr_widths = AXI_DMA_BUSWIDTHS;
> +	dw->dma.dst_addr_widths = AXI_DMA_BUSWIDTHS;
> +	dw->dma.directions = BIT(DMA_MEM_TO_MEM);
> +	dw->dma.residue_granularity =
> DMA_RESIDUE_GRANULARITY_DESCRIPTOR;
> +
> +	dw->dma.dev = chip->dev;
> +	dw->dma.device_tx_status = dma_chan_tx_status;
> +	dw->dma.device_issue_pending = dma_chan_issue_pending;
> +	dw->dma.device_terminate_all = dma_chan_terminate_all;
> +	dw->dma.device_pause = dma_chan_pause;
> +	dw->dma.device_resume = dma_chan_resume;
> +
> +	dw->dma.device_alloc_chan_resources =
> dma_chan_alloc_chan_resources;
> +	dw->dma.device_free_chan_resources =
> dma_chan_free_chan_resources;
> +
> +	dw->dma.device_prep_dma_memcpy = dma_chan_prep_dma_memcpy;
> +	dw->dma.device_prep_dma_sg = dma_chan_prep_dma_sg;
> +
> +	platform_set_drvdata(pdev, chip);
> +
> +	pm_runtime_enable(chip->dev);
> +
> +	/*
> +	 * We can't just call pm_runtime_get here instead of
> +	 * pm_runtime_get_noresume + axi_dma_runtime_resume because
> we need
> +	 * driver to work also without Runtime PM.
> +	 */
> +	pm_runtime_get_noresume(chip->dev);
> +	ret = axi_dma_runtime_resume(chip->dev);
> +	if (ret < 0)
> +		goto err_pm_disable;
> +
> +	axi_dma_hw_init(chip);
> +
> +	pm_runtime_put(chip->dev);
> +
> +	ret = dma_async_device_register(&dw->dma);
> +	if (ret)
> +		goto err_pm_disable;
> +
> +	dev_info(chip->dev, "DesignWare AXI DMA Controller, %d
> channels\n",
> +		 dw->hdata->nr_channels);
> +
> +	return 0;
> +
> +err_pm_disable:
> +	pm_runtime_disable(chip->dev);
> +
> +	return ret;
> +}
> +
> +static int dw_remove(struct platform_device *pdev)
> +{
> +	struct axi_dma_chip *chip = platform_get_drvdata(pdev);
> +	struct dw_axi_dma *dw = chip->dw;
> +	struct axi_dma_chan *chan, *_chan;
> +	u32 i;
> +
> +	/* Enable clk before accessing to registers */
> +	clk_prepare_enable(chip->clk);
> +	axi_dma_irq_disable(chip);
> +	for (i = 0; i < dw->hdata->nr_channels; i++) {
> +		axi_chan_disable(&chip->dw->chan[i]);
> +		axi_chan_irq_disable(&chip->dw->chan[i],
> DWAXIDMAC_IRQ_ALL);
> +	}
> +	axi_dma_disable(chip);
> +
> +	pm_runtime_disable(chip->dev);
> +	axi_dma_runtime_suspend(chip->dev);
> +
> +	devm_free_irq(chip->dev, chip->irq, chip);
> +
> +	list_for_each_entry_safe(chan, _chan, &dw->dma.channels,
> +			vc.chan.device_node) {
> +		list_del(&chan->vc.chan.device_node);
> +		tasklet_kill(&chan->vc.task);
> +	}
> +
> +	dma_async_device_unregister(&dw->dma);
> +
> +	return 0;
> +}
> +

> +static const struct dev_pm_ops dw_axi_dma_pm_ops = {
> +	SET_RUNTIME_PM_OPS(axi_dma_runtime_suspend,
> axi_dma_runtime_resume, NULL)
> +};

Have you tried to build with CONFIG_PM disabled?

I'm pretty sure you need __maybe_unused applied to your PM ops.

> +struct axi_dma_chan {
> +	struct axi_dma_chip		*chip;
> +	void __iomem			*chan_regs;
> +	u8				id;
> +	atomic_t			descs_allocated;
> +
> +	struct virt_dma_chan		vc;
> +

> +	/* these other elements are all protected by vc.lock */
> +	bool				is_paused;

I still didn't get (already forgot) why you can't use dma_status instead
for the active descriptor?

> +};

> +/* LLI == Linked List Item */
> +struct __attribute__ ((__packed__)) axi_dma_lli {

...

> +	__le64		sar;
> +	__le64		dar;
> +	__le32		block_ts_lo;
> +	__le32		block_ts_hi;
> +	__le64		llp;
> +	__le32		ctl_lo;
> +	__le32		ctl_hi;
> +	__le32		sstat;
> +	__le32		dstat;
> +	__le32		status_lo;
> +	__le32		ststus_hi;
> +	__le32		reserved_lo;
> +	__le32		reserved_hi;
> +};

Just __packed here.

> +
> +struct axi_dma_desc {
> +	struct axi_dma_lli		lli;
> +
> +	struct virt_dma_desc		vd;
> +	struct axi_dma_chan		*chan;

> +	struct list_head		xfer_list;

This looks redundant. Already asked above about it.

> +};
> +

> +/* Common registers offset */
> +#define DMAC_ID			0x000 /* R DMAC ID */
> +#define DMAC_COMPVER		0x008 /* R DMAC Component Version
> */
> +#define DMAC_CFG		0x010 /* R/W DMAC Configuration */
> +#define DMAC_CHEN		0x018 /* R/W DMAC Channel Enable */
> +#define DMAC_CHEN_L		0x018 /* R/W DMAC Channel Enable
> 00-31 */
> +#define DMAC_CHEN_H		0x01C /* R/W DMAC Channel Enable
> 32-63 */
> +#define DMAC_INTSTATUS		0x030 /* R DMAC Interrupt
> Status */
> +#define DMAC_COMMON_INTCLEAR	0x038 /* W DMAC Interrupt Clear
> */
> +#define DMAC_COMMON_INTSTATUS_ENA 0x040 /* R DMAC Interrupt Status
> Enable */
> +#define DMAC_COMMON_INTSIGNAL_ENA 0x048 /* R/W DMAC Interrupt Signal
> Enable */
> +#define DMAC_COMMON_INTSTATUS	0x050 /* R DMAC Interrupt Status
> */
> +#define DMAC_RESET		0x058 /* R DMAC Reset Register1 */
> +
> +/* DMA channel registers offset */
> +#define CH_SAR			0x000 /* R/W Chan Source
> Address */
> +#define CH_DAR			0x008 /* R/W Chan Destination
> Address */
> +#define CH_BLOCK_TS		0x010 /* R/W Chan Block Transfer
> Size */
> +#define CH_CTL			0x018 /* R/W Chan Control */
> +#define CH_CTL_L		0x018 /* R/W Chan Control 00-31 */
> +#define CH_CTL_H		0x01C /* R/W Chan Control 32-63 */
> +#define CH_CFG			0x020 /* R/W Chan Configuration
> */
> +#define CH_CFG_L		0x020 /* R/W Chan Configuration 00-31 
> */
> +#define CH_CFG_H		0x024 /* R/W Chan Configuration 32-63 
> */
> +#define CH_LLP			0x028 /* R/W Chan Linked List
> Pointer */
> +#define CH_STATUS		0x030 /* R Chan Status */
> +#define CH_SWHSSRC		0x038 /* R/W Chan SW Handshake
> Source */
> +#define CH_SWHSDST		0x040 /* R/W Chan SW Handshake
> Destination */
> +#define CH_BLK_TFR_RESUMEREQ	0x048 /* W Chan Block Transfer
> Resume Req */
> +#define CH_AXI_ID		0x050 /* R/W Chan AXI ID */
> +#define CH_AXI_QOS		0x058 /* R/W Chan AXI QOS */
> +#define CH_SSTAT		0x060 /* R Chan Source Status */
> +#define CH_DSTAT		0x068 /* R Chan Destination Status */
> +#define CH_SSTATAR		0x070 /* R/W Chan Source Status
> Fetch Addr */
> +#define CH_DSTATAR		0x078 /* R/W Chan Destination
> Status Fetch Addr */
> +#define CH_INTSTATUS_ENA	0x080 /* R/W Chan Interrupt Status
> Enable */
> +#define CH_INTSTATUS		0x088 /* R/W Chan Interrupt
> Status */
> +#define CH_INTSIGNAL_ENA	0x090 /* R/W Chan Interrupt Signal
> Enable */
> +#define CH_INTCLEAR		0x098 /* W Chan Interrupt Clear */

I'm wondering if you can use regmap API instead.

> +
> +

Redundant (one) empty line.

> +/* DMAC_CFG */
> +#define DMAC_EN_MASK		0x00000001U

GENMASK()

> +#define DMAC_EN_POS		0

Usually _SHIFT, but it's up to you.

> +
> +#define INT_EN_MASK		0x00000002U

GENMASK()

> +#define INT_EN_POS		1
> +

_SHIFT ?

> +#define CH_CTL_L_DST_MSIZE_POS	18
> +#define CH_CTL_L_SRC_MSIZE_POS	14

Ditto.

> +enum {
> +	DWAXIDMAC_BURST_TRANS_LEN_1	= 0x0,
> +	DWAXIDMAC_BURST_TRANS_LEN_4,
> +	DWAXIDMAC_BURST_TRANS_LEN_8,
> +	DWAXIDMAC_BURST_TRANS_LEN_16,
> +	DWAXIDMAC_BURST_TRANS_LEN_32,
> +	DWAXIDMAC_BURST_TRANS_LEN_64,
> +	DWAXIDMAC_BURST_TRANS_LEN_128,
> +	DWAXIDMAC_BURST_TRANS_LEN_256,
> +	DWAXIDMAC_BURST_TRANS_LEN_512,
> +	DWAXIDMAC_BURST_TRANS_LEN_1024

..._1024, ?

> +};

Hmm... do you need them in the header?

> +#define CH_CFG_H_TT_FC_POS	0
> +enum {
> +	DWAXIDMAC_TT_FC_MEM_TO_MEM_DMAC	= 0x0,
> +	DWAXIDMAC_TT_FC_MEM_TO_PER_DMAC,
> +	DWAXIDMAC_TT_FC_PER_TO_MEM_DMAC,
> +	DWAXIDMAC_TT_FC_PER_TO_PER_DMAC,
> +	DWAXIDMAC_TT_FC_PER_TO_MEM_SRC,
> +	DWAXIDMAC_TT_FC_PER_TO_PER_SRC,
> +	DWAXIDMAC_TT_FC_MEM_TO_PER_DST,
> +	DWAXIDMAC_TT_FC_PER_TO_PER_DST
> +};

Some of definitions are the same as for dw_dmac, right? We might split
them to a common header, though I have no strong opinion about it.
Vinod?

> +/**
> + * Dw axi dma channel interrupts

Dw axi dma - > DW AXI DMA?

> + *
> + * @DWAXIDMAC_IRQ_NONE: Bitmask of no one interrupt
> + * @DWAXIDMAC_IRQ_BLOCK_TRF: Block transfer complete
> + * @DWAXIDMAC_IRQ_DMA_TRF: Dma transfer complete
> + * @DWAXIDMAC_IRQ_SRC_TRAN: Source transaction complete
> + * @DWAXIDMAC_IRQ_DST_TRAN: Destination transaction complete
> + * @DWAXIDMAC_IRQ_SRC_DEC_ERR: Source decode error
> + * @DWAXIDMAC_IRQ_DST_DEC_ERR: Destination decode error
> + * @DWAXIDMAC_IRQ_SRC_SLV_ERR: Source slave error
> + * @DWAXIDMAC_IRQ_DST_SLV_ERR: Destination slave error
> + * @DWAXIDMAC_IRQ_LLI_RD_DEC_ERR: LLI read decode error
> + * @DWAXIDMAC_IRQ_LLI_WR_DEC_ERR: LLI write decode error
> + * @DWAXIDMAC_IRQ_LLI_RD_SLV_ERR: LLI read slave error
> + * @DWAXIDMAC_IRQ_LLI_WR_SLV_ERR: LLI write slave error
> + * @DWAXIDMAC_IRQ_INVALID_ERR: LLI invalide error or Shadow register
> error
> + * @DWAXIDMAC_IRQ_MULTIBLKTYPE_ERR: Slave Interface Multiblock type
> error
> + * @DWAXIDMAC_IRQ_DEC_ERR: Slave Interface decode error
> + * @DWAXIDMAC_IRQ_WR2RO_ERR: Slave Interface write to read only error
> + * @DWAXIDMAC_IRQ_RD2RWO_ERR: Slave Interface read to write only
> error
> + * @DWAXIDMAC_IRQ_WRONCHEN_ERR: Slave Interface write to channel
> error
> + * @DWAXIDMAC_IRQ_SHADOWREG_ERR: Slave Interface shadow reg error
> + * @DWAXIDMAC_IRQ_WRONHOLD_ERR: Slave Interface hold error
> + * @DWAXIDMAC_IRQ_LOCK_CLEARED: Lock Cleared Status
> + * @DWAXIDMAC_IRQ_SRC_SUSPENDED: Source Suspended Status
> + * @DWAXIDMAC_IRQ_SUSPENDED: Channel Suspended Status
> + * @DWAXIDMAC_IRQ_DISABLED: Channel Disabled Status
> + * @DWAXIDMAC_IRQ_ABORTED: Channel Aborted Status
> + * @DWAXIDMAC_IRQ_ALL_ERR: Bitmask of all error interrupts
> + * @DWAXIDMAC_IRQ_ALL: Bitmask of all interrupts
> + */
> +enum {
> +	DWAXIDMAC_IRQ_NONE		= 0x0,

Just 0.

> +	DWAXIDMAC_IRQ_BLOCK_TRF		= BIT(0),
> +	DWAXIDMAC_IRQ_DMA_TRF		= BIT(1),
> +	DWAXIDMAC_IRQ_SRC_TRAN		= BIT(3),
> +	DWAXIDMAC_IRQ_DST_TRAN		= BIT(4),
> +	DWAXIDMAC_IRQ_SRC_DEC_ERR	= BIT(5),
> +	DWAXIDMAC_IRQ_DST_DEC_ERR	= BIT(6),
> +	DWAXIDMAC_IRQ_SRC_SLV_ERR	= BIT(7),
> +	DWAXIDMAC_IRQ_DST_SLV_ERR	= BIT(8),
> +	DWAXIDMAC_IRQ_LLI_RD_DEC_ERR	= BIT(9),
> +	DWAXIDMAC_IRQ_LLI_WR_DEC_ERR	= BIT(10),
> +	DWAXIDMAC_IRQ_LLI_RD_SLV_ERR	= BIT(11),
> +	DWAXIDMAC_IRQ_LLI_WR_SLV_ERR	= BIT(12),
> +	DWAXIDMAC_IRQ_INVALID_ERR	= BIT(13),
> +	DWAXIDMAC_IRQ_MULTIBLKTYPE_ERR	= BIT(14),
> +	DWAXIDMAC_IRQ_DEC_ERR		= BIT(16),
> +	DWAXIDMAC_IRQ_WR2RO_ERR		= BIT(17),
> +	DWAXIDMAC_IRQ_RD2RWO_ERR	= BIT(18),
> +	DWAXIDMAC_IRQ_WRONCHEN_ERR	= BIT(19),
> +	DWAXIDMAC_IRQ_SHADOWREG_ERR	= BIT(20),
> +	DWAXIDMAC_IRQ_WRONHOLD_ERR	= BIT(21),
> +	DWAXIDMAC_IRQ_LOCK_CLEARED	= BIT(27),
> +	DWAXIDMAC_IRQ_SRC_SUSPENDED	= BIT(28),
> +	DWAXIDMAC_IRQ_SUSPENDED		= BIT(29),
> +	DWAXIDMAC_IRQ_DISABLED		= BIT(30),
> +	DWAXIDMAC_IRQ_ABORTED		= BIT(31),

> +	DWAXIDMAC_IRQ_ALL_ERR		= 0x003F7FE0,

GENMASK() | GENMASK() ?

> +	DWAXIDMAC_IRQ_ALL		= 0xFFFFFFFF

GENMASK()

> +};

-- 
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
