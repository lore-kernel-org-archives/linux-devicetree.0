From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [RESEND PATCH v9] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
Date: Sun, 27 Mar 2016 03:47:53 +0200
Message-ID: <56F73BC9.5000300@gmail.com>
References: <1458979861-3619-1-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458979861-3619-1-git-send-email-xuejiancheng@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Jiancheng Xue <xuejiancheng@huawei.com>, robh+dt@kernel.org, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, juhosg@openwrt.org, furquan@google.com, suwenping@hisilicon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yanhaifeng@hisilicon.com, raojun@hisilicon.com, xuejiancheng@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, yanghongwei@hisilicon.com, zhangzhenxing@hisilicon.com
List-Id: devicetree@vger.kernel.org

On 03/26/2016 09:11 AM, Jiancheng Xue wrote:
> Add hisilicon spi-nor flash controller driver
> 
> Signed-off-by: Binquan Peng <pengbinquan@huawei.com>
> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Reviewed-by: Jagan Teki <jteki@openedev.com>
> ---
> change log
> v9:
> Fixed issues pointed by Jagan Teki.

It'd be really great if you could list which exact issues you fixed.

> v8:
> Fixed issues pointed by Ezequiel Garcia and Brian Norris.
> Moved dts binding file to mtd directory.
> Changed the compatible string more specific.

[...]

> +/* Hardware register offsets and field definitions */
> +#define FMC_CFG				0x00
> +#define SPI_NOR_ADDR_MODE		BIT(10)
> +#define FMC_GLOBAL_CFG			0x04
> +#define FMC_GLOBAL_CFG_WP_ENABLE	BIT(6)
> +#define FMC_SPI_TIMING_CFG		0x08
> +#define TIMING_CFG_TCSH(nr)		(((nr) & 0xf) << 8)
> +#define TIMING_CFG_TCSS(nr)		(((nr) & 0xf) << 4)
> +#define TIMING_CFG_TSHSL(nr)		((nr) & 0xf)
> +#define CS_HOLD_TIME			0x6
> +#define CS_SETUP_TIME			0x6
> +#define CS_DESELECT_TIME		0xf
> +#define FMC_INT				0x18
> +#define FMC_INT_OP_DONE			BIT(0)
> +#define FMC_INT_CLR			0x20
> +#define FMC_CMD				0x24
> +#define FMC_CMD_CMD1(_cmd)		((_cmd) & 0xff)

Drop the underscores in the argument names.

> +#define FMC_ADDRL			0x2c
> +#define FMC_OP_CFG			0x30
> +#define OP_CFG_FM_CS(_cs)		((_cs) << 11)
> +#define OP_CFG_MEM_IF_TYPE(_type)	(((_type) & 0x7) << 7)
> +#define OP_CFG_ADDR_NUM(_addr)		(((_addr) & 0x7) << 4)
> +#define OP_CFG_DUMMY_NUM(_dummy)	((_dummy) & 0xf)
> +#define FMC_DATA_NUM			0x38
> +#define FMC_DATA_NUM_CNT(_n)		((_n) & 0x3fff)
> +#define FMC_OP				0x3c
> +#define FMC_OP_DUMMY_EN			BIT(8)
> +#define FMC_OP_CMD1_EN			BIT(7)
> +#define FMC_OP_ADDR_EN			BIT(6)
> +#define FMC_OP_WRITE_DATA_EN		BIT(5)
> +#define FMC_OP_READ_DATA_EN		BIT(2)
> +#define FMC_OP_READ_STATUS_EN		BIT(1)
> +#define FMC_OP_REG_OP_START		BIT(0)

[...]

> +enum hifmc_iftype {
> +	IF_TYPE_STD,
> +	IF_TYPE_DUAL,
> +	IF_TYPE_DIO,
> +	IF_TYPE_QUAD,
> +	IF_TYPE_QIO,
> +};
> +
> +struct hifmc_priv {
> +	int chipselect;

Can chipselect be set to < 0 values ?

> +	u32 clkrate;
> +	struct hifmc_host *host;
> +};
> +
> +#define HIFMC_MAX_CHIP_NUM		2

This does not scale very well, use dynamic allocation.

> +struct hifmc_host {
> +	struct device *dev;
> +	struct mutex lock;
> +
> +	void __iomem *regbase;
> +	void __iomem *iobase;
> +	struct clk *clk;
> +	void *buffer;
> +	dma_addr_t dma_buffer;
> +
> +	struct spi_nor	nor[HIFMC_MAX_CHIP_NUM];
> +	struct hifmc_priv priv[HIFMC_MAX_CHIP_NUM];
> +	int num_chip;
> +};
> +
> +static inline int wait_op_finish(struct hifmc_host *host)
> +{
> +	unsigned int reg;
> +
> +	return readl_poll_timeout(host->regbase + FMC_INT, reg,
> +		(reg & FMC_INT_OP_DONE), 0, FMC_WAIT_TIMEOUT);
> +}
> +
> +static int get_if_type(enum read_mode flash_read)
> +{
> +	enum hifmc_iftype if_type;
> +
> +	switch (flash_read) {
> +	case SPI_NOR_DUAL:
> +		if_type = IF_TYPE_DUAL;
> +		break;
> +	case SPI_NOR_QUAD:
> +		if_type = IF_TYPE_QUAD;
> +		break;
> +	case SPI_NOR_NORMAL:
> +	case SPI_NOR_FAST:
> +	default:
> +		if_type = IF_TYPE_STD;
> +		break;
> +	}
> +
> +	return if_type;
> +}
> +
> +static void hisi_spi_nor_init(struct hifmc_host *host)
> +{
> +	unsigned int reg;

Should be u32 here.

> +	reg = TIMING_CFG_TCSH(CS_HOLD_TIME)
> +		| TIMING_CFG_TCSS(CS_SETUP_TIME)
> +		| TIMING_CFG_TSHSL(CS_DESELECT_TIME);
> +	writel(reg, host->regbase + FMC_SPI_TIMING_CFG);
> +}
> +
> +static int hisi_spi_nor_prep(struct spi_nor *nor, enum spi_nor_ops ops)
> +{
> +	struct hifmc_priv *priv = nor->priv;
> +	struct hifmc_host *host = priv->host;
> +	int ret;
> +
> +	mutex_lock(&host->lock);

Why do you need the mutex lock here ? Let me guess -- SPI NOR framework
locks a mutex in struct spi_nor , but that's not enough if you have
multiple SPI NORs on the same bus, because concurrent access to multiple
SPI NOR flashes needs locking on the controller level, right ?

> +	ret = clk_set_rate(host->clk, priv->clkrate);
> +	if (ret)
> +		goto out;
> +
> +	ret = clk_prepare_enable(host->clk);
> +	if (ret)
> +		goto out;
> +
> +	return 0;
> +
> +out:
> +	mutex_unlock(&host->lock);
> +	return ret;
> +}
> +
> +static void hisi_spi_nor_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
> +{
> +	struct hifmc_priv *priv = nor->priv;
> +	struct hifmc_host *host = priv->host;
> +
> +	clk_disable_unprepare(host->clk);
> +	mutex_unlock(&host->lock);
> +}
> +
> +static void hisi_spi_nor_cmd_prepare(struct hifmc_host *host, u8 cmd,
> +		u32 *opcfg)
> +{
> +	u32 reg;
> +
> +	*opcfg |= FMC_OP_CMD1_EN;
> +	switch (cmd) {
> +	case SPINOR_OP_RDID:
> +	case SPINOR_OP_RDSR:
> +	case SPINOR_OP_RDCR:
> +		*opcfg |= FMC_OP_READ_DATA_EN;
> +		break;
> +	case SPINOR_OP_WREN:
> +		reg = readl(host->regbase + FMC_GLOBAL_CFG);
> +		if (reg & FMC_GLOBAL_CFG_WP_ENABLE) {
> +			reg &= ~FMC_GLOBAL_CFG_WP_ENABLE;
> +			writel(reg, host->regbase + FMC_GLOBAL_CFG);
> +		}
> +		break;
> +	case SPINOR_OP_WRSR:
> +		*opcfg |= FMC_OP_WRITE_DATA_EN;
> +		break;
> +	case SPINOR_OP_BE_4K:
> +	case SPINOR_OP_BE_4K_PMC:
> +	case SPINOR_OP_SE_4B:
> +	case SPINOR_OP_SE:
> +		*opcfg |= FMC_OP_ADDR_EN;
> +		break;
> +	case SPINOR_OP_EN4B:
> +		reg = readl(host->regbase + FMC_CFG);
> +		reg |= SPI_NOR_ADDR_MODE;
> +		writel(reg, host->regbase + FMC_CFG);
> +		break;
> +	case SPINOR_OP_EX4B:
> +		reg = readl(host->regbase + FMC_CFG);
> +		reg &= ~SPI_NOR_ADDR_MODE;
> +		writel(reg, host->regbase + FMC_CFG);
> +		break;
> +	case SPINOR_OP_CHIP_ERASE:
> +	default:
> +		break;
> +	}

Won't the driver fail if we add new instructions into the SPI NOR core
which are not handled by this huge switch statement ?

> +}

[...]

> +static void hisi_spi_nor_write(struct spi_nor *nor, loff_t to,
> +			size_t len, size_t *retlen, const u_char *write_buf)
> +{
> +	struct hifmc_priv *priv = nor->priv;
> +	struct hifmc_host *host = priv->host;
> +	const unsigned char *ptr = write_buf;
> +	size_t actual_len;
> +
> +	*retlen = 0;
> +	while (len > 0) {
> +		if (to & HIFMC_DMA_MASK)
> +			actual_len = (HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK))
> +				>= len	? len
> +				: (HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK));

Rewrite this as something like the following snippet, for the sake of
readability:

actual_len = HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK);
if (actual_len >= len)
   actual_len = len;

> +		else
> +			actual_len = (len >= HIFMC_DMA_MAX_LEN)
> +				? HIFMC_DMA_MAX_LEN : len;
> +		memcpy(host->buffer, ptr, actual_len);
> +		hisi_spi_nor_dma_transfer(nor, to, host->dma_buffer, actual_len,
> +				FMC_OP_WRITE);
> +		to += actual_len;
> +		ptr += actual_len;
> +		len -= actual_len;
> +		*retlen += actual_len;
> +	}
> +}
> +
> +static int hisi_spi_nor_erase(struct spi_nor *nor, loff_t offs)
> +{
> +	struct hifmc_priv *priv = nor->priv;
> +	struct hifmc_host *host = priv->host;
> +
> +	writel(offs, host->regbase + FMC_ADDRL);
> +
> +	return hisi_spi_nor_send_cmd(nor, nor->erase_opcode, 0);
> +}
> +
> +static int hisi_spi_nor_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct hifmc_host *host;
> +	struct device_node *np;
> +	int ret, i = 0;
> +
> +	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
> +	if (!host)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, host);
> +	host->dev = dev;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "control");
> +	host->regbase = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(host->regbase))
> +		return PTR_ERR(host->regbase);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "memory");
> +	host->iobase = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(host->iobase))
> +		return PTR_ERR(host->iobase);
> +
> +	host->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(host->clk))
> +		return PTR_ERR(host->clk);
> +
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +	if (ret) {
> +		dev_warn(dev, "Unable to set dma mask\n");
> +		return ret;
> +	}
> +
> +	host->buffer = dmam_alloc_coherent(dev, HIFMC_DMA_MAX_LEN,
> +			&host->dma_buffer, GFP_KERNEL);
> +	if (!host->buffer)
> +		return -ENOMEM;
> +
> +	mutex_init(&host->lock);
> +	clk_prepare_enable(host->clk);
> +	hisi_spi_nor_init(host);
> +
> +	for_each_available_child_of_node(dev->of_node, np) {
> +		struct spi_nor *nor = &host->nor[i];
> +		struct hifmc_priv *priv = &host->priv[i];
> +		struct mtd_info *mtd = &nor->mtd;
> +
> +		mtd->name = np->name;
> +		nor->dev = dev;
> +		spi_nor_set_flash_node(nor, np);
> +		ret = of_property_read_u32(np, "reg", &priv->chipselect);
> +		if (ret)
> +			goto fail;
> +		ret = of_property_read_u32(np, "spi-max-frequency",
> +				&priv->clkrate);
> +		if (ret)
> +			goto fail;
> +		priv->host = host;
> +		nor->priv = priv;
> +
> +		nor->prepare = hisi_spi_nor_prep;
> +		nor->unprepare = hisi_spi_nor_unprep;
> +		nor->read_reg = hisi_spi_nor_read_reg;
> +		nor->write_reg = hisi_spi_nor_write_reg;
> +		nor->read = hisi_spi_nor_read;
> +		nor->write = hisi_spi_nor_write;
> +		nor->erase = hisi_spi_nor_erase;
> +		ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
> +		if (ret)
> +			goto fail;
> +
> +		ret = mtd_device_register(mtd, NULL, 0);
> +		if (ret)
> +			goto fail;
> +
> +		i++;
> +		host->num_chip++;
> +		if (i == HIFMC_MAX_CHIP_NUM) {
> +			dev_warn(dev, "Flash device number exceeds the maximum chipselect number\n");
> +			break;
> +		}

Please factor this loop out into a separate function, so we can easily
locate the developing boilerplate.

> +	}
> +
> +	clk_disable_unprepare(host->clk);
> +	return 0;
> +
> +fail:
> +	for (i = 0; i < host->num_chip; i++)
> +		mtd_device_unregister(&host->nor[i].mtd);

Did you ever exercise this fail path ? I think if you call this without
registering all of the MTD devices, it will crash, but I might be wrong
on this one.

> +	clk_disable_unprepare(host->clk);
> +	mutex_destroy(&host->lock);
> +
> +	return ret;
> +}
> +
> +static int hisi_spi_nor_remove(struct platform_device *pdev)
> +{
> +	struct hifmc_host *host = platform_get_drvdata(pdev);
> +	int i;
> +
> +	for (i = 0; i < host->num_chip; i++)
> +		mtd_device_unregister(&host->nor[i].mtd);
> +
> +	clk_disable_unprepare(host->clk);
> +	mutex_destroy(&host->lock);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id hisi_spi_nor_dt_ids[] = {
> +	{ .compatible = "hisilicon,fmc-spi-nor"},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, hisi_spi_nor_dt_ids);
> +
> +static struct platform_driver hisi_spi_nor_driver = {
> +	.driver = {
> +		.name	= "hisi-sfc",
> +		.of_match_table = hisi_spi_nor_dt_ids,
> +	},
> +	.probe	= hisi_spi_nor_probe,
> +	.remove	= hisi_spi_nor_remove,
> +};
> +module_platform_driver(hisi_spi_nor_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("HiSilicon SPI Nor Flash Controller Driver");
> 

btw I also trimmed down the crazy CC list.

-- 
Best regards,
Marek Vasut
