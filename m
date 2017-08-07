From: matthew.gerlach@linux.intel.com
Subject: Re: [PATCH 2/2] mtd: spi-nor: Altera ASMI Parallel II IP Core
Date: Mon, 7 Aug 2017 08:21:12 -0700 (PDT)
Message-ID: <alpine.DEB.2.20.1708070751330.6824@mgerlach-VirtualBox>
References: <1502043844-3626-1-git-send-email-matthew.gerlach@linux.intel.com> <1502043844-3626-3-git-send-email-matthew.gerlach@linux.intel.com> <e43d80a2-e0b6-224b-f8ab-51b9446f58e0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e43d80a2-e0b6-224b-f8ab-51b9446f58e0@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, davem@davemloft.net, mchehab@kernel.org, linux-fpga@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On Sun, 6 Aug 2017, Marek Vasut wrote:


Hi Marek,

Thanks for the feedback.  Please see comments inline.

Matthew Gerlach

> On 08/06/2017 08:24 PM, matthew.gerlach@linux.intel.com wrote:
>> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>
> Thanks for the descriptive commit message. Could you explain what this
> patch is all about ?

Ok, I will add more of a comment.
>
>> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>
> [...]
>
>> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
>> index c5f171d..1c79324 100644
>> --- a/drivers/mtd/spi-nor/Makefile
>> +++ b/drivers/mtd/spi-nor/Makefile
>> @@ -1,4 +1,5 @@
>>  obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
>> +obj-$(CONFIG_SPI_ALTERA_ASMIP2)	+= altera-asmip2.o
>>  obj-$(CONFIG_SPI_ASPEED_SMC)	+= aspeed-smc.o
>>  obj-$(CONFIG_SPI_ATMEL_QUADSPI)	+= atmel-quadspi.o
>>  obj-$(CONFIG_SPI_CADENCE_QUADSPI)	+= cadence-quadspi.o
>> @@ -9,4 +10,4 @@ obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
>>  obj-$(CONFIG_SPI_INTEL_SPI)	+= intel-spi.o
>>  obj-$(CONFIG_SPI_INTEL_SPI_PCI)	+= intel-spi-pci.o
>>  obj-$(CONFIG_SPI_INTEL_SPI_PLATFORM)	+= intel-spi-platform.o
>> -obj-$(CONFIG_SPI_STM32_QUADSPI)	+= stm32-quadspi.o
>> \ No newline at end of file
>> +obj-$(CONFIG_SPI_STM32_QUADSPI)	+= stm32-quadspi.o
>
> Drop this hunk

I will fix this.

>
>> diff --git a/drivers/mtd/spi-nor/altera-asmip2.c b/drivers/mtd/spi-nor/altera-asmip2.c
>> new file mode 100644
>> index 0000000..2095f2e
>> --- /dev/null
>> +++ b/drivers/mtd/spi-nor/altera-asmip2.c
>> @@ -0,0 +1,474 @@
>> +/*
>> + * Copyright (C) 2017 Intel Corporation. All rights reserved.
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along with
>> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include <linux/iopoll.h>
>> +#include <linux/module.h>
>> +#include <linux/mtd/altera-asmip2.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mtd/spi-nor.h>
>> +#include <linux/of_device.h>
>> +
>> +#define QSPI_ACTION_REG 0
>> +#define QSPI_ACTION_RST BIT(0)
>> +#define QSPI_ACTION_EN BIT(1)
>> +#define QSPI_ACTION_SC BIT(2)
>> +#define QSPI_ACTION_CHIP_SEL_SFT 4
>> +#define QSPI_ACTION_DUMMY_SFT 8
>> +#define QSPI_ACTION_READ_BACK_SFT 16
>> +
>> +#define QSPI_FIFO_CNT_REG 4
>> +#define QSPI_FIFO_DEPTH 0x200
>> +#define QSPI_FIFO_CNT_MSK 0x3ff
>> +#define QSPI_FIFO_CNT_RX_SFT 0
>> +#define QSPI_FIFO_CNT_TX_SFT 12
>
> Indent the value with a tab at least ...

Ok, I can indent with tabs.

>
>> +#define QSPI_DATA_REG 0x8
>> +
>> +#define QSPI_POLL_TIMEOUT 10000000
>
> In what units is this ?

Units are in microseconds.  I will add a comment.

>
>> +#define QSPI_POLL_INTERVAL 5
>> +
>> +struct altera_asmip2 {
>> +	void __iomem *csr_base;
>> +	u32 num_flashes;
>> +	struct device *dev;
>> +	struct altera_asmip2_flash *flash[ALTERA_ASMIP2_MAX_NUM_FLASH_CHIP];
>> +	struct mutex bus_mutex;
>> +};
>> +
>> +struct altera_asmip2_flash {
>> +	struct spi_nor nor;
>> +	struct altera_asmip2 *q;
>> +	u32 bank;
>> +};
>> +
>> +static int altera_asmip2_write_reg(struct spi_nor *nor, u8 opcode, u8 *val,
>> +				    int len)
>> +{
>> +	struct altera_asmip2_flash *flash = nor->priv;
>> +	struct altera_asmip2 *q = flash->q;
>> +	u32 reg;
>> +	int ret;
>> +	int i;
>> +
>> +	if ((len + 1) > QSPI_FIFO_DEPTH) {
>> +		dev_err(q->dev, "%s bad len %d > %d\n",
>> +			__func__, len + 1, QSPI_FIFO_DEPTH);
>> +		return -EINVAL;
>> +	}
>> +
>> +	writel(opcode, q->csr_base + QSPI_DATA_REG);
>> +
>> +	for (i = 0; i < len; i++) {
>> +		writel((u32)val[i], q->csr_base + QSPI_DATA_REG);
>
> iowrite32_rep() ?

I don't think I can use iowrite32_rep() here because writes to the
register must be 32 bits, but the data to be written is 8 bits wide.

>
>> +	}
>> +
>> +	reg = QSPI_ACTION_EN | QSPI_ACTION_SC;
>> +
>> +	writel(reg, q->csr_base + QSPI_ACTION_REG);
>> +
>> +	ret = readl_poll_timeout(q->csr_base + QSPI_FIFO_CNT_REG, reg,
>> +				 (((reg >> QSPI_FIFO_CNT_TX_SFT) &
>> +				 QSPI_FIFO_CNT_MSK) == 0), QSPI_POLL_INTERVAL,
>> +				 QSPI_POLL_TIMEOUT);
>> +	if (ret)
>> +		dev_err(q->dev, "%s timed out\n", __func__);
>
> So if the poll fails , you ignore the failure and continue enabling
> whatever action you enable here ?

My intent is to put the controller in the ready state and shut off the 
failed action by clearing the QSPI_ACTION_SC bit.

>
>> +	reg = QSPI_ACTION_EN;
>> +
>> +	writel(reg, q->csr_base + QSPI_ACTION_REG);
>> +
>> +	return ret;
>> +}
>> +
>> +static int altera_asmip2_read_reg(struct spi_nor *nor, u8 opcode, u8 *val,
>> +				   int len)
>> +{
>> +	struct altera_asmip2_flash *flash = nor->priv;
>> +	struct altera_asmip2 *q = flash->q;
>> +	u32 reg;
>> +	int ret;
>> +	int i;
>> +
>> +	if (len > QSPI_FIFO_DEPTH) {
>> +		dev_err(q->dev, "%s bad len %d > %d\n",
>> +			__func__, len, QSPI_FIFO_DEPTH);
>> +		return -EINVAL;
>> +	}
>> +
>> +	writel(opcode, q->csr_base + QSPI_DATA_REG);
>> +
>> +	reg = QSPI_ACTION_EN | QSPI_ACTION_SC |
>> +		(len << QSPI_ACTION_READ_BACK_SFT);
>> +
>> +	writel(reg, q->csr_base + QSPI_ACTION_REG);
>> +
>> +	ret = readl_poll_timeout(q->csr_base + QSPI_FIFO_CNT_REG, reg,
>> +				 ((reg & QSPI_FIFO_CNT_MSK) == len),
>> +				 QSPI_POLL_INTERVAL, QSPI_POLL_TIMEOUT);
>> +
>> +	if (!ret)
>> +		for (i = 0; i < len; i++) {
>> +			reg = readl(q->csr_base + QSPI_DATA_REG);
>> +			val[i] = (u8)(reg & 0xff);
>
> ioread32_rep , plus same comments as for the write function

I don't think I can use ioread32_rep here either. The register is 32 bits, 
but the data is 8 bits.

Again, I am clearing the QSPI_ACTION_SC bit which is a one shot which must
be cleared before it can be set again.

>
>> +		}
>> +	else
>> +		dev_err(q->dev, "%s timeout\n", __func__);
>> +
>> +	writel(QSPI_ACTION_EN, q->csr_base + QSPI_ACTION_REG);
>> +
>> +	return ret;
>> +}
>> +
>> +static ssize_t altera_asmip2_read(struct spi_nor *nor, loff_t from, size_t len,
>> +				   u_char *buf)
>> +{
>> +	struct altera_asmip2_flash *flash = nor->priv;
>> +	struct altera_asmip2 *q = flash->q;
>> +	size_t bytes_to_read, i;
>> +	u32 reg;
>> +	int ret;
>> +
>> +	bytes_to_read = min_t(size_t, len, QSPI_FIFO_DEPTH);
>> +
>> +	writel(nor->read_opcode, q->csr_base + QSPI_DATA_REG);
>> +
>> +	writel((from & 0xff000000) >> 24, q->csr_base + QSPI_DATA_REG);
>> +	writel((from & 0x00ff0000) >> 16, q->csr_base + QSPI_DATA_REG);
>> +	writel((from & 0x0000ff00) >> 8, q->csr_base + QSPI_DATA_REG);
>> +	writel((from & 0x000000ff), q->csr_base + QSPI_DATA_REG);
>
> Use a for() loop ?
>
>> +	reg = QSPI_ACTION_EN | QSPI_ACTION_SC |
>> +		(10 << QSPI_ACTION_DUMMY_SFT) |
>> +		(bytes_to_read << QSPI_ACTION_READ_BACK_SFT);
>> +
>> +	writel(reg, q->csr_base + QSPI_ACTION_REG);
>> +
>> +	ret = readl_poll_timeout(q->csr_base + QSPI_FIFO_CNT_REG, reg,
>> +				 ((reg & QSPI_FIFO_CNT_MSK) ==
>> +				 bytes_to_read), QSPI_POLL_INTERVAL,
>> +				 QSPI_POLL_TIMEOUT);
>> +	if (ret) {
>> +		dev_err(q->dev, "%s timed out\n", __func__);
>> +		bytes_to_read = 0;
>> +	} else
>> +		for (i = 0; i < bytes_to_read; i++) {
>> +			reg = readl(q->csr_base + QSPI_DATA_REG);
>> +			*buf++ = (u8)(reg & 0xff);
>
> ioread8_rep or something ?
>
>> +		}
>> +
>> +	writel(QSPI_ACTION_EN, q->csr_base + QSPI_ACTION_REG);
>> +
>> +	return bytes_to_read;
>> +}
>> +
>> +static ssize_t altera_asmip2_write(struct spi_nor *nor, loff_t to,
>> +				    size_t len, const u_char *buf)
>> +{
>> +	struct altera_asmip2_flash *flash = nor->priv;
>> +	struct altera_asmip2 *q = flash->q;
>> +	size_t bytes_to_write, i;
>> +	u32 reg;
>> +	int ret;
>> +
>> +	bytes_to_write = min_t(size_t, len, (QSPI_FIFO_DEPTH - 5));
>> +
>> +	writel(nor->program_opcode, q->csr_base + QSPI_DATA_REG);
>> +
>> +	writel((to & 0xff000000) >> 24, q->csr_base + QSPI_DATA_REG);
>> +	writel((to & 0x00ff0000) >> 16, q->csr_base + QSPI_DATA_REG);
>> +	writel((to & 0x0000ff00) >> 8, q->csr_base + QSPI_DATA_REG);
>> +	writel((to & 0x000000ff), q->csr_base + QSPI_DATA_REG);
>> +
>> +	for (i = 0; i < bytes_to_write; i++) {
>> +		reg = (u32)*buf++;
>> +		writel(reg, q->csr_base + QSPI_DATA_REG);
>> +	}
>> +
>> +	reg = QSPI_ACTION_EN | QSPI_ACTION_SC;
>> +
>> +	writel(reg, q->csr_base + QSPI_ACTION_REG);
>> +
>> +	ret = readl_poll_timeout(q->csr_base + QSPI_FIFO_CNT_REG, reg,
>> +				 (((reg >> QSPI_FIFO_CNT_TX_SFT) &
>> +				 QSPI_FIFO_CNT_MSK) == 0), QSPI_POLL_INTERVAL,
>> +				 QSPI_POLL_TIMEOUT);
>> +
>> +	if (ret) {
>> +		dev_err(q->dev,
>> +			"%s timed out waiting for fifo to clear\n",
>> +			__func__);
>> +		bytes_to_write = 0;
>> +	}
>> +
>> +	writel(QSPI_ACTION_EN, q->csr_base + QSPI_ACTION_REG);
>> +
>> +	return bytes_to_write;
>> +
>> +}
>> +
>> +static int altera_asmip2_prep(struct spi_nor *nor, enum spi_nor_ops ops)
>> +{
>> +	struct altera_asmip2_flash *flash = nor->priv;
>> +	struct altera_asmip2 *q = flash->q;
>> +
>> +	mutex_lock(&q->bus_mutex);
>
> We should factor this mutex stuff into the SPI NOR framework, this
> pattern is repeating itself way too often.

I agree this seems to be a pattern.  Should I keep it for v2 of this patch
set?

>
>> +	return 0;
>> +}
>> +
>> +static void altera_asmip2_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
>> +{
>> +	struct altera_asmip2_flash *flash = nor->priv;
>> +	struct altera_asmip2 *q = flash->q;
>> +
>> +	mutex_unlock(&q->bus_mutex);
>> +}
>> +
>> +static int altera_asmip2_setup_banks(struct device *dev,
>> +				      u32 bank, struct device_node *np)
>> +{
>> +	const struct spi_nor_hwcaps hwcaps = {
>> +		.mask = SNOR_HWCAPS_READ |
>> +			SNOR_HWCAPS_READ_FAST |
>> +			SNOR_HWCAPS_PP,
>> +	};
>> +	struct altera_asmip2 *q = dev_get_drvdata(dev);
>> +	struct altera_asmip2_flash *flash;
>> +	struct spi_nor *nor;
>> +	int ret = 0;
>> +	char modalias[40] = {0};
>> +
>> +	if (bank > q->num_flashes - 1)
>> +		return -EINVAL;
>> +
>> +	flash = devm_kzalloc(q->dev, sizeof(*flash), GFP_KERNEL);
>> +	if (!flash)
>> +		return -ENOMEM;
>> +
>> +	q->flash[bank] = flash;
>> +	flash->q = q;
>> +	flash->bank = bank;
>> +
>> +	nor = &flash->nor;
>> +	nor->dev = dev;
>> +	nor->priv = flash;
>> +	nor->mtd.priv = nor;
>> +	spi_nor_set_flash_node(nor, np);
>> +
>> +	/* spi nor framework*/
>> +	nor->read_reg = altera_asmip2_read_reg;
>> +	nor->write_reg = altera_asmip2_write_reg;
>> +	nor->read = altera_asmip2_read;
>> +	nor->write = altera_asmip2_write;
>> +	nor->prepare = altera_asmip2_prep;
>> +	nor->unprepare = altera_asmip2_unprep;
>> +
>> +	/* scanning flash and checking dev id */
>> +#ifdef CONFIG_OF
>
> Why is this here ?

Looking at this again, I think this can be removed.

>
>> +	if (np && (of_modalias_node(np, modalias, sizeof(modalias)) < 0))
>> +		return -EINVAL;
>> +#endif
>> +
>> +	ret = spi_nor_scan(nor, modalias, &hwcaps);
>> +	if (ret) {
>> +		dev_err(nor->dev, "flash not found\n");
>> +		return ret;
>> +	}
>> +
>> +	ret =  mtd_device_register(&nor->mtd, NULL, 0);
>> +
>> +	return ret;
>> +}
>> +
>> +static int altera_asmip2_create(struct device *dev, void __iomem *csr_base)
>> +{
>> +	struct altera_asmip2 *q;
>> +	u32 reg;
>> +
>> +	q = devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
>> +	if (!q)
>> +		return -ENOMEM;
>> +
>> +	q->dev = dev;
>> +	q->csr_base = csr_base;
>> +
>> +	mutex_init(&q->bus_mutex);
>> +
>> +	dev_set_drvdata(dev, q);
>> +
>> +	reg = readl(q->csr_base + QSPI_ACTION_REG);
>> +	if (!(reg & QSPI_ACTION_RST)) {
>> +		writel((reg | QSPI_ACTION_RST), q->csr_base + QSPI_ACTION_REG);
>> +		dev_info(dev, "%s asserting reset\n", __func__);
>> +		udelay(10);
>> +	}
>> +
>> +	writel((reg & ~QSPI_ACTION_RST), q->csr_base + QSPI_ACTION_REG);
>> +	udelay(10);
>> +
>> +	return 0;
>> +}
>> +
>> +static int altera_qspi_add_bank(struct device *dev,
>> +			 u32 bank, struct device_node *np)
>> +{
>> +	struct altera_asmip2 *q = dev_get_drvdata(dev);
>> +
>> +	if (q->num_flashes >= ALTERA_ASMIP2_MAX_NUM_FLASH_CHIP)
>> +		return -ENOMEM;
>> +
>> +	q->num_flashes++;
>> +
>> +	return altera_asmip2_setup_banks(dev, bank, np);
>> +}
>> +
>> +static int altera_asmip2_remove_banks(struct device *dev)
>> +{
>> +	struct altera_asmip2 *q = dev_get_drvdata(dev);
>> +	struct altera_asmip2_flash *flash;
>> +	int i;
>> +	int ret = 0;
>> +
>> +	if (!q)
>> +		return -EINVAL;
>> +
>> +	/* clean up for all nor flash */
>> +	for (i = 0; i < q->num_flashes; i++) {
>> +		flash = q->flash[i];
>> +		if (!flash)
>> +			continue;
>> +
>> +		/* clean up mtd stuff */
>> +		ret = mtd_device_unregister(&flash->nor.mtd);
>> +		if (ret) {
>> +			dev_err(dev, "error removing mtd\n");
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int __probe_with_data(struct platform_device *pdev,
>> +			     struct altera_asmip2_plat_data *qdata)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	int ret, i;
>> +
>> +	ret = altera_asmip2_create(dev, qdata->csr_base);
>> +
>> +	if (ret) {
>> +		dev_err(dev, "failed to create qspi device %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	for (i = 0; i < qdata->num_chip_sel; i++) {
>> +		ret = altera_qspi_add_bank(dev, i, NULL);
>> +		if (ret) {
>> +			dev_err(dev, "failed to add qspi bank %d\n", ret);
>> +			break;
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int altera_asmip2_probe(struct platform_device *pdev)
>> +{
>> +	struct device_node *np = pdev->dev.of_node;
>> +	struct device *dev = &pdev->dev;
>> +	struct altera_asmip2_plat_data *qdata;
>> +	struct resource *res;
>> +	void __iomem *csr_base;
>> +	u32 bank;
>> +	int ret;
>> +	struct device_node *pp;
>> +
>> +	qdata = dev_get_platdata(dev);
>> +
>> +	if (qdata)
>> +		return __probe_with_data(pdev, qdata);
>
> Avoid function names with __ prefix.

OK, I can rename the function without the __ prefix.

>
>> +	if (!np) {
>> +		dev_err(dev, "no device tree found %p\n", pdev);
>> +		return -ENODEV;
>> +	}
>
> You might as well introduce a function to probe with of to be consistent
> ... or convert between pdata and ofdata and have one function for both.

There is a subtle difference when using platform data versus of data.
The of data requires the memory to be remapped, whereas the platform data
has the memory already mapped by the parent, PCIe driver.

Either way ends up with a single call to altera_asmip2_create plus one or 
more calls to altera_qspi_add_bank, which needs to be renamed for 
consistency.

>
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	csr_base = devm_ioremap_resource(dev, res);
>> +	if (IS_ERR(csr_base)) {
>> +		dev_err(dev, "%s: ERROR: failed to map csr base\n", __func__);
>> +		return PTR_ERR(csr_base);
>> +	}
>> +
>> +	ret = altera_asmip2_create(dev, csr_base);
>> +
>> +	if (ret) {
>> +		dev_err(dev, "failed to create qspi device\n");
>> +		return ret;
>> +	}
>> +
>> +	for_each_available_child_of_node(np, pp) {
>> +		of_property_read_u32(pp, "reg", &bank);
>> +		if (bank >= ALTERA_ASMIP2_MAX_NUM_FLASH_CHIP) {
>> +			dev_err(dev, "bad reg value %u >= %u\n", bank,
>> +				ALTERA_ASMIP2_MAX_NUM_FLASH_CHIP);
>> +			goto error;
>> +		}
>> +
>> +		if (altera_qspi_add_bank(dev, bank, pp)) {
>> +			dev_err(dev, "failed to add bank %u\n", bank);
>> +			goto error;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +error:
>> +	altera_asmip2_remove_banks(dev);
>> +	return -EIO;
>> +}
>> +
>> +static int altera_asmip2_remove(struct platform_device *pdev)
>> +{
>> +	if (!pdev) {
>> +		dev_err(&pdev->dev, "%s NULL\n", __func__);
>> +		return -EINVAL;
>
> Can this really happen ?

This probably cannot happen, and dereferencing a NULL pointer is bad.
I will get rid of this.

>
>> +	} else {
>> +		return altera_asmip2_remove_banks(&pdev->dev);
>> +	}
>> +}
>> +
>> +static const struct of_device_id altera_asmip2_id_table[] = {
>> +
>> +	{ .compatible = "altr,asmi_parallel2",},
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, altera_asmip2_id_table);
>> +
>> +static struct platform_driver altera_asmip2_driver = {
>> +	.driver = {
>> +		.name = ALTERA_ASMIP2_DRV_NAME,
>> +		.of_match_table = altera_asmip2_id_table,
>> +	},
>> +	.probe = altera_asmip2_probe,
>> +	.remove = altera_asmip2_remove,
>> +};
>> +module_platform_driver(altera_asmip2_driver);
>> +
>> +MODULE_AUTHOR("Matthew Gerlach <matthew.gerlach@linux.intel.com>");
>> +MODULE_DESCRIPTION("Altera ASMI Parallel II");
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_ALIAS("platform:" ALTERA_ASMIP2_DRV_NAME);
>> diff --git a/include/linux/mtd/altera-asmip2.h b/include/linux/mtd/altera-asmip2.h
>> new file mode 100644
>> index 0000000..580c43c
>> --- /dev/null
>> +++ b/include/linux/mtd/altera-asmip2.h
>> @@ -0,0 +1,24 @@
>> +/*
>> + *
>> + * Copyright 2017 Intel Corporation, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + */
>> +#ifndef __ALTERA_QUADSPI_H
>> +#define __ALTERA_QUADSPI_H
>> +
>> +#include <linux/device.h>
>> +
>> +#define ALTERA_ASMIP2_DRV_NAME "altr-asmip2"
>> +#define ALTERA_ASMIP2_MAX_NUM_FLASH_CHIP 3
>> +#define ALTERA_ASMIP2_RESOURCE_SIZE 0x10
>> +
>> +struct altera_asmip2_plat_data {
>> +	void __iomem *csr_base;
>> +	u32 num_chip_sel;
>> +};
>> +
>> +#endif
>>
>
>
> -- 
> Best regards,
> Marek Vasut
>
