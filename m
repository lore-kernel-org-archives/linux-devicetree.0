From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] mtd/spi-nor: Add SPI memory controllers for Aspeed
 SoCs
Date: Sun, 20 Nov 2016 22:43:48 +0100
Message-ID: <bc14b6ba-800c-bf69-763e-65ead8d4efa7@gmail.com>
References: <1478688149-4554-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478688149-4554-1-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/09/2016 11:42 AM, Cédric Le Goater wrote:
> This driver adds mtd support for spi-nor attached to either or both of
> the Firmware Memory Controller or the SPI Flash Controller (AST2400
> only).
> 
> The SMC controllers on the Aspeed AST2500 SoC are very similar to the
> ones found on the AST2400. The differences are on the number of
> supported flash modules and their default mappings in the SoC address
> space.
> 
> The Aspeed AST2500 has one SPI controller for the BMC firmware and two
> for the host firmware. All controllers have now the same set of
> registers compatible with the AST2400 FMC controller and the legacy
> 'SMC' controller is fully gone.
> 
> Each controller has a memory range on which it maps its flash module
> slaves. Each slave is assigned a memory window for its mapping that
> can be changed at bootime with the Segment Address Register.
> 
> Each SPI flash slave can then be accessed in two modes: Command and
> User. When in User mode, accesses to the memory segment of the slaves
> are translated in SPI transfers. When in Command mode, the HW
> generates the SPI commands automatically and the memory segment is
> accessed as if doing a MMIO.
> 
> Currently, only the User mode is supported. Command mode needs a
> little more work to check that the memory window on the AHB bus fits
> the module size.
> 
> Based on previous work from Milton D. Miller II <miltonm-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> 
> Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
> ---
>  Tested on:
> 
>  * OpenPOWER Palmetto (AST2400) with
>  	FMC controller : n25q256a
> 	SPI controller : mx25l25635e and n25q512ax3
> 
>  * Evaluation board (AST2500) with
>  	FMC controller : w25q256 
> 	SPI controller : w25q256
> 
>  * OpenPOWER Witherspoon (AST2500) with
>  	FMC controller : mx25l25635e * 2
> 	SPI controller : mx66l1g45g
> 
>  Changes since v2:
> 
>  - added a set4b ops to handle difference in the controllers
>  - simplified the IO routines
>  - prepared for fast read using dummy cycles
> 
>  Work in progress:
> 
>  - read optimization using higher SPI clock frequencies
>  - command mode to direct reads from AHB
>  - DMA support
> 
>  .../devicetree/bindings/mtd/aspeed-smc.txt         |  72 ++
>  drivers/mtd/spi-nor/Kconfig                        |  12 +
>  drivers/mtd/spi-nor/Makefile                       |   1 +
>  drivers/mtd/spi-nor/aspeed-smc.c                   | 783 +++++++++++++++++++++
>  4 files changed, 868 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt
>  create mode 100644 drivers/mtd/spi-nor/aspeed-smc.c
> 
> diff --git a/Documentation/devicetree/bindings/mtd/aspeed-smc.txt b/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
> new file mode 100644
> index 000000000000..7516b0c01fcf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
> @@ -0,0 +1,72 @@
> +* Aspeed Static Memory controller
> +* Aspeed SPI Flash Controller
> +
> +The Static memory controller in the ast2400 supports 5 chip selects
> +each can be attached to NAND, parallel NOR, or SPI NOR attached flash.

So this controller is supported by this driver, which behaves like a SPI
controller driver, yet the block can also do NAND and parallel NOR ?

> +The Firmware Memory Controller in the ast2500 supports 3 chip selects,
> +two of which are always in SPI-NOR mode and the third can be SPI-NOR
> +or parallel flash. The SPI flash controller in the ast2400 supports
> +one of 2 chip selects selected by pinmux. The two SPI flash
> +controllers in the ast2500 each support two chip selects.

This paragraph is confusing, it's hard to grok down how many different
controllers does this driver support and what are their properties from
it. It is all there, it's just hard to read.

Also, please split the DT bindings into separate patch and send them to
DT list for review.

> +Required properties:
> +  - compatible : Should be one of
> +	"aspeed,ast2400-fmc" for the AST2400 Static Memory Controller
> +	"aspeed,ast2400-smc" for the AST2400 SPI Flash Controller
> +	"aspeed,ast2500-fmc" for the AST2500 Firmware SPI Memory Controller
> +	"aspeed,ast2500-smc" for the AST2500 SPI Flash Controllers
> +  - reg : the first contains the control register location and length,
> +          the second contains the memory window mapping address and length
> +  - #address-cells : must be 1 corresponding to chip select child binding
> +  - #size-cells : must be 0 corresponding to chip select child binding
> +
> +Optional properties:
> +  - interrupts : Should contain the interrupt for the dma device if an fmc
> +
> +The child nodes are the SPI Flash modules which must have a compatible
> +property as specified in bindings/mtd/jedec,spi-nor.txt
> +
> +Optionally, the child node can contain properties for SPI mode (may be
> +ignored):
> +  - spi-max-frequency - (optional) max frequency of spi bus

You don't need to add the (optional) here again.

> +Example:
> +fmc: fmc@1e620000 {

I'd suggest to keep the example minimal -- drop the partitions etc.

> +	compatible = "aspeed,ast2400-fmc";
> +	reg = < 0x1e620000 0x94
> +		0x20000000 0x02000000
> +		0x22000000 0x02000000 >;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	interrupts = <19>;
> +	flash@0 {
> +		reg = < 0 >;
> +		compatible = "jedec,spi-nor" ;
> +		/* spi-max-frequency = <>; */
> +		/* m25p,fast-read; */
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			boot@0 {
> +				label = "boot-loader";
> +				reg = < 0 0x8000 >;
> +			};
> +			image@8000 {
> +				label = "kernel-image";
> +				reg = < 0x8000 0x1f8000 >;
> +			};
> +		};
> +	};
> +	flash@1 {
> +		reg = < 1 >;
> +		compatible = "jedec,spi-nor" ;
> +		label = "alt";
> +		/* spi-max-frequency = <>; */
> +		status = "fail";
> +		/* m25p,fast-read; */
> +	};
> +};
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 4a682ee0f632..96148600fdab 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -76,4 +76,16 @@ config SPI_NXP_SPIFI
>  	  Flash. Enable this option if you have a device with a SPIFI
>  	  controller and want to access the Flash as a mtd device.
>  
> +config ASPEED_FLASH_SPI

Should be SPI_ASPEED , see the other controllers and keep the list sorted.

> +	tristate "Aspeed flash controllers in SPI mode"
> +	depends on HAS_IOMEM && OF
> +	depends on ARCH_ASPEED || COMPILE_TEST
> +	# IO_SPACE_LIMIT must be equivalent to (~0UL)
> +	depends on !NEED_MACH_IO_H

Why?

> +	help
> +	  This enables support for the New Static Memory Controller
> +	  (FMC) in the Aspeed SoCs (AST2400 and AST2500) when attached
> +	  to SPI nor chips, and support for the SPI Memory controller
> +	  (SPI) for the BIOS.

I think there is a naming chaos between FMC, SMC (as in Static MC) and
SMC (as in SPI MC).

>  endif # MTD_SPI_NOR
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 121695e83542..c3174ebc45c2 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -4,4 +4,5 @@ obj-$(CONFIG_SPI_CADENCE_QUADSPI)	+= cadence-quadspi.o
>  obj-$(CONFIG_SPI_FSL_QUADSPI)	+= fsl-quadspi.o
>  obj-$(CONFIG_SPI_HISI_SFC)	+= hisi-sfc.o
>  obj-$(CONFIG_MTD_MT81xx_NOR)    += mtk-quadspi.o
> +obj-$(CONFIG_ASPEED_FLASH_SPI)	+= aspeed-smc.o
>  obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
> new file mode 100644
> index 000000000000..30662daf89ca
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -0,0 +1,783 @@
> +/*
> + * ASPEED Static Memory Controller driver
> + *
> + * Copyright (c) 2015-2016, IBM Corporation.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */
> +
> +#include <linux/bug.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/mtd/spi-nor.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/sysfs.h>
> +
> +#define DEVICE_NAME	"aspeed-smc"
> +
> +/*
> + * In user mode all data bytes read or written to the chip decode address
> + * range are transferred to or from the SPI bus. The range is treated as a
> + * fifo of arbitratry 1, 2, or 4 byte width but each write has to be aligned
> + * to its size.  The address within the multiple 8kB range is ignored when
> + * sending bytes to the SPI bus.
> + *
> + * On the arm architecture, as of Linux version 4.3, memcpy_fromio and
> + * memcpy_toio on little endian targets use the optimized memcpy routines
> + * that were designed for well behavied memory storage.  These routines
> + * have a stutter if the source and destination are not both word aligned,
> + * once with a duplicate access to the source after aligning to the
> + * destination to a word boundary, and again with a duplicate access to
> + * the source when the final byte count is not word aligned.
> + *
> + * When writing or reading the fifo this stutter discards data or sends
> + * too much data to the fifo and can not be used by this driver.
> + *
> + * While the low level io string routines that implement the insl family do
> + * the desired accesses and memory increments, the cross architecture io
> + * macros make them essentially impossible to use on a memory mapped address
> + * instead of a a token from the call to iomap of an io port.
> + *
> + * These fifo routines use readl and friends to a constant io port and update
> + * the memory buffer pointer and count via explicit code. The final updates
> + * to len are optimistically suppressed.
> + */
> +static int aspeed_smc_read_from_ahb(void *buf, const void __iomem *src,
> +				    size_t len)
> +{

What if start of buf is unaligned ?

> +	if ((((unsigned long)src | (unsigned long)buf | len) & 3) == 0) {

Uh, should use boolean OR, not bitwise or. Also, if you're testing
pointer for NULL, do if (!ptr) .

if (!src || !buf || !len)
   return;

while (...)

> +		while (len > 3) {
> +			*(u32 *)buf = readl(src);
> +			buf += 4;
> +			src += 4;
> +			len -= 4;
> +		}
> +	}
> +
> +	while (len--) {
> +		*(u8 *)buf = readb(src);
> +		buf += 1;
> +		src += 1;
> +	}
> +	return 0;
> +}
> +
> +static int aspeed_smc_write_to_ahb(void __iomem *dst, const void *buf,
> +				   size_t len)
> +{
> +	if ((((unsigned long)dst | (unsigned long)buf | len) & 3) == 0) {

DTTO

> +		while (len > 3) {
> +			u32 val = *(u32 *)buf;
> +
> +			writel(val, dst);
> +			buf += 4;
> +			dst += 4;
> +			len -= 4;
> +		}
> +	}
> +
> +	while (len--) {
> +		u8 val = *(u8 *)buf;
> +
> +		writeb(val, dst);
> +		buf += 1;
> +		dst += 1;
> +	}
> +	return 0;
> +}
> +
> +enum smc_flash_type {
> +	smc_type_nor = 0,	/* controller connected to nor flash */
> +	smc_type_nand = 1,	/* controller connected to nand flash */
> +	smc_type_spi = 2,	/* controller connected to spi flash */
> +};
> +
> +struct aspeed_smc_chip;
> +
> +struct aspeed_smc_info {
> +	u32 maxsize;		/* maximum size of 1 chip window */
> +	u8 nce;			/* number of chip enables */
> +	u8 maxwidth;		/* max width of spi bus */
> +	bool hastype;		/* flash type field exists in cfg reg */
> +	u8 we0;			/* shift for write enable bit for ce 0 */
> +	u8 ctl0;		/* offset in regs of ctl for ce 0 */
> +	u8 time;		/* offset in regs of timing */
> +	u8 misc;		/* offset in regs of misc settings */
> +
> +	void (*set_4b)(struct aspeed_smc_chip *chip);
> +};
> +
> +static void aspeed_smc_chip_set_4b_smc_2400(struct aspeed_smc_chip *chip);
> +static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip);
> +
> +static const struct aspeed_smc_info fmc_2400_info = {
> +	.maxsize = 64 * 1024 * 1024,
> +	.nce = 5,
> +	.maxwidth = 4,
> +	.hastype = true,

Shouldn't all this be specified in DT ?

> +	.we0 = 16,
> +	.ctl0 = 0x10,
> +	.time = 0x94,
> +	.misc = 0x54,
> +	.set_4b = aspeed_smc_chip_set_4b,
> +};
> +
> +static const struct aspeed_smc_info smc_2400_info = {
> +	.maxsize = 64 * 1024 * 1024,
> +	.nce = 1,
> +	.maxwidth = 2,
> +	.hastype = false,
> +	.we0 = 0,
> +	.ctl0 = 0x04,
> +	.time = 0x14,
> +	.misc = 0x10,
> +	.set_4b = aspeed_smc_chip_set_4b_smc_2400,
> +};
> +
> +static const struct aspeed_smc_info fmc_2500_info = {
> +	.maxsize = 256 * 1024 * 1024,
> +	.nce = 3,
> +	.maxwidth = 2,
> +	.hastype = true,
> +	.we0 = 16,
> +	.ctl0 = 0x10,
> +	.time = 0x94,
> +	.misc = 0x54,
> +	.set_4b = aspeed_smc_chip_set_4b,
> +};
> +
> +static const struct aspeed_smc_info smc_2500_info = {
> +	.maxsize = 128 * 1024 * 1024,
> +	.nce = 2,
> +	.maxwidth = 2,
> +	.hastype = false,
> +	.we0 = 16,
> +	.ctl0 = 0x10,
> +	.time = 0x94,
> +	.misc = 0x54,
> +	.set_4b = aspeed_smc_chip_set_4b,
> +};
> +
> +enum smc_ctl_reg_value {
> +	smc_base,		/* base value without mode for other commands */
> +	smc_read,		/* command reg for (maybe fast) reads */
> +	smc_write,		/* command reg for writes with timings */
> +	smc_num_ctl_reg_values	/* last value to get count of commands */
> +};
> +
> +struct aspeed_smc_controller;
> +
> +struct aspeed_smc_chip {
> +	int cs;
> +	struct aspeed_smc_controller *controller;
> +	__le32 __iomem *ctl;			/* control register */

Why do you use __le32* here and void* below ?

> +	void __iomem *base;			/* base of chip window */
> +	__le32 ctl_val[smc_num_ctl_reg_values];	/* controls with timing */
> +	enum smc_flash_type type;		/* what type of flash */
> +	struct spi_nor nor;
> +};
> +
> +struct aspeed_smc_controller {
> +	struct device *dev;
> +
> +	struct mutex mutex;			/* controller access mutex */
> +	const struct aspeed_smc_info *info;	/* type info of controller */
> +	void __iomem *regs;			/* controller registers */
> +	void __iomem *windows;			/* per-chip windows resource */
> +
> +	struct aspeed_smc_chip *chips[0];	/* pointers to attached chips */
> +};
> +
> +/*
> + * SPI Flash Configuration Register (AST2400 SPI)
> + */
> +#define CONFIG_REG			0x0
> +#define    CONFIG_ENABLE_CE_INACTIVE	    BIT(1)
> +#define    CONFIG_WRITE			    BIT(0)

#define[space]FOO[tab]BIT(bar)

> +/*
> + * SPI Flash Configuration Register (AST2500 SPI)
> + * Type setting Register (AST2500 FMC and AST2400 FMC)
> + */
> +#define TYPE_SETTING_REG		0x0
> +#define    CONFIG_DISABLE_LEGACY	    BIT(31) /* 1 on AST2500 FMC */
> +
> +#define    CONFIG_CE2_WRITE		    BIT(18)
> +#define    CONFIG_CE1_WRITE		    BIT(17)
> +#define    CONFIG_CE0_WRITE		    BIT(16)
> +
> +#define    CONFIG_CE2_TYPE		    BIT(4) /* FMC only */
> +#define    CONFIG_CE1_TYPE		    BIT(2) /* FMC only */
> +#define    CONFIG_CE0_TYPE		    BIT(0) /* FMC only */
> +
> +/*
> + * CE Control Register (AST2500 SPI,FMC and AST2400 FMC)
> + */
> +#define CE_CONTROL_REG			0x4
> +#define    CE2_ENABLE_CE_INACTIVE           BIT(10)
> +#define    CE1_ENABLE_CE_INACTIVE           BIT(9)
> +#define    CE0_ENABLE_CE_INACTIVE           BIT(8)
> +#define    CE2_CONTROL_EXTENDED		    BIT(2)
> +#define    CE1_CONTROL_EXTENDED		    BIT(1)
> +#define    CE0_CONTROL_EXTENDED		    BIT(0)
> +
> +/* CE0 Control Register (depends on the controller type) */
> +#define CONTROL_SPI_AAF_MODE BIT(31)
> +#define CONTROL_SPI_IO_MODE_MASK GENMASK(30, 28)
> +#define CONTROL_SPI_IO_DUAL_DATA BIT(29)
> +#define CONTROL_SPI_IO_DUAL_ADDR_DATA (BIT(29) | BIT(28))
> +#define CONTROL_SPI_IO_QUAD_DATA BIT(30)
> +#define CONTROL_SPI_IO_QUAD_ADDR_DATA (BIT(30) | BIT(28))
> +#define CONTROL_SPI_CE_INACTIVE_SHIFT 24
> +#define CONTROL_SPI_CE_INACTIVE_MASK GENMASK(27, CONTROL_SPI_CE_INACTIVE_SHIFT)
> +/* 0 = 16T ... 15 = 1T   T=HCLK */
> +#define CONTROL_SPI_COMMAND_SHIFT 16
> +#define CONTROL_SPI_DUMMY_CYCLE_COMMAND_OUTPUT BIT(15)
> +#define CONTROL_SPI_IO_DUMMY_CYCLES_HI BIT(14)
> +#define CONTROL_SPI_IO_DUMMY_CYCLES_HI_SHIFT 14
> +#define CONTROL_SPI_IO_ADDRESS_4B BIT(13) /* AST2400 SPI */
> +#define CONTROL_SPI_CLK_DIV4 BIT(13) /* others */
> +#define CONTROL_SPI_RW_MERGE BIT(12)
> +#define CONTROL_SPI_IO_DUMMY_CYCLES_LO_SHIFT 6
> +#define CONTROL_SPI_IO_DUMMY_CYCLES_LO GENMASK(7, \
> +				       CONTROL_SPI_IO_DUMMY_CYCLES_LO_SHIFT)
> +#define CONTROL_SPI_IO_DUMMY_CYCLES_MASK (CONTROL_SPI_IO_DUMMY_CYCLES_HI | \
> +					  CONTROL_SPI_IO_DUMMY_CYCLES_LO)
> +#define CONTROL_SPI_IO_DUMMY_CYCLES_SET(dummy)				\
> +	(((((dummy) >> 2) & 0x1) << CONTROL_SPI_IO_DUMMY_CYCLES_HI_SHIFT) | \
> +	(((dummy) & 0x3) << CONTROL_SPI_IO_DUMMY_CYCLES_LO_SHIFT))
> +
> +#define CONTROL_SPI_CLOCK_FREQ_SEL_SHIFT 8
> +#define CONTROL_SPI_CLOCK_FREQ_SEL_MASK GENMASK(11, \
> +					CONTROL_SPI_CLOCK_FREQ_SEL_SHIFT)
> +#define CONTROL_SPI_LSB_FIRST BIT(5)
> +#define CONTROL_SPI_CLOCK_MODE_3 BIT(4)
> +#define CONTROL_SPI_IN_DUAL_DATA BIT(3)
> +#define CONTROL_SPI_CE_STOP_ACTIVE_CONTROL BIT(2)
> +#define CONTROL_SPI_COMMAND_MODE_MASK GENMASK(1, 0)
> +#define CONTROL_SPI_COMMAND_MODE_NORMAL (0)
> +#define CONTROL_SPI_COMMAND_MODE_FREAD (1)
> +#define CONTROL_SPI_COMMAND_MODE_WRITE (2)
> +#define CONTROL_SPI_COMMAND_MODE_USER (3)
> +
> +#define CONTROL_SPI_KEEP_MASK (CONTROL_SPI_AAF_MODE | \
> +	CONTROL_SPI_CE_INACTIVE_MASK | CONTROL_SPI_CLK_DIV4 | \
> +	CONTROL_SPI_IO_DUMMY_CYCLES_MASK | CONTROL_SPI_CLOCK_FREQ_SEL_MASK | \
> +	CONTROL_SPI_LSB_FIRST | CONTROL_SPI_CLOCK_MODE_3)
> +
> +/* Segment Address Registers */
> +#define SEGMENT_ADDR_REG0		0x30
> +#define     SEGMENT_ADDR_START(_r)	    ((((_r) >> 16) & 0xFF) << 23)
> +#define     SEGMENT_ADDR_END(_r)	    ((((_r) >> 24) & 0xFF) << 23)
> +
> +static u32 spi_control_fill_opcode(u8 opcode)
> +{
> +	return ((u32)(opcode)) << CONTROL_SPI_COMMAND_SHIFT;

return opcode << CONTROL... , fix these horrible casts and parenthesis
globally.

> +}
> +
> +static inline u32 aspeed_smc_chip_write_bit(struct aspeed_smc_chip *chip)
> +{
> +	return ((u32)1 << (chip->controller->info->we0 + chip->cs));

return BIT(...)

I'm not sure these microfunctions are even needed.

> +}
> +
> +static void aspeed_smc_chip_check_config(struct aspeed_smc_chip *chip)
> +{
> +	struct aspeed_smc_controller *controller = chip->controller;
> +	u32 reg;
> +
> +	reg = readl(controller->regs + CONFIG_REG);
> +
> +	if (!(reg & aspeed_smc_chip_write_bit(chip))) {

Invert the logic and return here, ie if (reg & BIT()) return , to trim
the indent.

> +		dev_dbg(controller->dev,
> +			"config write is not set ! @%p: 0x%08x\n",
> +			controller->regs + CONFIG_REG, reg);
> +		reg |= aspeed_smc_chip_write_bit(chip);
> +		writel(reg, controller->regs + CONFIG_REG);
> +	}
> +}
> +
> +static void aspeed_smc_start_user(struct spi_nor *nor)
> +{
> +	struct aspeed_smc_chip *chip = nor->priv;
> +	u32 ctl = chip->ctl_val[smc_base];
> +
> +	/*
> +	 * When the chip is controlled in user mode, we need write
> +	 * access to send the opcodes to it. So check the config.
> +	 */
> +	aspeed_smc_chip_check_config(chip);
> +
> +	ctl |= CONTROL_SPI_COMMAND_MODE_USER |
> +		CONTROL_SPI_CE_STOP_ACTIVE_CONTROL;
> +	writel(ctl, chip->ctl);
> +
> +	ctl &= ~CONTROL_SPI_CE_STOP_ACTIVE_CONTROL;
> +	writel(ctl, chip->ctl);
> +}
> +
> +static void aspeed_smc_stop_user(struct spi_nor *nor)
> +{
> +	struct aspeed_smc_chip *chip = nor->priv;
> +
> +	u32 ctl = chip->ctl_val[smc_read];
> +	u32 ctl2 = ctl | CONTROL_SPI_COMMAND_MODE_USER |
> +		CONTROL_SPI_CE_STOP_ACTIVE_CONTROL;
> +
> +	writel(ctl2, chip->ctl);	/* stop user CE control */
> +	writel(ctl, chip->ctl);		/* default to fread or read */
> +}
> +
> +static int aspeed_smc_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
> +{
> +	struct aspeed_smc_chip *chip = nor->priv;
> +
> +	mutex_lock(&chip->controller->mutex);

Won't this have a horrid overhead ?

> +	aspeed_smc_start_user(nor);
> +	aspeed_smc_write_to_ahb(chip->base, &opcode, 1);
> +	aspeed_smc_read_from_ahb(buf, chip->base, len);
> +	aspeed_smc_stop_user(nor);
> +
> +	mutex_unlock(&chip->controller->mutex);
> +
> +	return 0;
> +}
> +
> +static int aspeed_smc_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
> +				int len)
> +{
> +	struct aspeed_smc_chip *chip = nor->priv;
> +
> +	mutex_lock(&chip->controller->mutex);
> +
> +	aspeed_smc_start_user(nor);
> +	aspeed_smc_write_to_ahb(chip->base, &opcode, 1);
> +	aspeed_smc_write_to_ahb(chip->base, buf, len);
> +	aspeed_smc_stop_user(nor);
> +
> +	mutex_unlock(&chip->controller->mutex);
> +
> +	return 0;
> +}
> +
> +static void aspeed_smc_send_cmd_addr(struct spi_nor *nor, u8 cmd, u32 addr)
> +{
> +	struct aspeed_smc_chip *chip = nor->priv;
> +	__be32 temp;
> +	u32 cmdaddr;
> +
> +	switch (nor->addr_width) {
> +	default:
> +		WARN_ONCE(1, "Unexpected address width %u, defaulting to 3\n",
> +			  nor->addr_width);
> +		/* FALLTHROUGH */
> +	case 3:
> +		cmdaddr = addr & 0xFFFFFF;
> +
> +		cmdaddr |= (u32)cmd << 24;

Drop the cast.

> +		temp = cpu_to_be32(cmdaddr);
> +		aspeed_smc_write_to_ahb(chip->base, &temp, 4);
> +		break;
> +	case 4:
> +		temp = cpu_to_be32(addr);
> +		aspeed_smc_write_to_ahb(chip->base, &cmd, 1);
> +		aspeed_smc_write_to_ahb(chip->base, &temp, 4);
> +		break;
> +	}
> +}
> +
> +static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
> +				    size_t len, u_char *read_buf)
> +{
> +	struct aspeed_smc_chip *chip = nor->priv;
> +
> +	mutex_lock(&chip->controller->mutex);
> +
> +	aspeed_smc_start_user(nor);
> +	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
> +	aspeed_smc_read_from_ahb(read_buf, chip->base, len);
> +	aspeed_smc_stop_user(nor);
> +
> +	mutex_unlock(&chip->controller->mutex);
> +
> +	return len;
> +}
> +
> +static ssize_t aspeed_smc_write_user(struct spi_nor *nor, loff_t to, size_t len,
> +				     const u_char *write_buf)
> +{
> +	struct aspeed_smc_chip *chip = nor->priv;
> +
> +	mutex_lock(&chip->controller->mutex);
> +
> +	aspeed_smc_start_user(nor);
> +	aspeed_smc_send_cmd_addr(nor, nor->program_opcode, to);
> +	aspeed_smc_write_to_ahb(chip->base, write_buf, len);
> +	aspeed_smc_stop_user(nor);
> +
> +	mutex_unlock(&chip->controller->mutex);
> +
> +	return len;
> +}
> +
> +static int aspeed_smc_remove(struct platform_device *dev)
> +{
> +	struct aspeed_smc_chip *chip;
> +	struct aspeed_smc_controller *controller = platform_get_drvdata(dev);
> +	int n;
> +
> +	for (n = 0; n < controller->info->nce; n++) {
> +		chip = controller->chips[n];
> +		if (chip)
> +			mtd_device_unregister(&chip->nor.mtd);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id aspeed_smc_matches[] = {
> +	{ .compatible = "aspeed,ast2400-fmc", .data = &fmc_2400_info },
> +	{ .compatible = "aspeed,ast2400-smc", .data = &smc_2400_info },
> +	{ .compatible = "aspeed,ast2500-fmc", .data = &fmc_2500_info },
> +	{ .compatible = "aspeed,ast2500-smc", .data = &smc_2500_info },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, aspeed_smc_matches);
> +
> +static struct platform_device *
> +of_platform_device_create_or_find(struct device_node *child,
> +				  struct device *parent)
> +{
> +	struct platform_device *cdev;
> +
> +	cdev = of_platform_device_create(child, NULL, parent);
> +	if (!cdev)
> +		cdev = of_find_device_by_node(child);
> +	return cdev;
> +}
> +
> +static void __iomem *window_start(struct aspeed_smc_controller *controller,
> +				  struct resource *r, unsigned int n)
> +{
> +	u32 offset = 0;
> +	u32 reg;
> +
> +	if (controller->info->nce > 1) {
> +		reg = readl(controller->regs + SEGMENT_ADDR_REG0 + n * 4);
> +
> +		if (SEGMENT_ADDR_START(reg) >= SEGMENT_ADDR_END(reg))
> +			return NULL;
> +
> +		offset = SEGMENT_ADDR_START(reg) - r->start;
> +	}
> +
> +	return controller->windows + offset;
> +}
> +
> +static void aspeed_smc_chip_enable_write(struct aspeed_smc_chip *chip)
> +{
> +	struct aspeed_smc_controller *controller = chip->controller;
> +	u32 reg;
> +
> +	reg = readl(controller->regs + CONFIG_REG);
> +
> +	reg |= aspeed_smc_chip_write_bit(chip);
> +	writel(reg, controller->regs + CONFIG_REG);
> +}
> +
> +static void aspeed_smc_chip_set_type(struct aspeed_smc_chip *chip, int type)
> +{
> +	struct aspeed_smc_controller *controller = chip->controller;
> +	u32 reg;
> +
> +	reg = readl(controller->regs + CONFIG_REG);
> +
> +	chip->type = type;

You can move this above the readl() to make the RMW block consistent.

> +	reg &= ~(3 << (chip->cs * 2));
> +	reg |= chip->type << (chip->cs * 2);
> +	writel(reg, controller->regs + CONFIG_REG);
> +}
> +
> +/*
> + * The AST2500 FMC and AST2400 FMC flash controllers should be
> + * strapped by hardware, or autodetected, but the AST2500 SPI flash
> + * needs to be set.
> + */
> +static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip)
> +{
> +	struct aspeed_smc_controller *controller = chip->controller;
> +	u32 reg;
> +
> +	if (chip->controller->info == &smc_2500_info) {
> +		reg = readl(controller->regs + CE_CONTROL_REG);
> +		reg |= 1 << chip->cs;
> +		writel(reg, controller->regs + CE_CONTROL_REG);
> +	}
> +}
> +
> +/*
> + * The AST2400 SPI flash controller does not have a CE Control
> + * register. It uses the CE0 control register to set 4Byte mode at the
> + * controller level.
> + */
> +static void aspeed_smc_chip_set_4b_smc_2400(struct aspeed_smc_chip *chip)
> +{
> +	chip->ctl_val[smc_base] |= CONTROL_SPI_IO_ADDRESS_4B;
> +	chip->ctl_val[smc_read] |= CONTROL_SPI_IO_ADDRESS_4B;
> +}
> +
> +static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
> +				      struct resource *r)
> +{
> +	struct aspeed_smc_controller *controller = chip->controller;
> +	const struct aspeed_smc_info *info = controller->info;
> +	u32 reg, base_reg;
> +
> +	/*
> +	 * Always turn on the write enable bit to allow opcodes to be
> +	 * sent in user mode.
> +	 */
> +	aspeed_smc_chip_enable_write(chip);
> +
> +	/* The driver only supports SPI type flash for the moment */
> +	if (info->hastype)
> +		aspeed_smc_chip_set_type(chip, smc_type_spi);
> +
> +	/*
> +	 * Configure chip base address in memory
> +	 */
> +	chip->base = window_start(controller, r, chip->cs);
> +	if (!chip->base) {
> +		dev_warn(chip->nor.dev, "CE segment window closed.\n");
> +		return -1;
> +	}
> +
> +	/*
> +	 * Read the existing control register to get basic values.
> +	 *
> +	 * XXX This register probably needs more sanitation.

What's this comment about ?

> +	 * Do we need support for mode 3 vs mode 0 clock phasing?
> +	 */
> +	reg = readl(chip->ctl);
> +	dev_dbg(controller->dev, "control register: %08x\n", reg);
> +
> +	base_reg = reg & CONTROL_SPI_KEEP_MASK;
> +	if (base_reg != reg) {
> +		dev_info(controller->dev,
> +			 "control register changed to: %08x\n",
> +			 base_reg);
> +	}
> +	chip->ctl_val[smc_base] = base_reg;
> +
> +	/*
> +	 * Retain the prior value of the control register as the
> +	 * default if it was normal access mode. Otherwise start with
> +	 * the sanitized base value set to read mode.
> +	 */
> +	if ((reg & CONTROL_SPI_COMMAND_MODE_MASK) ==
> +	    CONTROL_SPI_COMMAND_MODE_NORMAL)
> +		chip->ctl_val[smc_read] = reg;
> +	else
> +		chip->ctl_val[smc_read] = chip->ctl_val[smc_base] |
> +			CONTROL_SPI_COMMAND_MODE_NORMAL;
> +
> +	dev_dbg(controller->dev, "default control register: %08x\n",
> +		chip->ctl_val[smc_read]);
> +	return 0;
> +}
> +
> +static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
> +{
> +	struct aspeed_smc_controller *controller = chip->controller;
> +	const struct aspeed_smc_info *info = controller->info;
> +	u32 cmd;
> +
> +	if (chip->nor.addr_width == 4 && info->set_4b)
> +		info->set_4b(chip);
> +
> +	/*
> +	 * base mode has not been optimized yet. use it for writes.
> +	 */
> +	chip->ctl_val[smc_write] = chip->ctl_val[smc_base] |
> +		spi_control_fill_opcode(chip->nor.program_opcode) |
> +		CONTROL_SPI_COMMAND_MODE_WRITE;
> +
> +	dev_dbg(controller->dev, "write control register: %08x\n",
> +		chip->ctl_val[smc_write]);
> +
> +	/*
> +	 * XXX TODO
> +	 * Adjust clocks if fast read and write are supported.
> +	 * Interpret spi-nor flags to adjust controller settings.
> +	 * Check if resource size big enough for detected chip and
> +	 * add support assisted (normal or fast-) read and dma.
> +	 */
> +	switch (chip->nor.flash_read) {
> +	case SPI_NOR_NORMAL:
> +		cmd = CONTROL_SPI_COMMAND_MODE_NORMAL;
> +		break;
> +	case SPI_NOR_FAST:
> +		cmd = CONTROL_SPI_COMMAND_MODE_FREAD;
> +		break;
> +	default:
> +		dev_err(chip->nor.dev, "unsupported SPI read mode\n");
> +		return -EINVAL;
> +	}
> +
> +	chip->ctl_val[smc_read] |= cmd |
> +		CONTROL_SPI_IO_DUMMY_CYCLES_SET(chip->nor.read_dummy / 8);
> +
> +	dev_dbg(controller->dev, "base control register: %08x\n",
> +		chip->ctl_val[smc_read]);
> +	return 0;
> +}
> +
> +static int aspeed_smc_probe(struct platform_device *pdev)
> +{
> +	struct aspeed_smc_controller *controller;
> +	const struct of_device_id *match;
> +	const struct aspeed_smc_info *info;
> +	struct resource *r;
> +	struct device_node *child;
> +	int err = 0;
> +	unsigned int n;
> +
> +	match = of_match_device(aspeed_smc_matches, &pdev->dev);
> +	if (!match || !match->data)
> +		return -ENODEV;
> +	info = match->data;
> +
> +	controller = devm_kzalloc(&pdev->dev, sizeof(*controller) +
> +		info->nce * sizeof(controller->chips[0]), GFP_KERNEL);
> +	if (!controller)
> +		return -ENOMEM;
> +	controller->info = info;
> +
> +	mutex_init(&controller->mutex);
> +	platform_set_drvdata(pdev, controller);
> +
> +	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	controller->regs = devm_ioremap_resource(&pdev->dev, r);
> +	if (IS_ERR(controller->regs))
> +		return PTR_ERR(controller->regs);
> +
> +	r = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	controller->windows = devm_ioremap_resource(&pdev->dev, r);
> +	if (IS_ERR(controller->windows))
> +		return PTR_ERR(controller->windows);
> +
> +	controller->dev = &pdev->dev;
> +
> +	/* The pinmux or bootloader will disable the legacy mode controller */
> +
> +	/*
> +	 * XXX Need to add arbitration to the SMC (BIOS) controller if access
> +	 * is shared by the host.
> +	 */
> +	for_each_available_child_of_node(controller->dev->of_node, child) {
> +		struct platform_device *cdev;
> +		struct aspeed_smc_chip *chip;

Pull this into separate function, ie. like cadence_qspi.c , so we can
identify the developing boilerplate easily.

> +		/* This version does not support nand or nor flash devices. */
> +		if (!of_device_is_compatible(child, "jedec,spi-nor"))
> +			continue;
> +
> +		/*
> +		 * create a platform device from the of node.  If the device
> +		 * already was created (eg from a prior bind/unbind cycle)
> +		 * reuse it.
> +		 *
> +		 * The creating the device node for the child here allows its
> +		 * use for error reporting via dev_err below.
> +		 */
> +		cdev = of_platform_device_create_or_find(child,
> +							 controller->dev);
> +		if (!cdev)
> +			continue;
> +
> +		err = of_property_read_u32(child, "reg", &n);
> +		if (err == -EINVAL && info->nce == 1)
> +			n = 0;
> +		else if (err || n >= info->nce)
> +			continue;
> +		if (controller->chips[n]) {
> +			dev_err(&cdev->dev,
> +				"chip-id %u already in use in use by %s\n",
> +				n, dev_name(controller->chips[n]->nor.dev));
> +			continue;
> +		}
> +
> +		chip = devm_kzalloc(controller->dev, sizeof(*chip), GFP_KERNEL);
> +		if (!chip)
> +			continue;
> +		chip->controller = controller;
> +		chip->ctl = controller->regs + info->ctl0 + n * 4;
> +		chip->cs = n;
> +
> +		chip->nor.dev = &cdev->dev;
> +		chip->nor.priv = chip;
> +		spi_nor_set_flash_node(&chip->nor, child);
> +		chip->nor.mtd.name = of_get_property(child, "label", NULL);
> +		chip->nor.read = aspeed_smc_read_user;
> +		chip->nor.write = aspeed_smc_write_user;
> +		chip->nor.read_reg = aspeed_smc_read_reg;
> +		chip->nor.write_reg = aspeed_smc_write_reg;
> +
> +		err = aspeed_smc_chip_setup_init(chip, r);
> +		if (err)
> +			continue;
> +
> +		/*
> +		 * XXX Add support for SPI_NOR_QUAD and SPI_NOR_DUAL attach
> +		 * when board support is present as determined by of property.
> +		 */
> +		err = spi_nor_scan(&chip->nor, NULL, SPI_NOR_NORMAL);
> +		if (err)
> +			continue;
> +
> +		err = aspeed_smc_chip_setup_finish(chip);
> +		if (err)
> +			continue;
> +
> +		err = mtd_device_register(&chip->nor.mtd, NULL, 0);
> +		if (err)
> +			continue;

What happens if some chip fails to register ?

> +		controller->chips[n] = chip;
> +	}
> +
> +	/* Were any children registered? */
> +	for (n = 0; n < info->nce; n++)
> +		if (controller->chips[n])
> +			break;
> +
> +	if (n == info->nce)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static struct platform_driver aspeed_smc_driver = {
> +	.probe = aspeed_smc_probe,
> +	.remove = aspeed_smc_remove,
> +	.driver = {
> +		.name = DEVICE_NAME,
> +		.of_match_table = aspeed_smc_matches,
> +	}
> +};
> +
> +module_platform_driver(aspeed_smc_driver);
> +
> +MODULE_DESCRIPTION("ASPEED Static Memory Controller Driver");
> +MODULE_AUTHOR("Milton Miller");
> +MODULE_LICENSE("GPL v2");
> 


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
