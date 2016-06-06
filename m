From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 06/18] dmaengine: st_fdma: Add STMicroelectronics FDMA
 engine driver support
Date: Mon, 6 Jun 2016 10:24:28 +0530
Message-ID: <20160606045428.GW16910@localhost>
References: <1464192412-16386-1-git-send-email-peter.griffin@linaro.org>
 <1464192412-16386-8-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1464192412-16386-8-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 25, 2016 at 05:06:40PM +0100, Peter Griffin wrote:

> @@ -527,6 +527,18 @@ config ZX_DMA
>  	help
>  	  Support the DMA engine for ZTE ZX296702 platform devices.
>  
> +config ST_FDMA
> +	tristate "ST FDMA dmaengine support"
> +	depends on ARCH_STI || COMPILE_TEST
> +        depends on ST_XP70_REMOTEPROC
> +	select DMA_ENGINE
> +	select DMA_VIRTUAL_CHANNELS
> +	help
> +	  Enable support for ST FDMA controller.
> +	  It supports 16 independent DMA channels, accepts up to 32 DMA requests
> +
> +	  Say Y here if you have such a chipset.
> +	  If unsure, say N.

Alphabetical order in Kconfig and makefile please...

> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_dma.h>
> +#include <linux/platform_device.h>
> +#include <linux/interrupt.h>
> +#include <linux/clk.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dmapool.h>
> +#include <linux/firmware.h>
> +#include <linux/elf.h>
> +#include <linux/atomic.h>
> +#include <linux/remoteproc.h>
> +#include <linux/io.h>

that seems to be quite a lot of headers, am sure some of them are not
required..


> +static int st_fdma_dreq_get(struct st_fdma_chan *fchan)
> +{
> +	struct st_fdma_dev *fdev = fchan->fdev;
> +	u32 req_line_cfg = fchan->cfg.req_line;
> +	u32 dreq_line;
> +	int try = 0;
> +
> +	/*
> +	 * dreq_mask is shared for n channels of fdma, so all accesses must be
> +	 * atomic. if the dreq_mask it change between ffz ant set_bit,

s/ant/and

> +	switch (ch_sta) {
> +	case FDMA_CH_CMD_STA_PAUSED:
> +		fchan->status = DMA_PAUSED;
> +		break;

empty line here please

> +static void st_fdma_free_chan_res(struct dma_chan *chan)
> +{
> +	struct st_fdma_chan *fchan = to_st_fdma_chan(chan);
> +	unsigned long flags;
> +
> +	LIST_HEAD(head);
> +
> +	dev_dbg(fchan->fdev->dev, "%s: freeing chan:%d\n",
> +		__func__, fchan->vchan.chan.chan_id);
> +
> +	if (fchan->cfg.type != ST_FDMA_TYPE_FREE_RUN)
> +		st_fdma_dreq_put(fchan);
> +
> +	spin_lock_irqsave(&fchan->vchan.lock, flags);
> +	fchan->fdesc = NULL;
> +	vchan_get_all_descriptors(&fchan->vchan, &head);

and what are you doing with all these descriptors?

> +	spin_unlock_irqrestore(&fchan->vchan.lock, flags);
> +
> +	dma_pool_destroy(fchan->node_pool);
> +	fchan->node_pool = NULL;
> +	memset(&fchan->cfg, 0, sizeof(struct st_fdma_cfg));
> +
> +	rproc_shutdown(fchan->fdev->rproc);
> +}

> +static enum dma_status st_fdma_tx_status(struct dma_chan *chan,
> +					 dma_cookie_t cookie,
> +					 struct dma_tx_state *txstate)
> +{
> +	struct st_fdma_chan *fchan = to_st_fdma_chan(chan);
> +	struct virt_dma_desc *vd;
> +	enum dma_status ret;
> +	unsigned long flags;
> +
> +	ret = dma_cookie_status(chan, cookie, txstate);
> +	if (ret == DMA_COMPLETE)

check for txtstate here, that can be NULL and in that case no need to
calculate residue

> +
> +	dma_cap_set(DMA_SLAVE, fdev->dma_device.cap_mask);

why slave, you only support cyclic

> +	dma_cap_set(DMA_CYCLIC, fdev->dma_device.cap_mask);
> +	dma_cap_set(DMA_MEMCPY, fdev->dma_device.cap_mask);


helps to print the 'ret' too

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
