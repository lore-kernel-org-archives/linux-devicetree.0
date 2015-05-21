From: punnaiah choudary kalluri <punnaia@xilinx.com>
Subject: Re: [PATCH v2 2/2] mtd: nand: Add support for Arasan Nand Flash Controller
Date: Thu, 21 May 2015 08:52:25 +0530
Message-ID: <CAGnW=BYYRBzMJPC+CXoKi6pzV=9UxzjcAbGjz04+VjX0=hLMAA@mail.gmail.com>
References: <1432043357-558-1-git-send-email-punnaia@xilinx.com>
	<1432043357-558-2-git-send-email-punnaia@xilinx.com>
	<20150520204948.GL11598@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20150520204948.GL11598@ld-irv-0074>
Sender: linux-doc-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, Grant Likely <grant.likely@linaro.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>, Arnd Bergmann <arnd@arndb.de>, David Woodhouse <dwmw2@infradead.org>, "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>, "jussi.kivilinna@iki.fi" <jussi.kivilinna@iki.fi>, Alexandre Courbot <acourbot@nvidia.com>, "joern@logfs.org" <joern@logfs.org>d
List-Id: devicetree@vger.kernel.org

On Thu, May 21, 2015 at 2:19 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Tue, May 19, 2015 at 07:19:17PM +0530, Punnaiah Choudary Kalluri w=
rote:
>> Added the basic driver for Arasan Nand Flash Controller used in
>> Zynq UltraScale+ MPSoC. It supports only Hw Ecc and upto 24bit
>> correction.
>>
>> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
>> Tested-by: Michal Simek <michal.simek@xilinx.com>
>> ---
>> Changes in v2:
>> - Added missing of.h to avoid kbuild system report error
>> ---
>>  drivers/mtd/nand/Kconfig      |    7 +
>>  drivers/mtd/nand/Makefile     |    1 +
>>  drivers/mtd/nand/arasan_nfc.c |  862 ++++++++++++++++++++++++++++++=
+++++++++++
>>  3 files changed, 870 insertions(+), 0 deletions(-)
>>  create mode 100644 drivers/mtd/nand/arasan_nfc.c
>>
>> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>> index 5897d8d..64e497c 100644
>> --- a/drivers/mtd/nand/Kconfig
>> +++ b/drivers/mtd/nand/Kconfig
>> @@ -530,4 +530,11 @@ config MTD_NAND_HISI504
>>       help
>>         Enables support for NAND controller on Hisilicon SoC Hip04.
>>
>> +config MTD_NAND_ARASAN
>> +     tristate "Support for Arasan Nand Flash controller"
>> +     depends on MTD_NAND
>> +     help
>> +       Enables the driver for the Arasan Nand Flash controller on
>> +       Zynq UltraScale+ MPSoC.
>> +
>>  endif # MTD_NAND
>> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
>> index 582bbd05..fd863ea 100644
>> --- a/drivers/mtd/nand/Makefile
>> +++ b/drivers/mtd/nand/Makefile
>> @@ -52,5 +52,6 @@ obj-$(CONFIG_MTD_NAND_XWAY)         +=3D xway_nand=
=2Eo
>>  obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH) +=3D bcm47xxnflash/
>>  obj-$(CONFIG_MTD_NAND_SUNXI)         +=3D sunxi_nand.o
>>  obj-$(CONFIG_MTD_NAND_HISI504)               +=3D hisi504_nand.o
>> +obj-$(CONFIG_MTD_NAND_ARASAN)                +=3D arasan_nfc.o
>>
>>  nand-objs :=3D nand_base.o nand_bbt.o nand_timings.o
>> diff --git a/drivers/mtd/nand/arasan_nfc.c b/drivers/mtd/nand/arasan=
_nfc.c
>> new file mode 100644
>> index 0000000..5736864
>> --- /dev/null
>> +++ b/drivers/mtd/nand/arasan_nfc.c
>> @@ -0,0 +1,862 @@
>> +/*
>> + * Arasan Nand Flash Controller Driver
>> + *
>> + * Copyright (C) 2014 - 2015 Xilinx, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify it under
>> + * the terms of the GNU General Public License version 2 as publish=
ed by the
>> + * Free Software Foundation; either version 2 of the License, or (a=
t your
>> + * option) any later version.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/module.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mtd/nand.h>
>> +#include <linux/mtd/partitions.h>
>> +#include <linux/of.h>
>> +#include <linux/of_mtd.h>
>> +#include <linux/platform_device.h>
>> +
>> +#define DRIVER_NAME                  "arasan_nfc"
>> +#define EVNT_TIMEOUT                 1000
>> +#define STATUS_TIMEOUT                       2000
>> +
>> +#define PKT_OFST                     0x00
>> +#define MEM_ADDR1_OFST                       0x04
>> +#define MEM_ADDR2_OFST                       0x08
>> +#define CMD_OFST                     0x0C
>> +#define PROG_OFST                    0x10
>> +#define INTR_STS_EN_OFST             0x14
>> +#define INTR_SIG_EN_OFST             0x18
>> +#define INTR_STS_OFST                        0x1C
>> +#define READY_STS_OFST                       0x20
>> +#define DMA_ADDR1_OFST                       0x24
>> +#define FLASH_STS_OFST                       0x28
>> +#define DATA_PORT_OFST                       0x30
>> +#define ECC_OFST                     0x34
>> +#define ECC_ERR_CNT_OFST             0x38
>> +#define ECC_SPR_CMD_OFST             0x3C
>> +#define ECC_ERR_CNT_1BIT_OFST                0x40
>> +#define ECC_ERR_CNT_2BIT_OFST                0x44
>> +#define DMA_ADDR0_OFST                       0x50
>> +
>> +#define PKT_CNT_SHIFT                        12
>> +
>> +#define ECC_ENABLE                   BIT(31)
>> +#define DMA_EN_MASK                  GENMASK(27, 26)
>> +#define DMA_ENABLE                   0x2
>> +#define DMA_EN_SHIFT                 26
>> +#define PAGE_SIZE_MASK                       GENMASK(25, 23)
>> +#define PAGE_SIZE_SHIFT                      23
>> +#define PAGE_SIZE_512                        0
>> +#define PAGE_SIZE_1K                 5
>> +#define PAGE_SIZE_2K                 1
>> +#define PAGE_SIZE_4K                 2
>> +#define PAGE_SIZE_8K                 3
>> +#define PAGE_SIZE_16K                        4
>> +#define CMD2_SHIFT                   8
>> +#define ADDR_CYCLES_SHIFT            28
>> +
>> +#define XFER_COMPLETE                        BIT(2)
>> +#define READ_READY                   BIT(1)
>> +#define WRITE_READY                  BIT(0)
>> +#define MBIT_ERROR                   BIT(3)
>> +#define ERR_INTRPT                   BIT(4)
>> +
>> +#define PROG_PGRD                    BIT(0)
>> +#define PROG_ERASE                   BIT(2)
>> +#define PROG_STATUS                  BIT(3)
>> +#define PROG_PGPROG                  BIT(4)
>> +#define PROG_RDID                    BIT(6)
>> +#define PROG_RDPARAM                 BIT(7)
>> +#define PROG_RST                     BIT(8)
>> +
>> +#define ONFI_STATUS_FAIL             BIT(0)
>> +#define ONFI_STATUS_READY            BIT(6)
>> +
>> +#define PG_ADDR_SHIFT                        16
>> +#define BCH_MODE_SHIFT                       25
>> +#define BCH_EN_SHIFT                 27
>> +#define ECC_SIZE_SHIFT                       16
>> +
>> +#define MEM_ADDR_MASK                        GENMASK(7, 0)
>> +#define BCH_MODE_MASK                        GENMASK(27, 25)
>> +
>> +#define CS_MASK                              GENMASK(31, 30)
>> +#define CS_SHIFT                     30
>> +
>> +#define PAGE_ERR_CNT_MASK            GENMASK(16, 8)
>> +#define PKT_ERR_CNT_MASK             GENMASK(7, 0)
>> +
>> +#define ONFI_ID_LEN                  8
>> +#define TEMP_BUF_SIZE                        512
>> +
>> +/**
>> + * struct anfc_ecc_matrix - Defines ecc information storage format
>> + * @pagesize:                Page size in bytes.
>> + * @codeword_size:   Code word size information.
>> + * @eccbits:         Number of ecc bits.
>> + * @bch:             Bch / Hamming mode enable/disable.
>> + * @eccsize:         Ecc size information.
>> + */
>> +struct anfc_ecc_matrix {
>> +     u32 pagesize;
>> +     u32 codeword_size;
>> +     u8 eccbits;
>> +     u8 bch;
>> +     u16 eccsize;
>> +};
>> +
>> +static const struct anfc_ecc_matrix ecc_matrix[] =3D {
>> +     {512,   512,    1,      0,      0x3},
>> +     {512,   512,    4,      1,      0x7},
>> +     {512,   512,    8,      1,      0xD},
>> +     /* 2K byte page */
>> +     {2048,  512,    1,      0,      0xC},
>> +     {2048,  512,    4,      1,      0x1A},
>> +     {2048,  512,    8,      1,      0x34},
>> +     {2048,  512,    12,     1,      0x4E},
>> +     {2048,  1024,   24,     1,      0x54},
>> +     /* 4K byte page */
>> +     {4096,  512,    1,      0,      0x18},
>> +     {4096,  512,    4,      1,      0x34},
>> +     {4096,  512,    8,      1,      0x68},
>> +     {4096,  512,    12,     1,      0x9C},
>> +     {4096,  1024,   4,      1,      0xA8},
>> +     /* 8K byte page */
>> +     {8192,  512,    1,      0,      0x30},
>> +     {8192,  512,    4,      1,      0x68},
>> +     {8192,  512,    8,      1,      0xD0},
>> +     {8192,  512,    12,     1,      0x138},
>> +     {8192,  1024,   24,     1,      0x150},
>> +     /* 16K byte page */
>> +     {16384, 512,    1,      0,      0x60},
>> +     {16384, 512,    4,      1,      0xD0},
>> +     {16384, 512,    8,      1,      0x1A0},
>> +     {16384, 512,    12,     1,      0x270},
>> +     {16384, 1024,   24,     1,      0x2A0}
>> +};
>> +
>> +/**
>> + * struct anfc - Defines the Arasan NAND flash driver instance
>> + * @chip:            NAND chip information structure.
>> + * @mtd:             MTD information structure.
>> + * @parts:           Pointer to the mtd_partition structure.
>> + * @dev:             Pointer to the device structure.
>> + * @base:            Virtual address of the NAND flash device.
>> + * @curr_cmd:                Current command issued.
>> + * @dma:             Dma enable/disable.
>> + * @bch:             Bch / Hamming mode enable/disable.
>> + * @err:             Error identifier.
>> + * @iswriteoob:              Identifies if oob write operation is r=
equired.
>> + * @buf:             Buffer used for read/write byte operations.
>> + * @raddr_cycles:    Row address cycle information.
>> + * @caddr_cycles:    Column address cycle information.
>> + * @irq:             irq number
>> + * @page:            Page address to be use for write oob operation=
s.
>> + * @pktsize:         Packet size for read / write operation.
>> + * @bufshift:                Variable used for indexing buffer oper=
ation
>> + * @rdintrmask:              Interrupt mask value for read operatio=
n.
>> + * @bufrdy:          Completion event for buffer ready.
>> + * @xfercomp:                Completion event for transfer complete=
=2E
>> + * @ecclayout:               Ecc layout object
>> + */
>> +struct anfc {
>> +     struct nand_chip chip;
>> +     struct mtd_info mtd;
>> +     struct mtd_partition *parts;
>
> ^^ This field is unused.

yaa. i will remove

>
>> +     struct device *dev;
>> +
>> +     void __iomem *base;
>> +     int curr_cmd;
>> +
>> +     bool dma;
>> +     bool bch;
>> +     bool err;
>> +     bool iswriteoob;
>> +
>> +     u8 buf[TEMP_BUF_SIZE];
>> +
>> +     u16 raddr_cycles;)
>> +     u16 caddr_cycles;
>> +
>> +     u32 irq;
>> +     u32 page;
>> +     u32 pktsize;
>> +     u32 bufshift;
>> +     u32 rdintrmask;
>> +
>> +     struct completion bufrdy;
>> +     struct completion xfercomp;
>> +     struct nand_ecclayout ecclayout;
>> +};
>> +
>> +static u8 anfc_page(u32 pagesize)
>> +{
>> +     switch (pagesize) {
>> +     case 512:
>> +             return PAGE_SIZE_512;
>> +     case 2048:
>> +             return PAGE_SIZE_2K;
>> +     case 4096:
>> +             return PAGE_SIZE_4K;
>> +     case 8192:
>> +             return PAGE_SIZE_8K;
>> +     case 16384:
>> +             return PAGE_SIZE_16K;
>> +     case 1024:
>> +             return PAGE_SIZE_1K;
>> +     default:
>> +             break;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static inline void anfc_enable_intrs(struct anfc *nfc, u32 val)
>> +{
>> +     writel(val, nfc->base + INTR_STS_EN_OFST);
>> +     writel(val, nfc->base + INTR_SIG_EN_OFST);
>> +}
>> +
>> +static int anfc_wait_for_event(struct anfc *nfc, u32 event)
>> +{
>> +     struct completion *comp;
>> +     int ret;
>> +
>> +     if (event =3D=3D XFER_COMPLETE)
>> +             comp =3D &nfc->xfercomp;
>> +     else
>> +             comp =3D &nfc->bufrdy;
>> +
>> +     ret =3D wait_for_completion_timeout(comp, msecs_to_jiffies(EVN=
T_TIMEOUT));
>> +
>> +     return ret;
>> +}
>> +
>> +static inline void anfc_setpktszcnt(struct anfc *nfc, u32 pktsize,
>> +                                 u32 pktcount)
>> +{
>> +     writel(pktsize | (pktcount << PKT_CNT_SHIFT), nfc->base + PKT_=
OFST);
>> +}
>> +
>> +static inline void anfc_set_eccsparecmd(struct anfc *nfc, u8 cmd1, =
u8 cmd2)
>> +{
>> +     writel(cmd1 | (cmd2 << CMD2_SHIFT) |
>> +            (nfc->caddr_cycles << ADDR_CYCLES_SHIFT),
>> +            nfc->base + ECC_SPR_CMD_OFST);
>> +}
>> +
>> +static void anfc_setpagecoladdr(struct anfc *nfc, u32 page, u16 col=
)
>> +{
>> +     u32 val;
>> +
>> +     writel(col | (page << PG_ADDR_SHIFT), nfc->base + MEM_ADDR1_OF=
ST);
>> +
>> +     val =3D readl(nfc->base + MEM_ADDR2_OFST);
>> +     val =3D (val & ~MEM_ADDR_MASK) |
>> +           ((page >> PG_ADDR_SHIFT) & MEM_ADDR_MASK);
>> +     writel(val, nfc->base + MEM_ADDR2_OFST);
>> +}
>> +
>> +static void anfc_prepare_cmd(struct anfc *nfc, u8 cmd1, u8 cmd2,
>> +                          u8 dmamode, u32 pagesize, u8 addrcycles)
>> +{
>> +     u32 regval;
>> +
>> +     regval =3D cmd1 | (cmd2 << CMD2_SHIFT);
>> +     if (dmamode && nfc->dma)
>> +             regval |=3D DMA_ENABLE << DMA_EN_SHIFT;
>> +     if (addrcycles)
>> +             regval |=3D addrcycles << ADDR_CYCLES_SHIFT;
>> +     if (pagesize)
>> +             regval |=3D anfc_page(pagesize) << PAGE_SIZE_SHIFT;
>> +     writel(regval, nfc->base + CMD_OFST);
>> +}
>> +
>> +static int anfc_device_ready(struct mtd_info *mtd,
>> +                          struct nand_chip *chip)
>> +{
>> +     u8 status;
>> +     u32 timeout =3D STATUS_TIMEOUT;
>> +
>> +     while (timeout--) {
>> +             chip->cmdfunc(mtd, NAND_CMD_STATUS, 0, 0);
>> +             status =3D chip->read_byte(mtd);
>> +             if (status & ONFI_STATUS_READY) {
>> +                     if (status & ONFI_STATUS_FAIL)
>> +                             return NAND_STATUS_FAIL;
>> +                     return 0;
>> +             }
>> +     }
>
> No, we can't just do a busy-wait loop at an arbitrary count of 2000
> cycles. Can you do something that's interrupt-based? Or at least time
> yourself with jiffies or something similar.

I will Jiffies as there is no interrupt status for this.

>
>> +
>> +     pr_err("%s timed out\n", __func__);
>> +     return -ETIMEDOUT;
>> +}
>> +
>> +static int anfc_read_oob(struct mtd_info *mtd, struct nand_chip *ch=
ip,
>> +                      int page)
>> +{
>> +     struct anfc *nfc =3D container_of(mtd, struct anfc, mtd);
>> +
>> +     chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
>> +     if (nfc->dma)
>> +             nfc->rdintrmask =3D XFER_COMPLETE;
>> +     else
>> +             nfc->rdintrmask =3D READ_READY;
>> +     chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
>> +
>> +     return 0;
>> +}
>> +
>> +static int anfc_write_oob(struct mtd_info *mtd, struct nand_chip *c=
hip,
>> +                       int page)
>> +{
>> +     struct anfc *nfc =3D container_of(mtd, struct anfc, mtd);
>> +
>> +     nfc->iswriteoob =3D true;
>> +     chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize, page);
>> +     chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
>> +     nfc->iswriteoob =3D false;
>> +
>> +     return 0;
>> +}
>> +
>> +static void anfc_read_buf(struct mtd_info *mtd, uint8_t *buf, int l=
en)
>> +{
>> +     u32 i, pktcount, buf_rd_cnt =3D 0, pktsize;
>> +     u32 *bufptr =3D (u32 *)buf;
>> +     struct anfc *nfc =3D container_of(mtd, struct anfc, mtd);
>> +     dma_addr_t paddr =3D 0;
>> +
>> +     if (nfc->curr_cmd =3D=3D NAND_CMD_READ0) {
>> +             pktsize =3D nfc->pktsize;
>> +             if (mtd->writesize % pktsize)
>> +                     pktcount =3D mtd->writesize / pktsize + 1;
>> +             else
>> +                     pktcount =3D mtd->writesize / pktsize;
>> +     } else {
>> +             pktsize =3D len;
>> +             pktcount =3D 1;
>> +     }
>> +
>> +     anfc_setpktszcnt(nfc, pktsize, pktcount);
>> +
>> +     if (nfc->dma) {
>> +             paddr =3D dma_map_single(nfc->dev, buf, len, DMA_FROM_=
DEVICE);
>> +             if (dma_mapping_error(nfc->dev, paddr)) {
>> +                     dev_err(nfc->dev, "Read buffer mapping error")=
;
>> +                     return;
>> +             }
>> +             writel(paddr, nfc->base + DMA_ADDR0_OFST);
>> +             writel(paddr >> 32, nfc->base + DMA_ADDR1_OFST);
>
> drivers/mtd/nand/arasan_nfc.c: In function =E2=80=98anfc_read_buf=E2=80=
=99:
> drivers/mtd/nand/arasan_nfc.c:355:3: warning: right shift count >=3D =
width of type [enabled by default]
>    writel(paddr >> 32, nfc->base + DMA_ADDR1_OFST);
>    ^
>
> How about using upper_32_bits() and lower_32_bits()?

I just tried and it works. Thanks.

>
>> +             anfc_enable_intrs(nfc, nfc->rdintrmask);
>> +             writel(PROG_PGRD, nfc->base + PROG_OFST);
>> +             anfc_wait_for_event(nfc, XFER_COMPLETE);
>> +             dma_unmap_single(nfc->dev, paddr, len, DMA_FROM_DEVICE=
);
>> +             return;
>> +     }
>> +
>> +     anfc_enable_intrs(nfc, nfc->rdintrmask);
>> +     writel(PROG_PGRD, nfc->base + PROG_OFST);
>> +
>> +     while (buf_rd_cnt < pktcount) {
>> +
>> +             anfc_wait_for_event(nfc, READ_READY);
>> +             buf_rd_cnt++;
>> +
>> +             if (buf_rd_cnt =3D=3D pktcount)
>> +                     anfc_enable_intrs(nfc, XFER_COMPLETE);
>> +
>> +             for (i =3D 0; i < pktsize / 4; i++)
>> +                     bufptr[i] =3D readl(nfc->base + DATA_PORT_OFST=
);
>> +
>> +             bufptr +=3D (pktsize / 4);
>> +
>> +             if (buf_rd_cnt < pktcount)
>> +                     anfc_enable_intrs(nfc, nfc->rdintrmask);
>> +     }
>> +
>> +     anfc_wait_for_event(nfc, XFER_COMPLETE);
>> +}
>> +
>> +static void anfc_write_buf(struct mtd_info *mtd, const uint8_t *buf=
, int len)
>> +{
>> +     u32 buf_wr_cnt =3D 0, pktcount =3D 1, i, pktsize;
>> +     u32 *bufptr =3D (u32 *)buf;
>> +     struct anfc *nfc =3D container_of(mtd, struct anfc, mtd);
>> +     dma_addr_t paddr =3D 0;
>> +
>> +     if (nfc->iswriteoob) {
>> +             pktsize =3D len;
>> +             pktcount =3D 1;
>> +     } else {
>> +             pktsize =3D nfc->pktsize;
>> +             pktcount =3D mtd->writesize / pktsize;
>> +     }
>> +
>> +     anfc_setpktszcnt(nfc, pktsize, pktcount);
>> +
>> +     if (nfc->dma) {
>> +             paddr =3D dma_map_single(nfc->dev, (void *)buf, len,
>> +                                    DMA_TO_DEVICE);
>> +             if (dma_mapping_error(nfc->dev, paddr)) {
>> +                     dev_err(nfc->dev, "Write buffer mapping error"=
);
>> +                     return;
>> +             }
>> +             writel(paddr, nfc->base + DMA_ADDR0_OFST);
>> +             writel(paddr >> 32, nfc->base + DMA_ADDR1_OFST);
>
> Same problem as in read_buf().
>
>> +             anfc_enable_intrs(nfc, XFER_COMPLETE);
>> +             writel(PROG_PGPROG, nfc->base + PROG_OFST);
>> +             anfc_wait_for_event(nfc, XFER_COMPLETE);
>> +             dma_unmap_single(nfc->dev, paddr, len, DMA_TO_DEVICE);
>> +             return;
>> +     }
>> +
>> +     anfc_enable_intrs(nfc, WRITE_READY);
>> +     writel(PROG_PGPROG, nfc->base + PROG_OFST);
>> +
>> +     while (buf_wr_cnt < pktcount) {
>> +             anfc_wait_for_event(nfc, WRITE_READY);
>> +
>> +             buf_wr_cnt++;
>> +             if (buf_wr_cnt =3D=3D pktcount)
>> +                     anfc_enable_intrs(nfc, XFER_COMPLETE);
>> +
>> +             for (i =3D 0; i < (pktsize / 4); i++)
>> +                     writel(bufptr[i], nfc->base + DATA_PORT_OFST);
>> +
>> +             bufptr +=3D (pktsize / 4);
>> +
>> +             if (buf_wr_cnt < pktcount)
>> +                     anfc_enable_intrs(nfc, WRITE_READY);
>> +     }
>> +
>> +     anfc_wait_for_event(nfc, XFER_COMPLETE);
>> +}
>> +
>> +static int anfc_read_page_hwecc(struct mtd_info *mtd,
>> +                             struct nand_chip *chip, uint8_t *buf,
>> +                             int oob_required, int page)
>> +{
>> +     u32 val;
>> +     struct anfc *nfc =3D container_of(mtd, struct anfc, mtd);
>> +
>> +     anfc_set_eccsparecmd(nfc, NAND_CMD_RNDOUT, NAND_CMD_RNDOUTSTAR=
T);
>> +
>> +     val =3D readl(nfc->base + CMD_OFST);
>> +     val =3D val | ECC_ENABLE;
>> +     writel(val, nfc->base + CMD_OFST);
>> +
>> +     if (nfc->dma)
>> +             nfc->rdintrmask =3D XFER_COMPLETE;
>> +     else
>> +             nfc->rdintrmask =3D READ_READY;
>> +
>> +     if (!nfc->bch)
>> +             nfc->rdintrmask =3D MBIT_ERROR;
>> +
>> +     chip->read_buf(mtd, buf, mtd->writesize);
>> +
>> +     val =3D readl(nfc->base + ECC_ERR_CNT_OFST);
>> +     if (nfc->bch) {
>> +             mtd->ecc_stats.corrected +=3D val & PAGE_ERR_CNT_MASK;
>> +     } else {
>> +             val =3D readl(nfc->base + ECC_ERR_CNT_1BIT_OFST);
>> +             mtd->ecc_stats.corrected +=3D val;
>> +             val =3D readl(nfc->base + ECC_ERR_CNT_2BIT_OFST);
>> +             mtd->ecc_stats.failed +=3D val;
>> +             /* Clear ecc error count register 1Bit, 2Bit */
>> +             writel(0x0, nfc->base + ECC_ERR_CNT_1BIT_OFST);
>> +             writel(0x0, nfc->base + ECC_ERR_CNT_2BIT_OFST);
>> +     }
>> +     nfc->err =3D false;
>> +
>> +     if (oob_required)
>> +             chip->ecc.read_oob(mtd, chip, page);
>> +
>> +     return 0;
>> +}
>> +
>> +static int anfc_write_page_hwecc(struct mtd_info *mtd,
>> +                              struct nand_chip *chip, const uint8_t=
 *buf,
>> +                              int oob_required)
>> +{
>> +     u32 val, i;
>> +     struct anfc *nfc =3D container_of(mtd, struct anfc, mtd);
>> +     uint8_t *ecc_calc =3D chip->buffers->ecccalc;
>> +     uint32_t *eccpos =3D chip->ecc.layout->eccpos;
>> +
>> +     anfc_set_eccsparecmd(nfc, NAND_CMD_RNDIN, 0);
>> +
>> +     val =3D readl(nfc->base + CMD_OFST);
>> +     val =3D val | ECC_ENABLE;
>> +     writel(val, nfc->base + CMD_OFST);
>> +
>> +     chip->write_buf(mtd, buf, mtd->writesize);
>> +
>> +     if (oob_required) {
>> +             anfc_device_ready(mtd, chip);
>> +             chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, nfc->page);
>> +             if (nfc->dma)
>> +                     nfc->rdintrmask =3D XFER_COMPLETE;
>> +             else
>> +                     nfc->rdintrmask =3D READ_READY;
>> +             chip->read_buf(mtd, ecc_calc, mtd->oobsize);
>> +             for (i =3D 0; i < chip->ecc.total; i++)
>> +                     chip->oob_poi[eccpos[i]] =3D ecc_calc[eccpos[i=
]];
>> +             chip->ecc.write_oob(mtd, chip, nfc->page);
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static u8 anfc_read_byte(struct mtd_info *mtd)
>> +{
>> +     struct anfc *nfc =3D container_of(mtd, struct anfc, mtd);
>> +
>> +     return nfc->buf[nfc->bufshift++];
>> +}
>> +
>> +static void anfc_readfifo(struct anfc *nfc, u32 prog, u32 size)
>> +{
>> +     u32 i, *bufptr =3D (u32 *)&nfc->buf[0];
>> +
>> +     anfc_enable_intrs(nfc, READ_READY);
>> +
>> +     writel(prog, nfc->base + PROG_OFST);
>> +     anfc_wait_for_event(nfc, READ_READY);
>> +
>> +     anfc_enable_intrs(nfc, XFER_COMPLETE);
>> +
>> +     for (i =3D 0; i < size / 4; i++)
>> +             bufptr[i] =3D readl(nfc->base + DATA_PORT_OFST);
>> +
>> +     anfc_wait_for_event(nfc, XFER_COMPLETE);
>> +}
>> +
>> +static int anfc_ecc_init(struct mtd_info *mtd,
>> +                      struct nand_ecc_ctrl *ecc)
>> +{
>> +     u32 oob_index, i, ecc_addr, regval, bchmode =3D 0;
>> +     struct nand_chip *nand_chip =3D mtd->priv;
>> +     struct anfc *nfc =3D container_of(mtd, struct anfc, mtd);
>> +     int found =3D -1;
>> +
>> +     nand_chip->ecc.mode =3D NAND_ECC_HW;
>> +     nand_chip->ecc.read_page =3D anfc_read_page_hwecc;
>> +     nand_chip->ecc.write_page =3D anfc_write_page_hwecc;
>> +     nand_chip->ecc.write_oob =3D anfc_write_oob;
>> +     nand_chip->ecc.read_oob =3D anfc_read_oob;
>> +
>> +     for (i =3D 0; i < sizeof(ecc_matrix) / sizeof(struct anfc_ecc_=
matrix);
>> +          i++) {
>> +             if ((ecc_matrix[i].pagesize =3D=3D mtd->writesize) &&
>> +                 (ecc_matrix[i].codeword_size >=3D nand_chip->ecc_s=
tep_ds)) {
>> +                     if (ecc_matrix[i].eccbits >=3D
>> +                         nand_chip->ecc_strength_ds) {
>> +                             found =3D i;
>> +                             break;
>> +                     }
>> +                     found =3D i;
>> +             }
>> +     }
>> +
>> +     if (found < 0) {
>> +             dev_err(nfc->dev, "ECC scheme not supported");
>> +             return 1;
>> +     }
>> +     if (ecc_matrix[found].bch) {
>> +             switch (ecc_matrix[found].eccbits) {
>> +             case 12:
>> +                     bchmode =3D 0x1;
>> +                     break;
>> +             case 8:
>> +                     bchmode =3D 0x2;
>> +                     break;
>> +             case 4:
>> +                     bchmode =3D 0x3;
>> +                     break;
>> +             case 24:
>> +                     bchmode =3D 0x4;
>> +                     break;
>> +             default:
>> +                     bchmode =3D 0x0;
>> +             }
>> +     }
>> +
>> +     nand_chip->ecc.strength =3D ecc_matrix[found].eccbits;
>> +     nand_chip->ecc.size =3D ecc_matrix[found].codeword_size;
>> +     nand_chip->ecc.steps =3D ecc_matrix[found].pagesize /
>> +                            ecc_matrix[found].codeword_size;
>> +     nand_chip->ecc.bytes =3D ecc_matrix[found].eccsize /
>> +                            nand_chip->ecc.steps;
>> +     nfc->ecclayout.eccbytes =3D ecc_matrix[found].eccsize;
>> +     nfc->bch =3D ecc_matrix[found].bch;
>> +     oob_index =3D nand_chip->onfi_params.spare_bytes_per_page -
>> +                 nfc->ecclayout.eccbytes;
>
> sparse doesn't like this:
>
> drivers/mtd/nand/arasan_nfc.c:599:43: warning: restricted __le16 degr=
ades to integer [sparse]
>
> You need to use __le16_to_cpu() when accessing ONFI params. But reall=
y,
> you should be using mtd->oobsize, not onfi_params

Correct. I can use mtd->oobsize.

>
>> +     ecc_addr =3D mtd->writesize + oob_index;
>> +
>> +     for (i =3D 0; i < nand_chip->ecc.size; i++)
>> +             nfc->ecclayout.eccpos[i] =3D oob_index + i;
>> +
>> +     nfc->ecclayout.oobfree->offset =3D 2;
>> +     nfc->ecclayout.oobfree->length =3D oob_index -
>> +                                      nfc->ecclayout.oobfree->offse=
t;
>> +
>> +     nand_chip->ecc.layout =3D &(nfc->ecclayout);
>> +     regval =3D ecc_addr | (ecc_matrix[found].eccsize << ECC_SIZE_S=
HIFT) |
>> +              (ecc_matrix[found].bch << BCH_EN_SHIFT);
>> +     writel(regval, nfc->base + ECC_OFST);
>> +
>> +     regval =3D readl(nfc->base + MEM_ADDR2_OFST);
>> +     regval =3D (regval & ~(BCH_MODE_MASK)) | (bchmode << BCH_MODE_=
SHIFT);
>> +     writel(regval, nfc->base + MEM_ADDR2_OFST);
>> +
>> +     if (nand_chip->ecc_step_ds >=3D 1024)
>> +             nfc->pktsize =3D 1024;
>> +     else
>> +             nfc->pktsize =3D 512;
>> +
>> +     return 0;
>> +}
>> +
>> +static void anfc_cmd_function(struct mtd_info *mtd,
>> +                           unsigned int cmd, int column, int page_a=
ddr)
>> +{
>> +     struct anfc *nfc =3D container_of(mtd, struct anfc, mtd);
>> +     bool wait =3D false, read =3D false;
>> +     u32 addrcycles, prog;
>> +     u32 *bufptr =3D (u32 *)&nfc->buf[0];
>> +
>> +     nfc->bufshift =3D 0;
>> +     nfc->curr_cmd =3D cmd;
>> +
>> +     if (page_addr =3D=3D -1)
>> +             page_addr =3D 0;
>> +     if (column =3D=3D -1)
>> +             column =3D 0;
>> +
>> +     switch (cmd) {
>> +     case NAND_CMD_RESET:
>> +             anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 0);
>> +             prog =3D PROG_RST;
>> +             wait =3D true;
>> +             break;
>> +     case NAND_CMD_SEQIN:
>> +             addrcycles =3D nfc->raddr_cycles + nfc->caddr_cycles;
>> +             nfc->page =3D page_addr;
>> +             anfc_prepare_cmd(nfc, cmd, NAND_CMD_PAGEPROG, 1,
>> +                              mtd->writesize, addrcycles);
>> +             anfc_setpagecoladdr(nfc, page_addr, column);
>> +             break;
>> +     case NAND_CMD_READOOB:
>> +             column +=3D mtd->writesize;
>> +     case NAND_CMD_READ0:
>> +     case NAND_CMD_READ1:
>> +             addrcycles =3D nfc->raddr_cycles + nfc->caddr_cycles;
>> +             anfc_prepare_cmd(nfc, NAND_CMD_READ0, NAND_CMD_READSTA=
RT, 1,
>> +                              mtd->writesize, addrcycles);
>> +             anfc_setpagecoladdr(nfc, page_addr, column);
>> +             break;
>> +     case NAND_CMD_RNDOUT:
>> +             anfc_prepare_cmd(nfc, cmd, NAND_CMD_RNDOUTSTART, 1,
>> +                              mtd->writesize, 2);
>> +             anfc_setpagecoladdr(nfc, page_addr, column);
>> +             if (nfc->dma)
>> +                     nfc->rdintrmask =3D XFER_COMPLETE;
>> +             else
>> +                     nfc->rdintrmask =3D READ_READY;
>> +             break;
>> +     case NAND_CMD_PARAM:
>> +             anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
>> +             anfc_setpagecoladdr(nfc, page_addr, column);
>> +             anfc_setpktszcnt(nfc, sizeof(struct nand_onfi_params),=
 1);
>> +             anfc_readfifo(nfc, PROG_RDPARAM,
>> +                             sizeof(struct nand_onfi_params));
>> +             break;
>> +     case NAND_CMD_READID:
>> +             anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
>> +             anfc_setpagecoladdr(nfc, page_addr, column);
>> +             anfc_setpktszcnt(nfc, ONFI_ID_LEN, 1);
>> +             anfc_readfifo(nfc, PROG_RDID, ONFI_ID_LEN);
>> +             break;
>> +     case NAND_CMD_ERASE1:
>> +             addrcycles =3D nfc->raddr_cycles;
>> +             prog =3D PROG_ERASE;
>> +             anfc_prepare_cmd(nfc, cmd, NAND_CMD_ERASE2, 0, 0, addr=
cycles);
>> +             column =3D page_addr & 0xffff;
>> +             page_addr =3D (page_addr >> PG_ADDR_SHIFT) & 0xffff;
>> +             anfc_setpagecoladdr(nfc, page_addr, column);
>> +             wait =3D true;
>> +             break;
>> +     case NAND_CMD_STATUS:
>> +             anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 0);
>> +             anfc_setpktszcnt(nfc, 1, 1);
>> +             anfc_setpagecoladdr(nfc, page_addr, column);
>> +             prog =3D PROG_STATUS;
>> +             wait =3D read =3D true;
>> +             break;
>> +     default:
>> +             return;
>> +     }
>> +
>> +     if (wait) {
>> +             anfc_enable_intrs(nfc, XFER_COMPLETE);
>> +             writel(prog, nfc->base + PROG_OFST);
>> +             anfc_wait_for_event(nfc, XFER_COMPLETE);
>> +     }
>> +
>> +     if (read)
>> +             bufptr[0] =3D readl(nfc->base + FLASH_STS_OFST);
>> +}
>> +
>> +static void anfc_select_chip(struct mtd_info *mtd, int num)
>> +{
>> +     u32 val;
>> +     struct anfc *nfc =3D container_of(mtd, struct anfc, mtd);
>> +
>> +     if (num =3D=3D -1)
>> +             return;
>> +
>> +     val =3D readl(nfc->base + MEM_ADDR2_OFST);
>> +     val =3D (val & ~(CS_MASK)) | (num << CS_SHIFT);
>> +     writel(val, nfc->base + MEM_ADDR2_OFST);
>> +}
>> +
>> +static irqreturn_t anfc_irq_handler(int irq, void *ptr)
>> +{
>> +     struct anfc *nfc =3D ptr;
>> +     u32 regval =3D 0, status;
>> +
>> +     status =3D readl(nfc->base + INTR_STS_OFST);
>> +     if (status & XFER_COMPLETE) {
>> +             complete(&nfc->xfercomp);
>> +             regval |=3D XFER_COMPLETE;
>> +     }
>> +
>> +     if (status & READ_READY) {
>> +             complete(&nfc->bufrdy);
>> +             regval |=3D READ_READY;
>> +     }
>> +
>> +     if (status & WRITE_READY) {
>> +             complete(&nfc->bufrdy);
>> +             regval |=3D WRITE_READY;
>> +     }
>> +
>> +     if (status & MBIT_ERROR) {
>> +             nfc->err =3D true;
>> +             complete(&nfc->bufrdy);
>> +             regval |=3D MBIT_ERROR;
>> +     }
>> +
>> +     if (regval) {
>> +             writel(regval, nfc->base + INTR_STS_OFST);
>> +             writel(0, nfc->base + INTR_STS_EN_OFST);
>> +             writel(0, nfc->base + INTR_SIG_EN_OFST);
>> +
>> +             return IRQ_HANDLED;
>> +     }
>> +
>> +     return IRQ_NONE;
>> +}
>> +
>> +static int anfc_probe(struct platform_device *pdev)
>> +{
>> +     struct anfc *nfc;
>> +     struct mtd_info *mtd;
>> +     struct nand_chip *nand_chip;
>> +     struct resource *res;
>> +     struct mtd_part_parser_data ppdata;
>> +     int err;
>> +
>> +     nfc =3D devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
>> +     if (!nfc)
>> +             return -ENOMEM;
>> +
>> +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +     nfc->base =3D devm_ioremap_resource(&pdev->dev, res);
>> +     if (IS_ERR(nfc->base))
>> +             return PTR_ERR(nfc->base);
>> +
>> +     mtd =3D &nfc->mtd;
>> +     nand_chip =3D &nfc->chip;
>> +     nand_chip->priv =3D nfc;
>> +     mtd->priv =3D nand_chip;
>> +     mtd->owner =3D THIS_MODULE;
>> +     mtd->name =3D DRIVER_NAME;
>> +     nfc->dev =3D &pdev->dev;
>
> You should set mtd->dev.parent too.


Ok.

>
>> +
>> +     nand_chip->cmdfunc =3D anfc_cmd_function;
>> +     nand_chip->waitfunc =3D anfc_device_ready;
>> +     nand_chip->chip_delay =3D 30;
>> +     nand_chip->read_buf =3D anfc_read_buf;
>> +     nand_chip->write_buf =3D anfc_write_buf;
>> +     nand_chip->read_byte =3D anfc_read_byte;
>> +     nand_chip->bbt_options =3D NAND_BBT_USE_FLASH;
>> +     nand_chip->select_chip =3D anfc_select_chip;
>> +     mtd->size =3D nand_chip->chipsize;
>
> This line looks superfluous. chipsize isn't even set at this point.

I will remove this.

>
>> +     nfc->dma =3D of_property_read_bool(pdev->dev.of_node,
>> +                                      "arasan,has-mdma");
>> +     platform_set_drvdata(pdev, nfc);
>> +     init_completion(&nfc->bufrdy);
>> +     init_completion(&nfc->xfercomp);
>> +     nfc->irq =3D platform_get_irq(pdev, 0);
>
> Check for errors?

I thought devm_request_irq will return error if an invalid irq number i=
s passed.
i will cross check once again and add error check if required.

>
>> +     err =3D devm_request_irq(&pdev->dev, nfc->irq, anfc_irq_handle=
r,
>> +                            0, "arasannfc", nfc);
>> +     if (err)
>> +             return err;
>> +
>> +     if (nand_scan_ident(mtd, 1, NULL)) {
>> +             dev_err(&pdev->dev, "nand_scan_ident for NAND failed\n=
");
>> +             return -ENXIO;
>> +     }
>> +     nfc->raddr_cycles =3D nand_chip->onfi_params.addr_cycles & 0xF=
;
>> +     nfc->caddr_cycles =3D (nand_chip->onfi_params.addr_cycles >> 4=
) & 0xF;
>
> Do you *have* to get this from ONFI? What if someone uses non-ONFI
> flash? You should at least check if this is an ONFI flash before usin=
g
> these param values.

Yes, i have to get this from onfi because though most of the flash
devices typically
using 5 address cycles (row + col) we have seen few spansion devices ex=
pecting
4 address cycles.

probably

   if (nand_chip->onfi_version) // or add an equivalent API in mtd/nand=
=2Eh
      get the address cycles info from onfi
   else
       use default 5 address cycles.


Please let me know is it the correct implementation.

>
>> +
>> +     if (anfc_ecc_init(mtd, &nand_chip->ecc))
>> +             return -ENXIO;
>> +
>> +     if (nand_scan_tail(mtd)) {
>> +             dev_err(&pdev->dev, "nand_scan_tail for NAND failed\n"=
);
>> +             return -ENXIO;
>> +     }
>> +
>> +     ppdata.of_node =3D pdev->dev.of_node;
>> +
>> +     mtd_device_parse_register(&nfc->mtd, NULL, &ppdata, NULL, 0);
>> +     return 0;
>
> You're ignoring the return value from mtd_device_parse_register(). Ho=
w
> about:

Ok.

Thanks Brian for the review.

Regards,
Punnaiah
>
>         return mtd_device_parse_register(&nfc->mtd, NULL, &ppdata, NU=
LL, 0);
>
>> +}
>> +
>> +static int anfc_remove(struct platform_device *pdev)
>> +{
>> +     struct anfc *nfc =3D platform_get_drvdata(pdev);
>> +
>> +     nand_release(&nfc->mtd);
>> +
>> +     return 0;
>> +}
>> +
>> +static const struct of_device_id anfc_ids[] =3D {
>> +     { .compatible =3D "arasan,nfc-v3p10" },
>> +     {  }
>> +};
>> +MODULE_DEVICE_TABLE(of, anfc_ids);
>> +
>> +static struct platform_driver anfc_driver =3D {
>> +     .driver =3D {
>> +             .name =3D DRIVER_NAME,
>> +             .of_match_table =3D anfc_ids,
>> +     },
>> +     .probe =3D anfc_probe,
>> +     .remove =3D anfc_remove,
>> +};
>> +module_platform_driver(anfc_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("Xilinx, Inc");
>> +MODULE_DESCRIPTION("Arasan NAND Flash Controller Driver");
>
> Brian
