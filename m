From: Jagan Teki <jteki@openedev.com>
Subject: Re: [PATCH v8] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
Date: Fri, 11 Mar 2016 13:34:57 +0530
Message-ID: <56E27C29.2040904@openedev.com>
References: <1457682114-1667-1-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457682114-1667-1-git-send-email-xuejiancheng@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiancheng Xue <xuejiancheng@huawei.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, dwmw2@infradead.org, computersforpeace@gmail.com, zajec5@gmail.com, boris.brezillon@free-electrons.com, ezequiel@vanguardiasur.com.ar, juhosg@openwrt.org, shijie.huang@intel.com, mika.westerberg@linux.intel.com, furquan@google.com, han.xu@freescale.com, fabio.estevam@freescale.com, manabian@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, raojun@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com, xuejiancheng@hisilicon.com, Binquan Peng <pengbinquan@huawei.com>
List-Id: devicetree@vger.kernel.org



On Friday 11 March 2016 01:11 PM, Jiancheng Xue wrote:
> Add hisilicon spi-nor flash controller driver
>
> Signed-off-by: Binquan Peng <pengbinquan@huawei.com>
> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
> change log
> v8:
> Fixed issues pointed by Ezequiel Garcia and Brian Norris.
> Moved dts binding file to mtd directory.
> Changed the compatible string more specific.
> v7:
> Rebased to v4.5-rc3.
> Fixed issues pointed by Ezequiel Garcia.
> v6:
> Based on v4.5-rc2
> Fixed issues pointed by Ezequiel Garcia.
> v5:
> Fixed a compile error.
> v4:
> Rebased to v4.5-rc1
> v3:
> Added a compatible string "hisilicon,hi3519-sfc".
> v2:
> Fixed some compiling warings.
>
>   .../bindings/mtd/hisilicon,fmc-spi-nor.txt         |  24 +
>   drivers/mtd/spi-nor/Kconfig                        |   7 +
>   drivers/mtd/spi-nor/Makefile                       |   1 +
>   drivers/mtd/spi-nor/hisi-sfc.c                     | 500 +++++++++++++++++++++
>   4 files changed, 532 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt
>   create mode 100644 drivers/mtd/spi-nor/hisi-sfc.c
>
> diff --git a/Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt b/Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt
> new file mode 100644
> index 0000000..7498152
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt
> @@ -0,0 +1,24 @@
> +HiSilicon SPI-NOR Flash Controller
> +
> +Required properties:
> +- compatible : Should be "hisilicon,fmc-spi-nor" and one of the following strings:
> +		"hisilicon,hi3519-spi-nor"
> +- address-cells : Should be 1.
> +- size-cells : Should be 0.
> +- reg : Offset and length of the register set for the controller device.
> +- reg-names : Must include the following two entries: "control", "memory".
> +- clocks : handle to spi-nor flash controller clock.
> +
> +Example:
> +spi-nor-controller@10000000 {
> +	compatible = "hisilicon,hi3519-spi-nor", "hisilicon,fmc-spi-nor";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	reg = <0x10000000 0x1000>, <0x14000000 0x1000000>;
> +	reg-names = "control", "memory";
> +	clocks = <&clock HI3519_FMC_CLK>;
> +	spi-nor@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +	};
> +};
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 0dc9275..120624d 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -37,6 +37,13 @@ config SPI_FSL_QUADSPI
>   	  This controller does not support generic SPI. It only supports
>   	  SPI NOR.
>
> +config SPI_HISI_SFC
> +	tristate "Hisilicon SPI-NOR Flash Controller(SFC)"
> +	depends on ARCH_HISI || COMPILE_TEST
> +	depends on HAS_IOMEM
> +	help
> +	  This enables support for hisilicon SPI-NOR flash controller.
> +
>   config SPI_NXP_SPIFI
>   	tristate "NXP SPI Flash Interface (SPIFI)"
>   	depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 0bf3a7f8..8a6fa69 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -1,4 +1,5 @@
>   obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
>   obj-$(CONFIG_SPI_FSL_QUADSPI)	+= fsl-quadspi.o
> +obj-$(CONFIG_SPI_HISI_SFC)	+= hisi-sfc.o
>   obj-$(CONFIG_MTD_MT81xx_NOR)    += mtk-quadspi.o
>   obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
> diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
> new file mode 100644
> index 0000000..be56904
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/hisi-sfc.c
> @@ -0,0 +1,500 @@
> +/*
> + * HiSilicon SPI Nor Flash Controller Driver
> + *
> + * Copyright (c) 2015-2016 HiSilicon Technologies Co., Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + */
> +#include <linux/clk.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/spi-nor.h>
> +#include <linux/of_platform.h>
> +#include <linux/slab.h>
> +
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
> +#define FMC_DMA_LEN			0x40
> +#define FMC_DMA_LEN_SET(_len)		((_len) & 0x0fffffff)
> +#define FMC_DMA_SADDR_D0		0x4c
> +#define HIFMC_DMA_MAX_LEN		(4096)
> +#define HIFMC_DMA_MASK			(HIFMC_DMA_MAX_LEN - 1)
> +#define FMC_OP_DMA			0x68
> +#define OP_CTRL_RD_OPCODE(_code)	(((_code) & 0xff) << 16)
> +#define OP_CTRL_WR_OPCODE(_code)	(((_code) & 0xff) << 8)
> +#define OP_CTRL_RW_OP(_op)		((_op) << 1)
> +#define OP_CTRL_DMA_OP_READY		BIT(0)
> +#define FMC_OP_READ			0x0
> +#define FMC_OP_WRITE			0x1
> +#define FMC_WAIT_TIMEOUT		1000000
> +
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
> +	u32 clkrate;
> +	struct hifmc_host *host;
> +};
> +
> +#define HIFMC_MAX_CHIP_NUM		2
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
> +
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
> +
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
> +}
> +
> +static int hisi_spi_nor_send_cmd(struct spi_nor *nor, u8 cmd, int len)
> +{
> +	struct hifmc_priv *priv = nor->priv;
> +	struct hifmc_host *host = priv->host;
> +	u32 reg, op_cfg = 0;
> +
> +	hisi_spi_nor_cmd_prepare(host, cmd, &op_cfg);
> +
> +	reg = FMC_CMD_CMD1(cmd);
> +	writel(reg, host->regbase + FMC_CMD);
> +
> +	reg = OP_CFG_FM_CS(priv->chipselect);
> +	if (op_cfg & FMC_OP_ADDR_EN)
> +		reg |= OP_CFG_ADDR_NUM(nor->addr_width);
> +	writel(reg, host->regbase + FMC_OP_CFG);
> +
> +	reg = FMC_DATA_NUM_CNT(len);
> +	writel(reg, host->regbase + FMC_DATA_NUM);
> +
> +	writel(0xff, host->regbase + FMC_INT_CLR);
> +	reg = op_cfg | FMC_OP_REG_OP_START;
> +	writel(reg, host->regbase + FMC_OP);
> +
> +	return wait_op_finish(host);
> +}
> +
> +static int hisi_spi_nor_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
> +		int len)
> +{
> +	struct hifmc_priv *priv = nor->priv;
> +	struct hifmc_host *host = priv->host;
> +	int ret;
> +
> +	ret = hisi_spi_nor_send_cmd(nor, opcode, len);
> +	if (ret)
> +		return ret;
> +
> +	memcpy_fromio(buf, host->iobase, len);
> +
> +	return 0;
> +}
> +
> +static int hisi_spi_nor_write_reg(struct spi_nor *nor, u8 opcode,
> +				u8 *buf, int len)
> +{
> +	struct hifmc_priv *priv = nor->priv;
> +	struct hifmc_host *host = priv->host;
> +
> +	if (len)
> +		memcpy_toio(host->iobase, buf, len);
> +
> +	return hisi_spi_nor_send_cmd(nor, opcode, len);
> +}
> +
> +static void hisi_spi_nor_dma_transfer(struct spi_nor *nor, loff_t start_off,
> +		dma_addr_t dma_buf, size_t len, u8 op_type)
> +{
> +	struct hifmc_priv *priv = nor->priv;
> +	struct hifmc_host *host = priv->host;
> +	u8 if_type = 0, dummy = 0;
> +	u8 w_cmd = 0, r_cmd = 0;
> +	u32 reg;
> +
> +	writel(start_off, host->regbase + FMC_ADDRL);
> +
> +	if (op_type == FMC_OP_READ) {
> +		if_type = get_if_type(nor->flash_read);
> +		dummy = nor->read_dummy >> 3;
> +		r_cmd = nor->read_opcode;
> +	} else {
> +		w_cmd = nor->program_opcode;
> +	}
> +
> +	reg = OP_CFG_FM_CS(priv->chipselect)
> +		| OP_CFG_MEM_IF_TYPE(if_type)
> +		| OP_CFG_ADDR_NUM(nor->addr_width)
> +		| OP_CFG_DUMMY_NUM(dummy);
> +	writel(reg, host->regbase + FMC_OP_CFG);
> +
> +	reg = FMC_DMA_LEN_SET(len);
> +	writel(reg, host->regbase + FMC_DMA_LEN);
> +	writel(dma_buf, host->regbase + FMC_DMA_SADDR_D0);
> +
> +	reg = OP_CTRL_RD_OPCODE(r_cmd)
> +		| OP_CTRL_WR_OPCODE(w_cmd)
> +		| OP_CTRL_RW_OP(op_type)
> +		| OP_CTRL_DMA_OP_READY;
> +	writel(0xff, host->regbase + FMC_INT_CLR);
> +	writel(reg, host->regbase + FMC_OP_DMA);
> +	wait_op_finish(host);
> +}
> +
> +static int hisi_spi_nor_read(struct spi_nor *nor, loff_t from, size_t len,
> +		size_t *retlen, u_char *read_buf)
> +{
> +	struct hifmc_priv *priv = nor->priv;
> +	struct hifmc_host *host = priv->host;
> +	unsigned char *ptr = read_buf;
> +	size_t num;
> +
> +	while (len > 0) {
> +		num = (len >= HIFMC_DMA_MAX_LEN)
> +			? HIFMC_DMA_MAX_LEN : len;
> +		hisi_spi_nor_dma_transfer(nor, from, host->dma_buffer,
> +				num, FMC_OP_READ);
> +		memcpy(ptr, host->buffer, num);
> +		ptr += num;
> +		from += num;
> +		len -= num;
> +	}
> +	*retlen += (size_t)(ptr - read_buf);
> +
> +	return 0;
> +}
> +
> +static void hisi_spi_nor_write(struct spi_nor *nor, loff_t to,
> +			size_t len, size_t *retlen, const u_char *write_buf)
> +{
> +	struct hifmc_priv *priv = nor->priv;
> +	struct hifmc_host *host = priv->host;
> +	const unsigned char *ptr = write_buf;
> +	size_t num;
> +
> +	while (len > 0) {
> +		if (to & HIFMC_DMA_MASK)
> +			num = (HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK))
> +				>= len	? len
> +				: (HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK));
> +		else
> +			num = (len >= HIFMC_DMA_MAX_LEN)
> +				? HIFMC_DMA_MAX_LEN : len;

Since num is the actual length bytes to read Better to rename num to 
actual_len for proper meaning here.

> +		memcpy(host->buffer, ptr, num);
> +		hisi_spi_nor_dma_transfer(nor, to, host->dma_buffer, num,
> +				FMC_OP_WRITE);
> +		to += num;
> +		ptr += num;
> +		len -= num;
> +	}
> +	*retlen += (size_t)(ptr - write_buf);

Please avoid this type casting and do *retlen += num inside while.
