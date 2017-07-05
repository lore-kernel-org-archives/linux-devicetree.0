From: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Subject: Re: [PATCH 2/3] mtd: spi-nor: core code for the Altera Quadspi Flash
 Controller v2
Date: Wed, 5 Jul 2017 07:34:49 -0700 (PDT)
Message-ID: <alpine.DEB.2.20.1707050715540.2639@mgerlach-VirtualBox>
References: <1498493619-4633-1-git-send-email-matthew.gerlach@linux.intel.com> <1498493619-4633-3-git-send-email-matthew.gerlach@linux.intel.com> <54a6cd9d-8d4a-8d22-26e7-b5e0f8df0f5b@wedev4u.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1779773493-1499265291=:2639"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54a6cd9d-8d4a-8d22-26e7-b5e0f8df0f5b-yU5RGvR974pGWvitb5QawA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>
Cc: vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1779773493-1499265291=:2639
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT



On Tue, 4 Jul 2017, Cyrille Pitchen wrote:

Hi Cyrille,

Thanks for all the great feedback.  Clearly, I've got some work to do.
Please see my comments inline.

Matthew Gerlach


> Hi Matthew,
>
>
> Le 26/06/2017 à 18:13, matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org a écrit :
>> From: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>>
>> Signed-off-by: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>> ---
>>  MAINTAINERS                          |   7 +
>>  drivers/mtd/spi-nor/Kconfig          |   5 +
>>  drivers/mtd/spi-nor/Makefile         |   4 +-
>>  drivers/mtd/spi-nor/altera-quadspi.c | 676 +++++++++++++++++++++++++++++++++++
>>  include/linux/mtd/altera-quadspi.h   |  28 ++
>>  5 files changed, 719 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/mtd/spi-nor/altera-quadspi.c
>>  create mode 100644 include/linux/mtd/altera-quadspi.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 6b4395c..ae33fa6 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -648,6 +648,13 @@ L:	linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>  S:	Maintained
>>  F:	drivers/gpio/gpio-altera.c
>>
>> +ALTERA QUADSPI FLASH DRIVER
>> +M:	Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>> +L:	linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> +S:	Maintained
>> +F:	drivers/mtd/spi-nor/altera-quadspi.c
>> +F:	inclulde/linux/mtd/altera-quadspi.h
>> +
>>  ALTERA SYSTEM RESOURCE DRIVER FOR ARRIA10 DEVKIT
>>  M:	Thor Thayer <thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>>  S:	Maintained
>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
>> index 293c8a4..89fe425 100644
>> --- a/drivers/mtd/spi-nor/Kconfig
>> +++ b/drivers/mtd/spi-nor/Kconfig
>> @@ -113,4 +113,9 @@ config SPI_STM32_QUADSPI
>>  	  This enables support for the STM32 Quad SPI controller.
>>  	  We only connect the NOR to this controller.
>>
>> +config SPI_ALTERA_QUADSPI
>> +        tristate "Altera Quad SPI Flash Controller II"
>> +        help
>> +          Enable support for version 2 of Altera Quad SPI Flash Controller.
>> +
>>  endif # MTD_SPI_NOR
>> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
>> index 285aab8..024c6ac 100644
>> --- a/drivers/mtd/spi-nor/Makefile
>> +++ b/drivers/mtd/spi-nor/Makefile
>> @@ -8,4 +8,6 @@ obj-$(CONFIG_MTD_MT81xx_NOR)    += mtk-quadspi.o
>>  obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
>>  obj-$(CONFIG_SPI_INTEL_SPI)	+= intel-spi.o
>>  obj-$(CONFIG_SPI_INTEL_SPI_PLATFORM)	+= intel-spi-platform.o
>> -obj-$(CONFIG_SPI_STM32_QUADSPI)	+= stm32-quadspi.o
>> \ No newline at end of file
>> +obj-$(CONFIG_SPI_STM32_QUADSPI)	+= stm32-quadspi.o
>> +obj-$(CONFIG_SPI_ALTERA_QUADSPI) += altera-quadspi.o
>> +
>> diff --git a/drivers/mtd/spi-nor/altera-quadspi.c b/drivers/mtd/spi-nor/altera-quadspi.c
>> new file mode 100644
>> index 0000000..de65453
>> --- /dev/null
>> +++ b/drivers/mtd/spi-nor/altera-quadspi.c
>> @@ -0,0 +1,676 @@
>> +/*
>> + * Copyright (C) 2014 Altera Corporation. All rights reserved.
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
>> +
>> +#include <linux/bitrev.h>
>> +#include <linux/module.h>
>> +#include <linux/mtd/altera-quadspi.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mtd/spi-nor.h>
>> +
>> +#define ALTERA_QUADSPI_RESOURCE_NAME			"altera_quadspi"
>> +
>> +#define EPCS_OPCODE_ID					1
>> +#define NON_EPCS_OPCODE_ID				2
>> +
>> +#define WRITE_CHECK					1
>> +#define ERASE_CHECK					0
>> +
>> +#define QUADSPI_SR_REG					0x0
>> +#define QUADSPI_SR_MASK					0x0000000F
>> +
>> +/* defines for device id register */
>> +#define QUADSPI_SID_REG					0x4
>> +#define QUADSPI_RDID_REG				0x8
>> +#define QUADSPI_ID_MASK					0x000000FF
>> +
>> +/*
>> + * QUADSPI_MEM_OP register offset
>> + *
>> + * The QUADSPI_MEM_OP register is used to do memory protect and erase operations
>> + *
>> + */
>> +#define QUADSPI_MEM_OP_REG				0xC
>> +
>> +#define QUADSPI_MEM_OP_CMD_MASK				0x00000003
>> +#define QUADSPI_MEM_OP_BULK_ERASE_CMD			0x00000001
>> +#define QUADSPI_MEM_OP_SECTOR_ERASE_CMD			0x00000002
>> +#define QUADSPI_MEM_OP_SECTOR_PROTECT_CMD		0x00000003
>> +#define QUADSPI_MEM_OP_SECTOR_WRITE_ENABLE_CMD		0x00000004
>> +#define QUADSPI_MEM_OP_SECTOR_VALUE_MASK		0x0003FF00
>> +
>> +#define QUADSPI_MEM_OP_SECTOR_PROTECT_SHIFT		8
>> +#define QUADSPI_MEM_OP_SECTOR_PROTECT_VALUE_MASK	0x00001F00
>> +/*
>> + * QUADSPI_ISR register offset
>> + *
>> + * The QUADSPI_ISR register is used to determine whether an invalid write or
>> + * erase operation trigerred an interrupt
>> + *
>> + */
>> +#define QUADSPI_ISR_REG					0x10
>> +
>> +#define QUADSPI_ISR_ILLEGAL_ERASE_MASK			0x00000001
>> +#define QUADSPI_ISR_ILLEGAL_WRITE_MASK			0x00000002
>> +
>> +/*
>> + * QUADSPI_IMR register offset
>> + *
>> + * The QUADSPI_IMR register is used to mask the invalid erase or the invalid
>> + * write interrupts.
>> + *
>> + */
>> +#define QUADSPI_IMR_REG					0x14
>> +#define QUADSPI_IMR_ILLEGAL_ERASE_MASK			0x00000001
>> +
>> +#define QUADSPI_IMR_ILLEGAL_WRITE_MASK			0x00000002
>> +
>> +#define QUADSPI_CHIP_SELECT_REG				0x18
>> +#define QUADSPI_CHIP_SELECT_MASK			0x00000007
>> +#define QUADSPI_CHIP_SELECT_0				0x00000001
>> +#define QUADSPI_CHIP_SELECT_1				0x00000002
>> +#define QUADSPI_CHIP_SELECT_2				0x00000004
>> +
>> +#define QUADSPI_FLAG_STATUS_REG				0x1C
>> +#define QUADSPI_DEV_ID_DATA_0				0x20
>> +#define QUADSPI_DEV_ID_DATA_1				0x24
>> +#define QUADSPI_DEV_ID_DATA_2				0x28
>> +#define QUADSPI_DEV_ID_DATA_3				0x2C
>> +#define QUADSPI_DEV_ID_DATA_4				0x30
>> +
>> +#define QUADSPI_WIN_OCC_REG				0x4
>> +#define QUADSPI_WIN_OCC_SFT				24
>> +
>> +#define QUADSPI_WIN_SEL_REG				0x8
>> +
>> +struct altera_quadspi {
>> +	u32 opcode_id;
>> +	void __iomem *csr_base;
>> +	void __iomem *data_base;
>> +	void __iomem *window_base;
>> +	size_t window_size;
>> +	u32 num_flashes;
>> +	u32 flags;
>> +	struct device *dev;
>> +	struct altera_quadspi_flash *flash[ALTERA_QUADSPI_MAX_NUM_FLASH_CHIP];
>> +	struct device_node *np[ALTERA_QUADSPI_MAX_NUM_FLASH_CHIP];
>> +};
>> +
>> +struct altera_quadspi_flash {
>> +	struct spi_nor nor;
>> +	struct altera_quadspi *q;
>> +	u32 bank;
>> +};
>> +
>> +struct flash_device {
>> +	char *name;
>> +	u32 opcode_id;
>> +	u32 device_id;
>> +};
>> +
>> +#ifdef DEBUG
>> +static inline u32 alt_qspi_readl(void __iomem *base, off_t offset)
>> +{
>> +	u32 val = readl(base + offset);
>> +
>> +	pr_info("%s 0x%x from offset 0x%lx\n", __func__, val, offset);
>> +	return val;
>> +}
>> +static inline void alt_qspi_writel(u32 val, void __iomem *base, off_t offset)
>> +{
>> +	writel(val, base + offset);
>> +	pr_info("%s 0x%x to offset 0x%lx\n", __func__, val, offset);
>> +}
>> +#else
>> +#define alt_qspi_readl(base, offset) readl(base+offset)
>> +#define alt_qspi_writel(val, base, offset) writel(val, base + offset)
>> +#endif
>> +
>> +static void altera_quadspi_chip_select(struct altera_quadspi *q, u32 bank)
>> +{
>> +	u32 val = 0;
>> +
>> +	switch (bank) {
>> +	case 0:
>> +		val = QUADSPI_CHIP_SELECT_0;
>> +		break;
>> +	case 1:
>> +		val = QUADSPI_CHIP_SELECT_1;
>> +		break;
>> +	case 2:
>> +		val = QUADSPI_CHIP_SELECT_2;
>> +		break;
>> +	default:
>> +		dev_err(q->dev, "invalid bank\n");
>> +		return;
>> +	}
>> +	alt_qspi_writel(val, q->csr_base, QUADSPI_CHIP_SELECT_REG);
>> +}
>> +
>> +static int altera_quadspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *val,
>> +				    int len)
>> +{
>> +	struct altera_quadspi_flash *flash = nor->priv;
>> +	struct altera_quadspi *q = flash->q;
>> +
>> +	altera_quadspi_chip_select(q, flash->bank);
>> +
>> +	switch (opcode) {
>> +	case SPINOR_OP_WREN:
>> +		dev_dbg(q->dev, "%s enabling write\n", __func__);
>> +		alt_qspi_writel(QUADSPI_MEM_OP_SECTOR_WRITE_ENABLE_CMD,
>> +				q->csr_base, QUADSPI_MEM_OP_REG);
>> +		break;
>> +
>> +	case SPINOR_OP_CHIP_ERASE:
>> +		alt_qspi_writel(QUADSPI_MEM_OP_BULK_ERASE_CMD,
>> +				q->csr_base, QUADSPI_MEM_OP_REG);
>> +		break;
>> +
>> +	default:
>> +		dev_dbg(q->dev, "%s UNHANDLED write_reg 0x%x\n",
>> +			__func__, opcode);
>
> Looking at the code I assume, the hardware can only send
> predefined/hard-coded SPI op codes but not those actually chosen by
> spi-nor.c so what will happen when spi-nor introduces new op codes?
> Does it mean that this driver will immediately be broken?

Good point.  I will have to investigate this problem.

>
>> +
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int altera_quadspi_read_reg(struct spi_nor *nor, u8 opcode, u8 *val,
>> +				   int len)
>> +{
>> +	struct altera_quadspi_flash *flash = nor->priv;
>> +	struct altera_quadspi *q = flash->q;
>> +	u32 data = 0;
>> +
>> +	memset(val, 0, len);
>> +
>> +	altera_quadspi_chip_select(q, flash->bank);
>> +
>> +	switch (opcode) {
>> +	case SPINOR_OP_RDSR:
>> +		data = alt_qspi_readl(q->csr_base, QUADSPI_SR_REG);
>> +		dev_dbg(q->dev, "%s RDSR 0x%x\n", __func__, data);
>> +		*val = (u8)data & QUADSPI_SR_MASK;
>> +		break;
>> +	case SPINOR_OP_RDID:
>> +		if (q->opcode_id == EPCS_OPCODE_ID)
>
> Where do you initialize opcode_id ?
>
>> +			data = alt_qspi_readl(q->csr_base, QUADSPI_SID_REG);
>> +		else
>> +			data = alt_qspi_readl(q->csr_base, QUADSPI_RDID_REG);
>
> Why 2 differents registers for the JEDEC ID? Is data actually the result
> of some READ JEDEC ID (9Fh) command or some hard-coded value?

This is some left over code from when the driver was trying to support 
both original version of the Altera Quadspi controller and version 2 of 
the component.  It should be removed.

>
>> +
>> +		*((u32 *)val) = data;
>> +		break;
>> +	case SPINOR_OP_RDFSR:
>> +		data = alt_qspi_readl(q->csr_base, QUADSPI_FLAG_STATUS_REG);
>> +		dev_dbg(q->dev, "%s RDFSR 0x%x\n", __func__, data);
>> +		*val = (u8)(data & 0xff);
>> +		break;
>
> This is a "Micron only" register, other chunks of this patch let me
> think that the Altera controller can only work this Micron/EPCS
> memories, am I wrong?

My understanding is that the component should be able to support 
non-Micron devices, but I could be wrong.  I will have to investigate 
more.

>
> OK, then let assume a Micron memory: what if one day spi-nor.c needs to
> read the VCR and/or EVCR registers of Micron memories to check some
> specific bits? This driver is very likely to fail.

Clearly, there is a problem here.

>
>> +	default:
>> +		dev_dbg(q->dev, "%s UNHANDLED read_reg 0x%x\n",
>> +			__func__, opcode);
>> +		*val = 0;
>> +		break;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int altera_quadspi_write_erase_check(struct spi_nor *nor,
>> +					    bool write_erase)
>> +{
>> +	struct altera_quadspi_flash *flash = nor->priv;
>> +	struct altera_quadspi *q = flash->q;
>> +	u32 val;
>> +	u32 mask;
>> +
>> +	if (write_erase)
>> +		mask = QUADSPI_ISR_ILLEGAL_WRITE_MASK;
>> +	else
>> +		mask = QUADSPI_ISR_ILLEGAL_ERASE_MASK;
>> +
>> +	val = alt_qspi_readl(q->csr_base, QUADSPI_ISR_REG);
>> +
>> +	if (val & mask) {
>> +		dev_err(nor->dev,
>> +			"write/erase failed, sector might be protected\n");
>> +		alt_qspi_writel(0, q->csr_base, QUADSPI_FLAG_STATUS_REG);
>> +
>> +		return -EIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int altera_quadspi_addr_to_sector(struct mtd_info *mtd, uint64_t offset)
>> +{
>> +	if (mtd->erasesize_shift)
>> +		return offset >> mtd->erasesize_shift;
>> +	do_div(offset, mtd->erasesize);
>> +	return offset;
>> +}
>> +
>> +static int altera_quadspi_erase(struct spi_nor *nor, loff_t offset)
>> +{
>> +	struct altera_quadspi_flash *flash = nor->priv;
>> +	struct altera_quadspi *q = flash->q;
>> +	struct mtd_info *mtd = &nor->mtd;
>> +	u32 val;
>> +	int sector_value;
>> +
>> +	altera_quadspi_chip_select(q, flash->bank);
>> +
>> +	sector_value = altera_quadspi_addr_to_sector(mtd, offset);
>
> Here the driver uses nor->mtd.erasesize to do some conversion of the
> offset into some kind of sector index.
> However this function doesn't care about nor->erase_opcode. Then I guess
> that the hardware can only use a hard-coded op code for Block/Sector
> Erase operations.
>
> I don't know which erase op code is actually used by the hardware but
> whatever... How do you know that you've computed the right sector index
> before asking the hardware to execute some erase operation since this
> index is based on nor->mtd.erasesize ?
>
> nor->mtd.erasesize depends on the chosen nor->erase_opcode.
> For instance, depending on whether CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is
> defined or not, there will be at least one case where nor->erase_opcode
> doesn't match the hard-coded op code used by the Altera controller:
> different op codes, different sector sizes, different sector indexes...
>
> buggy nor->erase() function

Again, I will have to investigate more.

>
>
>> +
>> +	dev_dbg(q->dev, "%s sector %d\n", __func__, sector_value);
>> +
>> +	if (sector_value < 0)
>> +		return -EINVAL;
>> +
>> +	val = (sector_value << 8) & QUADSPI_MEM_OP_SECTOR_VALUE_MASK;
>> +
>> +	val |= QUADSPI_MEM_OP_SECTOR_ERASE_CMD;
>> +
>> +	alt_qspi_writel(val, q->csr_base, QUADSPI_MEM_OP_REG);
>> +
>> +	dev_dbg(q->dev, "%s SR=0x%x FSR=0x%x\n", __func__,
>> +		alt_qspi_readl(q->csr_base, QUADSPI_SR_REG),
>> +		alt_qspi_readl(q->csr_base, QUADSPI_FLAG_STATUS_REG));
>> +
>> +	return altera_quadspi_write_erase_check(nor, ERASE_CHECK);
>> +}
>> +
>> +#define WINDOW_ALIGN 4
>> +#define WINDOW_MASK (WINDOW_ALIGN - 1)
>> +
>> +static ssize_t altera_quadspi_windowed_read(struct altera_quadspi *q,
>> +					    loff_t from,
>> +					    size_t len, u_char *buf)
>> +{
>> +	size_t bytes_left = len;
>> +	size_t bytes_to_read, i;
>> +	loff_t next_window_off;
>> +	u64 start_window;
>> +	u32 window;
>> +	u32 *dst;
>> +
>> +	if ((from & WINDOW_MASK) || (len & WINDOW_MASK) ||
>> +	    !IS_ALIGNED((unsigned long)buf, WINDOW_ALIGN)) {
>> +		dev_err(q->dev, "%s only 32 bit aligned accesses allowed\n",
>> +			__func__);
>> +		return 0;
>> +	}
>> +
>> +	start_window = from;
>> +	do_div(start_window, q->window_size);
>> +	window = (u32)(start_window & 0xffffffff);
>> +
>> +	next_window_off = (window + 1) * q->window_size;
>> +
>> +	while (bytes_left > 0) {
>> +
>> +		writel(window, q->window_base + QUADSPI_WIN_SEL_REG);
>> +
>> +		bytes_to_read = min((size_t)bytes_left,
>> +				    (size_t)(next_window_off - from));
>> +
>> +		dev_dbg(q->dev,
>> +			"window%u fr0x%llx next0x%llx left%zu num0x%zx\n",
>> +			window,  from, next_window_off, bytes_left,
>> +			bytes_to_read);
>> +
>> +		dst = (u32 *)buf;
>> +		for (i = 0; i < bytes_to_read; i += 4, dst++)
>> +			*dst = readl(q->data_base +
>> +				     (from & (q->window_size - 1)) + i);
>> +
>> +		bytes_left -= bytes_to_read;
>> +		buf += bytes_to_read;
>> +		from += bytes_to_read;
>> +		window++;
>> +		next_window_off += q->window_size;
>> +	}
>> +
>> +	return len;
>> +}
>> +static ssize_t altera_quadspi_windowed_write(struct altera_quadspi *q,
>> +					     loff_t to, size_t len,
>> +					     const u_char *buf)
>> +{
>> +	size_t bytes_left = len;
>> +	u32 window_mask = q->window_size - 1;
>> +	u32 read_back;
>> +	size_t bytes_to_write, i;
>> +	loff_t next_window_off;
>> +	u64 start_window;
>> +	u32 window;
>> +	const u32 *src;
>> +	u32 words_can_write;
>> +
>> +	if ((to & WINDOW_MASK) || (len & WINDOW_MASK) ||
>> +	    !IS_ALIGNED((unsigned long)buf, WINDOW_ALIGN)) {
>> +		dev_err(q->dev, "%s only 32 bit aligned accesses allowed\n",
>> +			__func__);
>> +		return 0;
>> +	}
>> +
>> +	start_window = to;
>> +	do_div(start_window, q->window_size);
>> +	window = (u32)(start_window & 0xffffffff);
>> +
>> +	next_window_off = (window + 1) * q->window_size;
>> +
>> +	while (bytes_left > 0) {
>> +
>> +		writel(window, q->window_base + QUADSPI_WIN_SEL_REG);
>> +
>> +		bytes_to_write = min((size_t)bytes_left,
>> +				    (size_t)(next_window_off - to));
>> +
>> +		dev_dbg(q->dev,
>> +			"window%u to0x%llx next0x%llx left%zu num0x%zx\n",
>> +			window,  to, next_window_off, bytes_left,
>> +			bytes_to_write);
>> +
>> +		src = (u32 *)buf;
>> +		for (i = 0; i < bytes_to_write;) {
>> +			words_can_write =
>> +				readl(q->window_base + QUADSPI_WIN_OCC_REG) >>
>> +				      QUADSPI_WIN_OCC_SFT;
>> +			dev_dbg(q->dev, "can write 0x%x\n", words_can_write);
>> +
>> +			for (; words_can_write > 0; words_can_write--) {
>> +				writel(*src,
>> +				       q->data_base +
>> +				       (to & window_mask) + i);
>> +				read_back = readl(q->data_base +
>> +						  (to & window_mask) + i);
>> +				if (*src != read_back) {
>> +					dev_err(q->dev, "%s 0x%x != 0x%x\n",
>> +						__func__, *src, read_back);
>> +					return (len - bytes_left);
>> +				}
>> +				i += 4;
>> +				src++;
>> +			}
>> +		}
>> +
>> +		bytes_left -= bytes_to_write;
>> +		buf += bytes_to_write;
>> +		to += bytes_to_write;
>> +		window++;
>> +		next_window_off += q->window_size;
>> +	}
>> +
>> +	return len;
>> +}
>> +
>> +static ssize_t altera_quadspi_read(struct spi_nor *nor, loff_t from, size_t len,
>> +				   u_char *buf)
>> +{
>> +	struct altera_quadspi_flash *flash = nor->priv;
>> +	struct altera_quadspi *q = flash->q;
>> +	size_t i;
>> +
>> +	altera_quadspi_chip_select(q, flash->bank);
>> +
>> +	if (q->window_size)
>> +		altera_quadspi_windowed_read(q, from, len, buf);
>> +	else
>> +		memcpy_fromio(buf, q->data_base + from, len);
>> +
>> +	if (q->flags & ALTERA_QUADSPI_FL_BITREV_READ) {
>> +		for (i = 0; i < len; i++, buf++)
>> +			*buf = bitrev8(*buf);
>> +	}
>> +
>> +	return len;
>> +}
>> +
>> +static ssize_t altera_quadspi_write(struct spi_nor *nor, loff_t to,
>> +				    size_t len, const u_char *buf)
>> +{
>> +	struct altera_quadspi_flash *flash = nor->priv;
>> +	struct altera_quadspi *q = flash->q;
>> +	u_char *bitrev_buf = NULL;
>> +	const u_char *src;
>> +	u_char *dst;
>> +	size_t i;
>> +	int ret = 0;
>> +
>> +	altera_quadspi_chip_select(q, flash->bank);
>> +
>> +	if (q->flags & ALTERA_QUADSPI_FL_BITREV_WRITE) {
>> +		bitrev_buf = devm_kzalloc(q->dev, len, GFP_KERNEL);
>> +		if (!bitrev_buf)
>> +			return 0;
>> +
>> +		src = buf;
>> +		dst = bitrev_buf;
>> +		for (i = 0; i < len; i++, src++, dst++)
>> +			*dst = bitrev8(*src);
>> +
>> +		buf = bitrev_buf;
>> +	}
>> +
>> +	if (q->window_size)
>> +		altera_quadspi_windowed_write(q, to, len, buf);
>> +	else
>> +		memcpy_toio(q->data_base + to, buf, len);
>> +
>> +
>> +	if (bitrev_buf)
>> +		devm_kfree(q->dev, bitrev_buf);
>> +
>> +	ret = altera_quadspi_write_erase_check(nor, WRITE_CHECK);
>> +
>> +	return len;
>> +
>> +}
>> +
>> +static int altera_quadspi_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>> +{
>> +	struct altera_quadspi_flash *flash = nor->priv;
>> +	struct altera_quadspi *q = flash->q;
>> +	struct mtd_info *mtd = &nor->mtd;
>> +	uint32_t offset = ofs;
>> +	u32 sector_start, sector_end;
>> +	uint64_t num_sectors;
>> +	u32 mem_op;
>> +	u32 sr_bp;
>> +	u32 sr_tb;
>> +
>> +	altera_quadspi_chip_select(q, flash->bank);
>> +
>> +	sector_start = offset;
>> +	sector_end = altera_quadspi_addr_to_sector(mtd, offset + len);
>> +	num_sectors = mtd->size;
>> +	do_div(num_sectors, mtd->erasesize);
>> +
>> +	dev_dbg(nor->dev, "%s: sector start is %u,sector end is %u\n",
>> +		__func__, sector_start, sector_end);
>> +
>> +	if (sector_start >= num_sectors / 2) {
>> +		sr_bp = fls(num_sectors - 1 - sector_start) + 1;
>> +		sr_tb = 0;
>> +	} else if ((sector_end < num_sectors / 2) &&
>> +		  (q->opcode_id != EPCS_OPCODE_ID)) {
>> +		sr_bp = fls(sector_end) + 1;
>> +		sr_tb = 1;
>> +	} else {
>> +		sr_bp = 16;
>> +		sr_tb = 0;
>> +	}
>> +
>> +	mem_op = (sr_tb << 12) | (sr_bp << 8);
>> +	mem_op &= QUADSPI_MEM_OP_SECTOR_PROTECT_VALUE_MASK;
>> +	mem_op |= QUADSPI_MEM_OP_SECTOR_PROTECT_CMD;
>> +
>> +	alt_qspi_writel(mem_op, q->csr_base, QUADSPI_MEM_OP_REG);
>> +
>> +	return 0;
>> +}
>> +
>> +static int altera_quadspi_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>> +{
>> +	struct altera_quadspi_flash *flash = nor->priv;
>> +	struct altera_quadspi *q = flash->q;
>> +	u32 mem_op;
>> +
>> +	dev_dbg(nor->dev, "Unlock all protected area\n");
>> +
>> +	altera_quadspi_chip_select(q, flash->bank);
>> +
>> +	mem_op = QUADSPI_MEM_OP_SECTOR_PROTECT_CMD;
>> +	alt_qspi_writel(mem_op, q->csr_base, QUADSPI_MEM_OP_REG);
>> +
>> +	return 0;
>> +}
>> +
>> +static int altera_quadspi_setup_banks(struct device *dev,
>> +				      u32 bank, struct device_node *np)
>> +{
>> +	struct altera_quadspi *q = dev_get_drvdata(dev);
>> +	struct altera_quadspi_flash *flash;
>> +	struct spi_nor *nor;
>> +	int ret = 0;
>> +	char modalias[40] = {0};
>> +	struct spi_nor_hwcaps hwcaps = {
>> +		.mask = SNOR_HWCAPS_READ |
>> +			SNOR_HWCAPS_READ_FAST |
>> +			SNOR_HWCAPS_READ_1_1_2 |
>> +			SNOR_HWCAPS_READ_1_1_4 |
>> +			SNOR_HWCAPS_PP,
>> +	};
>
> since aletera_quadspi_{read|erase} just don't care about
> nor->read_opcode, nor->program_opcode and so on and anyway override all
> settings chosen by spi-nor.c, it means they will use Dual or Quad SPI
> controllers as they want, whether SNOR_HWCAPS_READ_1_1_{2|4} are set or not.
> Then I think it's risky to declare the READ_1_1_2 and READ_1_1_4 hwcaps
> because it may trigger additionnal calls of nor->read_reg() /
> nor->write_reg() from spi_nor_scan() with op codes not supported by
> altera_quadspi_{read|write}_reg().
>
>> +
>> +	if (bank > q->num_flashes - 1)
>> +		return -EINVAL;
>> +
>> +	altera_quadspi_chip_select(q, bank);
>> +
>> +	flash = devm_kzalloc(q->dev, sizeof(*flash), GFP_KERNEL);
>> +	if (!flash)
>> +		return -ENOMEM;
>> +
>> +	q->flash[bank] = flash;
>> +	nor = &flash->nor;
>> +	nor->dev = dev;
>> +	nor->priv = flash;
>> +	nor->mtd.priv = nor;
>> +	flash->q = q;
>> +	flash->bank = bank;
>> +	spi_nor_set_flash_node(nor, np);
>> +
>> +	/* spi nor framework*/
>> +	nor->read_reg = altera_quadspi_read_reg;
>> +	nor->write_reg = altera_quadspi_write_reg;
>> +	nor->read = altera_quadspi_read;
>> +	nor->write = altera_quadspi_write;
>> +	nor->erase = altera_quadspi_erase;
>> +	nor->flash_lock = altera_quadspi_lock;
>> +	nor->flash_unlock = altera_quadspi_unlock;
>
> nor->flash_lock and nor->flash_unlock are described as "FLASH SPECIFIC"
> in include/linux/mtd/spi-nor.h as opposed to "DRIVER SPECIFIC" functions
> like nor->read, nor->read_reg, ...
>
> It means the actual implementations should be provided by the spi-nor
> sub-system but not by each SPI controller driver.
>
>
>
> For me, it really sounds like a bad idea that this driver tries so much
> to mystify the spi-nor sub-system.

I aggree.  This driver is doing to much of the work that the spi layer 
should be doing.  It is in my best interest to let the spi-nor layer do as 
much as possible.

>
> I can understand that you have to cope with the hardware design and its
> limitations but clearly it looks the spi-nor API is not suited to this
> hardware. This driver ignores and by-passes any settings selected by
> spi_nor_scan().
> Duplicating code is generally a bad idea but in this case, I don't know
> if trying to reuse spi_nor_read() / spi_nor_write() and spi_nor_erase()
> from spi-nor.c is that helpful.

The component is an FPGA component; so i should be able to get it "fixed" 
to work properly.

>
> Why not directly plug your driver into the above mtd layer implementing
> you own version of mtd->_read(), mtd->_write() and mtd->_erase() then
> registering the mtd device? It may be not the way to go but at least we
> should study this alternative.

I aggree this alternative should be explored.


>
> *IF* I have understood the hardware constraints of the Altera Quad SPI
> controller and what this driver tries to discover by calling
> spi_nor_scan(), I think you actually don't need spi_nor_scan() but only
> to have access to the spi_nor_ids[] array to initialize mtd->erasesize
> with info->sector_size. Am I right?
>
> Then why not just exporting spi_nor_ids[] so your driver could directly
> search into this table to get the pieces of information it needs?
>
> I'm not confortable with the idea of a driver pretending to be compliant
> with the API of spi-nor when obviously it is not.
>
> Even if the Altera hardware looks really limited, I think we can still
> try to help you finding a solution to add its support into mainline but
> I would like to find a solution with less "hacks" because I'm pretty
> sure that if we let pass a driver like this one, it would often be
> broken and it would be a real pain to maintain.

I would like to find a solution with less "hacks" too because I don't want 
to spend a lot of time maintaining the hacks.

>
> Besides, I generally claim that SPI controller drivers should not use
> SPINOR_OP_* macros because when they do so, they almost always try to
> implement some kind of hack/by-pass of the spi-nor sub-system and the
> result is maintainance issues when we update or add new features in
> spi-nor.{c|h}.
>
> IMHO, this driver goes in the wrong direction. Marek, do have an idea of
> a better/cleaner solution to add support to Altera hardware in mainline?

OK, I get that this going in the wrong.  I would like to "turn it around" 
and go in the right direction.

>
> Best regards,
>
> Cyrille
>
>> +
>> +	/* scanning flash and checking dev id */
>> +#ifdef CONFIG_OF
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
>> +	altera_quadspi_unlock(nor, 0, 0);
>> +
>> +	return ret;
>> +}
>> +
>> +int altera_quadspi_create(struct device *dev, void __iomem *csr_base,
>> +			  void __iomem *data_base, void __iomem *window_base,
>> +			  size_t window_size, u32 flags)
>> +{
>> +	struct altera_quadspi *q;
>> +
>> +	q = devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
>> +	if (!q)
>> +		return -ENOMEM;
>> +
>> +	q->dev = dev;
>> +	q->csr_base = csr_base;
>> +	q->data_base = data_base;
>> +	q->window_base = window_base;
>> +	q->window_size = window_size;
>> +
>> +	q->flags = flags;
>> +
>> +	dev_set_drvdata(dev, q);
>> +
>> +	dev_dbg(dev, "%s SR=0x%x FSR=0x%x\n", __func__,
>> +		alt_qspi_readl(q->csr_base, QUADSPI_SR_REG),
>> +		alt_qspi_readl(q->csr_base, QUADSPI_FLAG_STATUS_REG));
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(altera_quadspi_create);
>> +
>> +int altera_qspi_add_bank(struct device *dev,
>> +			 u32 bank, struct device_node *np)
>> +{
>> +	struct altera_quadspi *q = dev_get_drvdata(dev);
>> +
>> +	if (q->num_flashes >= ALTERA_QUADSPI_MAX_NUM_FLASH_CHIP)
>> +		return -ENOMEM;
>> +
>> +	q->num_flashes++;
>> +
>> +	return altera_quadspi_setup_banks(dev, bank, np);
>> +}
>> +EXPORT_SYMBOL_GPL(altera_qspi_add_bank);
>> +
>> +int altera_quadspi_remove_banks(struct device *dev)
>> +{
>> +	struct altera_quadspi *q = dev_get_drvdata(dev);
>> +	struct altera_quadspi_flash *flash;
>> +	int i;
>> +	int ret = 0;
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
>> +EXPORT_SYMBOL_GPL(altera_quadspi_remove_banks);
>> +
>> +MODULE_AUTHOR("Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>");
>> +MODULE_AUTHOR("Yong Sern Lau <lau.yong.sern-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>");
>> +MODULE_AUTHOR("Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>");
>> +MODULE_DESCRIPTION("Altera QuadSPI Version 2 Driver");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/include/linux/mtd/altera-quadspi.h b/include/linux/mtd/altera-quadspi.h
>> new file mode 100644
>> index 0000000..58f31ee
>> --- /dev/null
>> +++ b/include/linux/mtd/altera-quadspi.h
>> @@ -0,0 +1,28 @@
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
>> +#define ALTERA_QUADSPI_FL_BITREV_READ BIT(0)
>> +#define ALTERA_QUADSPI_FL_BITREV_WRITE BIT(1)
>> +
>> +#define ALTERA_QUADSPI_MAX_NUM_FLASH_CHIP 3
>> +
>> +int altera_quadspi_create(struct device *dev, void __iomem *csr_base,
>> +			  void __iomem *data_base, void __iomem *window_reg,
>> +			  size_t window_size, u32 flags);
>> +
>> +int altera_qspi_add_bank(struct device *dev,
>> +			 u32 bank, struct device_node *np);
>> +
>> +int altera_quadspi_remove_banks(struct device *dev);
>> +#endif
>>
>
>
--8323329-1779773493-1499265291=:2639--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
