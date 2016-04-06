From: "R, Vignesh" <vigneshr-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH V10 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Date: Wed, 6 Apr 2016 22:25:29 +0530
Message-ID: <57053F81.70204@ti.com>
References: <1452486886-8049-1-git-send-email-marex@denx.de>
 <1452486886-8049-2-git-send-email-marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452486886-8049-2-git-send-email-marex-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Marek,

I encountered a issue with this driver while testing.

On 1/11/2016 10:04 AM, Marek Vasut wrote:
> From: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> 
> Add support for the Cadence QSPI controller. This controller is
> present in the Altera SoCFPGA SoCs and this driver has been tested
> on the Cyclone V SoC.


> +static void cqspi_switch_cs(struct spi_nor *nor)
> +{
> +	struct cqspi_flash_pdata *f_pdata = nor->priv;
> +	struct cqspi_st *cqspi = f_pdata->cqspi;
> +	void __iomem *iobase = cqspi->iobase;
> +	unsigned int reg;
> +
> +	cqspi_controller_enable(cqspi, 0);
> +
> +	/* configure page size and block size. */
> +	reg = readl(iobase + CQSPI_REG_SIZE);
> +	reg &= ~(CQSPI_REG_SIZE_PAGE_MASK << CQSPI_REG_SIZE_PAGE_LSB);
> +	reg &= ~(CQSPI_REG_SIZE_BLOCK_MASK << CQSPI_REG_SIZE_BLOCK_LSB);
> +	reg &= ~CQSPI_REG_SIZE_ADDRESS_MASK;
> +	reg |= (nor->page_size << CQSPI_REG_SIZE_PAGE_LSB);
> +	reg |= (ilog2(nor->mtd.erasesize) << CQSPI_REG_SIZE_BLOCK_LSB);
> +	reg |= (nor->addr_width - 1);
> +	writel(reg, iobase + CQSPI_REG_SIZE);
> +

Page size and block size are configured here...

> +	/* configure the chip select */
> +	cqspi_chipselect(nor);
> +
> +	cqspi_controller_enable(cqspi, 1);
> +}
> +
> +static int cqspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
> +{
> +	struct cqspi_flash_pdata *f_pdata = nor->priv;
> +	struct cqspi_st *cqspi = f_pdata->cqspi;
> +	const unsigned int sclk = f_pdata->clk_rate;
> +
> +	/* Switch chip select. */
> +	if (cqspi->current_cs != f_pdata->cs) {
> +		cqspi->current_cs = f_pdata->cs;
> +		cqspi_switch_cs(nor);

cqspi_switch_cs(nor) is called from cqspi_prep(). And is called only
once for a given slave (assuming only one slave on the QSPI bus)

> +	}
> +
> +	/* Setup baudrate divisor and delays */
> +	if (cqspi->sclk != sclk) {
> +		cqspi->sclk = sclk;
> +		cqspi_controller_enable(cqspi, 0);
> +		cqspi_config_baudrate_div(cqspi, sclk);
> +		cqspi_delay(nor, sclk);
> +		cqspi_readdata_capture(cqspi, 1, f_pdata->read_delay);
> +		cqspi_controller_enable(cqspi, 1);
> +	}
> +
> +	return 0;
> +}
> +
> +static int cqspi_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
> +{
> +	int ret;
> +
> +	ret = cqspi_set_protocol(nor, nor->reg_proto);
> +	if (ret)
> +		return ret;
> +
> +	cqspi_prep(nor, SPI_NOR_OPS_READ);

cqspi_read_reg() is first called to read JEDEC ID, this calls
cqspi_prep() for first time. But nor->page_size, nor->mtd.erasesize are
not yet populated. Therefore cqspi_switch_cs() will not populate
CQSPI_REG_SIZE with correct values.
I think its better to configure this register each time during
read/write ops.

Regards
Vignesh

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
