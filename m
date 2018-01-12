From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] dma: xilinx: dpdma: Add the Xilinx DisplayPort DMA
 engine driver
Date: Fri, 12 Jan 2018 19:43:56 +0530
Message-ID: <20180112141355.GO18649@localhost>
References: <1515204848-3493-1-git-send-email-hyun.kwon@xilinx.com>
 <1515204848-3493-2-git-send-email-hyun.kwon@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1515204848-3493-2-git-send-email-hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Tejas Upadhyay <tejasu-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 05, 2018 at 06:14:08PM -0800, Hyun Kwon wrote:
> The ZynqMP includes the DisplayPort subsystem with own DMA engine
> called DPDMA. The DPDMA IP comes with 6 individual channels
> (4 for display, 2 for audio). This driver implements DMAENGINE API
> which can be used for audio (ALSA) and display (DRM) drivers.

The subsystem name is dmaengine.

> Signed-off-by: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Tejas Upadhyay <tejasu-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>  MAINTAINERS                       |    7 +
>  drivers/dma/Kconfig               |   19 +
>  drivers/dma/xilinx/Makefile       |    1 +
>  drivers/dma/xilinx/xilinx_dpdma.c | 2309 +++++++++++++++++++++++++++++++++++++

That is a very long file for review! Pls split it up to reasonable logical
chunks

> +config XILINX_DPDMA_DEBUG_FS
> +        bool "Xilinx DPDMA debugfs"
> +        depends on DEBUG_FS && XILINX_DPDMA
> +        help
> +          Enable the debugfs code for DPDMA driver. The debugfs code
> +          enables debugging or testing related features. It exposes some
> +          low level controls to the user space to help testing automation,
> +          as well as can enable additional diagnostic or statistical
> +          information.

why should this be a compile option

> + * Xilinx ZynqMP DPDMA Engine driver
> + *
> + *  Copyright (C) 2015 - 2018 Xilinx, Inc.
> + *
> + *  Author: Hyun Woo Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0

this should be first line in file with c99 style,

// SPDX-License-Identifier: GPL-2.0

> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/debugfs.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dmapool.h>
> +#include <linux/gfp.h>
> +#include <linux/interrupt.h>
> +#include <linux/irqreturn.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_dma.h>
> +#include <linux/platform_device.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +#include <linux/uaccess.h>
> +#include <linux/wait.h>

do you need all these headers?

> +
> +#include "../dmaengine.h"
> +
> +/* DPDMA registers */
> +#define XILINX_DPDMA_ERR_CTRL				0x0
> +#define XILINX_DPDMA_ISR				0x4
> +#define XILINX_DPDMA_IMR				0x8
> +#define XILINX_DPDMA_IEN				0xc
> +#define XILINX_DPDMA_IDS				0x10
> +#define XILINX_DPDMA_INTR_DESC_DONE_MASK		(0x3f << 0)

GENMASK() for this and others

> +#define XILINX_DPDMA_INTR_DESC_DONE_SHIFT		0

you can define a common shift using ffs

> + * struct xilinx_dpdma_hw_desc - DPDMA hardware descriptor
> + * @control: control configuration field
> + * @desc_id: descriptor ID
> + * @xfer_size: transfer size
> + * @hsize_stride: horizontal size and stride
> + * @timestamp_lsb: LSB of time stamp
> + * @timestamp_msb: MSB of time stamp
> + * @addr_ext: upper 16 bit of 48 bit address (next_desc and src_addr)
> + * @next_desc: next descriptor 32 bit address
> + * @src_addr: payload source address (lower 32 bit of 1st 4KB page)
> + * @addr_ext_23: upper 16 bit of 48 bit address (src_addr2 and src_addr3)
> + * @addr_ext_45: upper 16 bit of 48 bit address (src_addr4 and src_addr5)
> + * @src_addr2: payload source address (lower 32 bit of 2nd 4KB page)
> + * @src_addr3: payload source address (lower 32 bit of 3rd 4KB page)
> + * @src_addr4: payload source address (lower 32 bit of 4th 4KB page)
> + * @src_addr5: payload source address (lower 32 bit of 5th 4KB page)

what does it mean (lower 32 bit of Nth 4KB page)

> +struct xilinx_dpdma_sw_desc {
> +	struct xilinx_dpdma_hw_desc hw;
> +	struct list_head node;
> +	dma_addr_t phys;

dma_addr_t is not a physical addr

> +struct xilinx_dpdma_device {
> +	struct dma_device common;
> +	void __iomem *reg;
> +	struct device *dev;
> +
> +	struct clk *axi_clk;
> +	struct xilinx_dpdma_chan *chan[XILINX_DPDMA_NUM_CHAN];
> +
> +	bool ext_addr;
> +	void (*desc_addr)(struct xilinx_dpdma_sw_desc *sw_desc,
> +			  struct xilinx_dpdma_sw_desc *prev,
> +			  dma_addr_t dma_addr[], unsigned int num_src_addr);
> +};
> +
> +#ifdef CONFIG_XILINX_DPDMA_DEBUG_FS

this can be CONFIG_DEBUGFS, also am skipping this part to focus on driver.
Pls split this to a separate patch

> +static int xilinx_dpdma_config(struct dma_chan *dchan,
> +			       struct dma_slave_config *config)
> +{
> +	if (config->direction != DMA_MEM_TO_DEV)
> +		return -EINVAL;

?? Why are the config values not used, how else do you configure the
channel?

> +
> +	return 0;
> +}
> +
> +static int xilinx_dpdma_pause(struct dma_chan *dchan)
> +{
> +	xilinx_dpdma_chan_pause(to_xilinx_chan(dchan));
> +
> +	return 0;
> +}
> +
> +static int xilinx_dpdma_resume(struct dma_chan *dchan)
> +{
> +	xilinx_dpdma_chan_unpause(to_xilinx_chan(dchan));
> +
> +	return 0;
> +}
> +
> +static int xilinx_dpdma_terminate_all(struct dma_chan *dchan)
> +{
> +	return xilinx_dpdma_chan_terminate_all(to_xilinx_chan(dchan));
> +}
> +
> +static void xilinx_dpdma_synchronize(struct dma_chan *dchan)
> +{
> +	xilinx_dpdma_chan_synchronize(to_xilinx_chan(dchan));
> +}

why have these wrappers which do not do anything?

> +
> +	chan->reg = xdev->reg + XILINX_DPDMA_CH_BASE + XILINX_DPDMA_CH_OFFSET *
> +		    chan->id;
> +	chan->status = IDLE;
> +
> +	spin_lock_init(&chan->lock);
> +	INIT_LIST_HEAD(&chan->done_list);
> +	init_waitqueue_head(&chan->wait_to_stop);
> +
> +	tasklet_init(&chan->done_task, xilinx_dpdma_chan_done_task,
> +		     (unsigned long)chan);
> +	tasklet_init(&chan->err_task, xilinx_dpdma_chan_err_task,
> +		     (unsigned long)chan);

Have you checked the vchan code, i dont see that used. It will help you in
descriptor management and reduce code from driver

> +static int xilinx_dpdma_remove(struct platform_device *pdev)
> +{
> +	struct xilinx_dpdma_device *xdev;
> +	unsigned int i;
> +
> +	xdev = platform_get_drvdata(pdev);
> +
> +	xilinx_dpdma_disable_intr(xdev);
> +	of_dma_controller_free(pdev->dev.of_node);
> +	dma_async_device_unregister(&xdev->common);
> +	clk_disable_unprepare(xdev->axi_clk);
> +
> +	for (i = 0; i < XILINX_DPDMA_NUM_CHAN; i++)
> +		if (xdev->chan[i])
> +			xilinx_dpdma_chan_remove(xdev->chan[i]);

At this point your irq is still enabled and can fire, and can schedule
tasklet.. Are you sure you are okay with that?

> +MODULE_AUTHOR("Xilinx, Inc.");
> +MODULE_DESCRIPTION("Xilinx DPDMA driver");
> +MODULE_LICENSE("GPL v2");

No MODULE_ALIAS()?

I haven't reviewed in details though as it is too large patch. Pls use vchan
and split things up for better review.

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
