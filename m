From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: add rockchip serial flash controller
 driver
Date: Mon, 5 Dec 2016 04:40:51 +0100
Message-ID: <852b11c2-daf3-75dc-a5c6-576109a974a9@gmail.com>
References: <1480906577-38455-1-git-send-email-shawn.lin@rock-chips.com>
 <1480906577-38455-3-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480906577-38455-3-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/05/2016 03:56 AM, Shawn Lin wrote:
> Add rockchip serial flash controller driver
> 
> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 

Looks good, a few nits below.

[...]

> +static int get_if_type(struct rockchip_sfc *sfc, enum read_mode flash_read)
> +{
> +	enum rockchip_sfc_iftype if_type;

Wouldn't it be shorter if you used if-return below ?
Example

if (flash_read == SPI_NOR_QUAD)
	return IF_TYPE_QUAD;

if (flash_read == SPI_NOR_DUAL)
	return IF_TYPE_DUAL;
...

dev_err(sfc->dev, "unsupported SPI read mode\n");
return -EINVAL;

> +	switch (flash_read) {
> +	case SPI_NOR_DUAL:
> +		if_type = IF_TYPE_DUAL;
> +		break;
> +	case SPI_NOR_QUAD:
> +		if_type = IF_TYPE_QUAD;
> +		break;
> +	case SPI_NOR_NORMAL:
> +	case SPI_NOR_FAST:
> +		if_type = IF_TYPE_STD;
> +		break;
> +	default:
> +		dev_err(sfc->dev, "unsupported SPI read mode\n");
> +		return -EINVAL;
> +	}
> +
> +	return if_type;
> +}

[...]

> +static inline void rockchip_sfc_setup_transfer(struct spi_nor *nor,
> +					       loff_t from_to,
> +					       size_t len, u8 op_type)
> +{
> +	struct rockchip_sfc_chip_priv *priv = nor->priv;
> +	struct rockchip_sfc *sfc = priv->sfc;
> +	u32 reg;
> +	u8 if_type = 0;
> +
> +	if_type = get_if_type(sfc, nor->flash_read);
> +	writel_relaxed((if_type << SFC_CTRL_DATA_BITS_SHIFT) |
> +		       (if_type << SFC_CTRL_ADDR_BITS_SHIFT) |
> +		       (if_type << SFC_CTRL_CMD_BITS_SHIFT) |

Hm, looking at this, does the controller only support n-n-n mode (1-1-1,
2-2-2, 4-4-4) ? Or why don't you allow 1-1-n/1-n-n/2-n-n ?
I would like to hear some input from Cyrille on this one.

> +		       (sfc->negative_edge ? SFC_CTRL_PHASE_SEL_NEGETIVE : 0),
> +		       sfc->regbase + SFC_CTRL);
> +
> +	if (op_type == SFC_CMD_DIR_WR)
> +		reg = nor->program_opcode << SFC_CMD_IDX_SHIFT;
> +	else
> +		reg = nor->read_opcode << SFC_CMD_IDX_SHIFT;
> +
> +	reg |= op_type << SFC_CMD_DIR_SHIFT;
> +	reg |= (nor->addr_width == 4) ?
> +		SFC_CMD_ADDR_32BITS : SFC_CMD_ADDR_24BITS;
> +
> +	reg |= priv->cs << SFC_CMD_CS_SHIFT;
> +	reg |= len << SFC_CMD_TRAN_BYTES_SHIFT;
> +
> +	if (op_type == SFC_CMD_DIR_RD)
> +		reg |= SFC_CMD_DUMMY(nor->read_dummy);
> +
> +	/* Should minus one as 0x0 means 1 bit flash address */
> +	writel_relaxed(nor->addr_width * 8 - 1, sfc->regbase + SFC_ABIT);
> +	writel_relaxed(reg, sfc->regbase + SFC_CMD);
> +	writel_relaxed(from_to, sfc->regbase + SFC_ADDR);
> +}


[...]

> +static int rockchip_sfc_dma_transfer(struct spi_nor *nor, loff_t from_to,
> +				     size_t len, u_char *buf, u8 op_type)
> +{
> +	struct rockchip_sfc_chip_priv *priv = nor->priv;
> +	struct rockchip_sfc *sfc = priv->sfc;
> +	size_t offset;
> +	int ret;
> +	dma_addr_t dma_addr = 0;

Nit, you can precalculate the DMA_TO/FROM_DEVICE and store it to
variable here, ie.

dma_dir = (op_type == SFC_CMD_DIR_RD) ? DMA_FROM_DEVICE : DMA_TO_DEVICE.

> +	for (offset = 0; offset < len; offset += SFC_DMA_MAX_LEN) {
> +		size_t trans = min_t(size_t, SFC_DMA_MAX_LEN, len - offset);
> +
> +		if (SFC_CMD_DIR_RD)

if (op_type == is missing, but you can drop this, see above.

> +			dma_addr = dma_map_single(NULL, (void *)buf,
> +						  trans, DMA_FROM_DEVICE);
> +		else
> +			dma_addr = dma_map_single(NULL, (void *)buf,
> +						  trans, DMA_TO_DEVICE);

You can use dma_dir here ^ and drop the condition.

> +		if (dma_mapping_error(sfc->dev, dma_addr)) {
> +			/*
> +			 * If we use pre-allocated dma_buffer, we need to
> +			 * do a copy here.
> +			 */
> +			if (op_type == SFC_CMD_DIR_WR)
> +				memcpy(sfc->buffer, buf + offset, trans);
> +
> +			dma_addr = 0;
> +		}
> +
> +		if (op_type == SFC_CMD_DIR_WR)
> +			/*
> +			 * Flush the write data from write_buf to dma_addr
> +			 * if using dynamic allocated dma buffer before dma
> +			 * moves data from dma_addr to fifo.
> +			 */
> +			dma_sync_single_for_device(sfc->dev, dma_addr,
> +						   trans, DMA_TO_DEVICE);
> +
> +
> +		/* If failing to map dma, use pre-allocated area instead */
> +		ret = rockchip_sfc_do_dma_transfer(nor, from_to + offset,
> +						dma_addr ? dma_addr :
> +						sfc->dma_buffer,
> +						trans, op_type);
> +
> +		if (dma_addr) {
> +			/*
> +			 * Invalidate the read data from dma_addr if using
> +			 * dynamic allocated dma buffer after dma moves data
> +			 * from fifo to dma_addr.
> +			 */
> +			if (op_type == SFC_CMD_DIR_RD) {
> +				dma_sync_single_for_cpu(sfc->dev, dma_addr,
> +							trans, DMA_FROM_DEVICE);
> +				dma_unmap_single(NULL, dma_addr,
> +						 trans, DMA_FROM_DEVICE);
> +			} else {
> +				dma_unmap_single(NULL, dma_addr,
> +						 trans, DMA_TO_DEVICE);

Here as well and it'd be reduced to

if (...)
  dma_sync_single...()
dma_unmap( ... , dma_dir);

> +			}
> +		}
> +
> +		if (ret) {
> +			dev_warn(nor->dev, "DMA read timeout\n");
> +			return ret;
> +		}
> +		/*
> +		 * If we use pre-allocated dma_buffer for read, we need to
> +		 * do a copy here.
> +		 */
> +		if (!dma_addr && (op_type == SFC_CMD_DIR_RD))
> +			memcpy(buf + offset, sfc->buffer, trans);
> +	}
> +
> +	return len;
> +}
> +
> +static ssize_t rockchip_sfc_do_rd_wr(struct spi_nor *nor, loff_t from_to,
> +				     size_t len, u_char *buf, u32 op_type)
> +{
> +	struct rockchip_sfc_chip_priv *priv = nor->priv;
> +	struct rockchip_sfc *sfc = priv->sfc;
> +	int ret;
> +
> +	if (!sfc->use_dma)
> +		goto no_dma;
> +
> +	return rockchip_sfc_dma_transfer(nor, from_to, len,
> +					 buf, op_type);

if (likely(sfc->use_dma))
  return rockchip_sfc_dma...();

/* Comment saying that we fall back to PIO */
... pio code ...

> +no_dma:
> +	ret = rockchip_sfc_pio_transfer(nor, from_to, len,
> +					(u_char *)buf, op_type);
> +	if (ret) {
> +		if (op_type == SFC_CMD_DIR_RD)
> +			dev_warn(nor->dev, "PIO read timeout\n");
> +		else
> +			dev_warn(nor->dev, "PIO write timeout\n");
> +		return ret;
> +	}
> +
> +	return len;
> +}

[...]

> +/**

Drop this asterisk unless you document the driver in kerneldoc.

> + * Get spi flash device information and register it as a mtd device.
> + */
> +static int rockchip_sfc_register(struct device_node *np,
> +				 struct rockchip_sfc *sfc)
> +{
> +	struct device *dev = sfc->dev;
> +	struct mtd_info *mtd;
> +	struct spi_nor *nor;
> +	int ret;
> +
> +	nor = &(sfc->flash[sfc->num_chip].nor);

Parenthesis not needed.

> +	nor->dev = dev;
> +	spi_nor_set_flash_node(nor, np);
> +
> +	ret = of_property_read_u8(np, "reg", &sfc->flash[sfc->num_chip].cs);
> +	if (ret) {
> +		dev_err(dev, "No reg property for %s\n",
> +			np->full_name);
> +		return ret;
> +	}
> +
> +	ret = of_property_read_u32(np, "spi-max-frequency",
> +			&sfc->flash[sfc->num_chip].clk_rate);
> +	if (ret) {
> +		dev_err(dev, "No spi-max-frequency property for %s\n",
> +			np->full_name);
> +		return ret;
> +	}
> +
> +	sfc->flash[sfc->num_chip].sfc = sfc;
> +	nor->priv = &(sfc->flash[sfc->num_chip]);
> +
> +	nor->prepare = rockchip_sfc_prep;
> +	nor->unprepare = rockchip_sfc_unprep;
> +	nor->read_reg = rockchip_sfc_read_reg;
> +	nor->write_reg = rockchip_sfc_write_reg;
> +	nor->read = rockchip_sfc_read;
> +	nor->write = rockchip_sfc_write;
> +	nor->erase = NULL;
> +	ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
> +	if (ret)
> +		return ret;
> +
> +	mtd = &(nor->mtd);
> +	mtd->name = np->name;
> +	ret = mtd_device_register(mtd, NULL, 0);
> +	if (ret)
> +		return ret;
> +
> +	sfc->num_chip++;
> +	return 0;
> +}
> +
> +static void rockchip_sfc_unregister_all(struct rockchip_sfc *sfc)
> +{
> +	int i;
> +
> +	for (i = 0; i < sfc->num_chip; i++)
> +		mtd_device_unregister(&(sfc->flash[i].nor.mtd));

Inner parenthesis not needed IMO

> +}
> +
> +static int rockchip_sfc_register_all(struct rockchip_sfc *sfc)
> +{
> +	struct device *dev = sfc->dev;
> +	struct device_node *np;
> +	int ret;
> +
> +	for_each_available_child_of_node(dev->of_node, np) {
> +		ret = rockchip_sfc_register(np, sfc);
> +		if (ret)
> +			goto fail;
> +
> +		if (sfc->num_chip == SFC_MAX_CHIPSELECT_NUM) {
> +			dev_warn(dev, "Exceeds the max cs limitation\n");
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +
> +fail:
> +	dev_err(dev, "Failed to register all chips\n");
> +	/* Unregister all the _registered_ nor flash */
> +	rockchip_sfc_unregister_all(sfc);
> +	return ret;
> +}


[...]

> +#ifdef CONFIG_PM
> +int rockchip_sfc_runtime_suspend(struct device *dev)
> +{
> +	struct rockchip_sfc *sfc = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(sfc->hclk);
> +	return 0;
> +}

Was the suspend ever really tested with this block ? Is disabling clock
really enough ?

> +int rockchip_sfc_runtime_resume(struct device *dev)
> +{
> +	struct rockchip_sfc *sfc = dev_get_drvdata(dev);
> +
> +	clk_prepare_enable(sfc->hclk);
> +	return 0;
> +}
> +#endif /* CONFIG_PM */

[...]

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
