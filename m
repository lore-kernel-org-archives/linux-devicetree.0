From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 3/4] mtd: nand: Add support for Evatronix NANDFLASH-CTRL
Date: Fri, 3 Jun 2016 16:59:09 +0200
Message-ID: <20160603165909.09f27ee0@bbrezillon>
References: <alpine.DEB.2.02.1606020948070.19416@lnxricardw1.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1606020948070.19416@lnxricardw1.se.axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, Linux mtd <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org, Oleksij Rempel <linux@rempel-privat.de>
List-Id: devicetree@vger.kernel.org

On Thu, 2 Jun 2016 09:48:32 +0200
Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:

> Driver for the Evatronix NANDFLASH-CTRL NAND flash controller IP. This
> controller is used in the Axis ARTPEC-6 SoC.
> 
> The driver supports BCH ECC using the controller's hardware, but there is
> also an option to use software BCH ECC. However, the ECC layouts are not
> compatible so it's not possible to mix them. The main advantage to using
> software ECC is that there are more OOB bytes free, as the hardware is
> slightly wasteful on OOB space.
> 
> BCH ECC from 4 to 32 bits over 256, 512 or 1024 byte ECC blocks is supported.
> 
> Only large-page flash chips are supported, using 4 or 5 address cycles.
> 
> The driver has been extensively tested using hardware ECC on 2 Mbit flash chips,
> with 8 bit ECC over 512 bytes ECC blocks.
> 
> Signed-off-by: Ricard Wanderlof <ricardw@axis.com>
> ---
>  drivers/mtd/nand/Kconfig          |    6 +
>  drivers/mtd/nand/Makefile         |    1 +
>  drivers/mtd/nand/evatronix_nand.c | 1909 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 1916 insertions(+)
>  create mode 100644 drivers/mtd/nand/evatronix_nand.c

Please run checkpatch.pl and fix all the ERRORS and WARNINGS.

> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index f05e0e9..30fba73 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -295,6 +295,12 @@ config MTD_NAND_DOCG4
>  	  by the block containing the saftl partition table.  This is probably
>  	  typical.
>  
> +config MTD_NAND_EVATRONIX
> +	tristate "Enable Evatronix NANDFLASH-CTRL driver"
> +	help
> +	  NAND hardware driver for Evatronix NANDFLASH-CTRL
> +	  NAND flash controller.
> +
>  config MTD_NAND_SHARPSL
>  	tristate "Support for NAND Flash on Sharp SL Series (C7xx + others)"
>  	depends on ARCH_PXA
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index f553353..ac89b12 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_MTD_NAND_S3C2410)		+= s3c2410.o
>  obj-$(CONFIG_MTD_NAND_DAVINCI)		+= davinci_nand.o
>  obj-$(CONFIG_MTD_NAND_DISKONCHIP)	+= diskonchip.o
>  obj-$(CONFIG_MTD_NAND_DOCG4)		+= docg4.o
> +obj-$(CONFIG_MTD_NAND_EVATRONIX)	+= evatronix_nand.o
>  obj-$(CONFIG_MTD_NAND_FSMC)		+= fsmc_nand.o
>  obj-$(CONFIG_MTD_NAND_SHARPSL)		+= sharpsl.o
>  obj-$(CONFIG_MTD_NAND_NANDSIM)		+= nandsim.o
> diff --git a/drivers/mtd/nand/evatronix_nand.c b/drivers/mtd/nand/evatronix_nand.c
> new file mode 100644
> index 0000000..94eb582
> --- /dev/null
> +++ b/drivers/mtd/nand/evatronix_nand.c
> @@ -0,0 +1,1909 @@
> +/*
> + * evatronix_nand.c - NAND Flash Driver for Evatronix NANDFLASH-CTRL
> + * NAND Flash Controller IP.
> + *
> + * Intended to handle one NFC, with up to two connected NAND flash chips,
> + * one per bank.
> + *
> + * This implementation has been designed against Rev 1.15 and Rev 1.16 of the
> + * NANDFLASH-CTRL Design Specification.
> + * Note that Rev 1.15 specifies up to 8 chip selects, whereas Rev 1.16
> + * only specifies one. We keep the definitions for the multiple chip
> + * selects though for future reference.
> + *
> + * The corresponding IP version is NANDFLASH-CTRL-DES-6V09H02RE08 .
> + *
> + * Copyright (c) 2016 Axis Communication AB, Lund, Sweden.
> + * Portions Copyright (c) 2010 ST Microelectronics
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
> + */
> +
> +#include <asm/dma.h>
> +#include <linux/bitops.h> /* for ffs() */
> +#include <linux/io.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/concat.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/version.h>

You seem to include a lot of things, and even asm headers. Please make
sure you really need them.

> +
> +/* Driver configuration */
> +
> +/* Some of this could potentially be moved to DT, but it represents stuff
> + * that is either untested, only used for debugging, or things we really
> + * don't want anyone to change, so we keep it here until a clear use case
> + * emerges.
> + */
> +
> +#undef NFC_DMA64BIT /* NFC hardware support for 64-bit DMA transfers */
> +
> +#undef POLLED_XFERS /* Use polled rather than interrupt based transfers */
> +
> +#undef CLEAR_DMA_BUF_AFTER_WRITE /* Useful for debugging */

Then simply drop the code in those sections and add it back when it's
been tested.

> +
> +/* DMA buffer for page transfers. */
> +#define DMA_BUF_SIZE (8192 + 640) /* main + spare for 8k page flash */

This should clearly be dynamic.

> +
> +/* # bytes into the OOB we put our ECC */
> +#define ECC_OFFSET 2
> +
> +/* Number of bytes that we read using READID command.
> + * When reading IDs the IP requires us set up the number of bytes to read
> + * prior to executing the operation, whereas the NAND subsystem would rather
> + * like us to be able to read one byte at a time from the chip. So we fake
> + * this by reading a set number of ID bytes, and then let the NAND subsystem
> + * read from our DMA buffer.
> + */
> +#define READID_LENGTH 8
> +
> +/* Debugging */
> +
> +#define MTD_TRACE(FORMAT, ...) pr_debug("%s: " FORMAT, __func__, ## __VA_ARGS__)

Hm, I'm not a big fan of those custom pr_debug() macros, but if you
really wan to keep it you shouldn't prefix it with MTD_.

Reading at the code I see a lot of MTD_TRACE() calls, while I'm not
against debug traces, it seems to me that you've kept traces you used
while developing/debugging your implementation. Can you clean it up and
keep only the relevant ones.

> +
> +/* Register offsets for Evatronix NANDFLASH-CTRL IP */
> +
> +/* Register field shift values and masks are interespersed as it makes
> + * them easier to locate.
> + *
> + * We use shift values rather than direct masks (e.g. 0x0000d000), as the
> + * hardware manual lists the bit number, making the definitions below
> + * easier to verify against the manual.
> + *
> + * All (known) registers are here, but we only put in the bit fields
> + * for the fields we need.
> + *
> + * We try to be consistent regarding _SIZE/_MASK/_value macros so as to
> + * get a consistent layout here, except for trivial cases where there is
> + * only a single bit or field in a register at bit offset 0.
> + */
> +
> +#define COMMAND_REG		0x00
> +/* The masks reflect the input data to the MAKE_COMMAND macro, rather than
> + * the bits in the register itself. These macros are not intended to be
> + * used by the user, who should use the MAKE_COMMAND et al macros.
> + */
> +#define _CMD_SEQ_SHIFT			0
> +#define _INPUT_SEL_SHIFT		6
> +#define _DATA_SEL_SHIFT			7
> +#define _CMD_0_SHIFT			8
> +#define _CMD_1_3_SHIFT			16
> +#define _CMD_2_SHIFT			24
> +
> +#define _CMD_SEQ_MASK			0x3f
> +#define _INPUT_SEL_MASK			1
> +#define _DATA_SEL_MASK			1
> +#define _CMD_MASK			0xff /* for all CMD_foo */
> +
> +#define MAKE_COMMAND(CMD_SEQ, INPUT_SEL, DATA_SEL, CMD_0, CMD_1_3, CMD_2) \
> +	((((CMD_SEQ)	& _CMD_SEQ_MASK)	<< _CMD_SEQ_SHIFT)	| \
> +	 (((INPUT_SEL)	& _INPUT_SEL_MASK)	<< _INPUT_SEL_SHIFT)	| \
> +	 (((DATA_SEL)	& _DATA_SEL_MASK)	<< _DATA_SEL_SHIFT)	| \
> +	 (((CMD_0)	& _CMD_MASK)		<< _CMD_0_SHIFT)	| \
> +	 (((CMD_1_3)	& _CMD_MASK)		<< _CMD_1_3_SHIFT)	| \
> +	 (((CMD_2)	& _CMD_MASK)		<< _CMD_2_SHIFT))
> +
> +#define INPUT_SEL_SIU			0
> +#define INPUT_SEL_DMA			1
> +#define DATA_SEL_FIFO			0
> +#define DATA_SEL_DATA_REG		1
> +
> +#define CONTROL_REG		0x04
> +#define CONTROL_BLOCK_SIZE_32		(0 << 6)
> +#define CONTROL_BLOCK_SIZE_64		(1 << 6)
> +#define CONTROL_BLOCK_SIZE_128		(2 << 6)
> +#define CONTROL_BLOCK_SIZE_256		(3 << 6)
> +#define CONTROL_BLOCK_SIZE(SIZE)	((ffs(SIZE) - 6) << 6)
> +#define CONTROL_ECC_EN			(1 << 5)
> +#define CONTROL_INT_EN			(1 << 4)
> +#define CONTROL_ECC_BLOCK_SIZE_256	(0 << 1)
> +#define CONTROL_ECC_BLOCK_SIZE_512	(1 << 1)
> +#define CONTROL_ECC_BLOCK_SIZE_1024	(2 << 1)
> +#define CONTROL_ECC_BLOCK_SIZE(SIZE)	((ffs(SIZE) - 9) << 1)
> +#define STATUS_REG		0x08
> +#define STATUS_MEM_ST(CS)		(1 << (CS))
> +#define STATUS_CTRL_STAT		(1 << 8)
> +#define STATUS_MASK_REG		0x0C
> +#define STATE_MASK_SHIFT		0
> +#define STATUS_MASK_STATE_MASK(MASK)	(((MASK) & 0xff) << STATE_MASK_SHIFT)
> +#define ERROR_MASK_SHIFT		8
> +#define STATUS_MASK_ERROR_MASK(MASK)	(((MASK) & 0xff) << ERROR_MASK_SHIFT)
> +#define INT_MASK_REG		0x10
> +#define INT_MASK_ECC_INT_EN(CS)		(1 << (24 + (CS)))
> +#define INT_MASK_STAT_ERR_INT_EN(CS)	(1 << (16 + (CS)))
> +#define INT_MASK_MEM_RDY_INT_EN(CS)	(1 << (8 + (CS)))
> +#define INT_MASK_DMA_INT_EN		(1 << 3)
> +#define INT_MASK_DATA_REG_EN		(1 << 2)
> +#define INT_MASK_CMD_END_INT_EN		(1 << 1)
> +#define INT_STATUS_REG		0x14
> +#define INT_STATUS_ECC_INT_FL(CS)	(1 << (24 + (CS)))
> +#define INT_STATUS_STAT_ERR_INT_FL(CS)	(1 << (16 + (CS)))
> +#define INT_STATUS_MEM_RDY_INT_FL(CS)	(1 << (8 + (CS)))
> +#define INT_STATUS_DMA_INT_FL		(1 << 3)
> +#define INT_STATUS_DATA_REG_FL		(1 << 2)
> +#define INT_STATUS_CMD_END_INT_FL	(1 << 1)
> +#define ECC_CTRL_REG		0x18
> +#define ECC_CTRL_ECC_CAP_2		(0 << 0)
> +#define ECC_CTRL_ECC_CAP_4		(1 << 0)
> +#define ECC_CTRL_ECC_CAP_8		(2 << 0)
> +#define ECC_CTRL_ECC_CAP_16		(3 << 0)
> +#define ECC_CTRL_ECC_CAP_24		(4 << 0)
> +#define ECC_CTRL_ECC_CAP_32		(5 << 0)
> +#define ECC_CTRL_ECC_CAP(B)		((B) < 24 ? ffs(B) - 2 : (B) / 6)
> +/* # ECC corrections that are acceptable during read before setting OVER flag */
> +#define ECC_CTRL_ECC_THRESHOLD(VAL)	(((VAL) & 0x3f) << 8)
> +#define ECC_OFFSET_REG		0x1C
> +#define ECC_STAT_REG		0x20
> +/* Correctable error flag(s) */
> +#define ECC_STAT_ERROR(CS)		(1 << (0 + (CS)))
> +/* Uncorrectable error flag(s) */
> +#define ECC_STAT_UNC(CS)		(1 << (8 + (CS)))
> +/* Acceptable errors level overflow flag(s) */
> +#define ECC_STAT_OVER(CS)		(1 << (16 + (CS)))
> +#define ADDR0_COL_REG		0x24
> +#define ADDR0_ROW_REG		0x28
> +#define ADDR1_COL_REG		0x2C
> +#define ADDR1_ROW_REG		0x30
> +#define PROTECT_REG		0x34
> +#define FIFO_DATA_REG		0x38
> +#define DATA_REG_REG		0x3C
> +#define DATA_REG_SIZE_REG	0x40
> +#define DATA_REG_SIZE_DATA_REG_SIZE(SIZE) (((SIZE) - 1) & 3)
> +#define DEV0_PTR_REG		0x44
> +#define DEV1_PTR_REG		0x48
> +#define DEV2_PTR_REG		0x4C
> +#define DEV3_PTR_REG		0x50
> +#define DEV4_PTR_REG		0x54
> +#define DEV5_PTR_REG		0x58
> +#define DEV6_PTR_REG		0x5C
> +#define DEV7_PTR_REG		0x60
> +#define DMA_ADDR_L_REG		0x64
> +#define DMA_ADDR_H_REG		0x68
> +#define DMA_CNT_REG		0x6C
> +#define DMA_CTRL_REG		0x70
> +#define DMA_CTRL_DMA_START		(1 << 7) /* start on command */
> +#define DMA_CTRL_DMA_MODE_SG		(1 << 5) /* scatter/gather mode */
> +#define DMA_CTRL_DMA_BURST_I_P_4	(0 << 2) /* incr. precise burst */
> +#define DMA_CTRL_DMA_BURST_S_P_16	(1 << 2) /* stream precise burst */
> +#define DMA_CTRL_DMA_BURST_SINGLE	(2 << 2) /* single transfer */
> +#define DMA_CTRL_DMA_BURST_UNSPEC	(3 << 2) /* burst of unspec. length */
> +#define DMA_CTRL_DMA_BURST_I_P_8	(4 << 2) /* incr. precise burst */
> +#define DMA_CTRL_DMA_BURST_I_P_16	(5 << 2) /* incr. precise burst */
> +#define DMA_CTRL_ERR_FLAG		(1 << 1) /* read only */
> +#define DMA_CTRL_DMA_READY		(1 << 0) /* read only */
> +#define BBM_CTRL_REG		0x74
> +#define MEM_CTRL_REG		0x80
> +#define MEM_CTRL_MEM_CE(CE)		(((CE) & 7) << 0)
> +#define MEM_CTRL_BANK_SEL(BANK)		(((BANK) & 7) << 16)
> +#define MEM_CTRL_MEM0_WR	BIT(8)
> +#define DATA_SIZE_REG		0x84
> +#define TIMINGS_ASYN_REG	0x88
> +#define TIMINGS_SYN_REG		0x8C
> +#define TIME_SEQ_0_REG		0x90
> +#define TIME_SEQ_1_REG		0x94
> +#define TIME_GEN_SEQ_0_REG	0x98
> +#define TIME_GEN_SEQ_1_REG	0x9C
> +#define TIME_GEN_SEQ_2_REG	0xA0
> +#define FIFO_INIT_REG		0xB0
> +#define FIFO_INIT_FIFO_INIT			1 /* Flush FIFO */
> +#define FIFO_STATE_REG		0xB4
> +#define FIFO_STATE_DF_W_EMPTY		(1 << 7)
> +#define FIFO_STATE_DF_R_FULL		(1 << 6)
> +#define FIFO_STATE_CF_ACCPT_W		(1 << 5)
> +#define FIFO_STATE_CF_ACCPT_R		(1 << 4)
> +#define FIFO_STATE_CF_FULL		(1 << 3)
> +#define FIFO_STATE_CF_EMPTY		(1 << 2)
> +#define FIFO_STATE_DF_W_FULL		(1 << 1)
> +#define FIFO_STATE_DF_R_EMPTY		(1 << 0)
> +#define GEN_SEQ_CTRL_REG	0xB8		/* aka GENERIC_SEQ_CTRL */
> +#define _CMD0_EN_SHIFT			0
> +#define _CMD1_EN_SHIFT			1
> +#define _CMD2_EN_SHIFT			2
> +#define _CMD3_EN_SHIFT			3
> +#define _COL_A0_SHIFT			4
> +#define _COL_A1_SHIFT			6
> +#define _ROW_A0_SHIFT			8
> +#define _ROW_A1_SHIFT			10
> +#define _DATA_EN_SHIFT			12
> +#define _DELAY_EN_SHIFT			13
> +#define _IMD_SEQ_SHIFT			15
> +#define _CMD3_SHIFT			16
> +#define ECC_CNT_REG		0x14C
> +#define ECC_CNT_ERR_LVL_MASK		0x3F
> +
> +#define _CMD0_EN_MASK			1
> +#define _CMD1_EN_MASK			1
> +#define _CMD2_EN_MASK			1
> +#define _CMD3_EN_MASK			1
> +#define _COL_A0_MASK			3
> +#define _COL_A1_MASK			3
> +#define _ROW_A0_MASK			3
> +#define _ROW_A1_MASK			3
> +#define _DATA_EN_MASK			1
> +#define _DELAY_EN_MASK			3
> +#define _IMD_SEQ_MASK			1
> +#define _CMD3_MASK			0xff
> +
> +/* DELAY_EN field values, non-shifted */
> +#define _BUSY_NONE			0
> +#define _BUSY_0				1
> +#define _BUSY_1				2
> +
> +/* Slightly confusingly, the DELAYx_EN fields enable BUSY phases. */
> +#define MAKE_GEN_CMD(CMD0_EN, CMD1_EN, CMD2_EN, CMD3_EN, \
> +		     COL_A0, ROW_A0, COL_A1, ROW_A1, \
> +		     DATA_EN, BUSY_EN, IMMEDIATE_SEQ, CMD3) \
> +	((((CMD0_EN)	& _CMD0_EN_MASK)	<< _CMD0_EN_SHIFT)	| \
> +	 (((CMD1_EN)	& _CMD1_EN_MASK)	<< _CMD1_EN_SHIFT)	| \
> +	 (((CMD2_EN)	& _CMD2_EN_MASK)	<< _CMD2_EN_SHIFT)	| \
> +	 (((CMD3_EN)	& _CMD3_EN_MASK)	<< _CMD3_EN_SHIFT)	| \
> +	 (((COL_A0)	& _COL_A0_MASK)		<< _COL_A0_SHIFT)	| \
> +	 (((COL_A1)	& _COL_A1_MASK)		<< _COL_A1_SHIFT)	| \
> +	 (((ROW_A0)	& _ROW_A0_MASK)		<< _ROW_A0_SHIFT)	| \
> +	 (((ROW_A1)	& _ROW_A1_MASK)		<< _ROW_A1_SHIFT)	| \
> +	 (((DATA_EN)	& _DATA_EN_MASK)	<< _DATA_EN_SHIFT)	| \
> +	 (((BUSY_EN)	& _DELAY_EN_MASK)	<< _DELAY_EN_SHIFT)	| \
> +	 (((IMMEDIATE_SEQ) & _IMD_SEQ_MASK)	<< _IMD_SEQ_SHIFT)	| \
> +	 (((CMD3)	& _CMD3_MASK)		<< _CMD3_SHIFT))
> +
> +/* The sequence encodings are not trivial. The ones we use are listed here. */
> +#define _SEQ_0			0x00 /* send one cmd, then wait for ready */
> +#define _SEQ_1			0x21 /* send one cmd, one addr, fetch data */
> +#define _SEQ_2			0x22 /* send one cmd, one addr, fetch data */
> +#define _SEQ_4			0x24 /* single cycle write then read */
> +#define _SEQ_10			0x2A /* read page */
> +#define _SEQ_12			0x0C /* write page, don't wait for R/B */
> +#define _SEQ_18			0x32 /* read page using general cycle */
> +#define _SEQ_19			0x13 /* write page using general cycle */
> +#define _SEQ_14			0x0E /* 3 address cycles, for block erase */
> +
> +#define MLUN_REG		0xBC
> +#define DEV0_SIZE_REG		0xC0
> +#define DEV1_SIZE_REG		0xC4
> +#define DEV2_SIZE_REG		0xC8
> +#define DEV3_SIZE_REG		0xCC
> +#define DEV4_SIZE_REG		0xD0
> +#define DEV5_SIZE_REG		0xD4
> +#define DEV6_SIZE_REG		0xD8
> +#define DEV7_SIZE_REG		0xDC
> +#define SS_CCNT0_REG		0xE0
> +#define SS_CCNT1_REG		0xE4
> +#define SS_SCNT_REG		0xE8
> +#define SS_ADDR_DEV_CTRL_REG	0xEC
> +#define SS_CMD0_REG		0xF0
> +#define SS_CMD1_REG		0xF4
> +#define SS_CMD2_REG		0xF8
> +#define SS_CMD3_REG		0xFC
> +#define SS_ADDR_REG		0x100
> +#define SS_MSEL_REG		0x104
> +#define SS_REQ_REG		0x108
> +#define SS_BRK_REG		0x10C
> +#define DMA_TLVL_REG		0x114
> +#define DMA_TLVL_MAX		0xFF
> +#define AES_CTRL_REG		0x118
> +#define AES_DATAW_REG		0x11C
> +#define AES_SVECT_REG		0x120
> +#define CMD_MARK_REG		0x124
> +#define LUN_STATUS_0_REG	0x128
> +#define LUN_STATUS_1_REG	0x12C
> +#define TIMINGS_TOGGLE_REG	0x130
> +#define TIME_GEN_SEQ_3_REG	0x134
> +#define SQS_DELAY_REG		0x138
> +#define CNE_MASK_REG		0x13C
> +#define CNE_VAL_REG		0x140
> +#define CNA_CTRL_REG		0x144
> +#define INTERNAL_STATUS_REG	0x148
> +#define ECC_CNT_REG		0x14C
> +#define PARAM_REG_REG		0x150
> +
> +/* NAND flash command generation */
> +
> +/* NAND flash command codes */
> +#define NAND_RESET		0xff
> +#define NAND_READ_STATUS	0x70
> +#define NAND_READ_ID		0x90
> +#define NAND_READ_ID_ADDR_STD	0x00	/* address written to ADDR0_COL */
> +#define NAND_READ_ID_ADDR_ONFI	0x20	/* address written to ADDR0_COL */
> +#define NAND_READ_ID_ADDR_JEDEC	0x40	/* address written to ADDR0_COL */
> +#define NAND_PARAM		0xEC
> +#define NAND_PARAM_SIZE_MAX		768 /* bytes */
> +#define NAND_PAGE_READ		0x00
> +#define NAND_PAGE_READ_END	0x30
> +#define NAND_BLOCK_ERASE	0x60
> +#define NAND_BLOCK_ERASE_END	0xd0
> +#define NAND_PAGE_WRITE		0x80
> +#define NAND_PAGE_WRITE_END	0x10
> +
> +#define _DONT_CARE 0x00 /* When we don't have anything better to say */
> +
> +
> +/* Assembled values for putting into COMMAND register */
> +
> +/* Reset NAND flash */
> +
> +/* Uses SEQ_0: non-directional sequence, single command, wait for ready */
> +#define COMMAND_RESET \
> +	MAKE_COMMAND(_SEQ_0, INPUT_SEL_SIU, DATA_SEL_FIFO, \
> +		NAND_RESET, _DONT_CARE, _DONT_CARE)
> +
> +/* Read status */
> +
> +/* Uses SEQ_4: single command, then read data via DATA_REG */
> +#define COMMAND_READ_STATUS \
> +	MAKE_COMMAND(_SEQ_4, INPUT_SEL_SIU, DATA_SEL_DATA_REG, \
> +		NAND_READ_STATUS, _DONT_CARE, _DONT_CARE)
> +
> +/* Read ID */
> +
> +/* Uses SEQ_1: single command, ADDR0_COL, then read data via FIFO */
> +/* ADDR0_COL is set to NAND_READ_ID_ADDR_STD for non-ONFi, and
> + * NAND_READ_ID_ADDR_ONFI for ONFi.
> + * The controller reads 5 bytes in the non-ONFi case, and 4 bytes in the
> + * ONFi case, so the data reception (DMA or FIFO_REG) needs to be set up
> + * accordingly.
> + */
> +#define COMMAND_READ_ID \
> +	MAKE_COMMAND(_SEQ_1, INPUT_SEL_DMA, DATA_SEL_FIFO, \
> +		NAND_READ_ID, _DONT_CARE, _DONT_CARE)
> +
> +#define COMMAND_PARAM \
> +	MAKE_COMMAND(_SEQ_2, INPUT_SEL_DMA, DATA_SEL_FIFO, \
> +		NAND_PARAM, _DONT_CARE, _DONT_CARE)
> +
> +/* Page read via slave interface (FIFO_DATA register) */
> +
> +/* Standard 5-cycle read command, with 0x30 end-of-cycle marker */
> +/* Uses SEQ_10: CMD0 + 5 address cycles + CMD2, read data */
> +#define COMMAND_READ_PAGE_STD \
> +	MAKE_COMMAND(_SEQ_10, INPUT_SEL_SIU, DATA_SEL_FIFO, \
> +		NAND_PAGE_READ, _DONT_CARE, NAND_PAGE_READ_END)
> +
> +/* 4-cycle read command, together with GEN_SEQ_CTRL_READ_PAGE_4CYCLE */
> +/* Uses SEQ_18 (generic command sequence, see GEN_SEQ_ECTRL_READ_PAGE_4CYCLE)):
> + * CMD0 + 2+2 address cycles + CMD2, read data
> + */
> +#define COMMAND_READ_PAGE_GEN \
> +	MAKE_COMMAND(_SEQ_18, INPUT_SEL_SIU, DATA_SEL_FIFO, \
> +		NAND_PAGE_READ, _DONT_CARE, NAND_PAGE_READ_END)
> +
> +/* Page read via master interface (DMA) */
> +
> +/* Standard 5-cycle read command, with 0x30 end-of-cycle marker */
> +/* Uses SEQ_10: CMD0 + 5 address cycles + CMD2, read data */
> +#define COMMAND_READ_PAGE_DMA_STD \
> +	MAKE_COMMAND(_SEQ_10, INPUT_SEL_DMA, DATA_SEL_FIFO, \
> +		NAND_PAGE_READ, _DONT_CARE, NAND_PAGE_READ_END)
> +
> +/* 4-cycle read command, together with GEN_SEQ_CTRL_READ_PAGE_4CYCLE */
> +/* Uses SEQ_18 (generic command sequence, see GEN_SEQ_ECTRL_READ_PAGE_4CYCLE)):
> + * CMD0 + 2+2 address cycles + CMD2, read data
> + */
> +#define COMMAND_READ_PAGE_DMA_GEN \
> +	MAKE_COMMAND(_SEQ_18, INPUT_SEL_DMA, DATA_SEL_FIFO, \
> +		NAND_PAGE_READ, _DONT_CARE, NAND_PAGE_READ_END)
> +
> +/* Page write via master interface (DMA) */
> +
> +/* Uses SEQ_12: CMD0 + 5 address cycles + write data + CMD1 */
> +#define COMMAND_WRITE_PAGE_DMA_STD \
> +	MAKE_COMMAND(_SEQ_12, INPUT_SEL_DMA, DATA_SEL_FIFO, \
> +		NAND_PAGE_WRITE, NAND_PAGE_WRITE_END, _DONT_CARE)
> +
> +/* Uses SEQ_19: CMD0 + 4 address cycles + write data + CMD1 */
> +#define COMMAND_WRITE_PAGE_DMA_GEN \
> +	MAKE_COMMAND(_SEQ_19, INPUT_SEL_DMA, DATA_SEL_FIFO, \
> +		NAND_PAGE_WRITE, NAND_PAGE_WRITE_END, _DONT_CARE)
> +
> +/* Block erase */
> +
> +/* Uses SEQ_14: CMD0 + 3 address cycles + CMD1 */
> +#define COMMAND_BLOCK_ERASE \
> +	MAKE_COMMAND(_SEQ_14, INPUT_SEL_SIU, DATA_SEL_FIFO, \
> +		NAND_BLOCK_ERASE, NAND_BLOCK_ERASE_END, _DONT_CARE)
> +
> +/* Assembled values for putting into GEN_SEQ_CTRL register */
> +
> +/* General command sequence specification for 4 cycle PAGE_READ command */
> +#define GEN_SEQ_CTRL_READ_PAGE_4CYCLE \
> +	MAKE_GEN_CMD(1, 0, 1, 0,	/* enable command 0 and 2 phases */ \
> +		     2, 2,		/* col A0 2 cycles, row A0 2 cycles */ \
> +		     0, 0,		/* col A1, row A1 not used */ \
> +		     1,			/* data phase enabled */ \
> +		     _BUSY_0,		/* busy0 phase enabled */ \
> +		     0,			/* immediate cmd execution disabled */ \
> +		     _DONT_CARE)	/* command 3 code not needed */
> +
> +/* General command sequence specification for 4 cycle PAGE_PROGRAM command */
> +#define GEN_SEQ_CTRL_WRITE_PAGE_4CYCLE \
> +	MAKE_GEN_CMD(1, 1, 0, 0,	/* enable command 0 and 1 phases */ \
> +		     2, 2,		/* col A0 2 cycles, row A0 2 cycles */ \
> +		     0, 0,		/* col A1, row A1 not used */ \
> +		     1,			/* data phase enabled */ \
> +		     _BUSY_1,		/* busy1 phase enabled */ \
> +		     0,			/* immediate cmd execution disabled */ \
> +		     _DONT_CARE)	/* command 3 code not needed */

I think I already commented on that last time a driver for the same IP
was submitted by Oleksij.

I'm pretty sure you can implement ->cmd_ctrl() and rely on the default
cmdfunc() logic instead of manually converting those high-level NAND
commands into your own model (which seems to match pretty much the
->cmd_ctrl() model, where you can get the number of address and command
cycles).

Maybe I'm wrong, but I think it's worth a try, and if it works, it
would greatly simplify the driver.

> +
> +/* BCH ECC size calculations. */
> +/* From "Mr. NAND's Wild Ride: Warning: Suprises Ahead", by Robert Pierce,
> + * Denali Software Inc. 2009, table on page 5
> + */
> +/* Use 8 bit correction as base. */
> +#define ECC8_BYTES(BLKSIZE) (ffs(BLKSIZE) + 3)
> +/* The following would be valid for 4..24 bits of correction. */
> +#define ECC_BYTES_PACKED(CAP, BLKSIZE) ((ECC8_BYTES(BLKSIZE) * (CAP) + 7) / 8)
> +/* Our hardware however requires more bytes than strictly necessary due to
> + * the internal design.
> + */
> +#define ECC_BYTES(CAP, BLKSIZE) ((ECC8_BYTES(1024) * (CAP) + 7) / 8)
> +
> +/* Read modes */
> +enum nfc_read_mode {
> +	NFC_READ_STD, /* Standard page read with ECC */
> +	NFC_READ_RAW, /* Raw mode read of main area without ECC */
> +	NFC_READ_OOB, /* Read oob only (no ECC) */
> +	NFC_READ_ALL  /* Read main+oob in raw mode (no ECC) */
> +};
> +
> +/* Timing parameters, from DT */
> +struct nfc_timings {
> +	uint32_t time_seq_0;
> +	uint32_t time_seq_1;
> +	uint32_t timings_asyn;
> +	uint32_t time_gen_seq_0;
> +	uint32_t time_gen_seq_1;
> +	uint32_t time_gen_seq_2;
> +	uint32_t time_gen_seq_3;
> +};
> +
> +/* Configuration, from DT */
> +struct nfc_setup {
> +	struct nfc_timings timings;
> +	bool use_bank_select; /* CE selects 'bank' rather than 'chip' */
> +	bool rb_wired_and;    /* Ready/busy wired AND rather than per-chip */
> +};
> +
> +/* DMA buffer, from both software (buf) and hardware (phys) perspective. */
> +struct nfc_dma {
> +	void *buf; /* mapped address */
> +	dma_addr_t phys; /* physical address */
> +	int bytes_left; /* how much data left to read from buffer? */
> +	int buf_bytes; /* how much allocated data in the buffer? */
> +	uint8_t *ptr; /* work pointer */
> +};
> +
> +#ifndef POLLED_XFERS
> +/* Interrupt management */
> +struct nfc_irq {
> +	int done; /* interrupt triggered, consequently we're done. */
> +	uint32_t int_status; /* INT_STATUS at time of interrupt */
> +	wait_queue_head_t wq; /* For waiting on controller interrupt */
> +};
> +#endif
> +
> +/* Information common to all chips, including the NANDFLASH-CTRL IP */
> +struct nfc_info {

Should inherit from nand_hw_ctrl (see the sunxi_nand driver)...

> +	void __iomem *regbase;
> +	struct device *dev;
> +	struct nand_hw_control *controller;

... and not point to it.

> +	spinlock_t lock;
> +	struct nfc_setup *setup;
> +	struct nfc_dma dma;
> +#ifndef POLLED_XFERS
> +	struct nfc_irq irq;
> +#endif
> +};
> +
> +/* Per-chip controller configuration */
> +struct nfc_config {
> +	uint32_t mem_ctrl;
> +	uint32_t control;
> +	uint32_t ecc_ctrl;
> +	uint32_t mem_status_mask;
> +	uint32_t cs;
> +};
> +
> +/* Cache for info that we need to save across calls to nfc_command */
> +struct nfc_cmd_cache {
> +	unsigned int command;
> +	int page;
> +	int column;
> +	int write_size;
> +	int oob_required;
> +	int write_raw;
> +};
> +
> +/* Information for each physical NAND chip. */
> +struct chip_info {
> +	struct nand_chip chip;
> +	struct nfc_cmd_cache cmd_cache;
> +	struct nfc_config nfc_config;
> +};
> +
> +/* What we tell mtd is an mtd_info actually is a complete chip_info */
> +#define TO_CHIP_INFO(mtd) ((struct chip_info *)(mtd_to_nand(mtd)))

Ouch! Please, don't do that, container_of() is here for a good reason.
And prefer static inline functions over macros for this kind of things.

static inline struct chip_info *mtd_to_chip_info(struct mtd_info *mtd)
{
	return container_of(mtd_to_nand(mtd), struct chip_info, chip);
}

> +
> +/* This is a global pointer, as we only support one single instance of the NFC.
> + * For multiple instances, we would need to add nfc_info as a parameter to
> + * several functions, as well as adding it as a member of the chip_info struct.
> + * Since most likely a system would only have one NFC instance, we don't
> + * go all the way implementing that feature now.
> + */
> +static struct nfc_info *nfc_info;

Come on! Don't be so lazy, do the right thing.

> +
> +/* The timing setup is expected to come via DT. We keep some default timings
> + * here for reference, based on a 100 MHz reference clock.
> + */
> +
> +static const struct nfc_timings default_mode0_pll_enabled = {
> +	0x0d151533, 0x000b0515, 0x00000046,
> +	0x00150000, 0x00000000, 0x00000005, 0x00000015 };

Can you explain those magic values?

> +
> +/**** Utility routines. */

Please use regular comments: /* */

> +
> +/* Count the number of 0's in buff up to a max of max_bits */
> +/* Used to determine how many bitflips there are in an allegedly erased block */
> +static int count_zero_bits(uint8_t *buff, int size, int max_bits)
> +{
> +	int k, zero_bits = 0;
> +
> +	for (k = 0; k < size; k++) {
> +		zero_bits += hweight8(~buff[k]);
> +		if (zero_bits > max_bits)
> +			break;
> +	}
> +
> +	return zero_bits;
> +}

We have an helper for that [1].

> +
> +/**** Low level stuff. Read and write registers, interrupt routine, etc. */

Ditto.

> +
> +/* Read and write NFC SFR registers */
> +
> +static uint32_t nfc_read(uint reg_offset)
> +{
> +	return readl_relaxed(nfc_info->regbase + reg_offset);
> +}
> +
> +static void nfc_write(uint32_t data, uint reg_offset)
> +{
> +	/* Note: According to NANDFLASH-CTRL Design Specification, rev 1.14,
> +	 * p19, the NFC SFR's can only be written when STATUS.CTRL_STAT is 0.
> +	 * However, this doesn't seem to be an issue in practice.
> +	 */
> +	writel_relaxed(data, nfc_info->regbase  + reg_offset);
> +}

Do you really want to use the _relaxed functions?

> +
> +#ifndef POLLED_XFERS
> +static irqreturn_t nfc_irq(int irq, void *device_info)
> +{
> +	/* Note that device_info = nfc_info, so if we don't want a global
> +	 * nfc_info we can get it via device_info.
> +	 */
> +
> +	/* Save interrupt status in case caller wants to check what actually
> +	 * happened.
> +	 */
> +	nfc_info->irq.int_status = nfc_read(INT_STATUS_REG);
> +
> +	MTD_TRACE("Got interrupt %d, INT_STATUS 0x%08x\n",
> +		  irq, nfc_info->irq.int_status);
> +
> +	/* Note: We can't clear the interrupts by clearing CONTROL.INT_EN,
> +	 * as that does not disable the interrupt output port from the
> +	 * nfc towards the gic.
> +	 */
> +	nfc_write(0, INT_STATUS_REG);
> +
> +	nfc_info->irq.done = 1;
> +	wake_up(&nfc_info->irq.wq);
> +
> +	return IRQ_HANDLED;
> +}
> +#endif

Remove the #ifndef section, since it's always activated (see my first
comment).

> +
> +/* Get resources from platform: register bank mapping, irqs, etc */
> +static int nfc_init_resources(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *resource;
> +#ifndef POLLED_XFERS
> +	int irq;
> +	int res;
> +#endif

Ditto.

> +
> +	/* Register base for controller, ultimately from device tree */
> +	resource = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!resource) {
> +		dev_err(dev, "No register addresses configured!\n");
> +		return -ENOMEM;
> +	}
> +	nfc_info->regbase = devm_ioremap_resource(dev, resource);
> +	if (IS_ERR(nfc_info->regbase))
> +		return PTR_ERR(nfc_info->regbase);
> +
> +	dev_dbg(dev, "Got SFRs at phys %p..%p, mapped to %p\n",
> +		 (void *)resource->start, (void *)resource->end,
> +		 nfc_info->regbase);
> +
> +	/* A DMA buffer */
> +	nfc_info->dma.buf =
> +		dma_alloc_coherent(dev, DMA_BUF_SIZE,
> +				   &nfc_info->dma.phys, GFP_KERNEL);
> +	if (nfc_info->dma.buf == NULL) {
> +		dev_err(dev, "dma_alloc_coherent failed!\n");
> +		return -ENOMEM;
> +	}
> +
> +	dev_dbg(dev, "DMA buffer %p at physical %p\n",
> +		 nfc_info->dma.buf, (void *)nfc_info->dma.phys);
> +
> +#ifndef POLLED_XFERS
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(dev, "No irq configured\n");
> +		return irq;
> +	}
> +	res = request_irq(irq, nfc_irq, 0, "evatronix-nand", nfc_info);

devm_?

> +	if (res < 0) {
> +		dev_err(dev, "request_irq failed\n");
> +		return res;
> +	}
> +	dev_dbg(dev, "Successfully registered IRQ %d\n", irq);
> +#endif
> +
> +	return 0;
> +}

I'm stopping there for now.

Can you please remove everything that is not strictly required and
clean the things I pointed before submitting a new version.

To be honest, your driver seems really complicated compared to what
it's supposed to do, and I suspect it could be a lot simpler, but
again, maybe I'm wrong.

If you didn't try yet, please investigate the ->cmd_ctrl() approach,
and if you did, could you explain why it didn't work out?

Regards,

Boris

[1]http://lxr.free-electrons.com/source/drivers/mtd/nand/nand_base.c#L1183

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
