From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH v4 2/2] mtd: spi-nor: add rockchip serial flash controller
 driver
Date: Tue, 17 Jan 2017 09:34:01 +0800
Message-ID: <975a0384-6f24-0255-7efe-f1c40ee07998@rock-chips.com>
References: <1481794068-241619-1-git-send-email-shawn.lin@rock-chips.com>
 <1481794068-241619-3-git-send-email-shawn.lin@rock-chips.com>
 <e5852f21-7aa0-8091-dc85-774e306e6f73@microchip.com>
 <c4a50d88-4a31-ec67-c180-808bfc81f254@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <c4a50d88-4a31-ec67-c180-808bfc81f254@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Cyrille Pitchen <cyrille.pitchen@microchip.com>
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Marek Vasut <marek.vasut@gmail.com>, shawn.lin@rock-chips.com, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Cyrille,

On 2017/1/16 22:03, Cyrille Pitchen wrote:
> Le 16/01/2017 =E0 12:10, Cyrille Pitchen a =E9crit :
>> Hi Shawn,
>>
>> Le 15/12/2016 =E0 10:27, Shawn Lin a =E9crit :
>>> Add rockchip serial flash controller driver
>>>
>>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>>>
>>> ---
>>>
>>> Changes in v4:
>>> - simplify the code of get_if_type
>>> - use dma_dir to simplify the code
>>> - simplify the rockchip_sfc_do_rd_wr
>>> - some minor improvements
>>> - add reset controller when doing resume
>>>
>>> Changes in v3:
>>> - use io{read32,write32}_rep to simplify the corner cases
>>> - remove more unnecessary bit definitions
>>> - some minor comment fixes and improvement
>>> - fix wrong unregister function
>>> - unify more code
>>> - use nor to avoid constantly replicating the whole
>>>   sfc->flash[sfc->num_chip].nor
>>> - add email for MODULE_AUTHOR
>>> - remove #if 1 --- #endif
>>> - extract DMA code to imporve the code structure
>>> - reset all when failing to do dma
>>> - pass sfc to get_if_type
>>> - rename sfc-no-dma to sfc-no-DMA
>>>
>>> Changes in v2:
>>> - fix typos
>>> - add some comment for buffer and others operations
>>> - rename SFC_MAX_CHIP_NUM to MAX_CHIPSELECT_NUM
>>> - use u8 for cs
>>> - return -EINVAL for default case of get_if_type
>>> - use readl_poll_*() to check timeout cases
>>> - simplify and clarify some condition checks
>>> - rework the bitshifts to simplify the code
>>> - define SFC_CMD_DUMMY(x)
>>> - fix ummap for dma read path and finish all the
>>>   cache maintenance.
>>> - rename to rockchip_sfc_chip_priv and embed struct spi_nor
>>>   in it.
>>> - add MODULE_AUTHOR
>>> - add runtime PM and general PM support.
>>> - Thanks for Marek's comments. Link:
>>>   http://lists.infradead.org/pipermail/linux-mtd/2016-November/070321.h=
tml
>>>
>>>  MAINTAINERS                        |   8 +
>>>  drivers/mtd/spi-nor/Kconfig        |   7 +
>>>  drivers/mtd/spi-nor/Makefile       |   1 +
>>>  drivers/mtd/spi-nor/rockchip-sfc.c | 872 +++++++++++++++++++++++++++++=
++++++++
>>>  4 files changed, 888 insertions(+)
>>>  create mode 100644 drivers/mtd/spi-nor/rockchip-sfc.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 1cd38a7..eb7e06d 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -10266,6 +10266,14 @@ L:	linux-serial@vger.kernel.org
>>>  S:	Odd Fixes
>>>  F:	drivers/tty/serial/rp2.*
>>>
>>> +ROCKCHIP SERIAL FLASH CONTROLLER DRIVER
>>> +M:	Shawn Lin <shawn.lin@rock-chips.com>
>>> +L:	linux-mtd@lists.infradead.org
>>> +L:	linux-rockchip@lists.infradead.org
>>> +S:	Maintained
>>> +F:	Documentation/devicetree/bindings/mtd/rockchip-sfc.txt
>>> +F:	drivers/mtd/spi-nor/rockchip-sfc.c
>>> +
>>>  ROSE NETWORK LAYER
>>>  M:	Ralf Baechle <ralf@linux-mips.org>
>>>  L:	linux-hams@vger.kernel.org
>>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
>>> index 4a682ee..bf783a8 100644
>>> --- a/drivers/mtd/spi-nor/Kconfig
>>> +++ b/drivers/mtd/spi-nor/Kconfig
>>> @@ -76,4 +76,11 @@ config SPI_NXP_SPIFI
>>>  	  Flash. Enable this option if you have a device with a SPIFI
>>>  	  controller and want to access the Flash as a mtd device.
>>>
>>> +config SPI_ROCKCHIP_SFC
>>> +	tristate "Rockchip Serial Flash Controller(SFC)"
>>> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
>>> +	depends on HAS_IOMEM && HAS_DMA
>>> +	help
>>> +	  This enables support for rockchip serial flash controller.
>>> +
>>>  endif # MTD_SPI_NOR
>>> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
>>> index 121695e..364d4c6 100644
>>> --- a/drivers/mtd/spi-nor/Makefile
>>> +++ b/drivers/mtd/spi-nor/Makefile
>>> @@ -5,3 +5,4 @@ obj-$(CONFIG_SPI_FSL_QUADSPI)	+=3D fsl-quadspi.o
>>>  obj-$(CONFIG_SPI_HISI_SFC)	+=3D hisi-sfc.o
>>>  obj-$(CONFIG_MTD_MT81xx_NOR)    +=3D mtk-quadspi.o
>>>  obj-$(CONFIG_SPI_NXP_SPIFI)	+=3D nxp-spifi.o
>>> +obj-$(CONFIG_SPI_ROCKCHIP_SFC)	+=3D rockchip-sfc.o
>>> diff --git a/drivers/mtd/spi-nor/rockchip-sfc.c b/drivers/mtd/spi-nor/r=
ockchip-sfc.c
>>> new file mode 100644
>>> index 0000000..102c08f
>>> --- /dev/null
>>> +++ b/drivers/mtd/spi-nor/rockchip-sfc.c
>>> @@ -0,0 +1,872 @@
>>> +/*
>>> + * Rockchip Serial Flash Controller Driver
>>> + *
>>> + * Copyright (c) 2016, Rockchip Inc.
>>> + * Author: Shawn Lin <shawn.lin@rock-chips.com>
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License as published by
>>> + * the Free Software Foundation; either version 2 of the License, or
>>> + * (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + *
>>> + * You should have received a copy of the GNU General Public License
>>> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
>>> + */
>>> +#include <linux/bitops.h>
>>> +#include <linux/clk.h>
>>> +#include <linux/completion.h>
>>> +#include <linux/dma-mapping.h>
>>> +#include <linux/iopoll.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mtd/mtd.h>
>>> +#include <linux/mtd/spi-nor.h>
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/slab.h>
>>> +
>>> +/* System control */
>>> +#define SFC_CTRL			0x0
>>> +#define  SFC_CTRL_COMMON_BITS_1		0x0
>>> +#define  SFC_CTRL_COMMON_BITS_2		0x1
>>> +#define  SFC_CTRL_COMMON_BITS_4		0x2
>>> +#define  SFC_CTRL_DATA_BITS_SHIFT	12
>>> +#define  SFC_CTRL_ADDR_BITS_SHIFT	10
>>> +#define  SFC_CTRL_CMD_BITS_SHIFT	8
>>> +#define  SFC_CTRL_PHASE_SEL_NEGETIVE	BIT(1)
>>> +
>>> +/* Interrupt mask */
>>> +#define SFC_IMR				0x4
>>> +#define  SFC_IMR_RX_FULL		BIT(0)
>>> +#define  SFC_IMR_RX_UFLOW		BIT(1)
>>> +#define  SFC_IMR_TX_OFLOW		BIT(2)
>>> +#define  SFC_IMR_TX_EMPTY		BIT(3)
>>> +#define  SFC_IMR_TRAN_FINISH		BIT(4)
>>> +#define  SFC_IMR_BUS_ERR		BIT(5)
>>> +#define  SFC_IMR_NSPI_ERR		BIT(6)
>>> +#define  SFC_IMR_DMA			BIT(7)
>>> +/* Interrupt clear */
>>> +#define SFC_ICLR			0x8
>>> +#define  SFC_ICLR_RX_FULL		BIT(0)
>>> +#define  SFC_ICLR_RX_UFLOW		BIT(1)
>>> +#define  SFC_ICLR_TX_OFLOW		BIT(2)
>>> +#define  SFC_ICLR_TX_EMPTY		BIT(3)
>>> +#define  SFC_ICLR_TRAN_FINISH		BIT(4)
>>> +#define  SFC_ICLR_BUS_ERR		BIT(5)
>>> +#define  SFC_ICLR_NSPI_ERR		BIT(6)
>>> +#define  SFC_ICLR_DMA			BIT(7)
>>> +/* FIFO threshold level */
>>> +#define SFC_FTLR			0xc
>>> +#define  SFC_FTLR_TX_SHIFT		0
>>> +#define  SFC_FTLR_TX_MASK		0x1f
>>> +#define  SFC_FTLR_RX_SHIFT		8
>>> +#define  SFC_FTLR_RX_MASK		0x1f
>>> +/* Reset FSM and FIFO */
>>> +#define SFC_RCVR			0x10
>>> +#define  SFC_RCVR_RESET			BIT(0)
>>> +/* Enhanced mode */
>>> +#define SFC_AX				0x14
>>> +/* Address Bit number */
>>> +#define SFC_ABIT			0x18
>>> +/* Interrupt status */
>>> +#define SFC_ISR				0x1c
>>> +#define  SFC_ISR_RX_FULL_SHIFT		BIT(0)
>>> +#define  SFC_ISR_RX_UFLOW_SHIFT		BIT(1)
>>> +#define  SFC_ISR_TX_OFLOW_SHIFT		BIT(2)
>>> +#define  SFC_ISR_TX_EMPTY_SHIFT		BIT(3)
>>> +#define  SFC_ISR_TX_FINISH_SHIFT	BIT(4)
>>> +#define  SFC_ISR_BUS_ERR_SHIFT		BIT(5)
>>> +#define  SFC_ISR_NSPI_ERR_SHIFT		BIT(6)
>>> +#define  SFC_ISR_DMA_SHIFT		BIT(7)
>>> +/* FIFO status */
>>> +#define SFC_FSR				0x20
>>> +#define  SFC_FSR_TX_IS_FULL		BIT(0)
>>> +#define  SFC_FSR_TX_IS_EMPTY		BIT(1)
>>> +#define  SFC_FSR_RX_IS_EMPTY		BIT(2)
>>> +#define  SFC_FSR_RX_IS_FULL		BIT(3)
>>> +/* FSM status */
>>> +#define SFC_SR				0x24
>>> +#define  SFC_SR_IS_IDLE			0x0
>>> +#define  SFC_SR_IS_BUSY			0x1
>>> +/* Raw interrupt status */
>>> +#define SFC_RISR			0x28
>>> +#define  SFC_RISR_RX_FULL		BIT(0)
>>> +#define  SFC_RISR_RX_UNDERFLOW		BIT(1)
>>> +#define  SFC_RISR_TX_OVERFLOW		BIT(2)
>>> +#define  SFC_RISR_TX_EMPTY		BIT(3)
>>> +#define  SFC_RISR_TRAN_FINISH		BIT(4)
>>> +#define  SFC_RISR_BUS_ERR		BIT(5)
>>> +#define  SFC_RISR_NSPI_ERR		BIT(6)
>>> +#define  SFC_RISR_DMA			BIT(7)
>>> +/* Master trigger */
>>> +#define SFC_DMA_TRIGGER			0x80
>>> +/* Src or Dst addr for master */
>>> +#define SFC_DMA_ADDR			0x84
>>> +/* Command */
>>> +#define SFC_CMD				0x100
>>> +#define  SFC_CMD_IDX_SHIFT		0
>>> +#define  SFC_CMD_DUMMY_SHIFT		8
>>> +#define  SFC_CMD_DIR_RD			0
>>> +#define  SFC_CMD_DIR_WR			1
>>> +#define  SFC_CMD_DIR_SHIFT		12
>>> +#define  SFC_CMD_ADDR_ZERO		(0x0 << 14)
>>> +#define  SFC_CMD_ADDR_24BITS		(0x1 << 14)
>>> +#define  SFC_CMD_ADDR_32BITS		(0x2 << 14)
>>> +#define  SFC_CMD_ADDR_FRS		(0x3 << 14)
>>> +#define  SFC_CMD_TRAN_BYTES_SHIFT	16
>>> +#define  SFC_CMD_CS_SHIFT		30
>>> +/* Address */
>>> +#define SFC_ADDR			0x104
>>> +/* Data */
>>> +#define SFC_DATA			0x108
>>> +
>>> +#define SFC_MAX_CHIPSELECT_NUM		4
>>> +#define SFC_DMA_MAX_LEN			0x4000
>>> +#define SFC_CMD_DUMMY(x) \
>>> +	((x) << SFC_CMD_DUMMY_SHIFT)
>>> +
>>> +enum rockchip_sfc_iftype {
>>> +	IF_TYPE_STD,
>>> +	IF_TYPE_DUAL,
>>> +	IF_TYPE_QUAD,
>>> +};
>>> +
>>> +struct rockchip_sfc;
>>> +struct rockchip_sfc_chip_priv {
>>> +	u8 cs;
>>> +	u32 clk_rate;
>>> +	struct spi_nor nor;
>>> +	struct rockchip_sfc *sfc;
>>> +};
>>> +
>>> +struct rockchip_sfc {
>>> +	struct device *dev;
>>> +	struct mutex lock;
>>> +	void __iomem *regbase;
>>> +	struct clk *hclk;
>>> +	struct clk *clk;
>>> +	/* virtual mapped addr for dma_buffer */
>>> +	void *buffer;
>>> +	dma_addr_t dma_buffer;
>>> +	struct completion cp;
>>> +	struct rockchip_sfc_chip_priv flash[SFC_MAX_CHIPSELECT_NUM];
>>> +	u32 num_chip;
>>> +	bool use_dma;
>>> +	/* use negative edge of hclk to latch data */
>>> +	bool negative_edge;
>>> +};
>>> +
>>> +static int get_if_type(struct rockchip_sfc *sfc, enum read_mode flash_=
read)
>>> +{
>>> +	if (flash_read =3D=3D SPI_NOR_DUAL)
>>> +		return IF_TYPE_DUAL;
>>> +	else if (flash_read =3D=3D SPI_NOR_QUAD)
>>> +		return IF_TYPE_QUAD;
>>> +	else if (flash_read =3D=3D SPI_NOR_NORMAL ||
>>> +		 flash_read =3D=3D SPI_NOR_FAST)
>>> +		return IF_TYPE_STD;
>>> +
>>> +	dev_err(sfc->dev, "unsupported SPI read mode\n");
>>> +	return -EINVAL;
>>> +}
>>> +
>>> +static int rockchip_sfc_reset(struct rockchip_sfc *sfc)
>>> +{
>>> +	int err;
>>> +	u32 status;
>>> +
>>> +	writel_relaxed(SFC_RCVR_RESET, sfc->regbase + SFC_RCVR);
>>> +
>>> +	err =3D readl_poll_timeout(sfc->regbase + SFC_RCVR, status,
>>> +				 !(status & SFC_RCVR_RESET), 20,
>>> +				 jiffies_to_usecs(HZ));
>>> +	if (err)
>>> +		dev_err(sfc->dev, "SFC reset never finished\n");
>>> +
>>> +	/* Still need to clear the masked interrupt from RISR */
>>> +	writel_relaxed(SFC_ICLR_RX_FULL | SFC_ICLR_RX_UFLOW |
>>> +		       SFC_ICLR_TX_OFLOW | SFC_ICLR_TX_EMPTY |
>>> +		       SFC_ICLR_TRAN_FINISH | SFC_ICLR_BUS_ERR |
>>> +		       SFC_ICLR_NSPI_ERR | SFC_ICLR_DMA,
>>> +		       sfc->regbase + SFC_ICLR);
>>> +	return err;
>>> +}
>>> +
>>> +static int rockchip_sfc_init(struct rockchip_sfc *sfc)
>>> +{
>>> +	int err;
>>> +
>>> +	err =3D rockchip_sfc_reset(sfc);
>>> +	if (err)
>>> +		return err;
>>> +
>>> +	/* Mask all eight interrupts */
>>> +	writel_relaxed(0xff, sfc->regbase + SFC_IMR);
>>> +
>>> +	/*
>>> +	 * Phase configure for sfc to latch data by using
>>> +	 * ahb clock, and this configuration should be Soc
>>> +	 * specific.
>>> +	 */
>>> +	if (sfc->negative_edge)
>>> +		writel_relaxed(SFC_CTRL_PHASE_SEL_NEGETIVE,
>>> +			       sfc->regbase + SFC_CTRL);
>>> +	else
>>> +		writel_relaxed(0, sfc->regbase + SFC_CTRL);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int rockchip_sfc_prep(struct spi_nor *nor, enum spi_nor_ops ops)
>>> +{
>>> +	struct rockchip_sfc_chip_priv *priv =3D nor->priv;
>>> +	struct rockchip_sfc *sfc =3D priv->sfc;
>>> +	int ret;
>>> +
>>> +	mutex_lock(&sfc->lock);
>>> +	pm_runtime_get_sync(sfc->dev);
>>> +
>>> +	ret =3D clk_set_rate(sfc->clk, priv->clk_rate);
>>> +	if (ret)
>>> +		goto out;
>>> +
>>> +	ret =3D clk_prepare_enable(sfc->clk);
>>> +	if (ret)
>>> +		goto out;
>>> +
>>> +	return 0;
>>> +
>>> +out:
>>> +	mutex_unlock(&sfc->lock);
>>> +	return ret;
>>> +}
>>> +
>>> +static void rockchip_sfc_unprep(struct spi_nor *nor, enum spi_nor_ops =
ops)
>>> +{
>>> +	struct rockchip_sfc_chip_priv *priv =3D nor->priv;
>>> +	struct rockchip_sfc *sfc =3D priv->sfc;
>>> +
>>> +	clk_disable_unprepare(sfc->clk);
>>> +	mutex_unlock(&sfc->lock);
>>> +	pm_runtime_mark_last_busy(sfc->dev);
>>> +	pm_runtime_put_autosuspend(sfc->dev);
>>> +}
>>> +
>>> +static int rockchip_sfc_wait_op_finish(struct rockchip_sfc *sfc)
>>> +{
>>> +	int err;
>>> +	u32 status;
>>> +
>>> +	/*
>>> +	 * Note: tx and rx share the same fifo, so the rx's water level
>>> +	 * is the same as rx's, which means this function could be reused
>>> +	 * for checking the read operations as well.
>>> +	 */
>>> +	err =3D readl_poll_timeout(sfc->regbase + SFC_FSR, status,
>>> +				 status & SFC_FSR_TX_IS_EMPTY,
>>> +				 20, jiffies_to_usecs(2 * HZ));
>>> +	if (err)
>>> +		dev_err(sfc->dev, "SFC fifo never empty\n");
>>> +
>>> +	return err;
>>> +}
>>> +
>>> +static int rockchip_sfc_op_reg(struct spi_nor *nor,
>>> +				u8 opcode, int len, u8 optype)
>>> +{
>>> +	struct rockchip_sfc_chip_priv *priv =3D nor->priv;
>>> +	struct rockchip_sfc *sfc =3D priv->sfc;
>>> +	u32 reg;
>>> +	bool tx_no_empty, rx_no_empty, is_busy;
>>> +	int err;
>>> +
>>> +	reg =3D readl_relaxed(sfc->regbase + SFC_FSR);
>>> +	tx_no_empty =3D !(reg & SFC_FSR_TX_IS_EMPTY);
>>> +	rx_no_empty =3D !(reg & SFC_FSR_RX_IS_EMPTY);
>>> +
>>> +	is_busy =3D readl_relaxed(sfc->regbase + SFC_SR);
>>> +
>>> +	if (tx_no_empty || rx_no_empty || is_busy) {
>>> +		err =3D rockchip_sfc_reset(sfc);
>>> +		if (err)
>>> +			return err;
>>> +	}
>>> +
>>> +	reg =3D opcode << SFC_CMD_IDX_SHIFT;
>>> +	reg |=3D len << SFC_CMD_TRAN_BYTES_SHIFT;
>>> +	reg |=3D priv->cs << SFC_CMD_CS_SHIFT;
>>> +	reg |=3D optype << SFC_CMD_DIR_SHIFT;
>>> +
>>> +	writel_relaxed(reg, sfc->regbase + SFC_CMD);
>>> +
>>> +	return rockchip_sfc_wait_op_finish(sfc);
>>> +}
>>> +
>>> +static void rockchip_sfc_read_fifo(struct rockchip_sfc *sfc, u8 *buf, =
int len)
>>> +{
>>> +	u32 tmp, i;
>>> +	int total_len =3D len;
>>> +
>>> +	/* 32-bit access only */
>>> +	if (len >=3D 4 && !((u32)buf & 0x03)) {
>
> 	if (len >=3D sizeof(u32) && IS_ALIGNED(buf, sizeof(u32))) {
>>> +		ioread32_rep(sfc->regbase + SFC_DATA, buf, len >> 2);
>>> +		len %=3D 4;
>>> +		buf +=3D total_len - len;
>>> +	}
>>> +
>>> +	/* read the rest bytes */
>>> +	for (i =3D 0; i < len; i++) {
>>> +		if (!(i & 0x03))
>>> +			tmp =3D readl_relaxed(sfc->regbase + SFC_DATA);
>>> +		buf[i] =3D (tmp >> ((i & 0x03) * 8)) & 0xff;
>>> +	}
>>> +}
>>> +
>>> +static int rockchip_sfc_read_reg(struct spi_nor *nor, u8 opcode,
>>> +				 u8 *buf, int len)
>>> +{
>>> +	struct rockchip_sfc_chip_priv *priv =3D nor->priv;
>>> +	struct rockchip_sfc *sfc =3D priv->sfc;
>>> +	int ret;
>>> +
>>> +	ret =3D rockchip_sfc_op_reg(nor, opcode, len, SFC_CMD_DIR_RD);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	rockchip_sfc_read_fifo(sfc, buf, len);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int rockchip_sfc_write_reg(struct spi_nor *nor, u8 opcode,
>>> +				  u8 *buf, int len)
>>> +{
>>> +	struct rockchip_sfc_chip_priv *priv =3D nor->priv;
>>> +	struct rockchip_sfc *sfc =3D priv->sfc;
>>> +	u32 dwords;
>>> +
>>> +	/* Align bytes to dwords */
>>> +	dwords =3D DIV_ROUND_UP(len, sizeof(u32));
>>> +	iowrite32_rep(sfc->regbase + SFC_DATA, buf, dwords);
>
> iowrite32_rep() is likely to be implemented with writesl() and writesl()
> casts its "const void *buffer" argument into a "const u32 *buf" local
> variable. Then this buf variable is used with __raw_writel(*buf++).
>
> Hence if the u8 *buf argument of rockchip_sfc_write_reg() is not aligned =
to
> 32 bits, this function performs unaligned accesses to the memory pointed =
by
> buf.
>

Good catch, will fix it.

>>> +
>>> +	return rockchip_sfc_op_reg(nor, opcode, len, SFC_CMD_DIR_WR);
>>> +}
>>> +
>>> +static inline void rockchip_sfc_setup_transfer(struct spi_nor *nor,
>>> +					       loff_t from_to,
>>> +					       size_t len, u8 op_type)
>>> +{
>>> +	struct rockchip_sfc_chip_priv *priv =3D nor->priv;
>>> +	struct rockchip_sfc *sfc =3D priv->sfc;
>>> +	u32 reg;
>>> +	u8 if_type =3D 0;
>>> +
>>> +	if_type =3D get_if_type(sfc, nor->flash_read);
>>> +	writel_relaxed((if_type << SFC_CTRL_DATA_BITS_SHIFT) |
>>> +		       (if_type << SFC_CTRL_ADDR_BITS_SHIFT) |
>>> +		       (if_type << SFC_CTRL_CMD_BITS_SHIFT) |
>>> +		       (sfc->negative_edge ? SFC_CTRL_PHASE_SEL_NEGETIVE : 0),
>>> +		       sfc->regbase + SFC_CTRL);
>>
>> Marek rose an issue when commenting v3:
>>
>> Looking at that code it seems that even if the hardware can support SPI
>> 1-1-n protocols, this driver actually allows SPI n-n-n protocols.
>>
>> However with the current spi-nor framework, the values of the enum
>> read_mode must be understood this way:
>> SPI_NOR_FAST or SPI_NOR_NORMAL: SPI 1-1-1 protocol
>> SPI_NOR_DUAL: SPI 1-1-2 protocol
>> SPI_NOR_QUAD: SPI 1-1-4 protocol
>>
>> Support to other SPI protocols such as SPI 1-4-4 or SPI 4-4-4 as not been
>> accepted in mainline yet.
>>
>> Below in this driver, spi_nor_scan() is called with the value SPI_NOR_QU=
AD
>> hence it asks the spi-nor framework for using the SPI 1-1-4 (and not SPI
>> 4-4-4) *when supported by the QSPI memory*.
>>
>> Also since the driver was tested with a Winbond w25q256 memory, let me w=
arn
>> you that currently the SPI_NOR_QUAD_READ flag is *NOT* set in the "w25q2=
56"
>> entry of the spi_nor_ids[] array. So this claims this memory is not capa=
ble
>> of using the SPI 1-1-4 protocol even if the Winbond memory actually
>> supports this protocol. Then the spi-nor framework selects the SPI 1-1-1
>> protocol as a fallback.
>> That's why you have succeeded in using your driver but it would have fai=
led
>> with another QSPI memory with its SPI_NOR_QUAD_READ flag due to a protoc=
ol
>> mismatch.
>>
>> So with the current spi-nor framework you must set
>> SFC_CTRL_{DATA|ADDR}_BITS_SHIFT to IF_TYPE_STD.
>>
>> Later, once the patch adding support to other SPI protocols would have b=
een
>> accepted in mainline, you could update your driver to tell the spi-nor
>> framework that the rockchip controller also supports SPI 1-2-2 and SPI
>> 1-4-4 protocols.
>>
>>
>>> +
>>> +	if (op_type =3D=3D SFC_CMD_DIR_WR)
>>> +		reg =3D nor->program_opcode << SFC_CMD_IDX_SHIFT;
>>> +	else
>>> +		reg =3D nor->read_opcode << SFC_CMD_IDX_SHIFT;
>>> +
>>> +	reg |=3D op_type << SFC_CMD_DIR_SHIFT;
>>> +	reg |=3D (nor->addr_width =3D=3D 4) ?
>>> +		SFC_CMD_ADDR_32BITS : SFC_CMD_ADDR_24BITS;
>>> +
>>> +	reg |=3D priv->cs << SFC_CMD_CS_SHIFT;
>>> +	reg |=3D len << SFC_CMD_TRAN_BYTES_SHIFT;
>>
>> Looking at the definitions of SFC_CMD_TRAN_BYTES_SHIFT (16) and
>> SFC_CMD_CS_SHIFT (30), I understand that the bitfield for the transfer
>> length lays between bits 16 and 30 hence a 14 bit value at most.
>> So what if len is greater than 16384? It overflows in the cs bitfield?
>>
>> You should apply masks to avoid such overflows and also test the len val=
ue
>> then report the actual number of transferred bytes.
>>
>>> +
>>> +	if (op_type =3D=3D SFC_CMD_DIR_RD)
>>> +		reg |=3D SFC_CMD_DUMMY(nor->read_dummy);
>>> +
>>> +	/* Should minus one as 0x0 means 1 bit flash address */
>>> +	writel_relaxed(nor->addr_width * 8 - 1, sfc->regbase + SFC_ABIT);
>>> +	writel_relaxed(reg, sfc->regbase + SFC_CMD);
>>> +	writel_relaxed(from_to, sfc->regbase + SFC_ADDR);
>>> +}
>>> +
>>> +static int rockchip_sfc_do_dma_transfer(struct spi_nor *nor, loff_t fr=
om_to,
>>> +					dma_addr_t dma_buf, size_t len,
>>> +					u8 op_type)
>>> +{
>>> +	struct rockchip_sfc_chip_priv *priv =3D nor->priv;
>>> +	struct rockchip_sfc *sfc =3D priv->sfc;
>>> +	u32 reg;
>>> +	int err =3D 0;
>>> +
>>> +	init_completion(&sfc->cp);
>>> +
>>> +	writel_relaxed(SFC_ICLR_RX_FULL | SFC_ICLR_RX_UFLOW |
>>> +		       SFC_ICLR_TX_OFLOW | SFC_ICLR_TX_EMPTY |
>>> +		       SFC_ICLR_TRAN_FINISH | SFC_ICLR_BUS_ERR |
>>> +		       SFC_ICLR_NSPI_ERR | SFC_ICLR_DMA,
>>> +		       sfc->regbase + SFC_ICLR);
>>> +
>>> +	/* Enable transfer complete interrupt */
>>> +	reg =3D readl_relaxed(sfc->regbase + SFC_IMR);
>>> +	reg &=3D ~SFC_IMR_TRAN_FINISH;
>>> +	writel_relaxed(reg, sfc->regbase + SFC_IMR);
>>> +
>>> +	rockchip_sfc_setup_transfer(nor, from_to, len, op_type);
>>> +	writel_relaxed(dma_buf, sfc->regbase + SFC_DMA_ADDR);
>>> +
>>> +	/*
>>> +	 * Start dma but note that the sfc->dma_buffer is derived from
>>> +	 * dmam_alloc_coherent so we don't actually need any sync operations
>>> +	 * for coherent dma memory.
>>> +	 */
>>> +	writel_relaxed(0x1, sfc->regbase + SFC_DMA_TRIGGER);
>>> +
>>> +	/* Wait for the interrupt. */
>>> +	if (!wait_for_completion_timeout(&sfc->cp, msecs_to_jiffies(2000))) {
>>> +		dev_err(sfc->dev, "DMA wait for transfer finish timeout\n");
>>> +		err =3D -ETIMEDOUT;
>>> +	}
>>> +
>>> +	/* Disable transfer finish interrupt */
>>> +	reg =3D readl_relaxed(sfc->regbase + SFC_IMR);
>>> +	reg |=3D SFC_IMR_TRAN_FINISH;
>>> +	writel_relaxed(reg, sfc->regbase + SFC_IMR);
>>> +
>>> +	if (err) {
>>> +		rockchip_sfc_reset(sfc);
>>> +		return err;
>>> +	}
>>> +
>>> +	return rockchip_sfc_wait_op_finish(sfc);
>>> +}
>>> +
>>> +static inline int rockchip_sfc_pio_write(struct rockchip_sfc *sfc, u_c=
har *buf,
>>> +					 size_t len)
>>> +{
>>> +	u32 dwords;
>>> +
>>> +	/*
>>> +	 * Align bytes to dwords, although we will write some extra
>>> +	 * bytes to fifo but the transfer bytes number in SFC_CMD
>>> +	 * register will make sure we just send out the expected
>>> +	 * byte numbers and the extra bytes will be clean before
>>> +	 * setting up the next transfer. We should always round up
>>> +	 * to align to DWORD as the ahb for Rockchip Socs won't
>>> +	 * support non-aligned-to-DWORD transfer.
>>> +	 */
>>> +	dwords =3D DIV_ROUND_UP(len, sizeof(u32));
>>> +	iowrite32_rep(sfc->regbase + SFC_DATA, buf, dwords);
>>> +
>
> Here again the buf pointer might not be aligned to 4 bytes.
>
>>> +	return rockchip_sfc_wait_op_finish(sfc);
>>> +}
>>> +
>>> +static inline int rockchip_sfc_pio_read(struct rockchip_sfc *sfc, u_ch=
ar *buf,
>>> +					size_t len)
>>> +{
>>> +	rockchip_sfc_read_fifo(sfc, buf, len);
>>> +
>>> +	return rockchip_sfc_wait_op_finish(sfc);
>>> +}
>>> +
>>> +static int rockchip_sfc_pio_transfer(struct spi_nor *nor, loff_t from_=
to,
>>> +				     size_t len, u_char *buf, u8 op_type)
>>> +{
>>> +	struct rockchip_sfc_chip_priv *priv =3D nor->priv;
>>> +	struct rockchip_sfc *sfc =3D priv->sfc;
>>> +
>>> +	rockchip_sfc_setup_transfer(nor, from_to, len, op_type);
>>> +
>>> +	if (op_type =3D=3D SFC_CMD_DIR_WR)
>>> +		return rockchip_sfc_pio_write(sfc, buf, len);
>>> +	else
>>> +		return rockchip_sfc_pio_read(sfc, buf, len);
>>> +}
>>> +
>>> +static int rockchip_sfc_dma_transfer(struct spi_nor *nor, loff_t from_=
to,
>>> +				     size_t len, u_char *buf, u8 op_type)
>>> +{
>>> +	struct rockchip_sfc_chip_priv *priv =3D nor->priv;
>>> +	struct rockchip_sfc *sfc =3D priv->sfc;
>>> +	size_t offset;
>>> +	int ret;
>>> +	dma_addr_t dma_addr =3D 0;
>>> +	int dma_dir;
>>> +
>>> +	dma_dir =3D (op_type =3D=3D SFC_CMD_DIR_RD) ?
>>> +		   DMA_FROM_DEVICE : DMA_TO_DEVICE;
>>> +
>>> +	for (offset =3D 0; offset < len; offset +=3D SFC_DMA_MAX_LEN) {
>>> +		size_t trans =3D min_t(size_t, SFC_DMA_MAX_LEN, len - offset);
>>> +
>>> +		dma_addr =3D dma_map_single(NULL, (void *)buf, trans, dma_dir);
>> not good: buf may have been allocated with vmalloc() hence the pages of =
buf
>> are not garanteed to be contiguous in physical memory.
>>
>> Just write a ubifs image into your QSPI memory and try to mount it. You =
are
>> very likely to notice some issues/crashes.
>>
>>
>
> This code can only work when:
> - len <=3D SFC_DMA_MAX_LEN and (buf + len) points inside the very same pa=
ge
> as buf.
> or
> - dma_map_single() always fails so the driver always copy from/to buf data
> to/from sfc->buffer and transfers from/to sfc->buffer_dma.
>
> Otherwise the driver always tries to dma map from buf but buf is never
> incremented by offset after a transfer. Hence the driver transfers the
> right data during the first loop but starting from the 2nd loop it
> transfers the very same data again and again till offset >=3D len.
>
> I think you have forgotten a "+ offset" in the dma_map_single() call:
>
> dma_map_single(NULL, (void *)buf + offset, trans, dma_dir);
>
>                ^^ should be better to provide some dev, e.g. nor->dev
>
> Anyway, like I've explained in my previous mail dma_map_single() is not
> suited to buffers allocated by vmalloc().
>

Got it, thanks.

>
>>> +
>>> +		if (dma_mapping_error(sfc->dev, dma_addr)) {
>>> +			/*
>>> +			 * If we use pre-allocated dma_buffer, we need to
>>> +			 * do a copy here.
>>> +			 */
>>> +			if (op_type =3D=3D SFC_CMD_DIR_WR)
>>> +				memcpy(sfc->buffer, buf + offset, trans);
>>> +
>>> +			dma_addr =3D 0;
>>> +		}
>>> +
>>> +		if (op_type =3D=3D SFC_CMD_DIR_WR)
>>> +			/*
>>> +			 * Flush the write data from write_buf to dma_addr
>>> +			 * if using dynamic allocated dma buffer before dma
>>> +			 * moves data from dma_addr to fifo.
>>> +			 */
>>> +			dma_sync_single_for_device(sfc->dev, dma_addr,
>>> +						   trans, DMA_TO_DEVICE);
>>> +
>>> +
>>> +		/* If failing to map dma, use pre-allocated area instead */
>>> +		ret =3D rockchip_sfc_do_dma_transfer(nor, from_to + offset,
>>> +						dma_addr ? dma_addr :
>>> +						sfc->dma_buffer,
>>> +						trans, op_type);
>>> +
>>> +		if (dma_addr) {
>>> +			/*
>>> +			 * Invalidate the read data from dma_addr if using
>>> +			 * dynamic allocated dma buffer after dma moves data
>>> +			 * from fifo to dma_addr.
>>> +			 */
>>> +			if (op_type =3D=3D SFC_CMD_DIR_RD)
>>> +				dma_sync_single_for_cpu(sfc->dev, dma_addr,
>>> +							trans, DMA_FROM_DEVICE);
>>> +
>>> +			dma_unmap_single(NULL, dma_addr,
>>> +					 trans, dma_dir);
>>> +		}
>>> +
>>> +		if (ret) {
>>> +			dev_warn(nor->dev, "DMA read timeout\n");
>>> +			return ret;
>>> +		}
>>> +		/*
>>> +		 * If we use pre-allocated dma_buffer for read, we need to
>>> +		 * do a copy here.
>>> +		 */
>>> +		if (!dma_addr && (op_type =3D=3D SFC_CMD_DIR_RD))
>>> +			memcpy(buf + offset, sfc->buffer, trans);
>>> +	}
>>> +
>>> +	return len;
>>> +}
>>> +
>>> +static ssize_t rockchip_sfc_do_rd_wr(struct spi_nor *nor, loff_t from_=
to,
>>> +				     size_t len, u_char *buf, u32 op_type)
>>> +{
>>> +	struct rockchip_sfc_chip_priv *priv =3D nor->priv;
>>> +	struct rockchip_sfc *sfc =3D priv->sfc;
>>> +	int ret;
>>> +
>>> +	if (likely(sfc->use_dma))
>>> +		return rockchip_sfc_dma_transfer(nor, from_to, len,
>>> +						 buf, op_type);
>>> +
>>> +	/* Fall back to PIO mode if DMA isn't present */
>>> +	ret =3D rockchip_sfc_pio_transfer(nor, from_to, len,
>>> +					(u_char *)buf, op_type);
>>> +	if (ret) {
>>> +		if (op_type =3D=3D SFC_CMD_DIR_RD)
>>> +			dev_warn(nor->dev, "PIO read timeout\n");
>>> +		else
>>> +			dev_warn(nor->dev, "PIO write timeout\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	return len;
>>> +}
>>> +
>>> +static ssize_t rockchip_sfc_read(struct spi_nor *nor, loff_t from,
>>> +				 size_t len, u_char *read_buf)
>>> +{
>>> +	return rockchip_sfc_do_rd_wr(nor, from, len,
>>> +				     read_buf, SFC_CMD_DIR_RD);
>>> +}
>>> +
>>> +static ssize_t rockchip_sfc_write(struct spi_nor *nor, loff_t to,
>>> +				  size_t len, const u_char *write_buf)
>>> +{
>>> +	return rockchip_sfc_do_rd_wr(nor, to, len,
>>> +				     (u_char *)write_buf,
>>> +				     SFC_CMD_DIR_WR);
>>> +}
>>> +
>>> +static int rockchip_sfc_register(struct device_node *np,
>>> +				 struct rockchip_sfc *sfc)
>>> +{
>>> +	struct device *dev =3D sfc->dev;
>>> +	struct mtd_info *mtd;
>>> +	struct spi_nor *nor;
>>> +	int ret;
>>> +
>>> +	nor =3D &sfc->flash[sfc->num_chip].nor;
>>> +	nor->dev =3D dev;
>>> +	spi_nor_set_flash_node(nor, np);
>>> +
>>> +	ret =3D of_property_read_u8(np, "reg", &sfc->flash[sfc->num_chip].cs);
>>> +	if (ret) {
>>> +		dev_err(dev, "No reg property for %s\n",
>>> +			np->full_name);
>>> +		return ret;
>>> +	}
>>> +
>>> +	ret =3D of_property_read_u32(np, "spi-max-frequency",
>>> +			&sfc->flash[sfc->num_chip].clk_rate);
>>> +	if (ret) {
>>> +		dev_err(dev, "No spi-max-frequency property for %s\n",
>>> +			np->full_name);
>>> +		return ret;
>>> +	}
>>> +
>>> +	sfc->flash[sfc->num_chip].sfc =3D sfc;
>>> +	nor->priv =3D &(sfc->flash[sfc->num_chip]);
>>> +
>>> +	nor->prepare =3D rockchip_sfc_prep;
>>> +	nor->unprepare =3D rockchip_sfc_unprep;
>>> +	nor->read_reg =3D rockchip_sfc_read_reg;
>>> +	nor->write_reg =3D rockchip_sfc_write_reg;
>>> +	nor->read =3D rockchip_sfc_read;
>>> +	nor->write =3D rockchip_sfc_write;
>>> +	nor->erase =3D NULL;
>>> +	ret =3D spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	mtd =3D &(nor->mtd);
>>> +	mtd->name =3D np->name;
>>> +	ret =3D mtd_device_register(mtd, NULL, 0);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	sfc->num_chip++;
>>> +	return 0;
>>> +}
>>> +
>>> +static void rockchip_sfc_unregister_all(struct rockchip_sfc *sfc)
>>> +{
>>> +	int i;
>>> +
>>> +	for (i =3D 0; i < sfc->num_chip; i++)
>>> +		mtd_device_unregister(&sfc->flash[i].nor.mtd);
>>> +}
>>> +
>>> +static int rockchip_sfc_register_all(struct rockchip_sfc *sfc)
>>> +{
>>> +	struct device *dev =3D sfc->dev;
>>> +	struct device_node *np;
>>> +	int ret;
>>> +
>>> +	for_each_available_child_of_node(dev->of_node, np) {
>>> +		ret =3D rockchip_sfc_register(np, sfc);
>>> +		if (ret)
>>> +			goto fail;
>>> +
>>> +		if (sfc->num_chip =3D=3D SFC_MAX_CHIPSELECT_NUM) {
>>> +			dev_warn(dev, "Exceeds the max cs limitation\n");
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +	return 0;
>>> +
>>> +fail:
>>> +	dev_err(dev, "Failed to register all chips\n");
>>> +	/* Unregister all the _registered_ nor flash */
>>> +	rockchip_sfc_unregister_all(sfc);
>>> +	return ret;
>>> +}
>>> +
>>> +static irqreturn_t rockchip_sfc_irq_handler(int irq, void *dev_id)
>>> +{
>>> +	struct rockchip_sfc *sfc =3D dev_id;
>>> +	u32 reg;
>>> +
>>> +	reg =3D readl_relaxed(sfc->regbase + SFC_RISR);
>>> +	dev_dbg(sfc->dev, "Get irq: 0x%x\n", reg);
>>> +
>>> +	/* Clear interrupt */
>>> +	writel_relaxed(reg, sfc->regbase + SFC_ICLR);
>>> +
>>> +	if (reg & SFC_RISR_TRAN_FINISH)
>>> +		complete(&sfc->cp);
>>> +
>>> +	return IRQ_HANDLED;
>>> +}
>>> +
>>> +static int rockchip_sfc_probe(struct platform_device *pdev)
>>> +{
>>> +	struct device *dev =3D &pdev->dev;
>>> +	struct resource *res;
>>> +	struct rockchip_sfc *sfc;
>>> +	int ret;
>>> +
>>> +	sfc =3D devm_kzalloc(dev, sizeof(*sfc), GFP_KERNEL);
>>> +	if (!sfc)
>>> +		return -ENOMEM;
>>> +
>>> +	platform_set_drvdata(pdev, sfc);
>>> +	sfc->dev =3D dev;
>>> +
>>> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +	sfc->regbase =3D devm_ioremap_resource(dev, res);
>>> +	if (IS_ERR(sfc->regbase))
>>> +		return PTR_ERR(sfc->regbase);
>>> +
>>> +	sfc->clk =3D devm_clk_get(&pdev->dev, "sfc");
>>> +	if (IS_ERR(sfc->clk)) {
>>> +		dev_err(&pdev->dev, "Failed to get sfc interface clk\n");
>>> +		return PTR_ERR(sfc->clk);
>>> +	}
>>> +
>>> +	sfc->hclk =3D devm_clk_get(&pdev->dev, "hsfc");
>>> +	if (IS_ERR(sfc->hclk)) {
>>> +		dev_err(&pdev->dev, "Failed to get sfc ahp clk\n");
>>> +		return PTR_ERR(sfc->hclk);
>>> +	}
>>> +
>>> +	ret =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
>>> +	if (ret) {
>>> +		dev_warn(dev, "Unable to set dma mask\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	sfc->buffer =3D dmam_alloc_coherent(dev, SFC_DMA_MAX_LEN,
>>> +			&sfc->dma_buffer, GFP_KERNEL);
>>> +	if (!sfc->buffer)
>>> +		return -ENOMEM;
>>> +
>>> +	mutex_init(&sfc->lock);
>>> +
>>> +	ret =3D clk_prepare_enable(sfc->hclk);
>>> +	if (ret) {
>>> +		dev_err(&pdev->dev, "Failed to enable hclk\n");
>>> +		goto err_hclk;
>>> +	}
>>> +
>>> +	ret =3D clk_prepare_enable(sfc->clk);
>>> +	if (ret) {
>>> +		dev_err(&pdev->dev, "Failed to enable clk\n");
>>> +		goto err_clk;
>>> +	}
>>> +
>>> +	sfc->use_dma =3D !of_property_read_bool(sfc->dev->of_node,
>>> +					      "rockchip,sfc-no-DMA");
>>> +
>>> +	sfc->negative_edge =3D of_device_is_compatible(sfc->dev->of_node,
>>> +						     "rockchip,rk1108-sfc");
>>> +	/* Find the irq */
>>> +	ret =3D platform_get_irq(pdev, 0);
>>> +	if (ret < 0) {
>>> +		dev_err(dev, "Failed to get the irq\n");
>>> +		goto err_irq;
>>> +	}
>>> +
>>> +	ret =3D devm_request_irq(dev, ret, rockchip_sfc_irq_handler,
>>> +			       0, pdev->name, sfc);
>>> +	if (ret) {
>>> +		dev_err(dev, "Failed to request irq\n");
>>> +		goto err_irq;
>>> +	}
>>> +
>>> +	sfc->num_chip =3D 0;
>>> +	ret =3D rockchip_sfc_init(sfc);
>>> +	if (ret)
>>> +		goto err_irq;
>>> +
>>> +	pm_runtime_get_noresume(&pdev->dev);
>>> +	pm_runtime_set_active(&pdev->dev);
>>> +	pm_runtime_enable(&pdev->dev);
>>> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
>>> +	pm_runtime_use_autosuspend(&pdev->dev);
>>> +
>>> +	ret =3D rockchip_sfc_register_all(sfc);
>>> +	if (ret)
>>> +		goto err_register;
>>> +
>>> +	clk_disable_unprepare(sfc->clk);
>>> +	pm_runtime_put_autosuspend(&pdev->dev);
>>> +	return 0;
>>> +
>>> +err_register:
>>> +	pm_runtime_disable(&pdev->dev);
>>> +	pm_runtime_set_suspended(&pdev->dev);
>>> +	pm_runtime_put_noidle(&pdev->dev);
>>> +err_irq:
>>> +	clk_disable_unprepare(sfc->clk);
>>> +err_clk:
>>> +	clk_disable_unprepare(sfc->hclk);
>>> +err_hclk:
>>> +	mutex_destroy(&sfc->lock);
>>> +	return ret;
>>> +}
>>> +
>>> +static int rockchip_sfc_remove(struct platform_device *pdev)
>>> +{
>>> +	struct rockchip_sfc *sfc =3D platform_get_drvdata(pdev);
>>> +
>>> +	pm_runtime_get_sync(&pdev->dev);
>>> +	pm_runtime_disable(&pdev->dev);
>>> +	pm_runtime_put_noidle(&pdev->dev);
>>> +
>>> +	rockchip_sfc_unregister_all(sfc);
>>> +	mutex_destroy(&sfc->lock);
>>> +	clk_disable_unprepare(sfc->clk);
>>> +	clk_disable_unprepare(sfc->hclk);
>>> +	return 0;
>>> +}
>>> +
>>> +#ifdef CONFIG_PM
>>> +int rockchip_sfc_runtime_suspend(struct device *dev)
>>> +{
>>> +	struct rockchip_sfc *sfc =3D dev_get_drvdata(dev);
>>> +
>>> +	clk_disable_unprepare(sfc->hclk);
>>> +	return 0;
>>> +}
>>> +
>>> +int rockchip_sfc_runtime_resume(struct device *dev)
>>> +{
>>> +	struct rockchip_sfc *sfc =3D dev_get_drvdata(dev);
>>> +
>>> +	clk_prepare_enable(sfc->hclk);
>>> +	return rockchip_sfc_reset(sfc);
>>> +}
>>> +#endif /* CONFIG_PM */
>>> +
>>> +static const struct of_device_id rockchip_sfc_dt_ids[] =3D {
>>> +	{ .compatible =3D "rockchip,sfc"},
>>> +	{ /* sentinel */ }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, rockchip_sfc_dt_ids);
>>> +
>>> +static const struct dev_pm_ops rockchip_sfc_dev_pm_ops =3D {
>>> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>>> +				pm_runtime_force_resume)
>>> +	SET_RUNTIME_PM_OPS(rockchip_sfc_runtime_suspend,
>>> +			   rockchip_sfc_runtime_resume, NULL)
>>> +};
>>> +
>>> +static struct platform_driver rockchip_sfc_driver =3D {
>>> +	.driver =3D {
>>> +		.name	=3D "rockchip-sfc",
>>> +		.of_match_table =3D rockchip_sfc_dt_ids,
>>> +		.pm =3D &rockchip_sfc_dev_pm_ops,
>>> +	},
>>> +	.probe	=3D rockchip_sfc_probe,
>>> +	.remove	=3D rockchip_sfc_remove,
>>> +};
>>> +module_platform_driver(rockchip_sfc_driver);
>>> +
>>> +MODULE_LICENSE("GPL v2");
>>> +MODULE_DESCRIPTION("Rockchip Serial Flash Controller Driver");
>>> +MODULE_AUTHOR("Shawn Lin <shawn.lin@rock-chips.com>");
>>>
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>
>
>
>


-- =

Best Regards
Shawn Lin


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
