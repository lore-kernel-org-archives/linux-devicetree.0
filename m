From: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH V12 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller
Date: Tue, 14 Jun 2016 10:40:10 +0530
Message-ID: <575F91B2.7010304@ti.com>
References: <1465000774-7762-1-git-send-email-marex@denx.de>
 <1465000774-7762-2-git-send-email-marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465000774-7762-2-git-send-email-marex-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Saturday 04 June 2016 06:09 AM, Marek Vasut wrote:
[...]
> +
> +static int cqspi_indirect_read_execute(struct spi_nor *nor,
> +				       u8 *rxbuf, const unsigned n_rx)
> +{
> +	struct cqspi_flash_pdata *f_pdata = nor->priv;
> +	struct cqspi_st *cqspi = f_pdata->cqspi;
> +	void __iomem *reg_base = cqspi->iobase;
> +	void __iomem *ahb_base = cqspi->ahb_base;
> +	unsigned int remaining = n_rx;
> +	unsigned int bytes_to_read = 0;
> +	int ret = 0;
> +
> +	writel(remaining, reg_base + CQSPI_REG_INDIRECTRDBYTES);
> +
> +	/* Clear all interrupts. */
> +	writel(CQSPI_IRQ_STATUS_MASK, reg_base + CQSPI_REG_IRQSTATUS);
> +
> +	writel(CQSPI_IRQ_MASK_RD, reg_base + CQSPI_REG_IRQMASK);
> +
> +	reinit_completion(&cqspi->transfer_complete);
> +	writel(CQSPI_REG_INDIRECTRD_START_MASK,
> +	       reg_base + CQSPI_REG_INDIRECTRD);
> +
> +	while (remaining > 0) {
> +		ret = wait_for_completion_timeout(&cqspi->transfer_complete,
> +						  msecs_to_jiffies
> +						  (CQSPI_READ_TIMEOUT_MS));
> +
> +		bytes_to_read = cqspi_get_rd_sram_level(cqspi);
> +
> +		if (!ret && bytes_to_read == 0) {
> +			dev_err(nor->dev, "Indirect read timeout, no bytes\n");
> +			ret = -ETIMEDOUT;
> +			goto failrd;
> +		}
> +
> +		while (bytes_to_read != 0) {
> +			bytes_to_read *= cqspi->fifo_width;
> +			bytes_to_read = bytes_to_read > remaining ?
> +					remaining : bytes_to_read;
> +			readsl(ahb_base, rxbuf, DIV_ROUND_UP(bytes_to_read, 4));
> +			rxbuf += bytes_to_read;
> +			remaining -= bytes_to_read;
> +			bytes_to_read = cqspi_get_rd_sram_level(cqspi);
> +		}
> +
> +		if (remaining > 0)
> +			reinit_completion(&cqspi->transfer_complete);
> +	}
> +
> +	/* Check indirect done status */
> +	ret = cqspi_wait_for_bit(reg_base + CQSPI_REG_INDIRECTRD,
> +				 CQSPI_REG_INDIRECTRD_DONE_MASK, 0);
> +

I was wondering if its better to use direct access mode[1]. With this
mode there is no need to wait for IRQ or monitor sdram level. By setting
up QSPI in direct access mode, this entire function can be replaced by:
memcpy(buf, cqspi->ahb_base + from, n_rx)

IMO, this might give better throughput. Have tested this mode?

[1] https://documentation.altera.com/#/00038604-AA$AA00045811



-- 
Regards
Vignesh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
