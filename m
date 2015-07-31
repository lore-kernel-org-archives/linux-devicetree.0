Return-Path: <klimov.linux@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1437743784-30163-2-git-send-email-stefan@agner.ch>
References: <1437743784-30163-1-git-send-email-stefan@agner.ch>
	<1437743784-30163-2-git-send-email-stefan@agner.ch>
Date: Sat, 1 Aug 2015 01:54:14 +0300
Message-ID: <CALW4P+LuXzYNgejpfhL8TuC=8oUDM67-PwJA1Z_CO5jSS21qZg@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] mtd: nand: vf610_nfc: Freescale NFC for VF610,
 MPC5125 and others
From: Alexey Klimov <klimov.linux@gmail.com>
Content-Type: multipart/alternative; boundary=f46d043c8208f15196051c33b206
To: Stefan Agner <stefan@agner.ch>
Cc: Kumar Gala <galak@codeaurora.org>, shawn.guo@linaro.org, mark.rutland@arm.com, marb@ixxat.de, kernel@pengutronix.de, linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com, robh+dt@kernel.org, aaron@tastycactus.com, dwmw2@infradead.org, linux-kernel@vger.kernel.org, computersforpeace@gmail.com, Bill Pringlemeir <bpringlemeir@nbsps.com>, ijc+devicetree@hellion.org.uk, linux-arm-kernel@lists.infradead.org, bpringlemeir@gmail.com, pawel.moll@arm.com, sebastian@breakpoint.cc, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--f46d043c8208f15196051c33b206
Content-Type: text/plain; charset=UTF-8

Hi Stefan,

just two small questions.

On Jul 24, 2015 4:20 PM, "Stefan Agner" <stefan@agner.ch> wrote:
>
> This driver supports Freescale NFC (NAND flash controller) found on
> Vybrid (VF610), MPC5125, MCF54418 and Kinetis K70. The driver has
> been tested on 8-bit and 16-bit NAND interface and supports ONFI
> parameter page reading.
>
> Limitations:
> - DMA and pipelining not used
> - Pages larger than 2k are not supported
> - No hardware ECC
>
> The driver has only been tested on Vybrid SoC VF610 and VF500.
>
> Some paths have been hand-optimized and evaluated by measurements
> made using mtd_speedtest.ko on a 100MB MTD partition.
>
> Colibri VF50
>     eb write     %   eb read     %   page write      %   page read     %
> rel/opt     5175           11537                4560             11039
> opt         5164 -0.21     11420 -1.01          4737 +3.88       10918
-1.10
> none        5113 -1.20     11352 -1.60          4490 -1.54       10865
-1.58
>
> Colibri VF61
>     eb write     %   eb read     %   page write      %   page read     %
> rel/opt     5766           13096                5459             12846
> opt         5883 +2.03     13064 -0.24          5561 +1.87       12802
-0.34
> none        5701 -1.13     12980 -0.89          5488 +0.53       12735
-0.86
>
> rel = using readl_relaxed/writel_relaxed in optimized paths
> opt = hand-optimized by combining multiple accesses into one read/write
>
> The measurements have not been statistically verfied, hence use them
> with care. The author came to the conclusion that using the relaxed
> variants of readl/writel are not worth the additional code.
>
> Signed-off-by: Bill Pringlemeir <bpringlemeir@nbsps.com>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  MAINTAINERS                  |   6 +
>  drivers/mtd/nand/Kconfig     |   9 +
>  drivers/mtd/nand/Makefile    |   1 +
>  drivers/mtd/nand/vf610_nfc.c | 640
+++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 656 insertions(+)
>  create mode 100644 drivers/mtd/nand/vf610_nfc.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9567329..59975c7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10835,6 +10835,12 @@ S:     Maintained
>  F:     Documentation/fb/uvesafb.txt
>  F:     drivers/video/fbdev/uvesafb.*
>
> +VF610 NAND DRIVER
> +M:     Stefan Agner <stefan@agner.ch>
> +L:     linux-mtd@lists.infradead.org
> +S:     Supported
> +F:     drivers/mtd/nand/vf610_nfc.c
> +
>  VFAT/FAT/MSDOS FILESYSTEM
>  M:     OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
>  S:     Maintained
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 5b2806a..8550b14 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -463,6 +463,15 @@ config MTD_NAND_MPC5121_NFC
>           This enables the driver for the NAND flash controller on the
>           MPC5121 SoC.
>
> +config MTD_NAND_VF610_NFC
> +       tristate "Support for Freescale NFC for VF610/MPC5125"
> +       depends on (SOC_VF610 || COMPILE_TEST)
> +       help
> +         Enables support for NAND Flash Controller on some Freescale
> +         processors like the VF610, MPC5125, MCF54418 or Kinetis K70.
> +         The driver supports a maximum 2k page size. The driver
> +         currently does not support hardware ECC.
> +
>  config MTD_NAND_MXC
>         tristate "MXC NAND support"
>         depends on ARCH_MXC
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index 1f897ec..a490af8 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -45,6 +45,7 @@ obj-$(CONFIG_MTD_NAND_SOCRATES)               +=
socrates_nand.o
>  obj-$(CONFIG_MTD_NAND_TXX9NDFMC)       += txx9ndfmc.o
>  obj-$(CONFIG_MTD_NAND_NUC900)          += nuc900_nand.o
>  obj-$(CONFIG_MTD_NAND_MPC5121_NFC)     += mpc5121_nfc.o
> +obj-$(CONFIG_MTD_NAND_VF610_NFC)       += vf610_nfc.o
>  obj-$(CONFIG_MTD_NAND_RICOH)           += r852.o
>  obj-$(CONFIG_MTD_NAND_JZ4740)          += jz4740_nand.o
>  obj-$(CONFIG_MTD_NAND_GPMI_NAND)       += gpmi-nand/
> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
> new file mode 100644
> index 0000000..0da500e
> --- /dev/null
> +++ b/drivers/mtd/nand/vf610_nfc.c
> @@ -0,0 +1,640 @@
> +/*
> + * Copyright 2009-2015 Freescale Semiconductor, Inc. and others
> + *
> + * Description: MPC5125, VF610, MCF54418 and Kinetis K70 Nand driver.
> + * Jason ported to M54418TWR and MVFA5 (VF610).
> + * Authors: Stefan Agner <stefan.agner@toradex.com>
> + *          Bill Pringlemeir <bpringlemeir@nbsps.com>
> + *          Shaohui Xie <b21989@freescale.com>
> + *          Jason Jin <Jason.jin@freescale.com>
> + *
> + * Based on original driver mpc5121_nfc.c.
> + *
> + * This is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * Limitations:
> + * - Untested on MPC5125 and M54418.
> + * - DMA not used.
> + * - 2K pages or less.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/of_mtd.h>
> +
> +#define        DRV_NAME                "vf610_nfc"
> +
> +/* Register Offsets */
> +#define NFC_FLASH_CMD1                 0x3F00
> +#define NFC_FLASH_CMD2                 0x3F04
> +#define NFC_COL_ADDR                   0x3F08
> +#define NFC_ROW_ADDR                   0x3F0c
> +#define NFC_ROW_ADDR_INC               0x3F14
> +#define NFC_FLASH_STATUS1              0x3F18
> +#define NFC_FLASH_STATUS2              0x3F1c
> +#define NFC_CACHE_SWAP                 0x3F28
> +#define NFC_SECTOR_SIZE                        0x3F2c
> +#define NFC_FLASH_CONFIG               0x3F30
> +#define NFC_IRQ_STATUS                 0x3F38
> +
> +/* Addresses for NFC MAIN RAM BUFFER areas */
> +#define NFC_MAIN_AREA(n)               ((n) *  0x1000)
> +
> +#define PAGE_2K                                0x0800
> +#define OOB_64                         0x0040
> +
> +/*
> + * NFC_CMD2[CODE] values. See section:
> + *  - 31.4.7 Flash Command Code Description, Vybrid manual
> + *  - 23.8.6 Flash Command Sequencer, MPC5125 manual
> + *
> + * Briefly these are bitmasks of controller cycles.
> + */
> +#define READ_PAGE_CMD_CODE             0x7EE0
> +#define READ_ONFI_PARAM_CMD_CODE       0x4860
> +#define PROGRAM_PAGE_CMD_CODE          0x7FC0
> +#define ERASE_CMD_CODE                 0x4EC0
> +#define READ_ID_CMD_CODE               0x4804
> +#define RESET_CMD_CODE                 0x4040
> +#define STATUS_READ_CMD_CODE           0x4068
> +
> +/* NFC ECC mode define */
> +#define ECC_BYPASS                     0
> +
> +/*** Register Mask and bit definitions */
> +
> +/* NFC_FLASH_CMD1 Field */
> +#define CMD_BYTE2_MASK                         0xFF000000
> +#define CMD_BYTE2_SHIFT                                24
> +
> +/* NFC_FLASH_CM2 Field */
> +#define CMD_BYTE1_MASK                         0xFF000000
> +#define CMD_BYTE1_SHIFT                                24
> +#define CMD_CODE_MASK                          0x00FFFF00
> +#define CMD_CODE_SHIFT                         8
> +#define BUFNO_MASK                             0x00000006
> +#define BUFNO_SHIFT                            1
> +#define START_BIT                              (1<<0)
> +
> +/* NFC_COL_ADDR Field */
> +#define COL_ADDR_MASK                          0x0000FFFF
> +#define COL_ADDR_SHIFT                         0
> +
> +/* NFC_ROW_ADDR Field */
> +#define ROW_ADDR_MASK                          0x00FFFFFF
> +#define ROW_ADDR_SHIFT                         0
> +#define ROW_ADDR_CHIP_SEL_RB_MASK              0xF0000000
> +#define ROW_ADDR_CHIP_SEL_RB_SHIFT             28
> +#define ROW_ADDR_CHIP_SEL_MASK                 0x0F000000
> +#define ROW_ADDR_CHIP_SEL_SHIFT                        24
> +
> +/* NFC_FLASH_STATUS2 Field */
> +#define STATUS_BYTE1_MASK                      0x000000FF
> +
> +/* NFC_FLASH_CONFIG Field */
> +#define CONFIG_ECC_SRAM_REQ_BIT                        (1<<21)
> +#define CONFIG_DMA_REQ_BIT                     (1<<20)
> +#define CONFIG_ECC_MODE_MASK                   0x000E0000
> +#define CONFIG_ECC_MODE_SHIFT                  17
> +#define CONFIG_FAST_FLASH_BIT                  (1<<16)
> +#define CONFIG_16BIT                           (1<<7)
> +#define CONFIG_BOOT_MODE_BIT                   (1<<6)
> +#define CONFIG_ADDR_AUTO_INCR_BIT              (1<<5)
> +#define CONFIG_BUFNO_AUTO_INCR_BIT             (1<<4)

Can you consider  using BIT() macro here and below?

> +#define CONFIG_PAGE_CNT_MASK                   0xF
> +#define CONFIG_PAGE_CNT_SHIFT                  0
> +
> +/* NFC_IRQ_STATUS Field */
> +#define IDLE_IRQ_BIT                           (1<<29)
> +#define IDLE_EN_BIT                            (1<<20)
> +#define CMD_DONE_CLEAR_BIT                     (1<<18)
> +#define IDLE_CLEAR_BIT                         (1<<17)
> +
> +struct vf610_nfc {
> +       struct mtd_info mtd;
> +       struct nand_chip chip;
> +       struct device *dev;
> +       void __iomem *regs;
> +       struct completion cmd_done;
> +       uint buf_offset;
> +       int page_sz;
> +       /* Status and ID are in alternate locations. */
> +       int alt_buf;
> +#define ALT_BUF_ID   1
> +#define ALT_BUF_STAT 2
> +#define ALT_BUF_ONFI 3
> +       struct clk *clk;
> +};
> +
> +#define mtd_to_nfc(_mtd) container_of(_mtd, struct vf610_nfc, mtd)
> +
> +static inline u32 vf610_nfc_read(struct vf610_nfc *nfc, uint reg)
> +{
> +       return readl(nfc->regs + reg);
> +}
> +
> +static inline void vf610_nfc_write(struct vf610_nfc *nfc, uint reg, u32
val)
> +{
> +       writel(val, nfc->regs + reg);
> +}
> +
> +static inline void vf610_nfc_set(struct vf610_nfc *nfc, uint reg, u32
bits)
> +{
> +       vf610_nfc_write(nfc, reg, vf610_nfc_read(nfc, reg) | bits);
> +}
> +
> +static inline void vf610_nfc_clear(struct vf610_nfc *nfc, uint reg, u32
bits)
> +{
> +       vf610_nfc_write(nfc, reg, vf610_nfc_read(nfc, reg) & ~bits);
> +}
> +
> +static inline void vf610_nfc_set_field(struct vf610_nfc *nfc, u32 reg,
> +                                      u32 mask, u32 shift, u32 val)
> +{
> +       vf610_nfc_write(nfc, reg,
> +                       (vf610_nfc_read(nfc, reg) & (~mask)) | val <<
shift);
> +}
> +
> +static inline void vf610_nfc_memcpy(void *dst, const void *src, size_t n)
> +{
> +       /*
> +        * Use this accessor for the internal SRAM buffers. On the ARM
> +        * Freescale Vybrid SoC it's known that the driver can treat
> +        * the SRAM buffer as if it's memory. Other platform might need
> +        * to treat the buffers differently.
> +        *
> +        * For the time being, use memcpy
> +        */
> +       memcpy(dst, src, n);
> +}
> +
> +/* Clear flags for upcoming command */
> +static inline void vf610_nfc_clear_status(struct vf610_nfc *nfc)
> +{
> +       u32 tmp = vf610_nfc_read(nfc, NFC_IRQ_STATUS);
> +
> +       tmp |= CMD_DONE_CLEAR_BIT | IDLE_CLEAR_BIT;
> +       vf610_nfc_write(nfc, NFC_IRQ_STATUS, tmp);
> +}
> +
> +static inline void vf610_nfc_done(struct vf610_nfc *nfc)
> +{
> +       unsigned long timeout = msecs_to_jiffies(100);
> +
> +       /*
> +        * Barrier is needed after this write. This write need
> +        * to be done before reading the next register the first
> +        * time.
> +        * vf610_nfc_set implicates such a barrier by using writel
> +        * to write to the register.
> +        */
> +       vf610_nfc_set(nfc, NFC_IRQ_STATUS, IDLE_EN_BIT);
> +       vf610_nfc_set(nfc, NFC_FLASH_CMD2, START_BIT);
> +
> +       if (!(vf610_nfc_read(nfc, NFC_IRQ_STATUS) & IDLE_IRQ_BIT)) {
> +               if (!wait_for_completion_timeout(&nfc->cmd_done, timeout))
> +                       dev_warn(nfc->dev, "Timeout while waiting for
BUSY.\n");
> +       }
> +       vf610_nfc_clear_status(nfc);
> +}
> +
> +static u8 vf610_nfc_get_id(struct vf610_nfc *nfc, int col)
> +{
> +       u32 flash_id;
> +
> +       if (col < 4) {
> +               flash_id = vf610_nfc_read(nfc, NFC_FLASH_STATUS1);
> +               flash_id >>= (3 - col) * 8;
> +       } else {
> +               flash_id = vf610_nfc_read(nfc, NFC_FLASH_STATUS2);
> +               flash_id >>= 24;
> +       }
> +
> +       return flash_id & 0xff;
> +}
> +
> +static u8 vf610_nfc_get_status(struct vf610_nfc *nfc)
> +{
> +       return vf610_nfc_read(nfc, NFC_FLASH_STATUS2) & STATUS_BYTE1_MASK;
> +}
> +
> +static void vf610_nfc_send_command(struct vf610_nfc *nfc, u32 cmd_byte1,
> +                                  u32 cmd_code)
> +{
> +       u32 tmp;
> +
> +       vf610_nfc_clear_status(nfc);
> +
> +       tmp = vf610_nfc_read(nfc, NFC_FLASH_CMD2);
> +       tmp &= ~(CMD_BYTE1_MASK | CMD_CODE_MASK | BUFNO_MASK);
> +       tmp |= cmd_byte1 << CMD_BYTE1_SHIFT;
> +       tmp |= cmd_code << CMD_CODE_SHIFT;
> +       vf610_nfc_write(nfc, NFC_FLASH_CMD2, tmp);
> +}
> +
> +static void vf610_nfc_send_commands(struct vf610_nfc *nfc, u32 cmd_byte1,
> +                                   u32 cmd_byte2, u32 cmd_code)
> +{
> +       u32 tmp;
> +
> +       vf610_nfc_send_command(nfc, cmd_byte1, cmd_code);
> +
> +       tmp = vf610_nfc_read(nfc, NFC_FLASH_CMD1);
> +       tmp &= ~CMD_BYTE2_MASK;
> +       tmp |= cmd_byte2 << CMD_BYTE2_SHIFT;
> +       vf610_nfc_write(nfc, NFC_FLASH_CMD1, tmp);
> +}
> +
> +static irqreturn_t vf610_nfc_irq(int irq, void *data)
> +{
> +       struct mtd_info *mtd = data;
> +       struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +
> +       vf610_nfc_clear(nfc, NFC_IRQ_STATUS, IDLE_EN_BIT);
> +       complete(&nfc->cmd_done);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static void vf610_nfc_addr_cycle(struct vf610_nfc *nfc, int column, int
page)
> +{
> +       if (column != -1) {
> +               if (nfc->chip.options & NAND_BUSWIDTH_16)
> +                       column = column / 2;
> +               vf610_nfc_set_field(nfc, NFC_COL_ADDR, COL_ADDR_MASK,
> +                                   COL_ADDR_SHIFT, column);
> +       }
> +       if (page != -1)
> +               vf610_nfc_set_field(nfc, NFC_ROW_ADDR, ROW_ADDR_MASK,
> +                                   ROW_ADDR_SHIFT, page);
> +}
> +
> +static inline void vf610_nfc_transfer_size(struct vf610_nfc *nfc, int
size)
> +{
> +       vf610_nfc_write(nfc, NFC_SECTOR_SIZE, size);
> +}
> +
> +static void vf610_nfc_command(struct mtd_info *mtd, unsigned command,
> +                             int column, int page)
> +{
> +       struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +       int page_sz = nfc->chip.options & NAND_BUSWIDTH_16 ? 1 : 0;
> +
> +       nfc->buf_offset = max(column, 0);
> +       nfc->alt_buf = 0;
> +
> +       switch (command) {
> +       case NAND_CMD_SEQIN:
> +               /* Use valid column/page from preread... */
> +               vf610_nfc_addr_cycle(nfc, column, page);
> +               /*
> +                * SEQIN => data => PAGEPROG sequence is done by the
controller
> +                * hence we do not need to issue the command here...
> +                */
> +               return;
> +       case NAND_CMD_PAGEPROG:
> +               page_sz += mtd->writesize + mtd->oobsize;
> +               vf610_nfc_transfer_size(nfc, page_sz);
> +               vf610_nfc_send_commands(nfc, NAND_CMD_SEQIN,
> +                                       command, PROGRAM_PAGE_CMD_CODE);
> +               break;
> +
> +       case NAND_CMD_RESET:
> +               vf610_nfc_transfer_size(nfc, 0);
> +               vf610_nfc_send_command(nfc, command, RESET_CMD_CODE);
> +               break;
> +
> +       case NAND_CMD_READOOB:
> +               page_sz += mtd->oobsize;
> +               column = mtd->writesize;
> +               vf610_nfc_transfer_size(nfc, page_sz);
> +               vf610_nfc_send_commands(nfc, NAND_CMD_READ0,
> +                                       NAND_CMD_READSTART,
READ_PAGE_CMD_CODE);
> +               vf610_nfc_addr_cycle(nfc, column, page);
> +               break;
> +
> +       case NAND_CMD_READ0:
> +               page_sz += mtd->writesize + mtd->oobsize;
> +               vf610_nfc_transfer_size(nfc, page_sz);
> +               vf610_nfc_send_commands(nfc, NAND_CMD_READ0,
> +                                       NAND_CMD_READSTART,
READ_PAGE_CMD_CODE);
> +               vf610_nfc_addr_cycle(nfc, column, page);
> +               break;
> +
> +       case NAND_CMD_PARAM:
> +               nfc->alt_buf = ALT_BUF_ONFI;
> +               vf610_nfc_transfer_size(nfc, 768);
> +               vf610_nfc_send_command(nfc, command,
READ_ONFI_PARAM_CMD_CODE);
> +               vf610_nfc_set_field(nfc, NFC_ROW_ADDR, ROW_ADDR_MASK,
> +                                   ROW_ADDR_SHIFT, column);
> +               break;
> +
> +       case NAND_CMD_ERASE1:
> +               vf610_nfc_transfer_size(nfc, 0);
> +               vf610_nfc_send_commands(nfc, command,
> +                                       NAND_CMD_ERASE2, ERASE_CMD_CODE);
> +               vf610_nfc_addr_cycle(nfc, column, page);
> +               break;
> +
> +       case NAND_CMD_READID:
> +               nfc->alt_buf = ALT_BUF_ID;
> +               nfc->buf_offset = 0;
> +               vf610_nfc_transfer_size(nfc, 0);
> +               vf610_nfc_send_command(nfc, command, READ_ID_CMD_CODE);
> +               vf610_nfc_set_field(nfc, NFC_ROW_ADDR, ROW_ADDR_MASK,
> +                                   ROW_ADDR_SHIFT, column);
> +               break;
> +
> +       case NAND_CMD_STATUS:
> +               nfc->alt_buf = ALT_BUF_STAT;
> +               vf610_nfc_transfer_size(nfc, 0);
> +               vf610_nfc_send_command(nfc, command,
STATUS_READ_CMD_CODE);
> +               break;
> +       default:
> +               return;
> +       }
> +
> +       vf610_nfc_done(nfc);
> +}
> +
> +static void vf610_nfc_read_buf(struct mtd_info *mtd, u_char *buf, int
len)
> +{
> +       struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +       uint c = nfc->buf_offset;
> +
> +       /* Alternate buffers are only supported through read_byte */
> +       WARN_ON(nfc->alt_buf);
> +
> +       vf610_nfc_memcpy(buf, nfc->regs + NFC_MAIN_AREA(0) + c, len);
> +
> +       nfc->buf_offset += len;
> +}
> +
> +static void vf610_nfc_write_buf(struct mtd_info *mtd, const uint8_t *buf,
> +                               int len)
> +{
> +       struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +       uint c = nfc->buf_offset;
> +       uint l;
> +
> +       l = min_t(uint, len, mtd->writesize + mtd->oobsize - c);
> +       vf610_nfc_memcpy(nfc->regs + NFC_MAIN_AREA(0) + c, buf, l);
> +
> +       nfc->buf_offset += l;
> +}
> +
> +static uint8_t vf610_nfc_read_byte(struct mtd_info *mtd)
> +{
> +       struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +       u8 tmp;
> +       uint c = nfc->buf_offset;
> +
> +       switch (nfc->alt_buf) {
> +       case ALT_BUF_ID:
> +               tmp = vf610_nfc_get_id(nfc, c);
> +               break;
> +       case ALT_BUF_STAT:
> +               tmp = vf610_nfc_get_status(nfc);
> +               break;
> +#ifdef __LITTLE_ENDIAN
> +       case ALT_BUF_ONFI:
> +               /* Reverse byte since the controller uses big endianness
*/
> +               c = nfc->buf_offset ^ 0x3;
> +               tmp = *((u8 *)(nfc->regs + NFC_MAIN_AREA(0) + c));

What do you think about fallthrough here? Instead of tmp = ... and break.

> +               break;
> +#endif
> +       default:
> +               tmp = *((u8 *)(nfc->regs + NFC_MAIN_AREA(0) + c));
> +               break;
> +       }
> +       nfc->buf_offset++;
> +       return tmp;
> +}
> +
> +static u16 vf610_nfc_read_word(struct mtd_info *mtd)
> +{
> +       u16 tmp;
> +
> +       vf610_nfc_read_buf(mtd, (u_char *)&tmp, sizeof(tmp));
> +       return tmp;
> +}
> +
> +/* If not provided, upper layers apply a fixed delay. */
> +static int vf610_nfc_dev_ready(struct mtd_info *mtd)
> +{
> +       /* NFC handles R/B internally; always ready.  */
> +       return 1;
> +}
> +
> +/*
> + * This function supports Vybrid only (MPC5125 would have full RB and
four CS)
> + */
> +static void vf610_nfc_select_chip(struct mtd_info *mtd, int chip)
> +{
> +#ifdef CONFIG_SOC_VF610
> +       struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +       u32 tmp = vf610_nfc_read(nfc, NFC_ROW_ADDR);
> +
> +       tmp &= ~(ROW_ADDR_CHIP_SEL_RB_MASK | ROW_ADDR_CHIP_SEL_MASK);
> +       tmp |= 1 << ROW_ADDR_CHIP_SEL_RB_SHIFT;
> +
> +       if (chip == 0)
> +               tmp |= 1 << ROW_ADDR_CHIP_SEL_SHIFT;
> +       else if (chip == 1)
> +               tmp |= 2 << ROW_ADDR_CHIP_SEL_SHIFT;
> +
> +       vf610_nfc_write(nfc, NFC_ROW_ADDR, tmp);
> +#endif
> +}
> +
> +static const struct of_device_id vf610_nfc_dt_ids[] = {
> +       { .compatible = "fsl,vf610-nfc" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, vf610_nfc_dt_ids);
> +
> +static int vf610_nfc_init_controller(struct vf610_nfc *nfc)
> +{
> +       if (nfc->chip.options & NAND_BUSWIDTH_16)
> +               vf610_nfc_set(nfc, NFC_FLASH_CONFIG, CONFIG_16BIT);
> +       else
> +               vf610_nfc_clear(nfc, NFC_FLASH_CONFIG, CONFIG_16BIT);
> +
> +       /* Set configuration register. */
> +       vf610_nfc_clear(nfc, NFC_FLASH_CONFIG, CONFIG_ADDR_AUTO_INCR_BIT);
> +       vf610_nfc_clear(nfc, NFC_FLASH_CONFIG,
CONFIG_BUFNO_AUTO_INCR_BIT);
> +       vf610_nfc_clear(nfc, NFC_FLASH_CONFIG, CONFIG_BOOT_MODE_BIT);
> +       vf610_nfc_clear(nfc, NFC_FLASH_CONFIG, CONFIG_DMA_REQ_BIT);
> +       vf610_nfc_set(nfc, NFC_FLASH_CONFIG, CONFIG_FAST_FLASH_BIT);
> +
> +       /* PAGE_CNT = 1 */
> +       vf610_nfc_set_field(nfc, NFC_FLASH_CONFIG, CONFIG_PAGE_CNT_MASK,
> +                           CONFIG_PAGE_CNT_SHIFT, 1);
> +
> +       return 0;
> +}
> +
> +static int vf610_nfc_probe(struct platform_device *pdev)
> +{
> +       struct vf610_nfc *nfc;
> +       struct resource *res;
> +       struct mtd_info *mtd;
> +       struct nand_chip *chip;
> +       int err = 0;
> +       int irq;
> +
> +       nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
> +       if (!nfc)
> +               return -ENOMEM;
> +
> +       nfc->dev = &pdev->dev;
> +       mtd = &nfc->mtd;
> +       chip = &nfc->chip;
> +
> +       mtd->priv = chip;
> +       mtd->owner = THIS_MODULE;
> +       mtd->dev.parent = nfc->dev;
> +       mtd->name = DRV_NAME;
> +
> +       irq = platform_get_irq(pdev, 0);
> +       if (irq <= 0)
> +               return -EINVAL;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       nfc->regs = devm_ioremap_resource(nfc->dev, res);
> +       if (IS_ERR(nfc->regs))
> +               return PTR_ERR(nfc->regs);
> +
> +       nfc->clk = devm_clk_get(&pdev->dev, NULL);
> +       if (IS_ERR(nfc->clk))
> +               return PTR_ERR(nfc->clk);
> +
> +       err = clk_prepare_enable(nfc->clk);
> +       if (err) {
> +               dev_err(nfc->dev, "Unable to enable clock!\n");
> +               return err;
> +       }
> +
> +       chip->dn = nfc->dev->of_node;
> +       chip->dev_ready = vf610_nfc_dev_ready;
> +       chip->cmdfunc = vf610_nfc_command;
> +       chip->read_byte = vf610_nfc_read_byte;
> +       chip->read_word = vf610_nfc_read_word;
> +       chip->read_buf = vf610_nfc_read_buf;
> +       chip->write_buf = vf610_nfc_write_buf;
> +       chip->select_chip = vf610_nfc_select_chip;
> +
> +       chip->options |= NAND_NO_SUBPAGE_WRITE;
> +
> +       init_completion(&nfc->cmd_done);
> +
> +       err = devm_request_irq(nfc->dev, irq, vf610_nfc_irq, 0, DRV_NAME,
mtd);
> +       if (err) {
> +               dev_err(nfc->dev, "Error requesting IRQ!\n");
> +               goto error;
> +       }
> +
> +       vf610_nfc_init_controller(nfc);
> +
> +       /* first scan to find the device and get the page size */
> +       if (nand_scan_ident(mtd, 1, NULL)) {
> +               err = -ENXIO;
> +               goto error;
> +       }
> +
> +       /* Bad block options. */
> +       if (chip->bbt_options & NAND_BBT_USE_FLASH)
> +               chip->bbt_options |= NAND_BBT_NO_OOB;
> +
> +       /* Single buffer only, max 256 OOB minus ECC status */
> +       if (mtd->writesize + mtd->oobsize > PAGE_2K + 256 - 8) {
> +               dev_err(nfc->dev, "Unsupported flash page size\n");
> +               err = -ENXIO;
> +               goto error;
> +       }
> +
> +       /* second phase scan */
> +       if (nand_scan_tail(mtd)) {
> +               err = -ENXIO;
> +               goto error;
> +       }
> +
> +       /* Register device in MTD */
> +       mtd_device_parse_register(mtd, NULL,
> +               &(struct mtd_part_parser_data){
> +                       .of_node = pdev->dev.of_node,
> +               },
> +               NULL, 0);
> +
> +       platform_set_drvdata(pdev, mtd);
> +
> +       return 0;
> +
> +error:
> +       clk_disable_unprepare(nfc->clk);
> +       return err;
> +}
> +
> +static int vf610_nfc_remove(struct platform_device *pdev)
> +{
> +       struct mtd_info *mtd = platform_get_drvdata(pdev);
> +       struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +
> +       nand_release(mtd);
> +       clk_disable_unprepare(nfc->clk);
> +       return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int vf610_nfc_suspend(struct device *dev)
> +{
> +       struct mtd_info *mtd = dev_get_drvdata(dev);
> +       struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +
> +       clk_disable_unprepare(nfc->clk);
> +       return 0;
> +}
> +
> +static int vf610_nfc_resume(struct device *dev)
> +{
> +       struct mtd_info *mtd = dev_get_drvdata(dev);
> +       struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +
> +       pinctrl_pm_select_default_state(dev);
> +
> +       clk_prepare_enable(nfc->clk);
> +
> +       vf610_nfc_init_controller(nfc);
> +       return 0;
> +}
> +#endif
> +
> +static SIMPLE_DEV_PM_OPS(vf610_nfc_pm_ops, vf610_nfc_suspend,
vf610_nfc_resume);
> +
> +static struct platform_driver vf610_nfc_driver = {
> +       .driver         = {
> +               .name   = DRV_NAME,
> +               .of_match_table = vf610_nfc_dt_ids,
> +               .pm     = &vf610_nfc_pm_ops,
> +       },
> +       .probe          = vf610_nfc_probe,
> +       .remove         = vf610_nfc_remove,
> +};
> +
> +module_platform_driver(vf610_nfc_driver);
> +
> +MODULE_AUTHOR("Stefan Agner <stefan.agner@toradex.com>");
> +MODULE_DESCRIPTION("Freescale VF610/MPC5125 NFC MTD NAND driver");
> +MODULE_LICENSE("GPL");
> --
> 2.4.5
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--f46d043c8208f15196051c33b206
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi Stefan,</p>
<p dir=3D"ltr">just two small questions.</p>
<p dir=3D"ltr">On Jul 24, 2015 4:20 PM, &quot;Stefan Agner&quot; &lt;<a hre=
f=3D"mailto:stefan@agner.ch">stefan@agner.ch</a>&gt; wrote:<br>
&gt;<br>
&gt; This driver supports Freescale NFC (NAND flash controller) found on<br=
>
&gt; Vybrid (VF610), MPC5125, MCF54418 and Kinetis K70. The driver has<br>
&gt; been tested on 8-bit and 16-bit NAND interface and supports ONFI<br>
&gt; parameter page reading.<br>
&gt;<br>
&gt; Limitations:<br>
&gt; - DMA and pipelining not used<br>
&gt; - Pages larger than 2k are not supported<br>
&gt; - No hardware ECC<br>
&gt;<br>
&gt; The driver has only been tested on Vybrid SoC VF610 and VF500.<br>
&gt;<br>
&gt; Some paths have been hand-optimized and evaluated by measurements<br>
&gt; made using mtd_speedtest.ko on a 100MB MTD partition.<br>
&gt;<br>
&gt; Colibri VF50<br>
&gt; =C2=A0 =C2=A0 eb write=C2=A0 =C2=A0 =C2=A0%=C2=A0 =C2=A0eb read=C2=A0 =
=C2=A0 =C2=A0%=C2=A0 =C2=A0page write=C2=A0 =C2=A0 =C2=A0 %=C2=A0 =C2=A0pag=
e read=C2=A0 =C2=A0 =C2=A0%<br>
&gt; rel/opt=C2=A0 =C2=A0 =C2=A05175=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A011537=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4560=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A011039<br>
&gt; opt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05164 -0.21=C2=A0 =C2=A0 =C2=A0114=
20 -1.01=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4737 +3.88=C2=A0 =C2=A0 =C2=A0 =
=C2=A010918 -1.10<br>
&gt; none=C2=A0 =C2=A0 =C2=A0 =C2=A0 5113 -1.20=C2=A0 =C2=A0 =C2=A011352 -1=
.60=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4490 -1.54=C2=A0 =C2=A0 =C2=A0 =C2=A0=
10865 -1.58<br>
&gt;<br>
&gt; Colibri VF61<br>
&gt; =C2=A0 =C2=A0 eb write=C2=A0 =C2=A0 =C2=A0%=C2=A0 =C2=A0eb read=C2=A0 =
=C2=A0 =C2=A0%=C2=A0 =C2=A0page write=C2=A0 =C2=A0 =C2=A0 %=C2=A0 =C2=A0pag=
e read=C2=A0 =C2=A0 =C2=A0%<br>
&gt; rel/opt=C2=A0 =C2=A0 =C2=A05766=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A013096=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5459=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012846<br>
&gt; opt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05883 +2.03=C2=A0 =C2=A0 =C2=A0130=
64 -0.24=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5561 +1.87=C2=A0 =C2=A0 =C2=A0 =
=C2=A012802 -0.34<br>
&gt; none=C2=A0 =C2=A0 =C2=A0 =C2=A0 5701 -1.13=C2=A0 =C2=A0 =C2=A012980 -0=
.89=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5488 +0.53=C2=A0 =C2=A0 =C2=A0 =C2=A0=
12735 -0.86<br>
&gt;<br>
&gt; rel =3D using readl_relaxed/writel_relaxed in optimized paths<br>
&gt; opt =3D hand-optimized by combining multiple accesses into one read/wr=
ite<br>
&gt;<br>
&gt; The measurements have not been statistically verfied, hence use them<b=
r>
&gt; with care. The author came to the conclusion that using the relaxed<br=
>
&gt; variants of readl/writel are not worth the additional code.<br>
&gt;<br>
&gt; Signed-off-by: Bill Pringlemeir &lt;<a href=3D"mailto:bpringlemeir@nbs=
ps.com">bpringlemeir@nbsps.com</a>&gt;<br>
&gt; Signed-off-by: Stefan Agner &lt;<a href=3D"mailto:stefan@agner.ch">ste=
fan@agner.ch</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A06 +<br>
&gt; =C2=A0drivers/mtd/nand/Kconfig=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09 +<br=
>
&gt; =C2=A0drivers/mtd/nand/Makefile=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt; =C2=A0drivers/mtd/nand/vf610_nfc.c | 640 +++++++++++++++++++++++++++++=
++++++++++++++<br>
&gt; =C2=A04 files changed, 656 insertions(+)<br>
&gt; =C2=A0create mode 100644 drivers/mtd/nand/vf610_nfc.c<br>
&gt;<br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index 9567329..59975c7 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -10835,6 +10835,12 @@ S:=C2=A0 =C2=A0 =C2=A0Maintained<br>
&gt; =C2=A0F:=C2=A0 =C2=A0 =C2=A0Documentation/fb/uvesafb.txt<br>
&gt; =C2=A0F:=C2=A0 =C2=A0 =C2=A0drivers/video/fbdev/uvesafb.*<br>
&gt;<br>
&gt; +VF610 NAND DRIVER<br>
&gt; +M:=C2=A0 =C2=A0 =C2=A0Stefan Agner &lt;<a href=3D"mailto:stefan@agner=
.ch">stefan@agner.ch</a>&gt;<br>
&gt; +L:=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:linux-mtd@lists.infradead.org=
">linux-mtd@lists.infradead.org</a><br>
&gt; +S:=C2=A0 =C2=A0 =C2=A0Supported<br>
&gt; +F:=C2=A0 =C2=A0 =C2=A0drivers/mtd/nand/vf610_nfc.c<br>
&gt; +<br>
&gt; =C2=A0VFAT/FAT/MSDOS FILESYSTEM<br>
&gt; =C2=A0M:=C2=A0 =C2=A0 =C2=A0OGAWA Hirofumi &lt;<a href=3D"mailto:hirof=
umi@mail.parknet.co.jp">hirofumi@mail.parknet.co.jp</a>&gt;<br>
&gt; =C2=A0S:=C2=A0 =C2=A0 =C2=A0Maintained<br>
&gt; diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig<br>
&gt; index 5b2806a..8550b14 100644<br>
&gt; --- a/drivers/mtd/nand/Kconfig<br>
&gt; +++ b/drivers/mtd/nand/Kconfig<br>
&gt; @@ -463,6 +463,15 @@ config MTD_NAND_MPC5121_NFC<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This enables the driver for the NAN=
D flash controller on the<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MPC5121 SoC.<br>
&gt;<br>
&gt; +config MTD_NAND_VF610_NFC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Support for Freescale NFC f=
or VF610/MPC5125&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on (SOC_VF610 || COMPILE_TEST)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Enables support for NAND Flash Cont=
roller on some Freescale<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0processors like the VF610, MPC5125,=
 MCF54418 or Kinetis K70.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The driver supports a maximum 2k pa=
ge size. The driver<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0currently does not support hardware=
 ECC.<br>
&gt; +<br>
&gt; =C2=A0config MTD_NAND_MXC<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 tristate &quot;MXC NAND support&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on ARCH_MXC<br>
&gt; diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile<br>
&gt; index 1f897ec..a490af8 100644<br>
&gt; --- a/drivers/mtd/nand/Makefile<br>
&gt; +++ b/drivers/mtd/nand/Makefile<br>
&gt; @@ -45,6 +45,7 @@ obj-$(CONFIG_MTD_NAND_SOCRATES)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D socrates_nand.o<br>
&gt; =C2=A0obj-$(CONFIG_MTD_NAND_TXX9NDFMC)=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D =
txx9ndfmc.o<br>
&gt; =C2=A0obj-$(CONFIG_MTD_NAND_NUC900)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
+=3D nuc900_nand.o<br>
&gt; =C2=A0obj-$(CONFIG_MTD_NAND_MPC5121_NFC)=C2=A0 =C2=A0 =C2=A0+=3D mpc51=
21_nfc.o<br>
&gt; +obj-$(CONFIG_MTD_NAND_VF610_NFC)=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D vf610=
_nfc.o<br>
&gt; =C2=A0obj-$(CONFIG_MTD_NAND_RICOH)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0+=3D r852.o<br>
&gt; =C2=A0obj-$(CONFIG_MTD_NAND_JZ4740)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
+=3D jz4740_nand.o<br>
&gt; =C2=A0obj-$(CONFIG_MTD_NAND_GPMI_NAND)=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D =
gpmi-nand/<br>
&gt; diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc=
.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..0da500e<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/mtd/nand/vf610_nfc.c<br>
&gt; @@ -0,0 +1,640 @@<br>
&gt; +/*<br>
&gt; + * Copyright 2009-2015 Freescale Semiconductor, Inc. and others<br>
&gt; + *<br>
&gt; + * Description: MPC5125, VF610, MCF54418 and Kinetis K70 Nand driver.=
<br>
&gt; + * Jason ported to M54418TWR and MVFA5 (VF610).<br>
&gt; + * Authors: Stefan Agner &lt;<a href=3D"mailto:stefan.agner@toradex.c=
om">stefan.agner@toradex.com</a>&gt;<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Bill Pringlemeir &lt;<a href=3D"=
mailto:bpringlemeir@nbsps.com">bpringlemeir@nbsps.com</a>&gt;<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Shaohui Xie &lt;<a href=3D"mailt=
o:b21989@freescale.com">b21989@freescale.com</a>&gt;<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Jason Jin &lt;<a href=3D"mailto:=
Jason.jin@freescale.com">Jason.jin@freescale.com</a>&gt;<br>
&gt; + *<br>
&gt; + * Based on original driver mpc5121_nfc.c.<br>
&gt; + *<br>
&gt; + * This is free software; you can redistribute it and/or modify it<br=
>
&gt; + * under the terms of the GNU General Public License as published by<=
br>
&gt; + * the Free Software Foundation; either version 2 of the License, or<=
br>
&gt; + * (at your option) any later version.<br>
&gt; + *<br>
&gt; + * Limitations:<br>
&gt; + * - Untested on MPC5125 and M54418.<br>
&gt; + * - DMA not used.<br>
&gt; + * - 2K pages or less.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/clk.h&gt;<br>
&gt; +#include &lt;linux/delay.h&gt;<br>
&gt; +#include &lt;linux/init.h&gt;<br>
&gt; +#include &lt;linux/interrupt.h&gt;<br>
&gt; +#include &lt;linux/io.h&gt;<br>
&gt; +#include &lt;linux/mtd/mtd.h&gt;<br>
&gt; +#include &lt;linux/mtd/nand.h&gt;<br>
&gt; +#include &lt;linux/mtd/partitions.h&gt;<br>
&gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; +#include &lt;linux/slab.h&gt;<br>
&gt; +#include &lt;linux/of_mtd.h&gt;<br>
&gt; +<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRV_NAME=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;vf610_nfc&quot;<br>
&gt; +<br>
&gt; +/* Register Offsets */<br>
&gt; +#define NFC_FLASH_CMD1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x3F00<br>
&gt; +#define NFC_FLASH_CMD2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x3F04<br>
&gt; +#define NFC_COL_ADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x3F08<br>
&gt; +#define NFC_ROW_ADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x3F0c<br>
&gt; +#define NFC_ROW_ADDR_INC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x3F14<br>
&gt; +#define NFC_FLASH_STATUS1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x3F18<br>
&gt; +#define NFC_FLASH_STATUS2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x3F1c<br>
&gt; +#define NFC_CACHE_SWAP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x3F28<br>
&gt; +#define NFC_SECTOR_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x3F2c<br>
&gt; +#define NFC_FLASH_CONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x3F30<br>
&gt; +#define NFC_IRQ_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x3F38<br>
&gt; +<br>
&gt; +/* Addresses for NFC MAIN RAM BUFFER areas */<br>
&gt; +#define NFC_MAIN_AREA(n)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0((n) *=C2=A0 0x1000)<br>
&gt; +<br>
&gt; +#define PAGE_2K=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0800<br>
&gt; +#define OOB_64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0040<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * NFC_CMD2[CODE] values. See section:<br>
&gt; + *=C2=A0 - 31.4.7 Flash Command Code Description, Vybrid manual<br>
&gt; + *=C2=A0 - 23.8.6 Flash Command Sequencer, MPC5125 manual<br>
&gt; + *<br>
&gt; + * Briefly these are bitmasks of controller cycles.<br>
&gt; + */<br>
&gt; +#define READ_PAGE_CMD_CODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x7EE0<br>
&gt; +#define READ_ONFI_PARAM_CMD_CODE=C2=A0 =C2=A0 =C2=A0 =C2=A00x4860<br>
&gt; +#define PROGRAM_PAGE_CMD_CODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x7FC=
0<br>
&gt; +#define ERASE_CMD_CODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x4EC0<br>
&gt; +#define READ_ID_CMD_CODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x4804<br>
&gt; +#define RESET_CMD_CODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x4040<br>
&gt; +#define STATUS_READ_CMD_CODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x4068<br>
&gt; +<br>
&gt; +/* NFC ECC mode define */<br>
&gt; +#define ECC_BYPASS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
&gt; +<br>
&gt; +/*** Register Mask and bit definitions */<br>
&gt; +<br>
&gt; +/* NFC_FLASH_CMD1 Field */<br>
&gt; +#define CMD_BYTE2_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xFF000000<br>
&gt; +#define CMD_BYTE2_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 24<br>
&gt; +<br>
&gt; +/* NFC_FLASH_CM2 Field */<br>
&gt; +#define CMD_BYTE1_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xFF000000<br>
&gt; +#define CMD_BYTE1_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 24<br>
&gt; +#define CMD_CODE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00FFFF00<br>
&gt; +#define CMD_CODE_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08<br>
&gt; +#define BUFNO_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00000006<br>
&gt; +#define BUFNO_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
&gt; +#define START_BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1&lt;&lt;0)<br>
&gt; +<br>
&gt; +/* NFC_COL_ADDR Field */<br>
&gt; +#define COL_ADDR_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0000FFFF<br>
&gt; +#define COL_ADDR_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
&gt; +<br>
&gt; +/* NFC_ROW_ADDR Field */<br>
&gt; +#define ROW_ADDR_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00FFFFFF<br>
&gt; +#define ROW_ADDR_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
&gt; +#define ROW_ADDR_CHIP_SEL_RB_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0xF0000000<br>
&gt; +#define ROW_ADDR_CHIP_SEL_RB_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A028<br>
&gt; +#define ROW_ADDR_CHIP_SEL_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x0F000000<br>
&gt; +#define ROW_ADDR_CHIP_SEL_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 24<br>
&gt; +<br>
&gt; +/* NFC_FLASH_STATUS2 Field */<br>
&gt; +#define STATUS_BYTE1_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x000000FF<br>
&gt; +<br>
&gt; +/* NFC_FLASH_CONFIG Field */<br>
&gt; +#define CONFIG_ECC_SRAM_REQ_BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1&lt;&lt;21)<br>
&gt; +#define CONFIG_DMA_REQ_BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1&lt;&lt;20)<br>
&gt; +#define CONFIG_ECC_MODE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x000E0000<br>
&gt; +#define CONFIG_ECC_MODE_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 17<br>
&gt; +#define CONFIG_FAST_FLASH_BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (1&lt;&lt;16)<br>
&gt; +#define CONFIG_16BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1&lt;&lt;7)<br>
&gt; +#define CONFIG_BOOT_MODE_BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1&lt;&lt;6)<br>
&gt; +#define CONFIG_ADDR_AUTO_INCR_BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (1&lt;&lt;5)<br>
&gt; +#define CONFIG_BUFNO_AUTO_INCR_BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(1&lt;&lt;4)</p>
<p dir=3D"ltr">Can you consider=C2=A0 using BIT() macro here and below?</p>
<p dir=3D"ltr">&gt; +#define CONFIG_PAGE_CNT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xF<br>
&gt; +#define CONFIG_PAGE_CNT_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
&gt; +<br>
&gt; +/* NFC_IRQ_STATUS Field */<br>
&gt; +#define IDLE_IRQ_BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1&lt;&lt;29)<br>
&gt; +#define IDLE_EN_BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1&lt;&lt;20)<br>
&gt; +#define CMD_DONE_CLEAR_BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1&lt;&lt;18)<br>
&gt; +#define IDLE_CLEAR_BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1&lt;&lt;17)<br>
&gt; +<br>
&gt; +struct vf610_nfc {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mtd_info mtd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nand_chip chip;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *regs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct completion cmd_done;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint buf_offset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int page_sz;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Status and ID are in alternate location=
s. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int alt_buf;<br>
&gt; +#define ALT_BUF_ID=C2=A0 =C2=A01<br>
&gt; +#define ALT_BUF_STAT 2<br>
&gt; +#define ALT_BUF_ONFI 3<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk *clk;<br>
&gt; +};<br>
&gt; +<br>
&gt; +#define mtd_to_nfc(_mtd) container_of(_mtd, struct vf610_nfc, mtd)<br=
>
&gt; +<br>
&gt; +static inline u32 vf610_nfc_read(struct vf610_nfc *nfc, uint reg)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return readl(nfc-&gt;regs + reg);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void vf610_nfc_write(struct vf610_nfc *nfc, uint reg, u=
32 val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(val, nfc-&gt;regs + reg);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void vf610_nfc_set(struct vf610_nfc *nfc, uint reg, u32=
 bits)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_write(nfc, reg, vf610_nfc_read(n=
fc, reg) | bits);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void vf610_nfc_clear(struct vf610_nfc *nfc, uint reg, u=
32 bits)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_write(nfc, reg, vf610_nfc_read(n=
fc, reg) &amp; ~bits);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void vf610_nfc_set_field(struct vf610_nfc *nfc, u32 reg=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 mask, u=
32 shift, u32 val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_write(nfc, reg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0(vf610_nfc_read(nfc, reg) &amp; (~mask)) | val &lt;&lt; shift=
);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void vf610_nfc_memcpy(void *dst, const void *src, size_=
t n)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Use this accessor for the internal SRAM=
 buffers. On the ARM<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Freescale Vybrid SoC it&#39;s known tha=
t the driver can treat<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * the SRAM buffer as if it&#39;s memory. =
Other platform might need<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * to treat the buffers differently.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * For the time being, use memcpy<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(dst, src, n);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Clear flags for upcoming command */<br>
&gt; +static inline void vf610_nfc_clear_status(struct vf610_nfc *nfc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 tmp =3D vf610_nfc_read(nfc, NFC_IRQ_ST=
ATUS);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp |=3D CMD_DONE_CLEAR_BIT | IDLE_CLEAR_B=
IT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_write(nfc, NFC_IRQ_STATUS, tmp);=
<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void vf610_nfc_done(struct vf610_nfc *nfc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long timeout =3D msecs_to_jiffies=
(100);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Barrier is needed after this write. Thi=
s write need<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * to be done before reading the next regi=
ster the first<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * time.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * vf610_nfc_set implicates such a barrier=
 by using writel<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * to write to the register.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_set(nfc, NFC_IRQ_STATUS, IDLE_EN=
_BIT);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_set(nfc, NFC_FLASH_CMD2, START_B=
IT);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(vf610_nfc_read(nfc, NFC_IRQ_STATUS) =
&amp; IDLE_IRQ_BIT)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!wait_for_=
completion_timeout(&amp;nfc-&gt;cmd_done, timeout))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dev_warn(nfc-&gt;dev, &quot;Timeout while waiting for BUSY.\n=
&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_clear_status(nfc);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u8 vf610_nfc_get_id(struct vf610_nfc *nfc, int col)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 flash_id;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (col &lt; 4) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flash_id =3D v=
f610_nfc_read(nfc, NFC_FLASH_STATUS1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flash_id &gt;&=
gt;=3D (3 - col) * 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flash_id =3D v=
f610_nfc_read(nfc, NFC_FLASH_STATUS2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flash_id &gt;&=
gt;=3D 24;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return flash_id &amp; 0xff;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u8 vf610_nfc_get_status(struct vf610_nfc *nfc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return vf610_nfc_read(nfc, NFC_FLASH_STATU=
S2) &amp; STATUS_BYTE1_MASK;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void vf610_nfc_send_command(struct vf610_nfc *nfc, u32 cmd_byt=
e1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 cmd_code)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 tmp;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_clear_status(nfc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D vf610_nfc_read(nfc, NFC_FLASH_CMD2=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp &amp;=3D ~(CMD_BYTE1_MASK | CMD_CODE_M=
ASK | BUFNO_MASK);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp |=3D cmd_byte1 &lt;&lt; CMD_BYTE1_SHIF=
T;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp |=3D cmd_code &lt;&lt; CMD_CODE_SHIFT;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_write(nfc, NFC_FLASH_CMD2, tmp);=
<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void vf610_nfc_send_commands(struct vf610_nfc *nfc, u32 cmd_by=
te1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 cmd_byte2, u32 =
cmd_code)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 tmp;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_send_command(nfc, cmd_byte1, cmd=
_code);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D vf610_nfc_read(nfc, NFC_FLASH_CMD1=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp &amp;=3D ~CMD_BYTE2_MASK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp |=3D cmd_byte2 &lt;&lt; CMD_BYTE2_SHIF=
T;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_write(nfc, NFC_FLASH_CMD1, tmp);=
<br>
&gt; +}<br>
&gt; +<br>
&gt; +static irqreturn_t vf610_nfc_irq(int irq, void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mtd_info *mtd =3D data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_clear(nfc, NFC_IRQ_STATUS, IDLE_=
EN_BIT);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0complete(&amp;nfc-&gt;cmd_done);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return IRQ_HANDLED;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void vf610_nfc_addr_cycle(struct vf610_nfc *nfc, int column, i=
nt page)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (column !=3D -1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (nfc-&gt;ch=
ip.options &amp; NAND_BUSWIDTH_16)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0column =3D column / 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_set_=
field(nfc, NFC_COL_ADDR, COL_ADDR_MASK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0COL_ADDR_SHIFT, col=
umn);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (page !=3D -1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_set_=
field(nfc, NFC_ROW_ADDR, ROW_ADDR_MASK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ROW_ADDR_SHIFT, pag=
e);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void vf610_nfc_transfer_size(struct vf610_nfc *nfc, int=
 size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_write(nfc, NFC_SECTOR_SIZE, size=
);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void vf610_nfc_command(struct mtd_info *mtd, unsigned command,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int column, int page)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int page_sz =3D nfc-&gt;chip.options &amp;=
 NAND_BUSWIDTH_16 ? 1 : 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0nfc-&gt;buf_offset =3D max(column, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0nfc-&gt;alt_buf =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (command) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case NAND_CMD_SEQIN:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Use valid c=
olumn/page from preread... */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_addr=
_cycle(nfc, column, page);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * SEQIN =3D&g=
t; data =3D&gt; PAGEPROG sequence is done by the controller<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * hence we do=
 not need to issue the command here...<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case NAND_CMD_PAGEPROG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page_sz +=3D m=
td-&gt;writesize + mtd-&gt;oobsize;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_tran=
sfer_size(nfc, page_sz);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_send=
_commands(nfc, NAND_CMD_SEQIN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0comma=
nd, PROGRAM_PAGE_CMD_CODE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case NAND_CMD_RESET:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_tran=
sfer_size(nfc, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_send=
_command(nfc, command, RESET_CMD_CODE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case NAND_CMD_READOOB:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page_sz +=3D m=
td-&gt;oobsize;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0column =3D mtd=
-&gt;writesize;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_tran=
sfer_size(nfc, page_sz);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_send=
_commands(nfc, NAND_CMD_READ0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NAND_=
CMD_READSTART, READ_PAGE_CMD_CODE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_addr=
_cycle(nfc, column, page);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case NAND_CMD_READ0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page_sz +=3D m=
td-&gt;writesize + mtd-&gt;oobsize;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_tran=
sfer_size(nfc, page_sz);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_send=
_commands(nfc, NAND_CMD_READ0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NAND_=
CMD_READSTART, READ_PAGE_CMD_CODE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_addr=
_cycle(nfc, column, page);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case NAND_CMD_PARAM:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nfc-&gt;alt_bu=
f =3D ALT_BUF_ONFI;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_tran=
sfer_size(nfc, 768);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_send=
_command(nfc, command, READ_ONFI_PARAM_CMD_CODE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_set_=
field(nfc, NFC_ROW_ADDR, ROW_ADDR_MASK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ROW_ADDR_SHIFT, col=
umn);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case NAND_CMD_ERASE1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_tran=
sfer_size(nfc, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_send=
_commands(nfc, command,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NAND_=
CMD_ERASE2, ERASE_CMD_CODE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_addr=
_cycle(nfc, column, page);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case NAND_CMD_READID:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nfc-&gt;alt_bu=
f =3D ALT_BUF_ID;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nfc-&gt;buf_of=
fset =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_tran=
sfer_size(nfc, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_send=
_command(nfc, command, READ_ID_CMD_CODE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_set_=
field(nfc, NFC_ROW_ADDR, ROW_ADDR_MASK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ROW_ADDR_SHIFT, col=
umn);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case NAND_CMD_STATUS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nfc-&gt;alt_bu=
f =3D ALT_BUF_STAT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_tran=
sfer_size(nfc, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_send=
_command(nfc, command, STATUS_READ_CMD_CODE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_done(nfc);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void vf610_nfc_read_buf(struct mtd_info *mtd, u_char *buf, int=
 len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint c =3D nfc-&gt;buf_offset;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Alternate buffers are only supported th=
rough read_byte */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0WARN_ON(nfc-&gt;alt_buf);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_memcpy(buf, nfc-&gt;regs + NFC_M=
AIN_AREA(0) + c, len);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0nfc-&gt;buf_offset +=3D len;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void vf610_nfc_write_buf(struct mtd_info *mtd, const uint8_t *=
buf,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint c =3D nfc-&gt;buf_offset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint l;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0l =3D min_t(uint, len, mtd-&gt;writesize +=
 mtd-&gt;oobsize - c);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_memcpy(nfc-&gt;regs + NFC_MAIN_A=
REA(0) + c, buf, l);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0nfc-&gt;buf_offset +=3D l;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static uint8_t vf610_nfc_read_byte(struct mtd_info *mtd)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 tmp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint c =3D nfc-&gt;buf_offset;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (nfc-&gt;alt_buf) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case ALT_BUF_ID:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D vf610_=
nfc_get_id(nfc, c);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case ALT_BUF_STAT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D vf610_=
nfc_get_status(nfc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +#ifdef __LITTLE_ENDIAN<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case ALT_BUF_ONFI:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Reverse byt=
e since the controller uses big endianness */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c =3D nfc-&gt;=
buf_offset ^ 0x3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D *((u8 =
*)(nfc-&gt;regs + NFC_MAIN_AREA(0) + c));</p>
<p dir=3D"ltr">What do you think about fallthrough here? Instead of tmp =3D=
 ... and break.<br></p>
<p dir=3D"ltr">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D *((u8 =
*)(nfc-&gt;regs + NFC_MAIN_AREA(0) + c));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0nfc-&gt;buf_offset++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return tmp;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u16 vf610_nfc_read_word(struct mtd_info *mtd)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 tmp;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_read_buf(mtd, (u_char *)&amp;tmp=
, sizeof(tmp));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return tmp;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* If not provided, upper layers apply a fixed delay. */<br>
&gt; +static int vf610_nfc_dev_ready(struct mtd_info *mtd)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* NFC handles R/B internally; always read=
y.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * This function supports Vybrid only (MPC5125 would have full RB and=
 four CS)<br>
&gt; + */<br>
&gt; +static void vf610_nfc_select_chip(struct mtd_info *mtd, int chip)<br>
&gt; +{<br>
&gt; +#ifdef CONFIG_SOC_VF610<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 tmp =3D vf610_nfc_read(nfc, NFC_ROW_AD=
DR);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp &amp;=3D ~(ROW_ADDR_CHIP_SEL_RB_MASK |=
 ROW_ADDR_CHIP_SEL_MASK);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp |=3D 1 &lt;&lt; ROW_ADDR_CHIP_SEL_RB_S=
HIFT;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (chip =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp |=3D 1 &lt=
;&lt; ROW_ADDR_CHIP_SEL_SHIFT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (chip =3D=3D 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp |=3D 2 &lt=
;&lt; ROW_ADDR_CHIP_SEL_SHIFT;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_write(nfc, NFC_ROW_ADDR, tmp);<b=
r>
&gt; +#endif<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct of_device_id vf610_nfc_dt_ids[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;fsl,vf610-nfc&quot=
; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ /* sentinel */ }<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(of, vf610_nfc_dt_ids);<br>
&gt; +<br>
&gt; +static int vf610_nfc_init_controller(struct vf610_nfc *nfc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nfc-&gt;chip.options &amp; NAND_BUSWID=
TH_16)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_set(=
nfc, NFC_FLASH_CONFIG, CONFIG_16BIT);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_clea=
r(nfc, NFC_FLASH_CONFIG, CONFIG_16BIT);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set configuration register. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_clear(nfc, NFC_FLASH_CONFIG, CON=
FIG_ADDR_AUTO_INCR_BIT);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_clear(nfc, NFC_FLASH_CONFIG, CON=
FIG_BUFNO_AUTO_INCR_BIT);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_clear(nfc, NFC_FLASH_CONFIG, CON=
FIG_BOOT_MODE_BIT);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_clear(nfc, NFC_FLASH_CONFIG, CON=
FIG_DMA_REQ_BIT);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_set(nfc, NFC_FLASH_CONFIG, CONFI=
G_FAST_FLASH_BIT);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* PAGE_CNT =3D 1 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_set_field(nfc, NFC_FLASH_CONFIG,=
 CONFIG_PAGE_CNT_MASK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_PAGE_CNT_SHIFT, 1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int vf610_nfc_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vf610_nfc *nfc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mtd_info *mtd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nand_chip *chip;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int err =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int irq;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0nfc =3D devm_kzalloc(&amp;pdev-&gt;dev, si=
zeof(*nfc), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!nfc)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0nfc-&gt;dev =3D &amp;pdev-&gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mtd =3D &amp;nfc-&gt;mtd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chip =3D &amp;nfc-&gt;chip;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mtd-&gt;priv =3D chip;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mtd-&gt;owner =3D THIS_MODULE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mtd-&gt;dev.parent =3D nfc-&gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mtd-&gt;name =3D DRV_NAME;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0irq =3D platform_get_irq(pdev, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &lt;=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESO=
URCE_MEM, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0nfc-&gt;regs =3D devm_ioremap_resource(nfc=
-&gt;dev, res);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(nfc-&gt;regs))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(nfc-&gt;regs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0nfc-&gt;clk =3D devm_clk_get(&amp;pdev-&gt=
;dev, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(nfc-&gt;clk))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(nfc-&gt;clk);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D clk_prepare_enable(nfc-&gt;clk);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(nfc-&g=
t;dev, &quot;Unable to enable clock!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chip-&gt;dn =3D nfc-&gt;dev-&gt;of_node;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chip-&gt;dev_ready =3D vf610_nfc_dev_ready=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chip-&gt;cmdfunc =3D vf610_nfc_command;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chip-&gt;read_byte =3D vf610_nfc_read_byte=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chip-&gt;read_word =3D vf610_nfc_read_word=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chip-&gt;read_buf =3D vf610_nfc_read_buf;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chip-&gt;write_buf =3D vf610_nfc_write_buf=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chip-&gt;select_chip =3D vf610_nfc_select_=
chip;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chip-&gt;options |=3D NAND_NO_SUBPAGE_WRIT=
E;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0init_completion(&amp;nfc-&gt;cmd_done);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D devm_request_irq(nfc-&gt;dev, irq,=
 vf610_nfc_irq, 0, DRV_NAME, mtd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(nfc-&g=
t;dev, &quot;Error requesting IRQ!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_init_controller(nfc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* first scan to find the device and get t=
he page size */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nand_scan_ident(mtd, 1, NULL)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D -ENXIO=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Bad block options. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (chip-&gt;bbt_options &amp; NAND_BBT_US=
E_FLASH)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chip-&gt;bbt_o=
ptions |=3D NAND_BBT_NO_OOB;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Single buffer only, max 256 OOB minus E=
CC status */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mtd-&gt;writesize + mtd-&gt;oobsize &g=
t; PAGE_2K + 256 - 8) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(nfc-&g=
t;dev, &quot;Unsupported flash page size\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D -ENXIO=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* second phase scan */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nand_scan_tail(mtd)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D -ENXIO=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Register device in MTD */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mtd_device_parse_register(mtd, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;(struct m=
td_part_parser_data){<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0.of_node =3D pdev-&gt;dev.of_node,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, mtd);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +error:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(nfc-&gt;clk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int vf610_nfc_remove(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mtd_info *mtd =3D platform_get_drvd=
ata(pdev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0nand_release(mtd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(nfc-&gt;clk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +#ifdef CONFIG_PM_SLEEP<br>
&gt; +static int vf610_nfc_suspend(struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mtd_info *mtd =3D dev_get_drvdata(d=
ev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(nfc-&gt;clk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int vf610_nfc_resume(struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mtd_info *mtd =3D dev_get_drvdata(d=
ev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl_pm_select_default_state(dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_prepare_enable(nfc-&gt;clk);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vf610_nfc_init_controller(nfc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +static SIMPLE_DEV_PM_OPS(vf610_nfc_pm_ops, vf610_nfc_suspend, vf610_n=
fc_resume);<br>
&gt; +<br>
&gt; +static struct platform_driver vf610_nfc_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =
=C2=A0=3D DRV_NAME,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_tabl=
e =3D vf610_nfc_dt_ids,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pm=C2=A0 =C2=
=A0 =C2=A0=3D &amp;vf610_nfc_pm_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D vf610_nfc_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D vf610_nfc_remove,<br>
&gt; +};<br>
&gt; +<br>
&gt; +module_platform_driver(vf610_nfc_driver);<br>
&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Stefan Agner &lt;<a href=3D"mailto:stefan.agner@t=
oradex.com">stefan.agner@toradex.com</a>&gt;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;Freescale VF610/MPC5125 NFC MTD NAND driver&=
quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL&quot;);<br>
&gt; --<br>
&gt; 2.4.5<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; linux-arm-kernel mailing list<br>
&gt; <a href=3D"mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kern=
el@lists.infradead.org</a><br>
&gt; <a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kerne=
l">http://lists.infradead.org/mailman/listinfo/linux-arm-kernel</a><br>
</p>

--f46d043c8208f15196051c33b206--
