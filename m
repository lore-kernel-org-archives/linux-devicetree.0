From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v4] MTD: LPC32xx SLC NAND driver
Date: Sun, 3 Jun 2012 20:09:32 +0100
Message-ID: <20120603190932.GB23368@n2100.arm.linux.org.uk>
References: <1338748689-29645-1-git-send-email-stigge@antcom.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1338748689-29645-1-git-send-email-stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>
Cc: srinivas.bakki-3arQi8VN3Tc@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, leiwen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kevin.wells-3arQi8VN3Tc@public.gmane.org, b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, hechtb-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jun 03, 2012 at 08:38:09PM +0200, Roland Stigge wrote:
> +static int lpc32xx_xmit_dma(struct mtd_info *mtd, dma_addr_t dma,
> +			    void *mem, int len, enum dma_transfer_direction dir)
> +{
> +	struct nand_chip *chip = mtd->priv;
> +	struct lpc32xx_nand_host *host = chip->priv;
> +	struct dma_async_tx_descriptor *desc;
> +	int flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
> +	int res;
> +	dma_cookie_t cookie;
> +
> +	host->dma_slave_config.direction = dir;
> +	host->dma_slave_config.src_addr = dma;
> +	host->dma_slave_config.dst_addr = dma;
> +	host->dma_slave_config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +	host->dma_slave_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +	host->dma_slave_config.src_maxburst = 4;
> +	host->dma_slave_config.dst_maxburst = 4;
> +	/* DMA controller does flow control: */
> +	host->dma_slave_config.device_fc = false;
> +	if (dmaengine_slave_config(host->dma_chan, &host->dma_slave_config)) {
> +		dev_err(mtd->dev.parent, "Failed to setup DMA slave\n");
> +		return -ENXIO;
> +	}
> +
> +	sg_init_one(&host->sgl, mem, len);
> +
> +	res = dma_map_sg(host->dma_chan->device->dev, &host->sgl, 1,
> +			 DMA_BIDIRECTIONAL);
> +	if (res != 1) {
> +		dev_err(mtd->dev.parent, "Failed to map sg list\n");
> +		return -ENXIO;
> +	}
> +	desc = dmaengine_prep_slave_sg(host->dma_chan, &host->sgl, 1, dir,
> +				       flags);
> +	if (!desc) {
> +		dev_err(mtd->dev.parent, "Failed to prepare slave sg\n");
> +		goto out1;
> +	}
> +
> +	init_completion(&host->comp);
> +	desc->callback = lpc32xx_dma_complete_func;
> +	desc->callback_param = &host->comp;
> +
> +	cookie = dmaengine_submit(desc);
> +	if (dma_submit_error(cookie)) {
> +		dev_err(mtd->dev.parent, "Failed to dmaengine_submit()\n");
> +		goto out1;
> +	}

dmaengine_submit() is no longer allowed to fail, so you don't need this
check here anymore.  It's been that way for a long time.

> +	dma_async_issue_pending(host->dma_chan);
> +
> +	wait_for_completion_timeout(&host->comp, msecs_to_jiffies(1000));

What about unmapping the buffer upon completion?

> +
> +	return 0;
> +out1:
> +	dma_unmap_sg(host->dma_chan->device->dev, &host->sgl, 1,
> +		     DMA_BIDIRECTIONAL);
> +	return -ENXIO;
> +}
