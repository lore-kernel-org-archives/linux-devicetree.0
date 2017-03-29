From: Ludovic BARRE <ludovic.barre-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: add driver for STM32 quad spi flash
 controller
Date: Wed, 29 Mar 2017 14:24:31 +0200
Message-ID: <2c364b99-512c-8eb6-7044-7989ba21d53b@st.com>
References: <1490619296-8168-1-git-send-email-ludovic.Barre@st.com>
 <1490619296-8168-3-git-send-email-ludovic.Barre@st.com>
 <1be39452-83b0-5c32-39fe-d6dd5134d1ef@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1be39452-83b0-5c32-39fe-d6dd5134d1ef-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

hi Marek

thanks for review
comment below

On 03/29/2017 12:54 PM, Marek Vasut wrote:
> On 03/27/2017 02:54 PM, Ludovic Barre wrote:
>> From: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
>>
>> The quadspi is a specialized communication interface targeting single,
>> dual or quad SPI Flash memories.
>>
>> It can operate in any of the following modes:
>> -indirect mode: all the operations are performed using the quadspi
>>   registers
>> -read memory-mapped mode: the external Flash memory is mapped to the
>>   microcontroller address space and is seen by the system as if it was
>>   an internal memory
>>
>> Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> Hi! I presume this is not compatible with the Cadence QSPI or any other
> QSPI controller, huh ?
it's not a cadence QSPI, it's specific for stm32 platform
>
> Mostly minor nits below ...
>
>> ---
>>   drivers/mtd/spi-nor/Kconfig         |   7 +
>>   drivers/mtd/spi-nor/Makefile        |   1 +
>>   drivers/mtd/spi-nor/stm32-quadspi.c | 679 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 687 insertions(+)
>>   create mode 100644 drivers/mtd/spi-nor/stm32-quadspi.c
> [...]
>
>> +struct stm32_qspi_cmd {
>> +	struct {
>> +		u32 addr_width:8;
>> +		u32 dummy:8;
>> +		u32 data:1;
>> +	} conf;
> This could all be u8 ? Why this awful construct ?
yes I could replace each u32 by u8
>
>> +	u8 opcode;
>> +	u32 framemode;
>> +	u32 qspimode;
>> +	u32 addr;
>> +	size_t len;
>> +	void *buf;
>> +};
>> +
>> +static int stm32_qspi_wait_cmd(struct stm32_qspi *qspi)
>> +{
>> +	u32 cr;
>> +	int err = 0;
> Can readl_poll_timeout() or somesuch replace this function ?
in fact stm32_qspi_wait_cmd test if the transfer has been complete (TCF 
flag)
else initialize an interrupt completion.
like the time may be long I prefer keep the interrupt wait, if you agree.
>> +	if (readl_relaxed(qspi->io_base + QUADSPI_SR) & SR_TCF)
>> +		return 0;
>> +
>> +	reinit_completion(&qspi->cmd_completion);
>> +	cr = readl_relaxed(qspi->io_base + QUADSPI_CR);
>> +	writel_relaxed(cr | CR_TCIE, qspi->io_base + QUADSPI_CR);
>> +
>> +	if (!wait_for_completion_interruptible_timeout(&qspi->cmd_completion,
>> +						       msecs_to_jiffies(1000)))
>> +		err = -ETIMEDOUT;
>> +
>> +	writel_relaxed(cr, qspi->io_base + QUADSPI_CR);
>> +	return err;
>> +}
>> +
>> +static int stm32_qspi_wait_nobusy(struct stm32_qspi *qspi)
>> +{
>> +	u32 sr;
>> +
>> +	return readl_relaxed_poll_timeout(qspi->io_base + QUADSPI_SR, sr,
>> +					  !(sr & SR_BUSY), 10, 100000);
>> +}
>> +
>> +static void stm32_qspi_set_framemode(struct spi_nor *nor,
>> +				     struct stm32_qspi_cmd *cmd, bool read)
>> +{
>> +	u32 dmode = CCR_DMODE_1;
>> +
>> +	cmd->framemode = CCR_IMODE_1;
>> +
>> +	if (read) {
>> +		switch (nor->flash_read) {
>> +		case SPI_NOR_NORMAL:
>> +		case SPI_NOR_FAST:
>> +			dmode = CCR_DMODE_1;
>> +			break;
>> +		case SPI_NOR_DUAL:
>> +			dmode = CCR_DMODE_2;
>> +			break;
>> +		case SPI_NOR_QUAD:
>> +			dmode = CCR_DMODE_4;
>> +			break;
>> +		}
>> +	}
>> +
>> +	cmd->framemode |= cmd->conf.data ? dmode : 0;
>> +	cmd->framemode |= cmd->conf.addr_width ? CCR_ADMODE_1 : 0;
>> +}
>> +
>> +static void stm32_qspi_read_fifo(u8 *val, void __iomem *addr)
>> +{
>> +	*val = readb_relaxed(addr);
>> +}
>> +
>> +static void stm32_qspi_write_fifo(u8 *val, void __iomem *addr)
>> +{
>> +	writeb_relaxed(*val, addr);
>> +}
>> +
>> +static int stm32_qspi_tx_poll(struct stm32_qspi *qspi,
>> +			      const struct stm32_qspi_cmd *cmd)
>> +{
>> +	void (*tx_fifo)(u8 *, void __iomem *);
>> +	u32 len = cmd->len, sr;
>> +	u8 *buf = cmd->buf;
>> +	int ret;
>> +
>> +	if (cmd->qspimode == CCR_FMODE_INDW)
>> +		tx_fifo = stm32_qspi_write_fifo;
>> +	else
>> +		tx_fifo = stm32_qspi_read_fifo;
>> +
>> +	while (len--) {
>> +		ret = readl_relaxed_poll_timeout(qspi->io_base + QUADSPI_SR,
>> +						 sr, (sr & SR_FTF),
>> +						 10, 30000);
> Add macros for those ad-hoc timeouts.
I will add 2 defines (for stm32_qspi_wait_nobusy, stm32_qspi_tx_poll)
#define STM32_QSPI_FIFO_TIMEOUT_US 30000
#define STM32_QSPI_BUSY_TIMEOUT_US 100000
>
>> +		if (ret) {
>> +			dev_err(qspi->dev, "fifo timeout (stat:%#x)\n", sr);
>> +			break;
>> +		}
>> +		tx_fifo(buf++, qspi->io_base + QUADSPI_DR);
>> +	}
>> +
>> +	return ret;
>> +}
>
> [...]
>
>> +static int stm32_qspi_send(struct stm32_qspi_flash *flash,
>> +			   const struct stm32_qspi_cmd *cmd)
>> +{
>> +	struct stm32_qspi *qspi = flash->qspi;
>> +	u32 ccr, dcr, cr;
>> +	int err;
>> +
>> +	err = stm32_qspi_wait_nobusy(qspi);
>> +	if (err)
>> +		goto abort;
>> +
>> +	dcr = readl_relaxed(qspi->io_base + QUADSPI_DCR) & ~DCR_FSIZE_MASK;
>> +	dcr |= DCR_FSIZE(flash->fsize);
>> +	writel_relaxed(dcr, qspi->io_base + QUADSPI_DCR);
>> +
>> +	cr = readl_relaxed(qspi->io_base + QUADSPI_CR);
>> +	cr &= ~CR_PRESC_MASK & ~CR_FSEL;
>> +	cr |= CR_PRESC(flash->presc);
>> +	cr |= flash->cs ? CR_FSEL : 0;
>> +	writel_relaxed(cr, qspi->io_base + QUADSPI_CR);
>> +
>> +	if (cmd->conf.data)
>> +		writel_relaxed(cmd->len - 1, qspi->io_base + QUADSPI_DLR);
>> +
>> +	ccr = cmd->framemode | cmd->qspimode;
>> +
>> +	if (cmd->conf.dummy)
>> +		ccr |= CCR_DCYC(cmd->conf.dummy);
>> +
>> +	if (cmd->conf.addr_width)
>> +		ccr |= CCR_ADSIZE(cmd->conf.addr_width - 1);
>> +
>> +	ccr |= CCR_INST(cmd->opcode);
>> +	writel_relaxed(ccr, qspi->io_base + QUADSPI_CCR);
>> +
>> +	if (cmd->conf.addr_width && cmd->qspimode != CCR_FMODE_MM)
>> +		writel_relaxed(cmd->addr, qspi->io_base + QUADSPI_AR);
>> +
>> +	err = stm32_qspi_tx(qspi, cmd);
>> +	if (err)
>> +		goto abort;
>> +
>> +	if (cmd->qspimode != CCR_FMODE_MM) {
>> +		err = stm32_qspi_wait_cmd(qspi);
>> +		if (err)
>> +			goto abort;
>> +		writel_relaxed(FCR_CTCF, qspi->io_base + QUADSPI_FCR);
>> +	}
>> +
>> +	return err;
>> +
>> +abort:
>> +	writel_relaxed(readl_relaxed(qspi->io_base + QUADSPI_CR)
>> +		       | CR_ABORT, qspi->io_base + QUADSPI_CR);
> Use a helper variable here too.
ok
>> +	dev_err(qspi->dev, "%s abort err:%d\n", __func__, err);
>> +	return err;
>> +}
> [...]
>
>> +static int stm32_qspi_flash_setup(struct stm32_qspi *qspi,
>> +				  struct device_node *np)
>> +{
>> +	u32 width, flash_read, presc, cs_num, max_rate = 0;
>> +	struct stm32_qspi_flash *flash;
>> +	struct mtd_info *mtd;
>> +	int ret;
>> +
>> +	of_property_read_u32(np, "reg", &cs_num);
>> +	if (cs_num >= STM32_MAX_NORCHIP)
>> +		return -EINVAL;
>> +
>> +	of_property_read_u32(np, "spi-max-frequency", &max_rate);
>> +	if (!max_rate)
>> +		return -EINVAL;
>> +
>> +	presc = DIV_ROUND_UP(qspi->clk_rate, max_rate) - 1;
>> +
>> +	if (of_property_read_u32(np, "spi-rx-bus-width", &width))
>> +		width = 1;
>> +
>> +	if (width == 4)
>> +		flash_read = SPI_NOR_QUAD;
>> +	else if (width == 2)
>> +		flash_read = SPI_NOR_DUAL;
>> +	else if (width == 1)
>> +		flash_read = SPI_NOR_NORMAL;
>> +	else
>> +		return -EINVAL;
>> +
>> +	flash = &qspi->flash[cs_num];
>> +	flash->qspi = qspi;
>> +	flash->cs = cs_num;
>> +	flash->presc = presc;
>> +
>> +	flash->nor.dev = qspi->dev;
>> +	spi_nor_set_flash_node(&flash->nor, np);
>> +	flash->nor.priv = flash;
>> +	mtd = &flash->nor.mtd;
>> +	mtd->priv = &flash->nor;
>> +
>> +	flash->nor.read = stm32_qspi_read;
>> +	flash->nor.write = stm32_qspi_write;
>> +	flash->nor.erase = stm32_qspi_erase;
>> +	flash->nor.read_reg = stm32_qspi_read_reg;
>> +	flash->nor.write_reg = stm32_qspi_write_reg;
>> +	flash->nor.prepare = stm32_qspi_prep;
>> +	flash->nor.unprepare = stm32_qspi_unprep;
>> +
>> +	writel_relaxed(LPTR_DFT_TIMEOUT, qspi->io_base + QUADSPI_LPTR);
>> +
>> +	writel_relaxed(CR_PRESC(presc) | CR_FTHRES(3) | CR_TCEN | CR_SSHIFT
>> +		       | CR_EN, qspi->io_base + QUADSPI_CR);
>> +
>> +	/* a minimum fsize must be set to sent the command id */
>> +	flash->fsize = 25;
> I don't understand why this is needed and the comment doesn't make
> sense. Please fix.
fsize field defines the size of external memory.
Normaly, this field is used only for memory map mode,
but in fact is check in indirect mode.
So while flash scan "spi_nor_scan":
-I can't let 0.
-I not know yet the size of flash.
So I fix a temporary value

I will update my comment
>
>> +	ret = spi_nor_scan(&flash->nor, NULL, flash_read);
>> +	if (ret) {
>> +		dev_err(qspi->dev, "device scan failed\n");
>> +		return ret;
>> +	}
>> +
>> +	flash->fsize = __fls(mtd->size) - 1;
>> +
>> +	writel_relaxed(DCR_CSHT(1), qspi->io_base + QUADSPI_DCR);
>> +
>> +	ret = mtd_device_register(mtd, NULL, 0);
>> +	if (ret) {
>> +		dev_err(qspi->dev, "mtd device parse failed\n");
>> +		return ret;
>> +	}
>> +
>> +	dev_dbg(qspi->dev, "read mm:%s cs:%d bus:%d\n",
>> +		qspi->read_mode == CCR_FMODE_MM ? "yes" : "no", cs_num, width);
>> +
>> +	return 0;
>> +}
> [...]
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
