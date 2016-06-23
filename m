From: Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: Re: [RESEND PATCH v11] mtd: spi-nor: add hisilicon spi-nor flash
 controller driver
Date: Thu, 23 Jun 2016 15:16:54 +0800
Message-ID: <576B8CE6.7050406@hisilicon.com>
References: <1465806112-1425-1-git-send-email-xuejiancheng@hisilicon.com>
 <576A8685.70808@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <576A8685.70808@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, jteki@openedev.com, ezequiel@vanguardiasur.com.ar, marek.vasut@gmail.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, linshunquan1@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi Cyrille,

On 2016/6/22 20:37, Cyrille Pitchen wrote:
> Hi Jiancheng,
>=20
> maybe a "depends on HAS_DMA" in the Kconfig may fix the kbuild test r=
obot error.
> Otherwise your driver looks good now :)
>=20

Thank you very much for all comments. I'll fix this issue in the new ve=
rsion.
If there are no any other comments from others. I'll send the new versi=
on patch
out later.

Thanks,

Jiancheng

> Reviewed-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>=20
> Best regards,
>=20
> Cyrille
>=20
> Le 13/06/2016 10:21, Jiancheng Xue a =E9crit :
>> Add hisilicon spi-nor flash controller driver
>>
>> Signed-off-by: Binquan Peng <pengbinquan@hisilicon.com>
>> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> ---
>> change log
>> v11:
>> Fixed issues pointed by Brian Norris and Cyrille Pitchen.
>> 1)Changed hisi_spi_nor_read_reg()/write_reg() to configure registers
>> without sniffing the opcodes.
>> 2)Deleted hisi_spi_nor_erase() and used default implementation inste=
ad.
>> 3)Changed hisi_spi_nor_dma_transfer() to return a integer type value
>> instead of nothing.
>> 4)Simplified hisi_spi_nor_read()/write() as Brian suggested.
>>
>> v10:
>> Fixed issues pointed by Marek Vasut.
>> 1)Droped the underscores in the argument names of some macros' defin=
ition.
>> 2)Changed some varibles to correct type.
>> 3)Rewrote hisi_spi_nor_read/write for readability.
>> 4)Added new functions hisi_spi_nor_register/unregister_all
>> 5)Changed to dynamically allocation for spi_nor embeded in hifmc_hos=
t.
>> Fixed issues pointed by Brian Norris.
>> 1)Replaced some headers with more accurate ones.
>> v9:
>> Fixed issues pointed by Jagan Teki.
>> v8:
>> Fixed issues pointed by Ezequiel Garcia and Brian Norris.
>> Moved dts binding file to mtd directory.
>> Changed the compatible string more specific.
>> v7:
>> Rebased to v4.5-rc3.
>> Fixed issues pointed by Ezequiel Garcia.
>> v6:
>> Based on v4.5-rc2
>> Fixed issues pointed by Ezequiel Garcia.
>> v5:
>> Fixed a compile error.
>> v4:
>> Rebased to v4.5-rc1
>> v3:
>> Added a compatible string "hisilicon,hi3519-sfc".
>> v2:
>> Fixed some compiling warings.
>>
>>  .../bindings/mtd/hisilicon,fmc-spi-nor.txt         |  24 +
>>  drivers/mtd/spi-nor/Kconfig                        |   7 +
>>  drivers/mtd/spi-nor/Makefile                       |   1 +
>>  drivers/mtd/spi-nor/hisi-sfc.c                     | 489 ++++++++++=
+++++++++++
>>  4 files changed, 521 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/hisilicon,=
fmc-spi-nor.txt
>>  create mode 100644 drivers/mtd/spi-nor/hisi-sfc.c
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi=
-nor.txt b/Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.=
txt
>> new file mode 100644
>> index 0000000..7498152
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.tx=
t
>> @@ -0,0 +1,24 @@
>> +HiSilicon SPI-NOR Flash Controller
>> +
>> +Required properties:
>> +- compatible : Should be "hisilicon,fmc-spi-nor" and one of the fol=
lowing strings:
>> +		"hisilicon,hi3519-spi-nor"
>> +- address-cells : Should be 1.
>> +- size-cells : Should be 0.
>> +- reg : Offset and length of the register set for the controller de=
vice.
>> +- reg-names : Must include the following two entries: "control", "m=
emory".
>> +- clocks : handle to spi-nor flash controller clock.
>> +
>> +Example:
>> +spi-nor-controller@10000000 {
>> +	compatible =3D "hisilicon,hi3519-spi-nor", "hisilicon,fmc-spi-nor"=
;
>> +	#address-cells =3D <1>;
>> +	#size-cells =3D <0>;
>> +	reg =3D <0x10000000 0x1000>, <0x14000000 0x1000000>;
>> +	reg-names =3D "control", "memory";
>> +	clocks =3D <&clock HI3519_FMC_CLK>;
>> +	spi-nor@0 {
>> +		compatible =3D "jedec,spi-nor";
>> +		reg =3D <0>;
>> +	};
>> +};
>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconf=
ig
>> index d42c98e..b9ff675 100644
>> --- a/drivers/mtd/spi-nor/Kconfig
>> +++ b/drivers/mtd/spi-nor/Kconfig
>> @@ -38,6 +38,13 @@ config SPI_FSL_QUADSPI
>>  	  This controller does not support generic SPI. It only supports
>>  	  SPI NOR.
>> =20
>> +config SPI_HISI_SFC
>> +	tristate "Hisilicon SPI-NOR Flash Controller(SFC)"
>> +	depends on ARCH_HISI || COMPILE_TEST
>> +	depends on HAS_IOMEM
>> +	help
>> +	  This enables support for hisilicon SPI-NOR flash controller.
>> +
>>  config SPI_NXP_SPIFI
>>  	tristate "NXP SPI Flash Interface (SPIFI)"
>>  	depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
>> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Make=
file
>> index 0bf3a7f8..8a6fa69 100644
>> --- a/drivers/mtd/spi-nor/Makefile
>> +++ b/drivers/mtd/spi-nor/Makefile
>> @@ -1,4 +1,5 @@
>>  obj-$(CONFIG_MTD_SPI_NOR)	+=3D spi-nor.o
>>  obj-$(CONFIG_SPI_FSL_QUADSPI)	+=3D fsl-quadspi.o
>> +obj-$(CONFIG_SPI_HISI_SFC)	+=3D hisi-sfc.o
>>  obj-$(CONFIG_MTD_MT81xx_NOR)    +=3D mtk-quadspi.o
>>  obj-$(CONFIG_SPI_NXP_SPIFI)	+=3D nxp-spifi.o
>> diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hi=
si-sfc.c
>> new file mode 100644
>> index 0000000..44664c3
>> --- /dev/null
>> +++ b/drivers/mtd/spi-nor/hisi-sfc.c
>> @@ -0,0 +1,489 @@
>> +/*
>> + * HiSilicon SPI Nor Flash Controller Driver
>> + *
>> + * Copyright (c) 2015-2016 HiSilicon Technologies Co., Ltd.
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License as publishe=
d by
>> + * the Free Software Foundation; either version 2 of the License, o=
r
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public Licens=
e
>> + * along with this program. If not, see <http://www.gnu.org/license=
s/>.
>> + */
>> +#include <linux/bitops.h>
>> +#include <linux/clk.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/module.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mtd/spi-nor.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/slab.h>
>> +
>> +/* Hardware register offsets and field definitions */
>> +#define FMC_CFG				0x00
>> +#define FMC_CFG_OP_MODE_MASK		BIT_MASK(0)
>> +#define FMC_CFG_OP_MODE_BOOT		0
>> +#define FMC_CFG_OP_MODE_NORMAL		1
>> +#define FMC_CFG_FLASH_SEL(type)		(((type) & 0x3) << 1)
>> +#define FMC_CFG_FLASH_SEL_MASK		0x6
>> +#define FMC_ECC_TYPE(type)		(((type) & 0x7) << 5)
>> +#define FMC_ECC_TYPE_MASK		GENMASK(7, 5)
>> +#define SPI_NOR_ADDR_MODE_MASK		BIT_MASK(10)
>> +#define SPI_NOR_ADDR_MODE_3BYTES	(0x0 << 10)
>> +#define SPI_NOR_ADDR_MODE_4BYTES	(0x1 << 10)
>> +#define FMC_GLOBAL_CFG			0x04
>> +#define FMC_GLOBAL_CFG_WP_ENABLE	BIT(6)
>> +#define FMC_SPI_TIMING_CFG		0x08
>> +#define TIMING_CFG_TCSH(nr)		(((nr) & 0xf) << 8)
>> +#define TIMING_CFG_TCSS(nr)		(((nr) & 0xf) << 4)
>> +#define TIMING_CFG_TSHSL(nr)		((nr) & 0xf)
>> +#define CS_HOLD_TIME			0x6
>> +#define CS_SETUP_TIME			0x6
>> +#define CS_DESELECT_TIME		0xf
>> +#define FMC_INT				0x18
>> +#define FMC_INT_OP_DONE			BIT(0)
>> +#define FMC_INT_CLR			0x20
>> +#define FMC_CMD				0x24
>> +#define FMC_CMD_CMD1(cmd)		((cmd) & 0xff)
>> +#define FMC_ADDRL			0x2c
>> +#define FMC_OP_CFG			0x30
>> +#define OP_CFG_FM_CS(cs)		((cs) << 11)
>> +#define OP_CFG_MEM_IF_TYPE(type)	(((type) & 0x7) << 7)
>> +#define OP_CFG_ADDR_NUM(addr)		(((addr) & 0x7) << 4)
>> +#define OP_CFG_DUMMY_NUM(dummy)		((dummy) & 0xf)
>> +#define FMC_DATA_NUM			0x38
>> +#define FMC_DATA_NUM_CNT(cnt)		((cnt) & GENMASK(13, 0))
>> +#define FMC_OP				0x3c
>> +#define FMC_OP_DUMMY_EN			BIT(8)
>> +#define FMC_OP_CMD1_EN			BIT(7)
>> +#define FMC_OP_ADDR_EN			BIT(6)
>> +#define FMC_OP_WRITE_DATA_EN		BIT(5)
>> +#define FMC_OP_READ_DATA_EN		BIT(2)
>> +#define FMC_OP_READ_STATUS_EN		BIT(1)
>> +#define FMC_OP_REG_OP_START		BIT(0)
>> +#define FMC_DMA_LEN			0x40
>> +#define FMC_DMA_LEN_SET(len)		((len) & GENMASK(27, 0))
>> +#define FMC_DMA_SADDR_D0		0x4c
>> +#define HIFMC_DMA_MAX_LEN		(4096)
>> +#define HIFMC_DMA_MASK			(HIFMC_DMA_MAX_LEN - 1)
>> +#define FMC_OP_DMA			0x68
>> +#define OP_CTRL_RD_OPCODE(code)		(((code) & 0xff) << 16)
>> +#define OP_CTRL_WR_OPCODE(code)		(((code) & 0xff) << 8)
>> +#define OP_CTRL_RW_OP(op)		((op) << 1)
>> +#define OP_CTRL_DMA_OP_READY		BIT(0)
>> +#define FMC_OP_READ			0x0
>> +#define FMC_OP_WRITE			0x1
>> +#define FMC_WAIT_TIMEOUT		1000000
>> +
>> +enum hifmc_iftype {
>> +	IF_TYPE_STD,
>> +	IF_TYPE_DUAL,
>> +	IF_TYPE_DIO,
>> +	IF_TYPE_QUAD,
>> +	IF_TYPE_QIO,
>> +};
>> +
>> +struct hifmc_priv {
>> +	u32 chipselect;
>> +	u32 clkrate;
>> +	struct hifmc_host *host;
>> +};
>> +
>> +#define HIFMC_MAX_CHIP_NUM		2
>> +struct hifmc_host {
>> +	struct device *dev;
>> +	struct mutex lock;
>> +
>> +	void __iomem *regbase;
>> +	void __iomem *iobase;
>> +	struct clk *clk;
>> +	void *buffer;
>> +	dma_addr_t dma_buffer;
>> +
>> +	struct spi_nor	*nor[HIFMC_MAX_CHIP_NUM];
>> +	u32 num_chip;
>> +};
>> +
>> +static inline int wait_op_finish(struct hifmc_host *host)
>> +{
>> +	u32 reg;
>> +
>> +	return readl_poll_timeout(host->regbase + FMC_INT, reg,
>> +		(reg & FMC_INT_OP_DONE), 0, FMC_WAIT_TIMEOUT);
>> +}
>> +
>> +static int get_if_type(enum read_mode flash_read)
>> +{
>> +	enum hifmc_iftype if_type;
>> +
>> +	switch (flash_read) {
>> +	case SPI_NOR_DUAL:
>> +		if_type =3D IF_TYPE_DUAL;
>> +		break;
>> +	case SPI_NOR_QUAD:
>> +		if_type =3D IF_TYPE_QUAD;
>> +		break;
>> +	case SPI_NOR_NORMAL:
>> +	case SPI_NOR_FAST:
>> +	default:
>> +		if_type =3D IF_TYPE_STD;
>> +		break;
>> +	}
>> +
>> +	return if_type;
>> +}
>> +
>> +static void hisi_spi_nor_init(struct hifmc_host *host)
>> +{
>> +	u32 reg;
>> +
>> +	reg =3D TIMING_CFG_TCSH(CS_HOLD_TIME)
>> +		| TIMING_CFG_TCSS(CS_SETUP_TIME)
>> +		| TIMING_CFG_TSHSL(CS_DESELECT_TIME);
>> +	writel(reg, host->regbase + FMC_SPI_TIMING_CFG);
>> +}
>> +
>> +static int hisi_spi_nor_prep(struct spi_nor *nor, enum spi_nor_ops =
ops)
>> +{
>> +	struct hifmc_priv *priv =3D nor->priv;
>> +	struct hifmc_host *host =3D priv->host;
>> +	int ret;
>> +
>> +	mutex_lock(&host->lock);
>> +
>> +	ret =3D clk_set_rate(host->clk, priv->clkrate);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret =3D clk_prepare_enable(host->clk);
>> +	if (ret)
>> +		goto out;
>> +
>> +	return 0;
>> +
>> +out:
>> +	mutex_unlock(&host->lock);
>> +	return ret;
>> +}
>> +
>> +static void hisi_spi_nor_unprep(struct spi_nor *nor, enum spi_nor_o=
ps ops)
>> +{
>> +	struct hifmc_priv *priv =3D nor->priv;
>> +	struct hifmc_host *host =3D priv->host;
>> +
>> +	clk_disable_unprepare(host->clk);
>> +	mutex_unlock(&host->lock);
>> +}
>> +
>> +static int hisi_spi_nor_op_reg(struct spi_nor *nor,
>> +				u8 opcode, int len, u8 optype)
>> +{
>> +	struct hifmc_priv *priv =3D nor->priv;
>> +	struct hifmc_host *host =3D priv->host;
>> +	u32 reg;
>> +
>> +	reg =3D FMC_CMD_CMD1(opcode);
>> +	writel(reg, host->regbase + FMC_CMD);
>> +
>> +	reg =3D FMC_DATA_NUM_CNT(len);
>> +	writel(reg, host->regbase + FMC_DATA_NUM);
>> +
>> +	reg =3D OP_CFG_FM_CS(priv->chipselect);
>> +	writel(reg, host->regbase + FMC_OP_CFG);
>> +
>> +	writel(0xff, host->regbase + FMC_INT_CLR);
>> +	reg =3D FMC_OP_CMD1_EN | FMC_OP_REG_OP_START | optype;
>> +	writel(reg, host->regbase + FMC_OP);
>> +
>> +	return wait_op_finish(host);
>> +}
>> +
>> +static int hisi_spi_nor_read_reg(struct spi_nor *nor, u8 opcode, u8=
 *buf,
>> +		int len)
>> +{
>> +	struct hifmc_priv *priv =3D nor->priv;
>> +	struct hifmc_host *host =3D priv->host;
>> +	int ret;
>> +
>> +	ret =3D hisi_spi_nor_op_reg(nor, opcode, len, FMC_OP_READ_DATA_EN)=
;
>> +	if (ret)
>> +		return ret;
>> +
>> +	memcpy_fromio(buf, host->iobase, len);
>> +	return 0;
>> +}
>> +
>> +static int hisi_spi_nor_write_reg(struct spi_nor *nor, u8 opcode,
>> +				u8 *buf, int len)
>> +{
>> +	struct hifmc_priv *priv =3D nor->priv;
>> +	struct hifmc_host *host =3D priv->host;
>> +
>> +	if (len)
>> +		memcpy_toio(host->iobase, buf, len);
>> +
>> +	return hisi_spi_nor_op_reg(nor, opcode, len, FMC_OP_WRITE_DATA_EN)=
;
>> +}
>> +
>> +static int hisi_spi_nor_dma_transfer(struct spi_nor *nor, loff_t st=
art_off,
>> +		dma_addr_t dma_buf, size_t len, u8 op_type)
>> +{
>> +	struct hifmc_priv *priv =3D nor->priv;
>> +	struct hifmc_host *host =3D priv->host;
>> +	u8 if_type =3D 0;
>> +	u32 reg;
>> +
>> +	reg =3D readl(host->regbase + FMC_CFG);
>> +	reg &=3D ~(FMC_CFG_OP_MODE_MASK | SPI_NOR_ADDR_MODE_MASK);
>> +	reg |=3D FMC_CFG_OP_MODE_NORMAL;
>> +	reg |=3D (nor->addr_width =3D=3D 4) ? SPI_NOR_ADDR_MODE_4BYTES
>> +		: SPI_NOR_ADDR_MODE_3BYTES;
>> +	writel(reg, host->regbase + FMC_CFG);
>> +
>> +	writel(start_off, host->regbase + FMC_ADDRL);
>> +	writel(dma_buf, host->regbase + FMC_DMA_SADDR_D0);
>> +	writel(FMC_DMA_LEN_SET(len), host->regbase + FMC_DMA_LEN);
>> +
>> +	reg =3D OP_CFG_FM_CS(priv->chipselect);
>> +	if_type =3D get_if_type(nor->flash_read);
>> +	reg |=3D OP_CFG_MEM_IF_TYPE(if_type);
>> +	if (op_type =3D=3D FMC_OP_READ)
>> +		reg |=3D OP_CFG_DUMMY_NUM(nor->read_dummy >> 3);
>> +	writel(reg, host->regbase + FMC_OP_CFG);
>> +
>> +	writel(0xff, host->regbase + FMC_INT_CLR);
>> +	reg =3D OP_CTRL_RW_OP(op_type) | OP_CTRL_DMA_OP_READY;
>> +	reg |=3D (op_type =3D=3D FMC_OP_READ)
>> +		? OP_CTRL_RD_OPCODE(nor->read_opcode)
>> +		: OP_CTRL_WR_OPCODE(nor->program_opcode);
>> +	writel(reg, host->regbase + FMC_OP_DMA);
>> +
>> +	return wait_op_finish(host);
>> +}
>> +
>> +static int hisi_spi_nor_read(struct spi_nor *nor, loff_t from, size=
_t len,
>> +		size_t *retlen, u_char *read_buf)
>> +{
>> +	struct hifmc_priv *priv =3D nor->priv;
>> +	struct hifmc_host *host =3D priv->host;
>> +	size_t offset;
>> +	int ret;
>> +
>> +	for (offset =3D 0; offset < len; offset +=3D HIFMC_DMA_MAX_LEN) {
>> +		size_t trans =3D min_t(size_t, HIFMC_DMA_MAX_LEN, len - offset);
>> +
>> +		ret =3D hisi_spi_nor_dma_transfer(nor,
>> +			from + offset, host->dma_buffer, trans, FMC_OP_READ);
>> +		if (ret) {
>> +			dev_warn(nor->dev, "DMA read timeout\n");
>> +			return ret;
>> +		}
>> +		memcpy(read_buf + offset, host->buffer, trans);
>> +		*retlen +=3D trans;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void hisi_spi_nor_write(struct spi_nor *nor, loff_t to,
>> +			size_t len, size_t *retlen, const u_char *write_buf)
>> +{
>> +	struct hifmc_priv *priv =3D nor->priv;
>> +	struct hifmc_host *host =3D priv->host;
>> +	size_t offset;
>> +	int ret;
>> +
>> +	for (offset =3D 0; offset < len; offset +=3D HIFMC_DMA_MAX_LEN) {
>> +		size_t trans =3D min_t(size_t, HIFMC_DMA_MAX_LEN, len - offset);
>> +
>> +		memcpy(host->buffer, write_buf + offset, trans);
>> +		ret =3D hisi_spi_nor_dma_transfer(nor,
>> +			to + offset, host->dma_buffer, trans, FMC_OP_WRITE);
>> +		if (ret) {
>> +			dev_warn(nor->dev, "DMA write timeout\n");
>> +			return;
>> +		}
>> +		*retlen +=3D len;
>> +	}
>> +}
>> +
>> +/**
>> + * Get spi flash device information and register it as a mtd device=
=2E
>> + */
>> +static int hisi_spi_nor_register(struct device_node *np,
>> +				struct hifmc_host *host)
>> +{
>> +	struct device *dev =3D host->dev;
>> +	struct spi_nor *nor;
>> +	struct hifmc_priv *priv;
>> +	struct mtd_info *mtd;
>> +	int ret;
>> +
>> +	nor =3D devm_kzalloc(dev, sizeof(*nor), GFP_KERNEL);
>> +	if (!nor)
>> +		return -ENOMEM;
>> +
>> +	nor->dev =3D dev;
>> +	spi_nor_set_flash_node(nor, np);
>> +
>> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	ret =3D of_property_read_u32(np, "reg", &priv->chipselect);
>> +	if (ret) {
>> +		dev_err(dev, "There's no reg property for %s\n",
>> +			np->full_name);
>> +		return ret;
>> +	}
>> +
>> +	ret =3D of_property_read_u32(np, "spi-max-frequency",
>> +			&priv->clkrate);
>> +	if (ret) {
>> +		dev_err(dev, "There's no spi-max-frequency property for %s\n",
>> +			np->full_name);
>> +		return ret;
>> +	}
>> +	priv->host =3D host;
>> +	nor->priv =3D priv;
>> +
>> +	nor->prepare =3D hisi_spi_nor_prep;
>> +	nor->unprepare =3D hisi_spi_nor_unprep;
>> +	nor->read_reg =3D hisi_spi_nor_read_reg;
>> +	nor->write_reg =3D hisi_spi_nor_write_reg;
>> +	nor->read =3D hisi_spi_nor_read;
>> +	nor->write =3D hisi_spi_nor_write;
>> +	nor->erase =3D NULL;
>> +	ret =3D spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
>> +	if (ret)
>> +		return ret;
>> +
>> +	mtd =3D &nor->mtd;
>> +	mtd->name =3D np->name;
>> +	ret =3D mtd_device_register(mtd, NULL, 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	host->nor[host->num_chip] =3D nor;
>> +	host->num_chip++;
>> +	return 0;
>> +}
>> +
>> +static void hisi_spi_nor_unregister_all(struct hifmc_host *host)
>> +{
>> +	int i;
>> +
>> +	for (i =3D 0; i < host->num_chip; i++)
>> +		mtd_device_unregister(&host->nor[i]->mtd);
>> +}
>> +
>> +static int hisi_spi_nor_register_all(struct hifmc_host *host)
>> +{
>> +	struct device *dev =3D host->dev;
>> +	struct device_node *np;
>> +	int ret;
>> +
>> +	for_each_available_child_of_node(dev->of_node, np) {
>> +		ret =3D hisi_spi_nor_register(np, host);
>> +		if (ret)
>> +			goto fail;
>> +
>> +		if (host->num_chip =3D=3D HIFMC_MAX_CHIP_NUM) {
>> +			dev_warn(dev, "Flash device number exceeds the maximum chipselec=
t number\n");
>> +			break;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +fail:
>> +	hisi_spi_nor_unregister_all(host);
>> +	return ret;
>> +}
>> +
>> +static int hisi_spi_nor_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev =3D &pdev->dev;
>> +	struct resource *res;
>> +	struct hifmc_host *host;
>> +	int ret;
>> +
>> +	host =3D devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
>> +	if (!host)
>> +		return -ENOMEM;
>> +
>> +	platform_set_drvdata(pdev, host);
>> +	host->dev =3D dev;
>> +
>> +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "contro=
l");
>> +	host->regbase =3D devm_ioremap_resource(dev, res);
>> +	if (IS_ERR(host->regbase))
>> +		return PTR_ERR(host->regbase);
>> +
>> +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "memory=
");
>> +	host->iobase =3D devm_ioremap_resource(dev, res);
>> +	if (IS_ERR(host->iobase))
>> +		return PTR_ERR(host->iobase);
>> +
>> +	host->clk =3D devm_clk_get(dev, NULL);
>> +	if (IS_ERR(host->clk))
>> +		return PTR_ERR(host->clk);
>> +
>> +	ret =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
>> +	if (ret) {
>> +		dev_warn(dev, "Unable to set dma mask\n");
>> +		return ret;
>> +	}
>> +
>> +	host->buffer =3D dmam_alloc_coherent(dev, HIFMC_DMA_MAX_LEN,
>> +			&host->dma_buffer, GFP_KERNEL);
>> +	if (!host->buffer)
>> +		return -ENOMEM;
>> +
>> +	mutex_init(&host->lock);
>> +	clk_prepare_enable(host->clk);
>> +	hisi_spi_nor_init(host);
>> +	ret =3D hisi_spi_nor_register_all(host);
>> +	if (ret)
>> +		mutex_destroy(&host->lock);
>> +
>> +	clk_disable_unprepare(host->clk);
>> +	return ret;
>> +}
>> +
>> +static int hisi_spi_nor_remove(struct platform_device *pdev)
>> +{
>> +	struct hifmc_host *host =3D platform_get_drvdata(pdev);
>> +
>> +	hisi_spi_nor_unregister_all(host);
>> +	mutex_destroy(&host->lock);
>> +	clk_disable_unprepare(host->clk);
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id hisi_spi_nor_dt_ids[] =3D {
>> +	{ .compatible =3D "hisilicon,fmc-spi-nor"},
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, hisi_spi_nor_dt_ids);
>> +
>> +static struct platform_driver hisi_spi_nor_driver =3D {
>> +	.driver =3D {
>> +		.name	=3D "hisi-sfc",
>> +		.of_match_table =3D hisi_spi_nor_dt_ids,
>> +	},
>> +	.probe	=3D hisi_spi_nor_probe,
>> +	.remove	=3D hisi_spi_nor_remove,
>> +};
>> +module_platform_driver(hisi_spi_nor_driver);
>> +
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_DESCRIPTION("HiSilicon SPI Nor Flash Controller Driver");
>>
>=20
>=20
> .
>=20
