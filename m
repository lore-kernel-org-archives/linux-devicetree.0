From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: add rockchip serial flash controller
 driver
Date: Wed, 30 Nov 2016 09:17:25 +0800
Message-ID: <cf514674-cc2b-f159-3caa-a3233fa1dbbb@rock-chips.com>
References: <1479437945-27918-1-git-send-email-shawn.lin@rock-chips.com>
 <1479437945-27918-3-git-send-email-shawn.lin@rock-chips.com>
 <62baf961-e84f-24a4-4345-05a51f351c01@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <62baf961-e84f-24a4-4345-05a51f351c01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

在 2016/11/25 21:52, Marek Vasut 写道:
> On 11/18/2016 03:59 AM, Shawn Lin wrote:
>> Add rockchip serial flash controller driver
>>
>> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>
> [...]
>
>> +enum rockchip_sfc_iftype {
>> +	IF_TYPE_STD,
>> +	IF_TYPE_DUAL,
>> +	IF_TYPE_QUAD,
>> +};
>> +
>> +struct rockchip_sfc;
>> +struct rockchip_sfc_chip_priv {
>> +	u8 cs;
>> +	u32 clk_rate;
>> +	struct spi_nor nor;
>> +	struct rockchip_sfc *sfc;
>> +};
>> +
>> +struct rockchip_sfc {
>> +	struct device *dev;
>> +	struct mutex lock;
>> +	void __iomem *regbase;
>> +	struct clk *hclk;
>> +	struct clk *clk;
>> +	/* virtual mapped addr for dma_buffer */
>> +	void *buffer;
>> +	dma_addr_t dma_buffer;
>> +	struct completion cp;
>> +	struct rockchip_sfc_chip_priv flash[SFC_MAX_CHIPSELECT_NUM];
>> +	u32 num_chip;
>> +	bool use_dma;
>> +	/* use negative edge of hclk to latch data */
>> +	bool negative_edge;
>> +};
>> +
>> +static int get_if_type(enum read_mode flash_read)
>> +{
>> +	enum rockchip_sfc_iftype if_type;
>> +
>> +	switch (flash_read) {
>> +	case SPI_NOR_DUAL:
>> +		if_type = IF_TYPE_DUAL;
>> +		break;
>> +	case SPI_NOR_QUAD:
>> +		if_type = IF_TYPE_QUAD;
>> +		break;
>> +	case SPI_NOR_NORMAL:
>> +	case SPI_NOR_FAST:
>> +		if_type = IF_TYPE_STD;
>> +		break;
>> +	default:
>> +		pr_err("unsupported SPI read mode\n");
>
> I'd switch this to dev_err() , so it's obvious from which device this
> error came. It's OK to pass in the sfc pointer.

Sure.

>
>> +		return -EINVAL;
>> +	}
>> +
>> +	return if_type;
>> +}
>
> [...]
>
>> +static int rockchip_sfc_write_reg(struct spi_nor *nor, u8 opcode,
>> +				  u8 *buf, int len)
>> +{
>> +	struct rockchip_sfc_chip_priv *priv = nor->priv;
>> +	struct rockchip_sfc *sfc = priv->sfc;
>> +	u32 dwords, i;
>> +
>> +	/* Align bytes to dwords */
>> +	dwords = (len + 3) >> 2;
>> +
>> +	for (i = 0; i < dwords; i++)
>> +		writel_relaxed(*(buf + 4 * i), sfc->regbase + SFC_DATA);
>
> Can $buf be unaligned to 4-bytes ? :-)

Ah, yes, I will check this.

>
>> +	return rockchip_sfc_op_reg(nor, opcode, len, SFC_CMD_DIR_WR);
>> +}
>> +
>> +static inline void rockchip_sfc_setup_transfer(struct spi_nor *nor,
>> +					       loff_t from_to,
>> +					       size_t len, u8 op_type)
>> +{
>> +	struct rockchip_sfc_chip_priv *priv = nor->priv;
>> +	struct rockchip_sfc *sfc = priv->sfc;
>> +	u32 reg;
>> +	u8 if_type = 0;
>> +
>> +	if (op_type == SFC_CMD_DIR_WR)
>> +		reg = (nor->program_opcode & SFC_CMD_IDX_MASK) <<
>> +		       SFC_CMD_IDX_SHIFT;
>> +	else
>> +		reg = (nor->read_opcode & SFC_CMD_IDX_MASK) <<
>> +		       SFC_CMD_IDX_SHIFT;
>
> You can define some SFC_CMD_IDX(foo) to avoid this two-line reg assignment:
>
> #define SFC_CMD_IDX(opc) \
>  ((opc) & SFC_CMD_IDX_MASK) << SFC_CMD_IDX_SHIFT)
>
> reg = SFC_CMD_IDX(nor->read_opcode);

Sure.

>
>> +	reg |= op_type << SFC_CMD_DIR_SHIFT;
>> +	reg |= (nor->addr_width == 4) ?
>> +		SFC_CMD_ADDR_32BITS : SFC_CMD_ADDR_24BITS;
>> +
>> +	if_type = get_if_type(nor->flash_read);
>> +	writel_relaxed((if_type << SFC_CTRL_DATA_BITS_SHIFT) |
>> +		       (if_type << SFC_CTRL_ADDR_BITS_SHIFT) |
>> +		       (if_type << SFC_CTRL_CMD_BITS_SHIFT) |
>> +		       (sfc->negative_edge ? SFC_CTRL_PHASE_SEL_NEGETIVE : 0),
>> +		       sfc->regbase + SFC_CTRL);
>> +
>> +	reg |= (priv->cs & SFC_CMD_CS_MASK) << SFC_CMD_CS_SHIFT;
>> +	reg |= (len & SFC_CMD_TRAN_BYTES_MASK) << SFC_CMD_TRAN_BYTES_SHIFT;
>> +
>> +	if (op_type == SFC_CMD_DIR_RD)
>> +		reg |= SFC_CMD_DUMMY(nor->read_dummy);
>> +
>> +	/* Should minus one as 0x0 means 1 bit flash address */
>> +	writel_relaxed(nor->addr_width * 8 - 1, sfc->regbase + SFC_ABIT);
>> +	writel_relaxed(reg, sfc->regbase + SFC_CMD);
>> +	writel_relaxed(from_to, sfc->regbase + SFC_ADDR);
>> +}
>> +
>> +static int rockchip_sfc_dma_transfer(struct spi_nor *nor, loff_t from_to,
>> +				     dma_addr_t dma_buf, size_t len, u8 op_type)
>> +{
>> +	struct rockchip_sfc_chip_priv *priv = nor->priv;
>> +	struct rockchip_sfc *sfc = priv->sfc;
>> +	u32 reg;
>> +	int err = 0;
>> +
>> +	init_completion(&sfc->cp);
>> +
>> +	writel_relaxed(SFC_ICLR_RX_FULL | SFC_ICLR_RX_UFLOW |
>> +		       SFC_ICLR_TX_OFLOW | SFC_ICLR_TX_EMPTY |
>> +		       SFC_ICLR_TRAN_FINISH | SFC_ICLR_BUS_ERR |
>> +		       SFC_ICLR_NSPI_ERR | SFC_ICLR_DMA,
>> +		       sfc->regbase + SFC_ICLR);
>> +
>> +	/* Enable transfer complete interrupt */
>> +	reg = readl_relaxed(sfc->regbase + SFC_IMR);
>> +	reg &= ~SFC_IMR_TRAN_FINISH;
>> +	writel_relaxed(reg, sfc->regbase + SFC_IMR);
>> +
>> +	rockchip_sfc_setup_transfer(nor, from_to, len, op_type);
>> +	writel_relaxed(dma_buf, sfc->regbase + SFC_DMA_ADDR);
>> +
>> +	/*
>> +	 * Start dma but note that the sfc->dma_buffer is derived from
>> +	 * dmam_alloc_coherent so we don't actually need any sync operations
>> +	 * for coherent dma memory.
>> +	 */
>> +	writel_relaxed(0x1, sfc->regbase + SFC_DMA_TRIGGER);
>> +
>> +	/* Wait for the interrupt. */
>> +	if (!wait_for_completion_timeout(&sfc->cp, msecs_to_jiffies(2000))) {
>> +		dev_err(sfc->dev, "DMA wait for transfer finish timeout\n");
>> +		err = -ETIMEDOUT;
>
> Don't you want to stop the DMA too ?

SFC_DMA_TRIGGER will be self-cleared after staring dma.
If any error occured, there is no a "STOP button" for us
to stop it but resetting the controller. I was considering
that the next transfer will check the controller's state and
reset the controller but I guess it would be nice to reset
it here in advance.

Will add a reset for error cases.


>
>> +	}
>> +
>> +	/* Disable transfer finish interrupt */
>> +	reg = readl_relaxed(sfc->regbase + SFC_IMR);
>> +	reg |= SFC_IMR_TRAN_FINISH;
>> +	writel_relaxed(reg, sfc->regbase + SFC_IMR);
>> +
>> +	if (err)
>> +		return err;
>> +
>> +	return rockchip_sfc_wait_op_finish(sfc);
>> +}
>> +
>> +static inline int rockchip_sfc_pio_write(struct rockchip_sfc *sfc, u_char *buf,
>> +					 size_t len)
>> +{
>> +	u32 dwords, tx_wl, count, i;
>> +	unsigned long timeout;
>> +	int ret = 0;
>> +	u32 *tbuf = (u32 *)buf;
>> +
>> +	/*
>> +	 * Align bytes to dwords, although we will write some extra
>> +	 * bytes to fifo but the transfer bytes number in SFC_CMD
>> +	 * register will make sure we just send out the expected
>> +	 * byte numbers and the extra bytes will be clean before
>> +	 * setting up the next transfer. We should always round up
>> +	 * to align to DWORD as the ahb for Rockchip Socs won't
>> +	 * support non-aligned-to-DWORD transfer.
>> +	 */
>> +	dwords = (len + 3) >> 2;
>
> Kernel has macros for rounding up, like DIV_ROUND_UP().

Sure.

>
>> +	while (dwords) {
>> +		tx_wl = (readl_relaxed(sfc->regbase + SFC_FSR) >>
>> +			 SFC_FSR_TX_WATER_LVL_SHIFT) &
>> +			 SFC_FSR_TX_WATER_LVL_MASK;
>> +
>> +		if (tx_wl > 0) {
>> +			count = min_t(u32, dwords, tx_wl);
>> +			for (i = 0; i < count; i++) {
>> +				writel_relaxed(*tbuf++,
>> +					       sfc->regbase + SFC_DATA);
>> +				dwords--;
>> +			}
>> +
>> +			if (dwords == 0)
>> +				break;
>> +			timeout = 0;
>> +		} else {
>> +			mdelay(1);
>
> That is a long delay, shouldn't you wait using udelay() here ?

I will drop all these open coding stuff and use
{readl,writel}_poll_timeout API instead.

>
>> +			if (timeout++ > SFC_MAX_IDLE_RETRY) {
>> +				ret = -ETIMEDOUT;
>> +				break;
>> +			}
>> +		}
>> +	}
>> +
>> +	if (ret)
>> +		return ret;
>> +	else
>> +		return rockchip_sfc_wait_op_finish(sfc);
>> +}
>> +
>> +static inline int rockchip_sfc_pio_read(struct rockchip_sfc *sfc, u_char *buf,
>> +					size_t len)
>> +{
>> +	u32 dwords, rx_wl, count, i, tmp;
>> +	unsigned long timeout;
>> +	int ret = 0;
>> +	u32 *tbuf = (u32 *)buf;
>> +	u_char *tbuf2;
>> +
>> +	/*
>> +	 * Align bytes to dwords, and get the remained bytes.
>> +	 * We should always round down to DWORD as the ahb for
>> +	 * Rockchip Socs won't support non-aligned-to-DWORD transfer.
>> +	 * So please don't use any APIs that will finally use non-aligned
>> +	 * read, for instance, memcpy_fromio or ioread32_rep etc.
>> +	 */
>> +	dwords = len >> 2;
>> +	len = len & 0x3;
>
> Won't this overwrite some bits past the $buf if you write more than $len
> bytes into this memory location ?
>

I can't see the possibility here to overwrite $buf, no?


>> +	while (dwords) {
>> +		rx_wl = (readl_relaxed(sfc->regbase + SFC_FSR) >>
>> +			 SFC_FSR_RX_WATER_LVL_SHIFT) &
>> +			 SFC_FSR_RX_WATER_LVL_MASK;
>> +
>> +		if (rx_wl > 0) {
>> +			count = min_t(u32, dwords, rx_wl);
>> +			for (i = 0; i < count; i++) {
>> +				*tbuf++ = readl_relaxed(sfc->regbase +
>> +							SFC_DATA);
>> +				dwords--;
>> +			}
>> +
>> +			if (dwords == 0)
>> +				break;
>> +			timeout = 0;
>> +		} else {
>> +			mdelay(1);
>> +			if (timeout++ > SFC_MAX_IDLE_RETRY) {
>> +				ret = -ETIMEDOUT;
>> +				break;
>> +			}
>> +		}
>> +	}
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Read the remained bytes */
>> +	timeout = 0;
>> +	tbuf2 = (u_char *)tbuf;
>> +	while (len) {
>> +		rx_wl = (readl_relaxed(sfc->regbase + SFC_FSR) >>
>> +			 SFC_FSR_RX_WATER_LVL_SHIFT) &
>> +			 SFC_FSR_RX_WATER_LVL_MASK;
>> +		if (rx_wl > 0) {
>> +			tmp = readl_relaxed(sfc->regbase + SFC_DATA);
>> +			for (i = 0; i < len; i++)
>> +				tbuf2[i] = (u8)((tmp >> (i * 8)) & 0xff);
>> +			goto done;
>> +		} else {
>> +			mdelay(1);
>> +			if (timeout++ > SFC_MAX_IDLE_RETRY) {
>> +				ret = -ETIMEDOUT;
>> +				break;
>> +			}
>> +		}
>> +	}
>
> Seems a lot like the write path, can you unify the code ?

yes, will drop all thease as mentioned above.

>
>> +done:
>> +	if (ret)
>> +		return ret;
>> +	else
>> +		return rockchip_sfc_wait_op_finish(sfc);
>> +}
>> +
>> +static int rockchip_sfc_pio_transfer(struct spi_nor *nor, loff_t from_to,
>> +				     size_t len, u_char *buf, u8 op_type)
>> +{
>> +	struct rockchip_sfc_chip_priv *priv = nor->priv;
>> +	struct rockchip_sfc *sfc = priv->sfc;
>> +
>> +	rockchip_sfc_setup_transfer(nor, from_to, len, op_type);
>> +
>> +	if (op_type == SFC_CMD_DIR_WR)
>> +		return rockchip_sfc_pio_write(sfc, buf, len);
>> +	else
>> +		return rockchip_sfc_pio_read(sfc, buf, len);
>> +}
>> +
>> +static ssize_t rockchip_sfc_read(struct spi_nor *nor, loff_t from, size_t len,
>> +				 u_char *read_buf)
>> +{
>> +	struct rockchip_sfc_chip_priv *priv = nor->priv;
>> +	struct rockchip_sfc *sfc = priv->sfc;
>> +	size_t offset;
>> +	int ret;
>> +	dma_addr_t dma_addr = 0;
>> +
>> +	if (!sfc->use_dma)
>> +		goto no_dma;
>
> You should extract this DMA code into rockchip_sfc_dma_read/write()
> instead and have this method-agnostic function only do the decision
> between calling the PIO one and DMA one. That'd improve the structure
> of the code a lot.

Sure.

>
>> +	for (offset = 0; offset < len; offset += SFC_DMA_MAX_LEN) {
>> +		size_t trans = min_t(size_t, SFC_DMA_MAX_LEN, len - offset);
>> +
>> +		dma_addr = dma_map_single(NULL, (void *)read_buf,
>> +					  trans, DMA_FROM_DEVICE);
>> +		if (dma_mapping_error(sfc->dev, dma_addr))
>> +			dma_addr = 0;
>> +
>> +		/* Fail to map dma, use pre-allocated area instead */
>> +		ret = rockchip_sfc_dma_transfer(nor, from + offset,
>> +						dma_addr ? dma_addr :
>> +						sfc->dma_buffer,
>> +						trans, SFC_CMD_DIR_RD);
>> +
>> +		if (dma_addr) {
>> +			/* Invalidate the read data from dma_addr */
>> +			dma_sync_single_for_cpu(sfc->dev, dma_addr,
>> +						trans, DMA_FROM_DEVICE);
>> +			dma_unmap_single(NULL, dma_addr,
>> +					 trans, DMA_FROM_DEVICE);
>> +		}
>> +
>> +		if (ret) {
>> +			dev_warn(nor->dev, "DMA read timeout\n");
>> +			return ret;
>> +		}
>> +		if (!dma_addr)
>> +			memcpy(read_buf + offset, sfc->buffer, trans);
>> +	}
>> +
>> +	return len;
>> +
>> +no_dma:
>> +	ret = rockchip_sfc_pio_transfer(nor, from, len,
>> +					read_buf, SFC_CMD_DIR_RD);
>> +	if (ret) {
>> +		dev_warn(nor->dev, "PIO read timeout\n");
>> +		return ret;
>> +	}
>> +	return len;
>> +}
>> +
>> +static ssize_t rockchip_sfc_write(struct spi_nor *nor, loff_t to,
>> +				  size_t len, const u_char *write_buf)
>> +{
>> +	struct rockchip_sfc_chip_priv *priv = nor->priv;
>> +	struct rockchip_sfc *sfc = priv->sfc;
>> +	size_t offset;
>> +	int ret;
>> +	dma_addr_t dma_addr = 0;
>> +
>> +	if (!sfc->use_dma)
>> +		goto no_dma;
>> +
>> +	for (offset = 0; offset < len; offset += SFC_DMA_MAX_LEN) {
>> +		size_t trans = min_t(size_t, SFC_DMA_MAX_LEN, len - offset);
>> +
>> +		dma_addr = dma_map_single(NULL, (void *)write_buf,
>> +					  trans, DMA_TO_DEVICE);
>> +		if (dma_mapping_error(sfc->dev, dma_addr)) {
>> +			dma_addr = 0;
>> +			memcpy(sfc->buffer, write_buf + offset, trans);
>> +		} else {
>> +			/* Flush the write data to dma memory */
>> +			dma_sync_single_for_device(sfc->dev, dma_addr,
>> +						   trans, DMA_TO_DEVICE);
>> +		}
>> +
>> +		/* Fail to map dma, use pre-allocated area instead */
>> +		ret = rockchip_sfc_dma_transfer(nor, to + offset,
>> +						dma_addr ? dma_addr :
>> +						sfc->dma_buffer,
>> +						trans, SFC_CMD_DIR_WR);
>> +		if (dma_addr)
>> +			dma_unmap_single(NULL, dma_addr,
>> +					 trans, DMA_TO_DEVICE);
>> +		if (ret) {
>> +			dev_warn(nor->dev, "DMA write timeout\n");
>> +			return ret;
>> +		}
>> +	}
>
> Again, the read and write looks really similar. I wonder if you cannot
> parametrize it and unify the code.
>

okay. I will refacter them to unify the code.

>> +	return len;
>> +no_dma:
>> +	ret = rockchip_sfc_pio_transfer(nor, to, len,
>> +					(u_char *)write_buf, SFC_CMD_DIR_WR);
>> +	if (ret) {
>> +		dev_warn(nor->dev, "PIO write timeout\n");
>> +		return ret;
>> +	}
>> +	return len;
>> +}
>> +
>> +/**
>> + * Get spi flash device information and register it as a mtd device.
>> + */
>> +static int rockchip_sfc_register(struct device_node *np,
>> +				 struct rockchip_sfc *sfc)
>> +{
>> +	struct device *dev = sfc->dev;
>> +	struct mtd_info *mtd;
>> +	int ret;
>> +
>> +	sfc->flash[sfc->num_chip].nor.dev = dev;
>> +	spi_nor_set_flash_node(&(sfc->flash[sfc->num_chip].nor), np);
>> +
>> +	ret = of_property_read_u8(np, "reg", &sfc->flash[sfc->num_chip].cs);
>> +	if (ret) {
>> +		dev_err(dev, "No reg property for %s\n",
>> +			np->full_name);
>> +		return ret;
>> +	}
>> +
>> +	ret = of_property_read_u32(np, "spi-max-frequency",
>> +			&sfc->flash[sfc->num_chip].clk_rate);
>> +	if (ret) {
>> +		dev_err(dev, "No spi-max-frequency property for %s\n",
>> +			np->full_name);
>> +		return ret;
>> +	}
>> +
>> +	sfc->flash[sfc->num_chip].sfc = sfc;
>> +	sfc->flash[sfc->num_chip].nor.priv = &(sfc->flash[sfc->num_chip]);
>
> You can add nor = sfc->flash[sfc->num_chip].nor; here to avoid
> constantly replicating the whole sfc->flash[sfc->num_chip].nor .

Sure.

>
>> +	sfc->flash[sfc->num_chip].nor.prepare = rockchip_sfc_prep;
>> +	sfc->flash[sfc->num_chip].nor.unprepare = rockchip_sfc_unprep;
>> +	sfc->flash[sfc->num_chip].nor.read_reg = rockchip_sfc_read_reg;
>> +	sfc->flash[sfc->num_chip].nor.write_reg = rockchip_sfc_write_reg;
>> +	sfc->flash[sfc->num_chip].nor.read = rockchip_sfc_read;
>> +	sfc->flash[sfc->num_chip].nor.write = rockchip_sfc_write;
>> +	sfc->flash[sfc->num_chip].nor.erase = NULL;
>> +	ret = spi_nor_scan(&(sfc->flash[sfc->num_chip].nor),
>> +			    NULL, SPI_NOR_QUAD);
>> +	if (ret)
>> +		return ret;
>> +
>> +	mtd = &(sfc->flash[sfc->num_chip].nor.mtd);
>> +	mtd->name = np->name;
>> +	ret = mtd_device_register(mtd, NULL, 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	sfc->num_chip++;
>> +	return 0;
>> +}
>> +
>> +static void rockchip_sfc_unregister_all(struct rockchip_sfc *sfc)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < sfc->num_chip; i++)
>> +		mtd_device_unregister(&(sfc->flash[sfc->num_chip].nor.mtd));
>
> Same here. Also, what happens if you have a hole in the SPI NOR
> numbering, ie you have only SPI NOR 0 and 2 registered ? This will fail,
> so see the cadence qspi how to handle such case.
>
>> +}
>> +
>> +static int rockchip_sfc_register_all(struct rockchip_sfc *sfc)
>> +{
>> +	struct device *dev = sfc->dev;
>> +	struct device_node *np;
>> +	int ret;
>> +
>> +	for_each_available_child_of_node(dev->of_node, np) {
>> +		ret = rockchip_sfc_register(np, sfc);
>> +		if (ret)
>> +			goto fail;
>> +
>> +		if (sfc->num_chip == SFC_MAX_CHIPSELECT_NUM) {
>> +			dev_warn(dev, "Exceeds the max cs limitation\n");
>> +			break;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +fail:
>> +	dev_err(dev, "Failed to register all chips\n");
>> +	/* Unregister all the _registered_ nor flash */
>> +	rockchip_sfc_unregister_all(sfc);
>> +	return ret;
>> +}
>
> [...]
>
>> +static int rockchip_sfc_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct resource *res;
>> +	struct rockchip_sfc *sfc;
>> +	int ret;
>> +
>> +	sfc = devm_kzalloc(dev, sizeof(*sfc), GFP_KERNEL);
>> +	if (!sfc)
>> +		return -ENOMEM;
>> +
>> +	platform_set_drvdata(pdev, sfc);
>> +	sfc->dev = dev;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	sfc->regbase = devm_ioremap_resource(dev, res);
>> +	if (IS_ERR(sfc->regbase))
>> +		return PTR_ERR(sfc->regbase);
>> +
>> +	sfc->clk = devm_clk_get(&pdev->dev, "sfc");
>> +	if (IS_ERR(sfc->clk)) {
>> +		dev_err(&pdev->dev, "Failed to get sfc interface clk\n");
>> +		return PTR_ERR(sfc->clk);
>> +	}
>> +
>> +	sfc->hclk = devm_clk_get(&pdev->dev, "hsfc");
>> +	if (IS_ERR(sfc->hclk)) {
>> +		dev_err(&pdev->dev, "Failed to get sfc ahp clk\n");
>> +		return PTR_ERR(sfc->hclk);
>> +	}
>> +
>> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
>> +	if (ret) {
>> +		dev_warn(dev, "Unable to set dma mask\n");
>> +		return ret;
>> +	}
>> +
>> +	sfc->buffer = dmam_alloc_coherent(dev, SFC_DMA_MAX_LEN,
>> +			&sfc->dma_buffer, GFP_KERNEL);
>> +	if (!sfc->buffer)
>> +		return -ENOMEM;
>> +
>> +	mutex_init(&sfc->lock);
>> +
>> +	ret = clk_prepare_enable(sfc->hclk);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "Failed to enable hclk\n");
>> +		goto err_hclk;
>> +	}
>> +
>> +	ret = clk_prepare_enable(sfc->clk);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "Failed to enable clk\n");
>> +		goto err_clk;
>> +	}
>> +
>> +	sfc->use_dma = !of_property_read_bool(sfc->dev->of_node,
>> +					      "rockchip,sfc-no-dma");
>> +
>> +	sfc->negative_edge = of_device_is_compatible(sfc->dev->of_node,
>> +						     "rockchip,rk1108-sfc");
>
> I think this should rather be a boolean property -- but isn't this
> something like CPOL or CPHA anyway ?

It isn't the same as CPOL or CPHA. And this value should be Soc
specificed.

>
>> +	/* Find the irq */
>> +	ret = platform_get_irq(pdev, 0);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to get the irq\n");
>> +		goto err_irq;
>> +	}
>> +
>> +	ret = devm_request_irq(dev, ret, rockchip_sfc_irq_handler,
>> +			       0, pdev->name, sfc);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to request irq\n");
>> +		goto err_irq;
>> +	}
>> +
>> +	sfc->num_chip = 0;
>> +	ret = rockchip_sfc_init(sfc);
>> +	if (ret)
>> +		goto err_irq;
>> +#if 1
>> +	pm_runtime_get_noresume(&pdev->dev);
>> +	pm_runtime_set_active(&pdev->dev);
>> +	pm_runtime_enable(&pdev->dev);
>> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
>> +	pm_runtime_use_autosuspend(&pdev->dev);
>> +#endif
>
> #if 1, remove, #endif :-)

Ah, will fix.

>
>> +	ret = rockchip_sfc_register_all(sfc);
>> +	if (ret)
>> +		goto err_register;
>> +
>> +	clk_disable_unprepare(sfc->clk);
>> +	pm_runtime_put_autosuspend(&pdev->dev);
>> +	return 0;
>> +
>> +err_register:
>> +	pm_runtime_disable(&pdev->dev);
>> +	pm_runtime_set_suspended(&pdev->dev);
>> +	pm_runtime_put_noidle(&pdev->dev);
>> +err_irq:
>> +	clk_disable_unprepare(sfc->clk);
>> +err_clk:
>> +	clk_disable_unprepare(sfc->hclk);
>> +err_hclk:
>> +	mutex_destroy(&sfc->lock);
>> +	return ret;
>> +}
>> +
>> +static int rockchip_sfc_remove(struct platform_device *pdev)
>> +{
>> +	struct rockchip_sfc *sfc = platform_get_drvdata(pdev);
>> +
>> +	pm_runtime_get_sync(&pdev->dev);
>> +	pm_runtime_disable(&pdev->dev);
>> +	pm_runtime_put_noidle(&pdev->dev);
>> +
>> +	rockchip_sfc_unregister_all(sfc);
>> +	mutex_destroy(&sfc->lock);
>> +	clk_disable_unprepare(sfc->clk);
>> +	clk_disable_unprepare(sfc->hclk);
>> +	return 0;
>> +}
>> +
>> +#ifdef CONFIG_PM
>> +int rockchip_sfc_runtime_suspend(struct device *dev)
>> +{
>> +	struct rockchip_sfc *sfc = dev_get_drvdata(dev);
>> +
>> +	clk_disable_unprepare(sfc->hclk);
>> +	return 0;
>> +}
>> +
>> +int rockchip_sfc_runtime_resume(struct device *dev)
>> +{
>> +	struct rockchip_sfc *sfc = dev_get_drvdata(dev);
>> +
>> +	clk_prepare_enable(sfc->hclk);
>> +	return 0;
>> +}
>> +#endif /* CONFIG_PM */
>> +
>> +static const struct of_device_id rockchip_sfc_dt_ids[] = {
>> +	{ .compatible = "rockchip,sfc"},
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, rockchip_sfc_dt_ids);
>> +
>> +static const struct dev_pm_ops rockchip_sfc_dev_pm_ops = {
>> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> +				pm_runtime_force_resume)
>> +	SET_RUNTIME_PM_OPS(rockchip_sfc_runtime_suspend,
>> +			   rockchip_sfc_runtime_resume, NULL)
>> +};
>> +
>> +static struct platform_driver rockchip_sfc_driver = {
>> +	.driver = {
>> +		.name	= "rockchip-sfc",
>> +		.of_match_table = rockchip_sfc_dt_ids,
>> +		.pm = &rockchip_sfc_dev_pm_ops,
>> +	},
>> +	.probe	= rockchip_sfc_probe,
>> +	.remove	= rockchip_sfc_remove,
>> +};
>> +module_platform_driver(rockchip_sfc_driver);
>> +
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_DESCRIPTION("Rockchip Serial Flash Controller Driver");
>> +MODULE_AUTHOR("Shawn Lin");
>
> Email in MODULE_AUTHOR would be great addition.

yup.

>


-- 
Best Regards
Shawn Lin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
