From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/4] mtd: spi-nor: add memory controllers for the
 Aspeed AST2500 SoC
Date: Tue, 20 Dec 2016 16:17:32 +0100
Message-ID: <2bec1e91-a196-b894-fb66-590b8f4f35c3@atmel.com>
References: <1481557252-13656-1-git-send-email-clg@kaod.org>
 <1481557252-13656-2-git-send-email-clg@kaod.org>
 <5566c62d-cc72-f207-e1dd-5a59e6947c24@wedev4u.fr>
 <a7cb781c-a4a8-f0f7-e7db-5cd9f19da0aa@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a7cb781c-a4a8-f0f7-e7db-5cd9f19da0aa-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 16/12/2016 à 15:56, Cédric Le Goater a écrit :
> Hello Cyrille,
> 
> On 12/16/2016 12:15 AM, Cyrille Pitchen wrote:
>> Hi Cedric,
>>
>> Le 12/12/2016 à 16:40, Cédric Le Goater a écrit :
>>> This driver adds mtd support for the Aspeed AST2500 SoC static memory
>>> controllers :
>>>
>>>  * Firmware SPI Memory Controller (FMC)
>>>    . BMC firmware
>>>    . 3 chip select pins (CE0 ~ CE2)
>>>    . supports SPI type flash memory (CE0-CE1)
>>>    . CE2 can be of NOR type flash but this is not supported by the
>>>      driver
>>>
>>>  * SPI Flash Controller (SPI1 and SPI2)
>>>    . host firmware
>>>    . 2 chip select pins (CE0 ~ CE1)
>>>    . supports SPI type flash memory
>>>
>>> Each controller has a memory range on which it maps its flash module
>>> slaves. Each slave is assigned a memory window for its mapping that
>>> can be changed at bootime with the Segment Address Register.
>>>
>>> Each SPI flash slave can then be accessed in two modes: Command and
>>> User. When in User mode, accesses to the memory segment of the slaves
>>> are translated in SPI transfers. When in Command mode, the HW
>>> generates the SPI commands automatically and the memory segment is
>>> accessed as if doing a MMIO.
>>>
>>> Currently, only the User mode is supported. Command mode needs a
>>> little more work to check that the memory window on the AHB bus fits
>>> the module size.
>>>
>>> Based on previous work from Milton D. Miller II <miltonm-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
>>>
>>> Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
>>> Reviewed-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
>>> ---
>>>
>>> Changes since v3:
>>>  - reworked IO routines to use io{read,write}32_rep
>>>  - changed config option to SPI_ASPEED_SMC
>>>  - fixed aspeed_smc_chip_setup_init() returned value
>>>  - merged the use of the "label" property"
>>>
>>>  drivers/mtd/spi-nor/Kconfig      |  10 +
>>>  drivers/mtd/spi-nor/Makefile     |   1 +
>>>  drivers/mtd/spi-nor/aspeed-smc.c | 719 +++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 730 insertions(+)
>>>  create mode 100644 drivers/mtd/spi-nor/aspeed-smc.c
>>>
>>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
>>> index 4a682ee0f632..42168e9d6097 100644
>>> --- a/drivers/mtd/spi-nor/Kconfig
>>> +++ b/drivers/mtd/spi-nor/Kconfig
>>> @@ -29,6 +29,16 @@ config MTD_SPI_NOR_USE_4K_SECTORS
>>>  	  Please note that some tools/drivers/filesystems may not work with
>>>  	  4096 B erase size (e.g. UBIFS requires 15 KiB as a minimum).
>>>  
>>> +config SPI_ASPEED_SMC
>>> +	tristate "Aspeed flash controllers in SPI mode"
>>> +	depends on ARCH_ASPEED || COMPILE_TEST
>>> +	depends on HAS_IOMEM && OF
>>> +	help
>>> +	  This enables support for the Firmware Memory controller (FMC)
>>> +	  in the Aspeed AST2500 SoC when attached to SPI NOR chips,
>>> +	  and support for the SPI flash memory controller (SPI) for
>>> +	  the host firmware. The implementation only supports SPI NOR.
>>> +
>>>  config SPI_ATMEL_QUADSPI
>>>  	tristate "Atmel Quad SPI Controller"
>>>  	depends on ARCH_AT91 || (ARM && COMPILE_TEST)
>>> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
>>> index 121695e83542..6ff64bc7fa0e 100644
>>> --- a/drivers/mtd/spi-nor/Makefile
>>> +++ b/drivers/mtd/spi-nor/Makefile
>>> @@ -1,4 +1,5 @@
>>>  obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
>>> +obj-$(CONFIG_SPI_ASPEED_SMC)	+= aspeed-smc.o
>>>  obj-$(CONFIG_SPI_ATMEL_QUADSPI)	+= atmel-quadspi.o
>>>  obj-$(CONFIG_SPI_CADENCE_QUADSPI)	+= cadence-quadspi.o
>>>  obj-$(CONFIG_SPI_FSL_QUADSPI)	+= fsl-quadspi.o
>>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>>> new file mode 100644
>>> index 000000000000..2667ab7aeb9b
>>> --- /dev/null
>>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>>> @@ -0,0 +1,719 @@
>>> +/*
>>> + * ASPEED Static Memory Controller driver
>>> + *
>>> + * Copyright (c) 2015-2016, IBM Corporation.
>>> + *
>>> + * This program is free software; you can redistribute it and/or
>>> + * modify it under the terms of the GNU General Public License
>>> + * as published by the Free Software Foundation; either version
>>> + * 2 of the License, or (at your option) any later version.
>>> + */
>>> +
>>> +#include <linux/bug.h>
>>> +#include <linux/device.h>
>>> +#include <linux/io.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/mtd/mtd.h>
>>> +#include <linux/mtd/partitions.h>
>>> +#include <linux/mtd/spi-nor.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_platform.h>
>>> +#include <linux/sysfs.h>
>>> +
>>> +#define DEVICE_NAME	"aspeed-smc"
>>> +
>>> +/*
>>> + * The driver only support SPI flash
>>> + */
>>> +enum aspeed_smc_flash_type {
>>> +	smc_type_nor  = 0,
>>> +	smc_type_nand = 1,
>>> +	smc_type_spi  = 2,
>>> +};
>>> +
>>> +struct aspeed_smc_chip;
>>> +
>>> +struct aspeed_smc_info {
>>> +	u32 maxsize;		/* maximum size of chip window */
>>> +	u8 nce;			/* number of chip enables */
>>> +	bool hastype;		/* flash type field exists in config reg */
>>> +	u8 we0;			/* shift for write enable bit for CE0 */
>>> +	u8 ctl0;		/* offset in regs of ctl for CE0 */
>>> +
>>> +	void (*set_4b)(struct aspeed_smc_chip *chip);
>>> +};
>>> +
>>> +static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip);
>>> +
>>> +static const struct aspeed_smc_info fmc_2500_info = {
>>> +	.maxsize = 256 * 1024 * 1024,
>>> +	.nce = 3,
>>> +	.hastype = true,
>>> +	.we0 = 16,
>>> +	.ctl0 = 0x10,
>>> +	.set_4b = aspeed_smc_chip_set_4b,
>>> +};
>>> +
>>> +static const struct aspeed_smc_info spi_2500_info = {
>>> +	.maxsize = 128 * 1024 * 1024,
>>> +	.nce = 2,
>>> +	.hastype = false,
>>> +	.we0 = 16,
>>> +	.ctl0 = 0x10,
>>> +	.set_4b = aspeed_smc_chip_set_4b,
>>> +};
>>> +
>>> +enum aspeed_smc_ctl_reg_value {
>>> +	smc_base,		/* base value without mode for other commands */
>>> +	smc_read,		/* command reg for (maybe fast) reads */
>>> +	smc_write,		/* command reg for writes */
>>> +	smc_max,
>>> +};
>>> +
>>> +struct aspeed_smc_controller;
>>> +
>>> +struct aspeed_smc_chip {
>>> +	int cs;
>>> +	struct aspeed_smc_controller *controller;
>>> +	void __iomem *ctl;			/* control register */
>>> +	void __iomem *ahb_base;			/* base of chip window */
>>> +	u32 ctl_val[smc_max];			/* control settings */
>>> +	enum aspeed_smc_flash_type type;	/* what type of flash */
>>> +	struct spi_nor nor;
>>> +};
>>> +
>>> +struct aspeed_smc_controller {
>>> +	struct device *dev;
>>> +
>>> +	struct mutex mutex;			/* controller access mutex */
>>> +	const struct aspeed_smc_info *info;	/* type info of controller */
>>> +	void __iomem *regs;			/* controller registers */
>>> +	void __iomem *ahb_base;			/* per-chip windows resource */
>>> +
>>> +	struct aspeed_smc_chip *chips[0];	/* pointers to attached chips */
>>> +};
>>> +
>>> +/*
>>> + * SPI Flash Configuration Register (AST2500 SPI)
>>> + *     or
>>> + * Type setting Register (AST2500 FMC).
>>> + * CE0 and CE1 can only be of type SPI. CE2 can be of type NOR but the
>>> + * driver does not support it.
>>> + */
>>> +#define CONFIG_REG			0x0
>>> +#define CONFIG_DISABLE_LEGACY		BIT(31) /* 1 */
>>> +
>>> +#define CONFIG_CE2_WRITE		BIT(18)
>>> +#define CONFIG_CE1_WRITE		BIT(17)
>>> +#define CONFIG_CE0_WRITE		BIT(16)
>>> +
>>> +#define CONFIG_CE2_TYPE			BIT(4) /* AST2500 FMC only */
>>> +#define CONFIG_CE1_TYPE			BIT(2) /* AST2500 FMC only */
>>> +#define CONFIG_CE0_TYPE			BIT(0) /* AST2500 FMC only */
>>> +
>>> +/*
>>> + * CE Control Register
>>> + */
>>> +#define CE_CONTROL_REG			0x4
>>> +
>>> +/*
>>> + * CEx Control Register
>>> + */
>>> +#define CONTROL_AAF_MODE		BIT(31)
>>> +#define CONTROL_IO_MODE_MASK		GENMASK(30, 28)
>>> +#define CONTROL_IO_DUAL_DATA		BIT(29)
>>> +#define CONTROL_IO_DUAL_ADDR_DATA	(BIT(29) | BIT(28))
>>> +#define CONTROL_IO_QUAD_DATA		BIT(30)
>>> +#define CONTROL_IO_QUAD_ADDR_DATA	(BIT(30) | BIT(28))
>>> +#define CONTROL_CE_INACTIVE_SHIFT	24
>>> +#define CONTROL_CE_INACTIVE_MASK	GENMASK(27, \
>>> +					CONTROL_CE_INACTIVE_SHIFT)
>>> +/* 0 = 16T ... 15 = 1T   T=HCLK */
>>> +#define CONTROL_COMMAND_SHIFT		16
>>> +#define CONTROL_DUMMY_COMMAND_OUT	BIT(15)
>>> +#define CONTROL_IO_DUMMY_HI		BIT(14)
>>> +#define CONTROL_IO_DUMMY_HI_SHIFT	14
>>> +#define CONTROL_CLK_DIV4		BIT(13) /* others */
>>> +#define CONTROL_RW_MERGE		BIT(12)
>>> +#define CONTROL_IO_DUMMY_LO_SHIFT	6
>>> +#define CONTROL_IO_DUMMY_LO		GENMASK(7, \
>>> +						CONTROL_IO_DUMMY_LO_SHIFT)
>>> +#define CONTROL_IO_DUMMY_MASK		(CONTROL_IO_DUMMY_HI | \
>>> +					 CONTROL_IO_DUMMY_LO)
>>> +#define CONTROL_IO_DUMMY_SET(dummy)				 \
>>> +	(((((dummy) >> 2) & 0x1) << CONTROL_IO_DUMMY_HI_SHIFT) | \
>>> +	 (((dummy) & 0x3) << CONTROL_IO_DUMMY_LO_SHIFT))
>>> +
>>> +#define CONTROL_CLOCK_FREQ_SEL_SHIFT	8
>>> +#define CONTROL_CLOCK_FREQ_SEL_MASK	GENMASK(11, \
>>> +						CONTROL_CLOCK_FREQ_SEL_SHIFT)
>>> +#define CONTROL_LSB_FIRST		BIT(5)
>>> +#define CONTROL_CLOCK_MODE_3		BIT(4)
>>> +#define CONTROL_IN_DUAL_DATA		BIT(3)
>>> +#define CONTROL_CE_STOP_ACTIVE_CONTROL	BIT(2)
>>> +#define CONTROL_COMMAND_MODE_MASK	GENMASK(1, 0)
>>> +#define CONTROL_COMMAND_MODE_NORMAL	0
>>> +#define CONTROL_COMMAND_MODE_FREAD	1
>>> +#define CONTROL_COMMAND_MODE_WRITE	2
>>> +#define CONTROL_COMMAND_MODE_USER	3
>>> +
>>> +#define CONTROL_KEEP_MASK						\
>>> +	(CONTROL_AAF_MODE | CONTROL_CE_INACTIVE_MASK | CONTROL_CLK_DIV4 | \
>>> +	 CONTROL_IO_DUMMY_MASK | CONTROL_CLOCK_FREQ_SEL_MASK |		\
>>> +	 CONTROL_LSB_FIRST | CONTROL_CLOCK_MODE_3)
>>> +
>>> +/*
>>> + * The Segment Register uses a 8MB unit to encode the start address
>>> + * and the end address of the mapping window of a flash SPI slave :
>>> + *
>>> + *        | byte 1 | byte 2 | byte 3 | byte 4 |
>>> + *        +--------+--------+--------+--------+
>>> + *        |  end   |  start |   0    |   0    |
>>> + */
>>> +#define SEGMENT_ADDR_REG0		0x30
>>> +#define SEGMENT_ADDR_START(_r)		((((_r) >> 16) & 0xFF) << 23)
>>> +#define SEGMENT_ADDR_END(_r)		((((_r) >> 24) & 0xFF) << 23)
>>> +
>>> +/*
>>> + * In user mode all data bytes read or written to the chip decode address
>>> + * range are transferred to or from the SPI bus. The range is treated as a
>>> + * fifo of arbitratry 1, 2, or 4 byte width but each write has to be aligned
>>> + * to its size. The address within the multiple 8kB range is ignored when
>>> + * sending bytes to the SPI bus.
>>> + *
>>> + * On the arm architecture, as of Linux version 4.3, memcpy_fromio and
>>> + * memcpy_toio on little endian targets use the optimized memcpy routines
>>> + * that were designed for well behavied memory storage. These routines
>>> + * have a stutter if the source and destination are not both word aligned,
>>> + * once with a duplicate access to the source after aligning to the
>>> + * destination to a word boundary, and again with a duplicate access to
>>> + * the source when the final byte count is not word aligned.
>>> + *
>>> + * When writing or reading the fifo this stutter discards data or sends
>>> + * too much data to the fifo and can not be used by this driver.
>>> + *
>>> + * While the low level io string routines that implement the insl family do
>>> + * the desired accesses and memory increments, the cross architecture io
>>> + * macros make them essentially impossible to use on a memory mapped address
>>> + * instead of a a token from the call to iomap of an io port.
>>> + *
>>> + * These fifo routines use readl and friends to a constant io port and update
>>> + * the memory buffer pointer and count via explicit code. The final updates
>>> + * to len are optimistically suppressed.
>>> + */
>>> +static int aspeed_smc_read_from_ahb(void *buf, const void __iomem *src,
>>> +				    size_t len)
>>> +{
>>> +	if (IS_ALIGNED((uintptr_t)src, sizeof(uintptr_t)) &&
>>> +	    IS_ALIGNED((uintptr_t)buf, sizeof(uintptr_t)) &&
>>> +	    IS_ALIGNED(len, sizeof(u32))) {
>>> +		ioread32_rep(src, buf, len >> 2);
>>> +	} else {
>>> +		ioread8_rep(src, buf, len);
>>> +	}
>>> +	return 0;
>>> +}
>>> +
>>
>> Maybe It might be something like:
>>
>> 	size_t offset = 0;
>>
>> 	if (IS_ALIGNED((uintptr_t)src, sizeof(uintptr_t)) &&
>> 	    IS_ALIGNED((uintptr_t)buf, sizeof(uintptr_t))) {
>> 		ioread32_rep(src, buf, len >> 2);
>> 		offset = len & ~0x3;
>> 		len -= offset;
>> 	}
>> 	ioread8_rep(src, (const u8 *)buf + offset, len);
> 
> yes. We had an earlier version doing something similar, not as well 
> crafted tough.
> 
>> I assume the Aspeed SPI controller allows to read as much 32-bit words
>> as possible before reading the remaining bytes.
> 
> yes.
> 
>> This is just a suggested optimization, no need to use it if you don't
>> want to.
> 
> well, it depends if there is a v4. If so, I will.
>  
>> In v3, with readl()/readb(), you used to increment both src and buf in
>> your while() loop but now with ioreadX_rep() only buf is incremented: it
>> always reads from src without incrementing this latest address.
>>
>> I guess it means that the Aspeed SPI controller doesn't care of the
>> actual value of src as long as it lays inside the chip address range.
> 
> yes :) in 'User' mode, the address has no meaning. 
> 
> The previous routine was practical to cover both mode: the currently 
> supported 'User' mode in which we read/write the ops in the memory window
> of the flash, and the 'Command' mode in which we read/write directly the 
> flash contents from the AHB bus. This mode requires a preliminary setup
> of the CEx Control Register, which is what the ctl_val field is for.
> 
> We have postponed 'Command' mode for the moment because we have flash 
> modules which exceed the maximum window size on some boards, and 'Command' 
> mode does not work in that case. Covering this mode and these special 
> cases needs more work. 'User' mode is simpler to start with but the code 
> prepares ground for the other mode.
> 
>> This is what you explain in the 1st paragraph of the comment, isn't it?
> 
> yes. That might be a little outdated. 
> 
>>> +static int aspeed_smc_write_to_ahb(void __iomem *dst, const void *buf,
>>> +				   size_t len)
>>> +{
>>> +	if (IS_ALIGNED((uintptr_t)dst, sizeof(uintptr_t)) &&
>>> +	    IS_ALIGNED((uintptr_t)buf, sizeof(uintptr_t)) &&
>>> +	    IS_ALIGNED(len, sizeof(u32))) {
>>> +		iowrite32_rep(dst, buf, len >> 2);
>>> +	} else {
>>> +		iowrite8_rep(dst, buf, len);
>>> +	}
>>> +	return 0;
>>> +}
>>> +
>>> +static inline u32 aspeed_smc_chip_write_bit(struct aspeed_smc_chip *chip)
>>> +{
>>> +	return BIT(chip->controller->info->we0 + chip->cs);
>>> +}
>>> +
>>> +static void aspeed_smc_chip_check_config(struct aspeed_smc_chip *chip)
>>> +{
>>> +	struct aspeed_smc_controller *controller = chip->controller;
>>> +	u32 reg;
>>> +
>>> +	reg = readl(controller->regs + CONFIG_REG);
>>> +
>>> +	if (reg & aspeed_smc_chip_write_bit(chip))
>>> +		return;
>>> +
>>> +	dev_dbg(controller->dev, "config write is not set ! @%p: 0x%08x\n",
>>> +		controller->regs + CONFIG_REG, reg);
>>> +	reg |= aspeed_smc_chip_write_bit(chip);
>>> +	writel(reg, controller->regs + CONFIG_REG);
>>> +}
>>> +
>>> +static void aspeed_smc_start_user(struct spi_nor *nor)
>>> +{
>>> +	struct aspeed_smc_chip *chip = nor->priv;
>>> +	u32 ctl = chip->ctl_val[smc_base];
>>> +
>>> +	/*
>>> +	 * When the chip is controlled in user mode, we need write
>>> +	 * access to send the opcodes to it. So check the config.
>>> +	 */
>>> +	aspeed_smc_chip_check_config(chip);
>>> +
>>> +	ctl |= CONTROL_COMMAND_MODE_USER |
>>> +		CONTROL_CE_STOP_ACTIVE_CONTROL;
>>> +	writel(ctl, chip->ctl);
>>> +
>>> +	ctl &= ~CONTROL_CE_STOP_ACTIVE_CONTROL;
>>> +	writel(ctl, chip->ctl);
>>> +}
>>> +
>>> +static void aspeed_smc_stop_user(struct spi_nor *nor)
>>> +{
>>> +	struct aspeed_smc_chip *chip = nor->priv;
>>> +
>>> +	u32 ctl = chip->ctl_val[smc_read];
>>> +	u32 ctl2 = ctl | CONTROL_COMMAND_MODE_USER |
>>> +		CONTROL_CE_STOP_ACTIVE_CONTROL;
>>> +
>>> +	writel(ctl2, chip->ctl);	/* stop user CE control */
>>> +	writel(ctl, chip->ctl);		/* default to fread or read mode */
>>> +}
>>> +
>>
>> This driver seems to use only the "USER" mode so why do you go back the
>> the "FREAD" or "READ" modes at the very end of aspeed_smc_stop_user() as
>> the comment suggests?
>>
>> Do you plan to implement other modes later? 
> 
> yes. I would like to, I have some code for it already but there some
> little issues as said above.
> 
>> Can't you just stay in "USER" mode? 
> 
> well, yes. we are also preparing ground for the Command mode and 
> the DMA support.
> 
>> I guess you just need the chip-select control part.
> 
> yes.
> 
>>> +static int aspeed_smc_prep(struct spi_nor *nor, enum spi_nor_ops ops)
>>> +{
>>> +	struct aspeed_smc_chip *chip = nor->priv;
>>> +
>>> +	mutex_lock(&chip->controller->mutex);
>>> +	return 0;
>>> +}
>>> +
>>> +static void aspeed_smc_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
>>> +{
>>> +	struct aspeed_smc_chip *chip = nor->priv;
>>> +
>>> +	mutex_unlock(&chip->controller->mutex);
>>> +}
>>> +
>>> +static int aspeed_smc_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
>>> +{
>>> +	struct aspeed_smc_chip *chip = nor->priv;
>>> +
>>> +	aspeed_smc_start_user(nor);
>>> +	aspeed_smc_write_to_ahb(chip->ahb_base, &opcode, 1);
>>> +	aspeed_smc_read_from_ahb(buf, chip->ahb_base, len);
>>> +	aspeed_smc_stop_user(nor);
>>> +	return 0;
>>> +}
>>> +
>>> +static int aspeed_smc_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
>>> +				int len)
>>> +{
>>> +	struct aspeed_smc_chip *chip = nor->priv;
>>> +
>>> +	aspeed_smc_start_user(nor);
>>> +	aspeed_smc_write_to_ahb(chip->ahb_base, &opcode, 1);
>>> +	aspeed_smc_write_to_ahb(chip->ahb_base, buf, len);
>>> +	aspeed_smc_stop_user(nor);
>>> +	return 0;
>>> +}
>>> +
>>> +static void aspeed_smc_send_cmd_addr(struct spi_nor *nor, u8 cmd, u32 addr)
>>> +{
>>> +	struct aspeed_smc_chip *chip = nor->priv;
>>> +	__be32 temp;
>>> +	u32 cmdaddr;
>>> +
>>> +	switch (nor->addr_width) {
>>> +	default:
>>> +		WARN_ONCE(1, "Unexpected address width %u, defaulting to 3\n",
>>> +			  nor->addr_width);
>>> +		/* FALLTHROUGH */
>>> +	case 3:
>>> +		cmdaddr = addr & 0xFFFFFF;
>>> +		cmdaddr |= cmd << 24;
>>> +
>>> +		temp = cpu_to_be32(cmdaddr);
>>> +		aspeed_smc_write_to_ahb(chip->ahb_base, &temp, 4);
>>> +		break;
>>> +	case 4:
>>> +		temp = cpu_to_be32(addr);
>>> +		aspeed_smc_write_to_ahb(chip->ahb_base, &cmd, 1);
>>> +		aspeed_smc_write_to_ahb(chip->ahb_base, &temp, 4);
>>> +		break;
>>> +	}
>>> +}
>>> +
>>> +static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
>>> +				    size_t len, u_char *read_buf)
>>> +{
>>> +	struct aspeed_smc_chip *chip = nor->priv;
>>> +
>>> +	aspeed_smc_start_user(nor);
>>> +	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
>>
>> Here, please check nor->read_dummy to write the relevant number dummy
>> bytes between the address and data cycles.
>>
>> It should not need too much work to add support to the dummy clock
>> cycles and it's more reliable/safe.
>>
>> Indeed, even if you call the current spi_nor_scan() function with the
>> enum read_mode SPI_NOR_NORMAL value, this function just doesn't care and
>> selects the Fast Read (0Bh) command instead of the Read (03h) command
>> for nor->read_opcode if the "m25p,fast-read" DT property is set.
>>
>> So if any end user sets this property in a custom DT,
>> aspeed_smc_read_user() would just fail.
>>
>> Hence I think it's worth dealing with dummy cycles now rather than later.
>>
>> Actually all (Fast) Read commands but the legacy Read (03h) command need
>> dummy cycles. So the Read SFDP (5Ah) command does.
>>
>> For all the (Q)SPI memories I've seen till now, the default factory
>> settings for the number of dummy cycles are chosen so it always
>> corresponds to entire bytes, whatever the SPI protocol is (SPI 1-1-2,
>> 1-2-2, 1-1-4, 1-4-4, ...).
>>
>> Besides, I recommend you use the 0xFF value for dummy cycles: this value
>> prevents the memory from entering its continuous mode by mistake.
>> The 0xFF value works for all manufacturers. The SFDP specification seems
>> to confirm that.
> 
> OK. I will take a closer look at that. 
> 
>>
>>> +	aspeed_smc_read_from_ahb(read_buf, chip->ahb_base, len);
>>> +	aspeed_smc_stop_user(nor);
>>> +	return len;
>>> +}
>>> +
>>> +static ssize_t aspeed_smc_write_user(struct spi_nor *nor, loff_t to,
>>> +				     size_t len, const u_char *write_buf)
>>> +{
>>> +	struct aspeed_smc_chip *chip = nor->priv;
>>> +
>>> +	aspeed_smc_start_user(nor);
>>> +	aspeed_smc_send_cmd_addr(nor, nor->program_opcode, to);
>>> +	aspeed_smc_write_to_ahb(chip->ahb_base, write_buf, len);
>>> +	aspeed_smc_stop_user(nor);
>>> +	return len;
>>> +}
>>> +
>>> +static int aspeed_smc_unregister(struct aspeed_smc_controller *controller)
>>> +{
>>> +	struct aspeed_smc_chip *chip;
>>> +	int n;
>>> +
>>> +	for (n = 0; n < controller->info->nce; n++) {
>>> +		chip = controller->chips[n];
>>> +		if (chip)
>>> +			mtd_device_unregister(&chip->nor.mtd);
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int aspeed_smc_remove(struct platform_device *dev)
>>> +{
>>> +	return aspeed_smc_unregister(platform_get_drvdata(dev));
>>> +}
>>> +
>>> +static const struct of_device_id aspeed_smc_matches[] = {
>>> +	{ .compatible = "aspeed,ast2500-fmc", .data = &fmc_2500_info },
>>> +	{ .compatible = "aspeed,ast2500-spi", .data = &spi_2500_info },
>>> +	{ }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, aspeed_smc_matches);
>>> +
>>> +/*
>>> + * Each chip has a mapping window defined by a segment address
>>> + * register defining a start and an end address on the AHB bus. These
>>> + * addresses can be configured to fit the chip size and offer a
>>> + * contiguous memory region across chips. For the moment, we only
>>> + * check that each chip segment is valid.
>>> + */
>>> +static void __iomem *aspeed_smc_chip_base(struct aspeed_smc_chip *chip,
>>> +					  struct resource *res)
>>> +{
>>> +	struct aspeed_smc_controller *controller = chip->controller;
>>> +	u32 offset = 0;
>>> +	u32 reg;
>>> +
>>> +	if (controller->info->nce > 1) {
>>> +		reg = readl(controller->regs + SEGMENT_ADDR_REG0 +
>>> +			    chip->cs * 4);
>>> +
>>> +		if (SEGMENT_ADDR_START(reg) >= SEGMENT_ADDR_END(reg))
>>> +			return NULL;
>>> +
>>> +		offset = SEGMENT_ADDR_START(reg) - res->start;
>>> +	}
>>> +
>>> +	return controller->ahb_base + offset;
>>> +}
>>> +
>>> +static void aspeed_smc_chip_enable_write(struct aspeed_smc_chip *chip)
>>> +{
>>> +	struct aspeed_smc_controller *controller = chip->controller;
>>> +	u32 reg;
>>> +
>>> +	reg = readl(controller->regs + CONFIG_REG);
>>> +
>>> +	reg |= aspeed_smc_chip_write_bit(chip);
>>> +	writel(reg, controller->regs + CONFIG_REG);
>>> +}
>>> +
>>> +static void aspeed_smc_chip_set_type(struct aspeed_smc_chip *chip, int type)
>>> +{
>>> +	struct aspeed_smc_controller *controller = chip->controller;
>>> +	u32 reg;
>>> +
>>> +	chip->type = type;
>>> +
>>> +	reg = readl(controller->regs + CONFIG_REG);
>>> +	reg &= ~(3 << (chip->cs * 2));
>>> +	reg |= chip->type << (chip->cs * 2);
>>> +	writel(reg, controller->regs + CONFIG_REG);
>>> +}
>>> +
>>> +/*
>>> + * The AST2500 FMC flash controller should be strapped by hardware, or
>>> + * autodetected, but the AST2500 SPI flash needs to be set.
>>> + */
>>> +static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip)
>>> +{
>>> +	struct aspeed_smc_controller *controller = chip->controller;
>>> +	u32 reg;
>>> +
>>> +	if (chip->controller->info == &spi_2500_info) {
>>> +		reg = readl(controller->regs + CE_CONTROL_REG);
>>> +		reg |= 1 << chip->cs;
>>> +		writel(reg, controller->regs + CE_CONTROL_REG);
>>> +	}
>>> +}
>>> +
>>> +static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
>>> +				      struct resource *res)
>>> +{
>>> +	struct aspeed_smc_controller *controller = chip->controller;
>>> +	const struct aspeed_smc_info *info = controller->info;
>>> +	u32 reg, base_reg;
>>> +
>>> +	/*
>>> +	 * Always turn on the write enable bit to allow opcodes to be
>>> +	 * sent in user mode.
>>> +	 */
>>> +	aspeed_smc_chip_enable_write(chip);
>>> +
>>> +	/* The driver only supports SPI type flash */
>>> +	if (info->hastype)
>>> +		aspeed_smc_chip_set_type(chip, smc_type_spi);
>>> +
>>> +	/*
>>> +	 * Configure chip base address in memory
>>> +	 */
>>> +	chip->ahb_base = aspeed_smc_chip_base(chip, res);
>>> +	if (!chip->ahb_base) {
>>> +		dev_warn(chip->nor.dev, "CE segment window closed.\n");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	/*
>>> +	 * Get value of the inherited control register. U-Boot usually
>>> +	 * does some timing calibration on the FMC chip, so it's good
>>> +	 * to keep them. In the future, we should handle calibration
>>> +	 * from Linux.
>>> +	 */
>>> +	reg = readl(chip->ctl);
>>> +	dev_dbg(controller->dev, "control register: %08x\n", reg);
>>> +
>>> +	base_reg = reg & CONTROL_KEEP_MASK;
>>> +	if (base_reg != reg) {
>>> +		dev_info(controller->dev,
>>> +			 "control register changed to: %08x\n",
>>> +			 base_reg);
>>
>> dev_dbg() should be enough: end users don't know what to do with the new
>> control register value, do they?
>>
>> This is just a suggestion, you can keep dev_info() if you want, I don't
>> mind :)
> 
> No, you are right. This is debug stuff. We had a bunch of user space tools 
> poking in the SMC controller MMIO region in early days and it was nice to
> know what was the initial setup.
> 
>>> +	}
>>> +	chip->ctl_val[smc_base] = base_reg;
>>> +
>>> +	/*
>>> +	 * Retain the prior value of the control register as the
>>> +	 * default if it was normal access mode. Otherwise start with
>>> +	 * the sanitized base value set to read mode.
>>> +	 */
>>> +	if ((reg & CONTROL_COMMAND_MODE_MASK) ==
>>> +	    CONTROL_COMMAND_MODE_NORMAL)
>>> +		chip->ctl_val[smc_read] = reg;
>>> +	else
>>> +		chip->ctl_val[smc_read] = chip->ctl_val[smc_base] |
>>> +			CONTROL_COMMAND_MODE_NORMAL;
>>> +
>>> +	dev_dbg(controller->dev, "default control register: %08x\n",
>>> +		chip->ctl_val[smc_read]);
>>> +	return 0;
>>> +}
>>> +
>>> +static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
>>> +{
>>> +	struct aspeed_smc_controller *controller = chip->controller;
>>> +	const struct aspeed_smc_info *info = controller->info;
>>> +	u32 cmd;
>>> +
>>> +	if (chip->nor.addr_width == 4 && info->set_4b)
>>> +		info->set_4b(chip);
>>> +
>>> +	/*
>>> +	 * base mode has not been optimized yet. use it for writes.
>>> +	 */
>>> +	chip->ctl_val[smc_write] = chip->ctl_val[smc_base] |
>>> +		chip->nor.program_opcode << CONTROL_COMMAND_SHIFT |
>>> +		CONTROL_COMMAND_MODE_WRITE;
>>> +
>>> +	dev_dbg(controller->dev, "write control register: %08x\n",
>>> +		chip->ctl_val[smc_write]);
>>> +
>>> +	/*
>>> +	 * TODO: Adjust clocks if fast read is supported and interpret
>>> +	 * SPI-NOR flags to adjust controller settings.
>>> +	 */
>>> +	switch (chip->nor.flash_read) {
>>> +	case SPI_NOR_NORMAL:
>>> +		cmd = CONTROL_COMMAND_MODE_NORMAL;
>>> +		break;
>>> +	case SPI_NOR_FAST:
>>> +		cmd = CONTROL_COMMAND_MODE_FREAD;
>>> +		break;
>>> +	default:
>>> +		dev_err(chip->nor.dev, "unsupported SPI read mode\n");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	chip->ctl_val[smc_read] |= cmd |
>>> +		CONTROL_IO_DUMMY_SET(chip->nor.read_dummy / 8);
>>> +
>>> +	dev_dbg(controller->dev, "base control register: %08x\n",
>>> +		chip->ctl_val[smc_read]);
>>> +	return 0;
>>> +}
>>> +
>>
>> Why do you configure both chip->ctrl_val[smc_write] and
>> chip->ctrl_val[smc_read] if the driver actually only uses
>> chip->ctrl_val[smc_base] ?
> 
> we expect Command mode support and DMAs will use it.
> 
>> all aspeed_smc_[read|write]_[reg|user]() functions call
>> aspeed_smc_[start|stop]_user(), so this driver always selects the "USER"
>> mode and configures the control register based on chip->ctrl_val[smc_base].
> 
> yes. 
> 
> Maybe you think it is too early to prepare ground for the other 
> mode ? Is that really confusing in the code ? Do you think I should
> remove it for the initial support in the driver and stick to 'User' 
> mode.
>

I think it is not a big deal, at least technically. This is more a
psychological aspect of the review: the bigger patches, the more scarier.
I mean it requires more time and courage to dig into the source code hence
to understand what the driver actually does.
Sometime, it's better to split a big patch into many incremental and
smaller patches so it's more easy for reviewers to understand each part as
an independent feature. It also reveals the driver evolution during the
development process hence it helps to understand where it goes and what are
the next improvements to come.

Anyway, since the review is done now, on my side I won't ask you to remove
or split the support of the 'Command' mode in a separated patch.
I let you do as you want, if it help you to introduce some part of the
support of this 'Command' mode now even if not completed yet, no problem on
my side :)

I was just giving you some pieces of advice for the next time if you want
to speed up the review of another patch introducing new features.

However, I will just ask you one more version handling the dummy cycles
properly as it would help us for the global maintenance of the spi-nor
subsystem. This is the only mandatory modification I ask you, after that I
think it would be ok for me and since Marek has already reviewed your
driver, it would be ready to be merged into the spi-nor tree.

Anyway, thanks for taking time to explain us how your driver work :)

Best regards,

Cyrille



>>> +static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
>>> +				  struct device_node *np, struct resource *r)
>>> +{
>>> +	const struct aspeed_smc_info *info = controller->info;
>>> +	struct device *dev = controller->dev;
>>> +	struct device_node *child;
>>> +	unsigned int cs;
>>> +	int ret = -ENODEV;
>>> +
>>> +	for_each_available_child_of_node(np, child) {
>>> +		struct aspeed_smc_chip *chip;
>>> +		struct spi_nor *nor;
>>> +		struct mtd_info *mtd;
>>> +
>>> +		/* This driver does not support NAND or NOR flash devices. */
>>> +		if (!of_device_is_compatible(child, "jedec,spi-nor"))
>>> +			continue;
>>> +
>>> +		ret = of_property_read_u32(child, "reg", &cs);
>>> +		if (ret) {
>>> +			dev_err(dev, "Couldn't not read chip select.\n");
>>> +			break;
>>> +		}
>>> +
>>> +		if (cs >= info->nce) {
>>> +			dev_err(dev, "Chip select %d out of range.\n",
>>> +				cs);
>>> +			ret = -ERANGE;
>>> +			break;
>>> +		}
>>> +
>>> +		if (controller->chips[cs]) {
>>> +			dev_err(dev, "Chip select %d already in use by %s\n",
>>> +				cs, dev_name(controller->chips[cs]->nor.dev));
>>> +			ret = -EBUSY;
>>> +			break;
>>> +		}
>>> +
>>> +		chip = devm_kzalloc(controller->dev, sizeof(*chip), GFP_KERNEL);
>>> +		if (!chip) {
>>> +			ret = -ENOMEM;
>>> +			break;
>>> +		}
>>> +
>>> +		chip->controller = controller;
>>> +		chip->ctl = controller->regs + info->ctl0 + cs * 4;
>>> +		chip->cs = cs;
>>> +
>>> +		nor = &chip->nor;
>>> +		mtd = &nor->mtd;
>>> +
>>> +		nor->dev = dev;
>>> +		nor->priv = chip;
>>> +		spi_nor_set_flash_node(nor, child);
>>> +		nor->read = aspeed_smc_read_user;
>>> +		nor->write = aspeed_smc_write_user;
>>> +		nor->read_reg = aspeed_smc_read_reg;
>>> +		nor->write_reg = aspeed_smc_write_reg;
>>> +		nor->prepare = aspeed_smc_prep;
>>> +		nor->unprepare = aspeed_smc_unprep;
>>> +
>>> +		mtd->name = of_get_property(child, "label", NULL);
>>
>> This new "label" DT property should be removed from this patch and send
>> in a dedicated patch to be discussed separately. However I agree with
>> Marek: it looks generic so maybe it could be managed directly from
>> mtd_device_register() since setting such as name could also be done when
>> using a NAND flash. Anyway, I don't see the link between this name and
>> spi-nor. Hence I don't think the DT property should be documented in
>> jedec,spi-nor.txt.
> 
> OK. I will remove it in the next version. 
> 
>> Be patient because I expect such a topic to be discussed quite a long
>> time before we all agree, even if this is "just" a new DT property ;)
> 
> yeah. I expected that also :) But it is quite pratical to give user
> space a hint on the flash nature. Systems can have up to 4 different
> ones. So there is need for it IMO.
> 
> How should I proceed then ? Shall I start a discussion with a single
> patch changing mtd_device_register() ? but I need to know which binding
> would be the more consensual for such a prop.
> 
> Thanks,
> 
> C.
> 
>>
>> Best regards,
>>
>> Cyrille
>>
>>
>>> +
>>> +		ret = aspeed_smc_chip_setup_init(chip, r);
>>> +		if (ret)
>>> +			break;
>>> +
>>> +		/*
>>> +		 * TODO: Add support for SPI_NOR_QUAD and SPI_NOR_DUAL
>>> +		 * attach when board support is present as determined
>>> +		 * by of property.
>>> +		 */
>>> +		ret = spi_nor_scan(nor, NULL, SPI_NOR_NORMAL);
>>> +		if (ret)
>>> +			break;
>>> +
>>> +		ret = aspeed_smc_chip_setup_finish(chip);
>>> +		if (ret)
>>> +			break;
>>> +
>>> +		ret = mtd_device_register(mtd, NULL, 0);
>>> +		if (ret)
>>> +			break;
>>> +
>>> +		controller->chips[cs] = chip;
>>> +	}
>>> +
>>> +	if (ret)
>>> +		aspeed_smc_unregister(controller);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int aspeed_smc_probe(struct platform_device *pdev)
>>> +{
>>> +	struct device_node *np = pdev->dev.of_node;
>>> +	struct device *dev = &pdev->dev;
>>> +	struct aspeed_smc_controller *controller;
>>> +	const struct of_device_id *match;
>>> +	const struct aspeed_smc_info *info;
>>> +	struct resource *res;
>>> +	int ret;
>>> +
>>> +	match = of_match_device(aspeed_smc_matches, &pdev->dev);
>>> +	if (!match || !match->data)
>>> +		return -ENODEV;
>>> +	info = match->data;
>>> +
>>> +	controller = devm_kzalloc(&pdev->dev, sizeof(*controller) +
>>> +		info->nce * sizeof(controller->chips[0]), GFP_KERNEL);
>>> +	if (!controller)
>>> +		return -ENOMEM;
>>> +	controller->info = info;
>>> +	controller->dev = dev;
>>> +
>>> +	mutex_init(&controller->mutex);
>>> +	platform_set_drvdata(pdev, controller);
>>> +
>>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +	controller->regs = devm_ioremap_resource(dev, res);
>>> +	if (IS_ERR(controller->regs)) {
>>> +		dev_err(dev, "Cannot remap controller address.\n");
>>> +		return PTR_ERR(controller->regs);
>>> +	}
>>> +
>>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>>> +	controller->ahb_base = devm_ioremap_resource(dev, res);
>>> +	if (IS_ERR(controller->ahb_base)) {
>>> +		dev_err(dev, "Cannot remap controller address.\n");
>>> +		return PTR_ERR(controller->ahb_base);
>>> +	}
>>> +
>>> +	ret = aspeed_smc_setup_flash(controller, np, res);
>>> +	if (ret)
>>> +		dev_err(dev, "Aspeed SMC probe failed %d\n", ret);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static struct platform_driver aspeed_smc_driver = {
>>> +	.probe = aspeed_smc_probe,
>>> +	.remove = aspeed_smc_remove,
>>> +	.driver = {
>>> +		.name = DEVICE_NAME,
>>> +		.of_match_table = aspeed_smc_matches,
>>> +	}
>>> +};
>>> +
>>> +module_platform_driver(aspeed_smc_driver);
>>> +
>>> +MODULE_DESCRIPTION("ASPEED Static Memory Controller Driver");
>>> +MODULE_AUTHOR("Cedric Le Goater <clg-Bxea+6Xhats@public.gmane.org>");
>>> +MODULE_LICENSE("GPL v2");
>>>
>>
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
