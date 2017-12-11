From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH 02/12] mtd: nand: add reworked Marvell NAND controller driver
Date: Mon, 11 Dec 2017 13:27:30 -0300
Message-ID: <CAAEAJfC89bRugBsK8jrK=6fdq76yzjThA74UCAhAaVuonLLNvg@mail.gmail.com>
References: <20171207201814.30411-1-miquel.raynal@free-electrons.com> <20171207201814.30411-3-miquel.raynal@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171207201814.30411-3-miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 7 December 2017 at 17:18, Miquel Raynal
<miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Add marvell_nand driver which aims at replacing the existing pxa3xx_nand
> driver.
>
> The new driver intends to be easier to understand and follows the brand
> new NAND framework rules by implementing hooks for every pattern the
> controller might support and referencing them inside a parser object
> that will be given to the core at each ->exec_op() call.
>
> Raw accessors are implemented, useful to test/debug memory/filesystem
> corruptions. Userspace binaries contained in the mtd-utils package may
> now be used and their output trusted.
>
> Timings may not be kept from the bootloader anymore, the timings used
> for instance in U-Boot were not optimal and it supposed to have NAND
> support (and initialized) in the bootloader.
>
> Thanks to the improved timings, implementation of ONFI mode 5 support
> (with EDO managed by adding a delay on data sampling), merging the
> commands together and optimizing writes in the command registers, the
> new driver may achieve faster throughputs in both directions.
> Measurements show an improvement of about +23% read throughput and +24%
> write throughput. These measurements have been done with an
> Armada-385-DB-AP (4kiB NAND pages forced in 4-bit strength BCH ECC
> correction) using the userspace tool 'flash_speed' from the MTD test
> suite.
>
> Besides these important topics, the new driver addresses several
> unsolved known issues in the old driver which:
> - did not work with ECC soft neither with ECC none ;
> - relied on naked read/write (which is unchanged) while the NFCv1
>   embedded in the pxa3xx platforms do not implement it, so several
>   NAND commands did not actually ever work without any notice (like
>   reading the ONFI PARAM_PAGE or SET/GET_FEATURES) ;
> - wrote the OOB data correctly, but was not able to read it correctly
>   past the first OOB data chunk ;
> - did not displayed ECC bytes ;
> - used device tree bindings that did not allow more than one NAND chip,
>   and did not allow to choose the correct chip select if not
>   incrementing from 0. Plus, the Ready/Busy line used had to be 0.
>
> Old device tree bindings are still supported but deprecated. A more
> hierarchical view has to be used to keep the controller and the NAND
> chip structures clearly separated both inside the device tree and also
> in the driver code.
>

So, is this driver fully compatible with the current pxa3xx-nand driver?

Have you tested with U-Boot's driver (based on the pxa3xx-nand)?

I recally some subtle issues with the fact that U-Boot and Linux had
to agree about the BBT format.

> Signed-off-by: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/mtd/nand/Kconfig        |   12 +
>  drivers/mtd/nand/Makefile       |    1 +
>  drivers/mtd/nand/marvell_nand.c | 2951 +++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 2964 insertions(+)
>  create mode 100644 drivers/mtd/nand/marvell_nand.c
>
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 859eb7790c46..9e141e03f5c2 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -323,6 +323,18 @@ config MTD_NAND_PXA3xx
>           platforms (XP, 370, 375, 38x, 39x) and 64-bit Armada
>           platforms (7K, 8K) (NFCv2).
>
> +config MTD_NAND_MARVELL
> +       tristate "NAND controller support on Marvell boards"
> +       depends on PXA3xx || ARCH_MMP || PLAT_ORION || ARCH_MVEBU || \
> +                  COMPILE_TEST
> +       depends on HAS_IOMEM
> +       help
> +         This enables the NAND flash controller driver for Marvell board=
s,
> +         including:
> +         - PXA3xx processors (NFCv1)
> +         - 32-bit Armada platforms (XP, 37x, 38x, 39x) (NFCv2)
> +         - 64-bit Aramda platforms (7k, 8k) (NFCv2)
> +
>  config MTD_NAND_SLC_LPC32XX
>         tristate "NXP LPC32xx SLC Controller"
>         depends on ARCH_LPC32XX
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index 118a1349aad3..921634ba400c 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -32,6 +32,7 @@ obj-$(CONFIG_MTD_NAND_OMAP2)          +=3D omap2_nand.o
>  obj-$(CONFIG_MTD_NAND_OMAP_BCH_BUILD)  +=3D omap_elm.o
>  obj-$(CONFIG_MTD_NAND_CM_X270)         +=3D cmx270_nand.o
>  obj-$(CONFIG_MTD_NAND_PXA3xx)          +=3D pxa3xx_nand.o
> +obj-$(CONFIG_MTD_NAND_MARVELL)         +=3D marvell_nand.o
>  obj-$(CONFIG_MTD_NAND_TMIO)            +=3D tmio_nand.o
>  obj-$(CONFIG_MTD_NAND_PLATFORM)                +=3D plat_nand.o
>  obj-$(CONFIG_MTD_NAND_PASEMI)          +=3D pasemi_nand.o
> diff --git a/drivers/mtd/nand/marvell_nand.c b/drivers/mtd/nand/marvell_n=
and.c
> new file mode 100644
> index 000000000000..2525d9b2f4fa
> --- /dev/null
> +++ b/drivers/mtd/nand/marvell_nand.c
> @@ -0,0 +1,2951 @@
> +/*
> + * Marvell NAND flash controller driver
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * Copyright (C) 2017 Marvell
> + * Author: Miquel RAYNAL <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/clk.h>
> +#include <linux/mtd/rawnand.h>
> +#include <linux/of_platform.h>
> +#include <linux/iopoll.h>
> +#include <linux/interrupt.h>
> +#include <linux/slab.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
> +#include <asm/unaligned.h>
> +
> +#include <linux/dmaengine.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/dma/pxa-dma.h>
> +#include <linux/platform_data/mtd-nand-pxa3xx.h>
> +
> +/* Data FIFO granularity, FIFO reads/writes must be a multiple of this l=
ength */
> +#define FIFO_DEPTH             8
> +#define FIFO_REP(x)            (x / sizeof(u32))
> +#define BCH_SEQ_READS          (32 / FIFO_DEPTH)
> +/* NFC does not support transfers of larger chunks at a time */
> +#define MAX_CHUNK_SIZE         2112
> +/* NFCv1 cannot read more that 7 bytes of ID */
> +#define NFCV1_READID_LEN       7
> +/* Polling is done at a pace of POLL_PERIOD us until POLL_TIMEOUT is rea=
ched */
> +#define POLL_PERIOD            0
> +#define POLL_TIMEOUT           100000
> +/* Interrupt maximum wait period in ms */
> +#define IRQ_TIMEOUT            1000
> +/* Latency in clock cycles between SoC pins and NFC logic */
> +#define MIN_RD_DEL_CNT         3
> +/* Maximum number of contiguous address cycles */
> +#define MAX_ADDRESS_CYC_NFCV1  5
> +#define MAX_ADDRESS_CYC_NFCV2  7
> +/* System control registers/bits to enable the NAND controller on some S=
oCs */
> +#define GENCONF_SOC_DEVICE_MUX 0x208
> +#define GENCONF_SOC_DEVICE_MUX_NFC_EN BIT(0)
> +#define GENCONF_SOC_DEVICE_MUX_ECC_CLK_RST BIT(20)
> +#define GENCONF_SOC_DEVICE_MUX_ECC_CORE_RST BIT(21)
> +#define GENCONF_SOC_DEVICE_MUX_NFC_INT_EN BIT(25)
> +#define GENCONF_CLK_GATING_CTRL        0x220
> +#define GENCONF_CLK_GATING_CTRL_ND_GATE BIT(2)
> +#define GENCONF_ND_CLK_CTRL    0x700
> +#define GENCONF_ND_CLK_CTRL_EN BIT(0)
> +
> +/* NAND controller data flash control register */
> +#define NDCR                   0x00
> +/* NAND interface timing parameter 0 register */
> +#define NDTR0                  0x04
> +/* NAND interface timing parameter 1 register */
> +#define NDTR1                  0x0C
> +/* NAND controller status register */
> +#define NDSR                   0x14
> +/* NAND ECC control register */
> +#define NDECCCTRL              0x28
> +/* NAND controller data buffer register */
> +#define NDDB                   0x40
> +/* NAND controller command buffer 0 register */
> +#define NDCB0                  0x48
> +/* NAND controller command buffer 1 register */
> +#define NDCB1                  0x4C
> +/* NAND controller command buffer 2 register */
> +#define NDCB2                  0x50
> +/* NAND controller command buffer 3 register */
> +#define NDCB3                  0x54
> +
> +/* Data flash control register bitfields */
> +#define NDCR_ALL_INT           GENMASK(11, 0)
> +#define NDCR_CS1_CMDDM         BIT(7)
> +#define NDCR_CS0_CMDDM         BIT(8)
> +#define NDCR_RDYM              BIT(11)
> +#define NDCR_ND_ARB_EN         BIT(12)
> +#define NDCR_RA_START          BIT(15)
> +#define NDCR_RD_ID_CNT(x)      (min_t(unsigned int, x, 0x7) << 16)
> +#define NDCR_PAGE_SZ(x)                (x >=3D 2048 ? BIT(24) : 0)
> +#define NDCR_DWIDTH_M          BIT(26)
> +#define NDCR_DWIDTH_C          BIT(27)
> +#define NDCR_ND_RUN            BIT(28)
> +#define NDCR_DMA_EN            BIT(29)
> +#define NDCR_ECC_EN            BIT(30)
> +#define NDCR_SPARE_EN          BIT(31)
> +
> +/* NAND interface timing parameter registers bitfields */
> +#define NDTR0_TRP(x)           ((min_t(unsigned int, x, 0xF) & 0x7) << 0=
)
> +#define NDTR0_TRH(x)           (min_t(unsigned int, x, 0x7) << 3)
> +#define NDTR0_ETRP(x)          ((min_t(unsigned int, x, 0xF) & 0x8) << 3=
)
> +#define NDTR0_SEL_NRE_EDGE     BIT(7)
> +#define NDTR0_TWP(x)           (min_t(unsigned int, x, 0x7) << 8)
> +#define NDTR0_TWH(x)           (min_t(unsigned int, x, 0x7) << 11)
> +#define NDTR0_TCS(x)           (min_t(unsigned int, x, 0x7) << 16)
> +#define NDTR0_TCH(x)           (min_t(unsigned int, x, 0x7) << 19)
> +#define NDTR0_RD_CNT_DEL(x)    (min_t(unsigned int, x, 0xF) << 22)
> +#define NDTR0_SELCNTR          BIT(26)
> +#define NDTR0_TADL(x)          (min_t(unsigned int, x, 0x1F) << 27)
> +
> +#define NDTR1_TAR(x)           (min_t(unsigned int, x, 0xF) << 0)
> +#define NDTR1_TWHR(x)          (min_t(unsigned int, x, 0xF) << 4)
> +#define NDTR1_TRHW(x)          (min_t(unsigned int, x / 16, 0x3) << 8)
> +#define NDTR1_PRESCALE         BIT(14)
> +#define NDTR1_WAIT_MODE                BIT(15)
> +#define NDTR1_TR(x)            (min_t(unsigned int, x, 0xFFFF) << 16)
> +
> +/* NAND controller status register bitfields */
> +#define NDSR_WRCMDREQ          BIT(0)
> +#define NDSR_RDDREQ            BIT(1)
> +#define NDSR_WRDREQ            BIT(2)
> +#define NDSR_CORERR            BIT(3)
> +#define NDSR_UNCERR            BIT(4)
> +#define NDSR_CMDD(cs)          BIT(8 - cs)
> +#define NDSR_RDY(rb)           BIT(11 + rb)
> +#define NDSR_ERRCNT(x)         ((x >> 16) & 0x1F)
> +
> +/* NAND ECC control register bitfields */
> +#define NDECCTRL_BCH_EN                BIT(0)
> +
> +/* NAND controller command buffer registers bitfields */
> +#define NDCB0_CMD1(x)          ((x & 0xFF) << 0)
> +#define NDCB0_CMD2(x)          ((x & 0xFF) << 8)
> +#define NDCB0_ADDR_CYC(x)      ((x & 0x7) << 16)
> +#define NDCB0_DBC              BIT(19)
> +#define NDCB0_CMD_TYPE(x)      ((x & 0x7) << 21)
> +#define NDCB0_CSEL             BIT(24)
> +#define NDCB0_RDY_BYP          BIT(27)
> +#define NDCB0_LEN_OVRD         BIT(28)
> +#define NDCB0_CMD_XTYPE(x)     ((x & 0x7) << 29)
> +
> +#define NDCB1_COLS(x)          ((x & 0xFFFF) << 0)
> +#define NDCB1_ADDRS(x)         (x << 16)
> +
> +#define NDCB2_ADDR5(x)         (((x >> 16) & 0xFF) << 0)
> +
> +#define NDCB3_ADDR6(x)         ((x & 0xFF) << 16)
> +#define NDCB3_ADDR7(x)         ((x & 0xFF) << 24)
> +
> +/* NAND controller command buffer 0 register 'type' and 'xtype' fields *=
/
> +#define TYPE_READ              0
> +#define TYPE_WRITE             1
> +#define TYPE_ERASE             2
> +#define TYPE_READ_ID           3
> +#define TYPE_STATUS            4
> +#define TYPE_RESET             5
> +#define TYPE_NAKED_CMD         6
> +#define TYPE_NAKED_ADDR                7
> +#define TYPE_MASK              7
> +#define XTYPE_MONOLITHIC_RW    0
> +#define XTYPE_LAST_NAKED_RW    1
> +#define XTYPE_FINAL_COMMAND    3
> +#define XTYPE_READ             4
> +#define XTYPE_WRITE_DISPATCH   4
> +#define XTYPE_NAKED_RW         5
> +#define XTYPE_COMMAND_DISPATCH 6
> +#define XTYPE_MASK             7
> +
> +/*
> + * Marvell ECC engine works differently than the others, in order to lim=
it the
> + * size of the IP, hardware engineers choose to set a fixed strength at =
16 bits
> + * per subpage, and depending on a the desired strength needed by the NA=
ND chip,
> + * a particular layout mixing data/spare/ecc is defined, with a possible=
 last
> + * chunk smaller that the others.
> + *
> + * @writesize:         Full page size on which the layout applies
> + * @chunk:             Desired ECC chunk size on which the layout applie=
s
> + * @strength:          Desired ECC strength (per chunk size bytes) on wh=
ich the
> + *                     layout applies
> + * @full_chunk_cnt:    Number of full-sized chunks, which is the number =
of
> + *                     repetitions of the pattern:
> + *                     (data_bytes + spare_bytes + ecc_bytes).
> + * @data_bytes:                Number of data bytes per chunk
> + * @spare_bytes:       Number of spare bytes per chunk
> + * @ecc_bytes:         Number of ecc bytes per chunk
> + * @last_chunk_cnt:    If there is a last chunk with a different size th=
an
> + *                     the first ones, the next fields may not be empty
> + * @last_data_bytes:   Number of data bytes in the last chunk
> + * @last_spare_bytes:  Number of spare bytes in the last chunk
> + * @last_ecc_bytes:    Number of ecc bytes in the last chunk
> + */
> +struct marvell_hw_ecc_layout {
> +       /* Constraints */
> +       int writesize;
> +       int chunk;
> +       int strength;
> +       /* Corresponding layout */
> +       int full_chunk_cnt;
> +       int data_bytes;
> +       int spare_bytes;
> +       int ecc_bytes;
> +       int last_chunk_cnt;
> +       int last_data_bytes;
> +       int last_spare_bytes;
> +       int last_ecc_bytes;
> +};
> +
> +#define MARVELL_LAYOUT(ws, dc, ds, fcc, db, sb, eb, lcc, ldb, lsb, leb) =
\
> +       {                                                               \
> +               .writesize =3D ws,                                       =
 \
> +               .chunk =3D dc,                                           =
 \
> +               .strength =3D ds,                                        =
 \
> +               .full_chunk_cnt =3D fcc,                                 =
 \
> +               .data_bytes =3D db,                                      =
 \
> +               .spare_bytes =3D sb,                                     =
 \
> +               .ecc_bytes =3D eb,                                       =
 \
> +               .last_chunk_cnt =3D lcc,                                 =
 \
> +               .last_data_bytes =3D ldb,                                =
 \
> +               .last_spare_bytes =3D lsb,                               =
 \
> +               .last_ecc_bytes =3D leb,                                 =
 \
> +       }
> +
> +/* Layouts explained in AN-379_Marvell_SoC_NFC_ECC */
> +static const struct marvell_hw_ecc_layout marvell_nfc_layouts[] =3D {
> +       MARVELL_LAYOUT(  512,   512,  1,  1,  512,  8,  8,  0,  0,  0,  0=
),
> +       MARVELL_LAYOUT( 2048,   512,  1,  1, 2048, 40, 24,  0,  0,  0,  0=
),
> +       MARVELL_LAYOUT( 2048,   512,  4,  1, 2048, 32, 30,  0,  0,  0,  0=
),
> +       MARVELL_LAYOUT( 4096,   512,  4,  2, 2048, 32, 30,  0,  0,  0,  0=
),
> +       MARVELL_LAYOUT( 4096,   512,  8,  4, 1024,  0, 30,  1,  0, 64, 30=
),
> +};
> +
> +/*
> + * The Nand Flash Controller has up to 4 CE and 2 RB pins. The CE select=
ion
> + * is made by a field in NDCB0 register, and in another field in NDCB2 r=
egister.
> + * The datasheet describes the logic with an error: ADDR5 field is once
> + * declared at the beginning of NDCB2, and another time at its end. Beca=
use the
> + * ADDR5 field of NDCB2 may be used by other bytes, it would be more log=
ical
> + * to use the last bit of this field instead of the first ones.
> + *
> + * @cs:                        Wanted CE lane.
> + * @ndcb0_csel:                Value of the NDCB0 register with or witho=
ut the flag
> + *                     selecting the wanted CE lane. This is set once wh=
en
> + *                     the Device Tree is probed.
> + * @rb:                        Ready/Busy pin for the flash chip
> + */
> +struct marvell_nand_chip_sel {
> +       unsigned int cs;
> +       u32 ndcb0_csel;
> +       unsigned int rb;
> +};
> +
> +/*
> + * NAND chip structure: stores NAND chip device related information
> + *
> + * @chip:              Base NAND chip structure
> + * @node:              Used to store NAND chips into a list
> + * @layout             NAND layout when using hardware ECC
> + * @ndtr0              Timing registers 0 value for this NAND chip
> + * @ndtr1              Timing registers 1 value for this NAND chip
> + * @selected_die:      Current active CS
> + * @nsels:             Number of CS lines required by the NAND chip
> + * @sels:              Array of CS lines descriptions
> + */
> +struct marvell_nand_chip {
> +       struct nand_chip chip;
> +       struct list_head node;
> +       const struct marvell_hw_ecc_layout *layout;
> +       u32 ndtr0;
> +       u32 ndtr1;
> +       int addr_cyc;
> +       int selected_die;
> +       unsigned int nsels;
> +       struct marvell_nand_chip_sel sels[0];
> +};
> +
> +static inline struct marvell_nand_chip *to_marvell_nand(struct nand_chip=
 *chip)
> +{
> +       return container_of(chip, struct marvell_nand_chip, chip);
> +}
> +
> +static inline struct marvell_nand_chip_sel *to_nand_sel(struct marvell_n=
and_chip
> +                                                       *nand)
> +{
> +       return &nand->sels[nand->selected_die];
> +}
> +
> +/*
> + * NAND controller capabilities for distinction between compatible strin=
gs
> + *
> + * @max_cs_nb:         Number of Chip Select lines available
> + * @max_rb_nb:         Number of Ready/Busy lines available
> + * @need_system_controller: Indicates if the SoC needs to have access to=
 the
> + *                      system controller (ie. to enable the NAND contro=
ller)
> + * @legacy_of_bindings:        Indicates if DT parsing must be done usin=
g the old
> + *                     fashion way
> + * @is_nfcv2:          NFCv2 has numerous enhancements compared to NFCv1=
, ie.
> + *                     BCH error detection and correction algorithm,
> + *                     NDCB3 register has been added
> + * @use_dma:           Use dma for data transfers
> + */
> +struct marvell_nfc_caps {
> +       unsigned int max_cs_nb;
> +       unsigned int max_rb_nb;
> +       bool need_system_controller;
> +       bool legacy_of_bindings;
> +       bool is_nfcv2;
> +       bool use_dma;
> +};
> +
> +/*
> + * NAND controller structure: stores Marvell NAND controller information
> + *
> + * @controller:                Base controller structure
> + * @dev:               Parent device (used to print error messages)
> + * @regs:              NAND controller registers
> + * @ecc_clk:           ECC block clock, two times the NAND controller cl=
ock
> + * @complete:          Completion object to wait for NAND controller eve=
nts
> + * @assigned_cs:       Bitmask describing already assigned CS lines
> + * @chips:             List containing all the NAND chips attached to
> + *                     this NAND controller
> + * @caps:              NAND controller capabilities for each compatible =
string
> + * @buf:               Controller local buffer to store a part of the re=
ad
> + *                     buffer when the read operation was not 8 bytes al=
igned
> + *                     as is the FIFO.
> + * @buf_pos:           Position in the 'buf' buffer
> + * @dma_chan:          DMA channel (NFCv1 only)
> + * @dma_buf:           32-bit aligned buffer for DMA transfers (NFCv1 on=
ly)
> + */
> +struct marvell_nfc {
> +       struct nand_hw_control controller;
> +       struct device *dev;
> +       void __iomem *regs;
> +       struct clk *ecc_clk;
> +       struct completion complete;
> +       unsigned long assigned_cs;
> +       struct list_head chips;
> +       struct nand_chip *selected_chip;
> +       const struct marvell_nfc_caps *caps;
> +
> +       /*
> +        * Buffer handling: @buf will be accessed byte-per-byter but also
> +        * int-per-int when exchanging data with the NAND controller FIFO=
,
> +        * 32-bit alignment is then required.
> +        */
> +       u8 buf[FIFO_DEPTH] __aligned(sizeof(u32));
> +       int buf_pos;
> +
> +       /* DMA (NFCv1 only) */
> +       bool use_dma;
> +       struct dma_chan *dma_chan;
> +       u8 *dma_buf;
> +};
> +
> +static inline struct marvell_nfc *to_marvell_nfc(struct nand_hw_control =
*ctrl)
> +{
> +       return container_of(ctrl, struct marvell_nfc, controller);
> +}
> +
> +/*
> + * NAND controller timings expressed in NAND Controller clock cycles
> + *
> + * @tRP:               ND_nRE pulse width
> + * @tRH:               ND_nRE high duration
> + * @tWP:               ND_nWE pulse time
> + * @tWH:               ND_nWE high duration
> + * @tCS:               Enable signal setup time
> + * @tCH:               Enable signal hold time
> + * @tADL:              Address to write data delay
> + * @tAR:               ND_ALE low to ND_nRE low delay
> + * @tWHR:              ND_nWE high to ND_nRE low for status read
> + * @tRHW:              ND_nRE high duration, read to write delay
> + * @tR:                        ND_nWE high to ND_nRE low for read
> + */
> +struct marvell_nfc_timings {
> +       /* NDTR0 fields */
> +       unsigned int tRP;
> +       unsigned int tRH;
> +       unsigned int tWP;
> +       unsigned int tWH;
> +       unsigned int tCS;
> +       unsigned int tCH;
> +       unsigned int tADL;
> +       /* NDTR1 fields */
> +       unsigned int tAR;
> +       unsigned int tWHR;
> +       unsigned int tRHW;
> +       unsigned int tR;
> +};
> +
> +/*
> + * Derives a duration in numbers of clock cycles.
> + *
> + * @ps: Duration in pico-seconds
> + * @period_ns:  Clock period in nano-seconds
> + *
> + * Convert the duration in nano-seconds, then divide by the period and
> + * return the number of clock periods.
> + */
> +#define TO_CYCLES(ps, period_ns) (DIV_ROUND_UP(ps / 1000, period_ns))
> +
> +/*
> + * NAND driver structure filled during the parsing of the ->exec_op() su=
bop
> + * subset of instructions.
> + *
> + * @ndcb:              Array for the values of the NDCBx registers
> + * @cle_ale_delay_ns:  Optional delay after the last CMD or ADDR cycle
> + * @rdy_timeout_ms:    Timeout for waits on Ready/Busy pin
> + * @rdy_delay_ns:      Optional delay after waiting for the RB pin
> + * @data_delay_ns:     Optional delay after the data xfer
> + * @data_instr_idx:    Index of the data instruction in the subop
> + * @data_instr:                Pointer to the data instruction in the su=
bop
> + */
> +struct marvell_nfc_op {
> +       u32 ndcb[4];
> +       unsigned int cle_ale_delay_ns;
> +       unsigned int rdy_timeout_ms;
> +       unsigned int rdy_delay_ns;
> +       unsigned int data_delay_ns;
> +       unsigned int data_instr_idx;
> +       const struct nand_op_instr *data_instr;
> +};
> +
> +/*
> + * Internal helper to conditionnally apply a delay (from the above struc=
ture,
> + * most of the time).
> + */
> +static void cond_delay(unsigned int ns)
> +{
> +       if (!ns)
> +               return;
> +
> +       if (ns < 10000)
> +               ndelay(ns);
> +       else
> +               udelay(DIV_ROUND_UP(ns, 1000));
> +}
> +
> +/*
> + * Internal helper to mimic core functions whithout having to distinguis=
h if
> + * this is the first read operation on the page or not and hence choose =
the
> + * right function.
> + */
> +int read_page_data(struct nand_chip *chip, unsigned int page,
> +                  unsigned int column, void *buf, unsigned int len)
> +{
> +       if (!column)
> +               return nand_read_page_op(chip, page, column, buf, len);
> +       else
> +               return nand_change_read_column_op(chip, column, buf, len,
> +                                                 false);
> +}
> +
> +/*
> + * The controller has many flags that could generate interrupts, most of=
 them
> + * are disabled and polling is used. For the very slow signals, using in=
terrupts
> + * may relax the CPU charge.
> + */
> +static void marvell_nfc_disable_int(struct marvell_nfc *nfc, u32 int_mas=
k)
> +{
> +       u32 reg;
> +
> +       /* Writing 1 disables the interrupt */
> +       reg =3D readl_relaxed(nfc->regs + NDCR);
> +       writel_relaxed(reg | int_mask, nfc->regs + NDCR);
> +}
> +
> +static void marvell_nfc_enable_int(struct marvell_nfc *nfc, u32 int_mask=
)
> +{
> +       u32 reg;
> +
> +       /* Writing 0 enables the interrupt */
> +       reg =3D readl_relaxed(nfc->regs + NDCR);
> +       writel_relaxed(reg & ~int_mask, nfc->regs + NDCR);
> +}
> +
> +static void marvell_nfc_clear_int(struct marvell_nfc *nfc, u32 int_mask)
> +{
> +       writel_relaxed(int_mask, nfc->regs + NDSR);
> +}
> +
> +/*
> + * The core may ask the controller to use only 8-bit accesses while usua=
lly
> + * using 16-bit accesses. Later function may blindly call this one with =
a
> + * boolean to indicate if 8-bit accesses must be enabled of disabled wit=
hout
> + * knowing if 16-bit accesses are actually in use.
> + */
> +static void marvell_nfc_force_byte_access(struct nand_chip *chip,
> +                                         bool force_8bit)
> +{
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +       u32 ndcr;
> +
> +       if (!(chip->options & NAND_BUSWIDTH_16))
> +               return;
> +
> +       ndcr =3D readl_relaxed(nfc->regs + NDCR);
> +
> +       if (force_8bit)
> +               ndcr &=3D ~(NDCR_DWIDTH_M | NDCR_DWIDTH_C);
> +       else
> +               ndcr |=3D NDCR_DWIDTH_M | NDCR_DWIDTH_C;
> +
> +       writel_relaxed(ndcr, nfc->regs + NDCR);
> +}
> +
> +static int marvell_nfc_wait_ndrun(struct nand_chip *chip)
> +{
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +       u32 val;
> +       int ret;
> +
> +       /*
> +        * The command is being processed, wait for the ND_RUN bit to be
> +        * cleared by the NFC. If not, we must clear it by hand.
> +        */
> +       ret =3D readl_relaxed_poll_timeout(nfc->regs + NDCR, val,
> +                                        (val & NDCR_ND_RUN) =3D=3D 0,
> +                                        POLL_PERIOD, POLL_TIMEOUT);
> +       if (ret) {
> +               dev_err(nfc->dev, "Timeout on NAND controller run mode\n"=
);
> +               writel_relaxed(readl_relaxed(nfc->regs + NDCR) & ~NDCR_ND=
_RUN,
> +                              nfc->regs + NDCR);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +/*
> + * Any time a command has to be sent to the controller, the following se=
quence
> + * has to be followed:
> + * - call marvell_nfc_prepare_cmd()
> + *      -> activate the ND_RUN bit that will kind of 'start a job'
> + *      -> wait the signal indicating the NFC is waiting for a command
> + * - send the command (cmd and address cycles)
> + * - enventually send or receive the data
> + * - call marvell_nfc_end_cmd() with the corresponding flag
> + *      -> wait the flag to be triggered or cancel the job with a timeou=
t
> + *
> + * The following functions are helpers to do this job and keep in the
> + * specialized functions the code that really does the operations.
> + */
> +static int marvell_nfc_prepare_cmd(struct nand_chip *chip)
> +{
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +       u32 ndcr, val;
> +       int ret;
> +
> +       /* Poll ND_RUN and clear NDSR before issuing any command */
> +       ret =3D marvell_nfc_wait_ndrun(chip);
> +       if (ret) {
> +               dev_err(nfc->dev, "Last operation did not suceed\n");
> +               return ret;
> +       }
> +
> +       ndcr =3D readl_relaxed(nfc->regs + NDCR);
> +       writel_relaxed(readl_relaxed(nfc->regs + NDSR), nfc->regs + NDSR)=
;
> +
> +       /* Assert ND_RUN bit and wait the NFC to be ready */
> +       writel_relaxed(ndcr | NDCR_ND_RUN, nfc->regs + NDCR);
> +       ret =3D readl_relaxed_poll_timeout(nfc->regs + NDSR, val,
> +                                        val & NDSR_WRCMDREQ,
> +                                        POLL_PERIOD, POLL_TIMEOUT);
> +       if (ret) {
> +               dev_err(nfc->dev, "Timeout on WRCMDRE\n");
> +               return -ETIMEDOUT;
> +       }
> +
> +       /* Command may be written, clear WRCMDREQ status bit */
> +       writel_relaxed(NDSR_WRCMDREQ, nfc->regs + NDSR);
> +
> +       return 0;
> +}
> +
> +static void marvell_nfc_send_cmd(struct nand_chip *chip,
> +                                struct marvell_nfc_op *nfc_op)
> +{
> +       struct marvell_nand_chip *marvell_nand =3D to_marvell_nand(chip);
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +
> +       dev_dbg(nfc->dev,
> +               "NDCB0: 0x%08x\nNDCB1: 0x%08x\nNDCB2: 0x%08x\nNDCB3: 0x%0=
8x\n",
> +               nfc_op->ndcb[0], nfc_op->ndcb[1], nfc_op->ndcb[2],
> +               nfc_op->ndcb[3]);
> +
> +       writel_relaxed(to_nand_sel(marvell_nand)->ndcb0_csel | nfc_op->nd=
cb[0],
> +                      nfc->regs + NDCB0);
> +       writel_relaxed(nfc_op->ndcb[1], nfc->regs + NDCB0);
> +       writel(nfc_op->ndcb[2], nfc->regs + NDCB0);
> +
> +       /*
> +        * Write NDCB0 four times only if LEN_OVRD is set or if ADDR6 or =
ADDR7
> +        * fields are used (only available on NFCv2).
> +        */
> +       if (nfc_op->ndcb[0] & NDCB0_LEN_OVRD ||
> +           (nfc_op->ndcb[0] & NDCB0_ADDR_CYC(6)) =3D=3D NDCB0_ADDR_CYC(6=
)) {
> +               if (nfc->caps->is_nfcv2)
> +                       writel(nfc_op->ndcb[3], nfc->regs + NDCB0);
> +               else
> +                       dev_err(nfc->dev,
> +                               "NDCB3 does not exist on NFCv1 and should=
 not be written\n");
> +       }
> +}
> +
> +static int marvell_nfc_end_cmd(struct nand_chip *chip, int flag,
> +                              const char *label)
> +{
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +       u32 val;
> +       int ret;
> +
> +       ret =3D readl_relaxed_poll_timeout(nfc->regs + NDSR, val,
> +                                        val & flag,
> +                                        POLL_PERIOD, POLL_TIMEOUT);
> +
> +       if (ret) {
> +               dev_err(nfc->dev, "Timeout on %s (NDSR: 0x%08x)\n",
> +                       label, val);
> +               if (nfc->dma_chan)
> +                       dmaengine_terminate_all(nfc->dma_chan);
> +               return ret;
> +       }
> +
> +       /*
> +        * DMA function uses this helper to poll on CMDD bits without wan=
ting
> +        * them to be bleared.
> +        */
> +       if (nfc->use_dma && (readl(nfc->regs + NDCR) & NDCR_DMA_EN))
> +               return 0;
> +
> +       writel_relaxed(flag, nfc->regs + NDSR);
> +
> +       return 0;
> +}
> +
> +static int marvell_nfc_wait_cmdd(struct nand_chip *chip)
> +{
> +       struct marvell_nand_chip *marvell_nand =3D to_marvell_nand(chip);
> +       int cs_flag =3D NDSR_CMDD(to_nand_sel(marvell_nand)->ndcb0_csel);
> +
> +       return marvell_nfc_end_cmd(chip, cs_flag, "CMDD");
> +}
> +
> +static int marvell_nfc_wait_op(struct nand_chip *chip, unsigned int time=
out_ms)
> +{
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +       int ret;
> +
> +       /* Timeout is expressed in ms */
> +       if (!timeout_ms)
> +               timeout_ms =3D IRQ_TIMEOUT;
> +
> +       init_completion(&nfc->complete);
> +
> +       marvell_nfc_enable_int(nfc, NDCR_RDYM);
> +       ret =3D wait_for_completion_timeout(&nfc->complete,
> +                                         msecs_to_jiffies(timeout_ms));
> +       marvell_nfc_disable_int(nfc, NDCR_RDYM);
> +       marvell_nfc_clear_int(nfc, NDSR_RDY(0) | NDSR_RDY(1));
> +       if (!ret) {
> +               dev_err(nfc->dev, "Timeout waiting for RB signal\n");
> +               return -ETIMEDOUT;
> +       }
> +
> +       return 0;
> +}
> +
> +static void marvell_nfc_select_chip(struct mtd_info *mtd, int die_nr)
> +{
> +       struct nand_chip *chip =3D mtd_to_nand(mtd);
> +       struct marvell_nand_chip *marvell_nand =3D to_marvell_nand(chip);
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +       u32 ndcr;
> +
> +       if (chip =3D=3D nfc->selected_chip && die_nr =3D=3D marvell_nand-=
>selected_die)
> +               return;
> +
> +       if (die_nr < 0 || die_nr >=3D marvell_nand->nsels) {
> +               nfc->selected_chip =3D NULL;
> +               marvell_nand->selected_die =3D -1;
> +               return;
> +       }
> +
> +       /*
> +        * Do not change the timing registers when using the DT property
> +        * marvell,nand-keep-config; in that case ->ndtr0 and ->ndtr1 fro=
m the
> +        * marvell_nand structure are supposedly empty.
> +        */
> +       if (marvell_nand->ndtr0 && marvell_nand->ndtr1) {
> +               writel_relaxed(marvell_nand->ndtr0, nfc->regs + NDTR0);
> +               writel_relaxed(marvell_nand->ndtr1, nfc->regs + NDTR1);
> +       }
> +
> +       ndcr =3D readl_relaxed(nfc->regs + NDCR);
> +
> +       /* Ensure controller is not blocked; also clear some fields */
> +       ndcr &=3D ~(NDCR_ND_RUN | NDCR_DWIDTH_M | NDCR_DWIDTH_C |
> +                 NDCR_PAGE_SZ(2048));
> +
> +       /* Adapt bus width */
> +       if (chip->options & NAND_BUSWIDTH_16)
> +               ndcr |=3D NDCR_DWIDTH_M | NDCR_DWIDTH_C;
> +
> +       /* Page size as seen by the controller, either 512B or 2kiB */
> +       ndcr |=3D NDCR_PAGE_SZ(mtd->writesize);
> +
> +       /* Update the control register */
> +       writel_relaxed(ndcr,  nfc->regs + NDCR);
> +
> +       /* Also reset the interrupt status register */
> +       marvell_nfc_clear_int(nfc, NDCR_ALL_INT);
> +
> +       nfc->selected_chip =3D chip;
> +       marvell_nand->selected_die =3D die_nr;
> +}
> +
> +static irqreturn_t marvell_nfc_isr(int irq, void *dev_id)
> +{
> +       struct marvell_nfc *nfc =3D dev_id;
> +       u32 st =3D readl_relaxed(nfc->regs + NDSR);
> +       u32 ien =3D (~readl_relaxed(nfc->regs + NDCR)) & NDCR_ALL_INT;
> +
> +       /*
> +        * RDY interrupt mask is one bit in NDCR while there are two stat=
us
> +        * bit in NDSR (RDY[cs0/cs2] and RDY[cs1/cs3]).
> +        */
> +       if (st & NDSR_RDY(1))
> +               st |=3D NDSR_RDY(0);
> +
> +       if (!(st & ien))
> +               return IRQ_NONE;
> +
> +       marvell_nfc_disable_int(nfc, st & NDCR_ALL_INT);
> +
> +       if (!(st & (NDSR_RDDREQ | NDSR_WRDREQ | NDSR_WRCMDREQ)))
> +               complete(&nfc->complete);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +/* HW ECC related functions */
> +static void marvell_nfc_enable_hw_ecc(struct nand_chip *chip)
> +{
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +       u32 ndcr =3D readl_relaxed(nfc->regs + NDCR);
> +
> +       if (!(ndcr & NDCR_ECC_EN)) {
> +               writel(ndcr | NDCR_ECC_EN, nfc->regs + NDCR);
> +
> +               /*
> +                * When enabling BCH, set threshold to 0 to always know t=
he
> +                * number of corrected bitflips.
> +                */
> +               if (chip->ecc.algo =3D=3D NAND_ECC_BCH)
> +                       writel(NDECCTRL_BCH_EN, nfc->regs + NDECCCTRL);
> +       }
> +}
> +
> +static void marvell_nfc_disable_hw_ecc(struct nand_chip *chip)
> +{
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +       u32 ndcr =3D readl_relaxed(nfc->regs + NDCR);
> +
> +       if (ndcr & NDCR_ECC_EN) {
> +               writel_relaxed(ndcr & ~NDCR_ECC_EN, nfc->regs + NDCR);
> +               if (chip->ecc.algo =3D=3D NAND_ECC_BCH)
> +                       writel_relaxed(0, nfc->regs + NDECCCTRL);
> +       }
> +}
> +
> +/*
> + * Enable/disable spare area
> + *
> + * NFCv1 needs it (see Hamming related functions). NFCv2 uses LEN_OVRD a=
nd thus
> + * does not need this bit to be set.
> + */
> +static void marvell_nfc_enable_spare(struct nand_chip *chip)
> +{
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +       u32 ndcr =3D readl_relaxed(nfc->regs + NDCR);
> +
> +       if (!(ndcr & NDCR_SPARE_EN))
> +               writel(ndcr | NDCR_SPARE_EN, nfc->regs + NDCR);
> +}
> +
> +static void marvell_nfc_disable_spare(struct nand_chip *chip)
> +{
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +       u32 ndcr =3D readl_relaxed(nfc->regs + NDCR);
> +
> +       if (ndcr & NDCR_SPARE_EN)
> +               writel_relaxed(ndcr & ~NDCR_SPARE_EN, nfc->regs + NDCR);
> +}
> +
> +/* DMA related helpers */
> +static void marvell_nfc_enable_dma(struct marvell_nfc *nfc)
> +{
> +       u32 reg;
> +
> +       reg =3D readl_relaxed(nfc->regs + NDCR);
> +       writel_relaxed(reg | NDCR_DMA_EN, nfc->regs + NDCR);
> +}
> +
> +static void marvell_nfc_disable_dma(struct marvell_nfc *nfc)
> +{
> +       u32 reg;
> +
> +       reg =3D readl_relaxed(nfc->regs + NDCR);
> +       writel_relaxed(reg & ~NDCR_DMA_EN, nfc->regs + NDCR);
> +}
> +
> +/* Read/write PIO/DMA accessors */
> +static int marvell_nfc_xfer_data_dma(struct marvell_nfc *nfc,
> +                                    enum dma_data_direction direction,
> +                                    unsigned int len)
> +{
> +       unsigned int dma_len =3D min_t(int, ALIGN(len, 32), MAX_CHUNK_SIZ=
E);
> +       struct dma_async_tx_descriptor *tx;
> +       struct scatterlist sg;
> +       dma_cookie_t cookie;
> +       int ret;
> +
> +       marvell_nfc_enable_dma(nfc);
> +       /* Prepare the DMA transfer */
> +       sg_init_one(&sg, nfc->dma_buf, dma_len);
> +       dma_map_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
> +       tx =3D dmaengine_prep_slave_sg(nfc->dma_chan, &sg, 1,
> +                                    direction =3D=3D DMA_FROM_DEVICE ?
> +                                    DMA_DEV_TO_MEM : DMA_MEM_TO_DEV,
> +                                    DMA_PREP_INTERRUPT);
> +       if (!tx) {
> +               dev_err(nfc->dev, "Could not prepare DMA S/G list\n");
> +               return -ENXIO;
> +       }
> +
> +       /* Do the task and wait for it to finish */
> +       cookie =3D dmaengine_submit(tx);
> +       ret =3D dma_submit_error(cookie);
> +       if (ret)
> +               return -EIO;
> +
> +       dma_async_issue_pending(nfc->dma_chan);
> +       ret =3D marvell_nfc_wait_cmdd(nfc->selected_chip);
> +       dma_unmap_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
> +       marvell_nfc_disable_dma(nfc);
> +       if (ret) {
> +               dev_err(nfc->dev, "Timeout waiting for DMA (status: %d)\n=
",
> +                       dmaengine_tx_status(nfc->dma_chan, cookie, NULL))=
;
> +               dmaengine_terminate_all(nfc->dma_chan);
> +               return -ETIMEDOUT;
> +       }
> +
> +       return 0;
> +}
> +
> +static int marvell_nfc_xfer_data_in_pio(struct marvell_nfc *nfc, u8 *in,
> +                                       unsigned int len)
> +{
> +       unsigned int last_len =3D len % FIFO_DEPTH;
> +       unsigned int last_full_offset =3D round_down(len, FIFO_DEPTH);
> +       int i;
> +
> +       for (i =3D 0; i < last_full_offset; i +=3D FIFO_DEPTH)
> +               ioread32_rep(nfc->regs + NDDB, in + i, FIFO_REP(FIFO_DEPT=
H));
> +
> +       if (last_len) {
> +               ioread32_rep(nfc->regs + NDDB, nfc->buf, FIFO_REP(FIFO_DE=
PTH));
> +               memcpy(in + last_full_offset, nfc->buf, last_len);
> +       }
> +
> +       return 0;
> +}
> +
> +static int marvell_nfc_xfer_data_out_pio(struct marvell_nfc *nfc, const =
u8 *out,
> +                                        unsigned int len)
> +{
> +       unsigned int last_len =3D len % FIFO_DEPTH;
> +       unsigned int last_full_offset =3D round_down(len, FIFO_DEPTH);
> +       int i;
> +
> +       for (i =3D 0; i < last_full_offset; i +=3D FIFO_DEPTH)
> +               iowrite32_rep(nfc->regs + NDDB, out + i, FIFO_REP(FIFO_DE=
PTH));
> +
> +       if (last_len) {
> +               memcpy(nfc->buf, out + last_full_offset, last_len);
> +               iowrite32_rep(nfc->regs + NDDB, nfc->buf, FIFO_REP(FIFO_D=
EPTH));
> +       }
> +
> +       return 0;
> +}
> +
> +static void marvell_nfc_hw_ecc_correct(struct nand_chip *chip,
> +                                      u8 *data, int data_len,
> +                                      u8 *oob, int oob_len,
> +                                      unsigned int *max_bitflips)
> +{
> +       struct mtd_info *mtd =3D nand_to_mtd(chip);
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +       int bf =3D 0;
> +       u32 ndsr;
> +
> +       ndsr =3D readl_relaxed(nfc->regs + NDSR);
> +
> +       /* Check uncorrectable error flag */
> +       if (ndsr & NDSR_UNCERR) {
> +               writel_relaxed(ndsr, nfc->regs + NDSR);
> +
> +               /*
> +                * Blank pages (all 0xFF) with no ECC are recognized as b=
ad
> +                * because hardware ECC engine expects non-empty ECC valu=
es
> +                * in that case, so whenever an uncorrectable error occur=
s,
> +                * check if the page is actually blank or not.
> +                *
> +                * It is important to check the emptyness only on oob_len=
,
> +                * which only covers the spare bytes because after a read=
 with
> +                * ECC enabled, the ECC bytes in the buffer have been set=
 by the
> +                * ECC engine, so they are not 0xFF.
> +                */
> +               if (!data)
> +                       data_len =3D 0;
> +               if (!oob)
> +                       oob_len =3D 0;
> +               bf =3D nand_check_erased_ecc_chunk(data, data_len, NULL, =
0,
> +                                                oob, oob_len,
> +                                                chip->ecc.strength);
> +               if (bf < 0) {
> +                       mtd->ecc_stats.failed++;
> +                       return;
> +               }
> +       }
> +
> +       /* Check correctable error flag */
> +       if (ndsr & NDSR_CORERR) {
> +               writel_relaxed(ndsr, nfc->regs + NDSR);
> +
> +               if (chip->ecc.algo =3D=3D NAND_ECC_BCH)
> +                       bf =3D NDSR_ERRCNT(ndsr);
> +               else
> +                       bf =3D 1;
> +       }
> +
> +       /*
> +        * Derive max_bitflips either from the number of bitflips detecte=
d by
> +        * the hardware ECC engine or by nand_check_erased_ecc_chunk().
> +        */
> +       mtd->ecc_stats.corrected +=3D bf;
> +       *max_bitflips =3D max_t(unsigned int, *max_bitflips, bf);
> +}
> +
> +/* Hamming read helpers */
> +static int marvell_nfc_hw_ecc_hmg_do_read_page(struct nand_chip *chip, u=
8 *buf,
> +                                              bool oob_required, bool ra=
w,
> +                                              int page)
> +{
> +       struct marvell_nand_chip *marvell_nand =3D to_marvell_nand(chip);
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +       const struct marvell_hw_ecc_layout *lt =3D to_marvell_nand(chip)-=
>layout;
> +       struct marvell_nfc_op nfc_op =3D {
> +               .ndcb[0] =3D NDCB0_CMD_TYPE(TYPE_READ) |
> +                          NDCB0_ADDR_CYC(marvell_nand->addr_cyc) |
> +                          NDCB0_DBC |
> +                          NDCB0_CMD1(NAND_CMD_READ0) |
> +                          NDCB0_CMD2(NAND_CMD_READSTART),
> +               .ndcb[1] =3D NDCB1_ADDRS(page),
> +               .ndcb[2] =3D NDCB2_ADDR5(page),
> +       };
> +       unsigned int oob_bytes =3D 0;
> +       int ret;
> +
> +       /* NFCv2 needs more information about the operation being execute=
d */
> +       if (nfc->caps->is_nfcv2)
> +               nfc_op.ndcb[0] |=3D NDCB0_CMD_XTYPE(XTYPE_MONOLITHIC_RW);
> +
> +       ret =3D marvell_nfc_prepare_cmd(chip);
> +       if (ret)
> +               return ret;
> +
> +       if (oob_required) {
> +               marvell_nfc_enable_spare(chip);
> +               oob_bytes =3D lt->spare_bytes;
> +               if (raw)
> +                       oob_bytes +=3D lt->ecc_bytes;
> +       }
> +
> +       marvell_nfc_send_cmd(chip, &nfc_op);
> +       ret =3D marvell_nfc_end_cmd(chip, NDSR_RDDREQ,
> +                                 "RDDREQ while draining FIFO (data/oob)"=
);
> +       if (ret)
> +               return ret;
> +
> +       /* Read the page then the OOB area */
> +       if (nfc->use_dma) {
> +               marvell_nfc_xfer_data_dma(nfc, DMA_FROM_DEVICE,
> +                                         lt->data_bytes + oob_bytes);
> +               memcpy(buf, nfc->dma_buf, lt->data_bytes);
> +               memcpy(chip->oob_poi + (raw ? 0 : lt->ecc_bytes),
> +                      nfc->dma_buf + lt->data_bytes, oob_bytes);
> +       } else {
> +               marvell_nfc_xfer_data_in_pio(nfc, buf, lt->data_bytes);
> +               marvell_nfc_xfer_data_in_pio(nfc, chip->oob_poi, oob_byte=
s);
> +       }
> +
> +       ret =3D marvell_nfc_wait_cmdd(chip);
> +       if (ret)
> +               return ret;
> +
> +       if (oob_required)
> +               marvell_nfc_disable_spare(chip);
> +
> +       return 0;
> +}
> +
> +static int marvell_nfc_hw_ecc_hmg_read_page_raw(struct mtd_info *mtd,
> +                                               struct nand_chip *chip, u=
8 *buf,
> +                                               int oob_required, int pag=
e)
> +{
> +       return marvell_nfc_hw_ecc_hmg_do_read_page(chip, buf, oob_require=
d,
> +                                                  true, page);
> +}
> +
> +static int marvell_nfc_hw_ecc_hmg_read_page(struct mtd_info *mtd,
> +                                           struct nand_chip *chip,
> +                                           u8 *buf, int oob_required,
> +                                           int page)
> +{
> +       const struct marvell_hw_ecc_layout *lt =3D to_marvell_nand(chip)-=
>layout;
> +       int max_bf =3D 0;
> +
> +       /*
> +        * Reading/Writing a given page must always be performed with the=
 same
> +        * configuration regarding the state of the SPARE_EN bit or ECC b=
ytes
> +        * will not be present at the same location (writing only data, w=
ithout
> +        * SPARE_EN will put the ECC bytes at the beginning of the OOB ar=
ea,
> +        * while writing with the SPARE_EN bit (hence, also writing free =
OOB
> +        * bytes) will put first the spare bytes then, at the end of the =
OOB
> +        * area, the ECC bytes. Choices has been made to always read/writ=
e OOB
> +        * area (padding with 0xFF is handled by the core for writes).
> +        */
> +
> +       marvell_nfc_enable_hw_ecc(chip);
> +       marvell_nfc_hw_ecc_hmg_do_read_page(chip, buf, true, false, page)=
;
> +       marvell_nfc_hw_ecc_correct(chip, buf, lt->data_bytes, NULL, 0, &m=
ax_bf);
> +       marvell_nfc_disable_hw_ecc(chip);
> +
> +       /*
> +        * Re-read the OOB area in raw mode to get the ECC bytes if the O=
OB area
> +        * is needed.
> +        */
> +       if (oob_required)
> +               chip->ecc.read_oob_raw(mtd, chip, page);
> +
> +       return max_bf;
> +}
> +
> +/*
> + * Spare area in Hamming layouts is not protected by the ECC engine (eve=
n if
> + * it appears before the ECC bytes when reading), the ->read_oob_raw() f=
unction
> + * also stands for ->read_oob().
> + */
> +static int marvell_nfc_hw_ecc_hmg_read_oob_raw(struct mtd_info *mtd,
> +                                              struct nand_chip *chip, in=
t page)
> +{
> +       /* Invalidate page cache */
> +       chip->pagebuf =3D -1;
> +
> +       return marvell_nfc_hw_ecc_hmg_do_read_page(chip, chip->data_buf, =
true,
> +                                                  true, page);
> +}
> +
> +/* Hamming write helpers */
> +static int marvell_nfc_hw_ecc_hmg_do_write_page(struct nand_chip *chip,
> +                                               const u8 *buf,
> +                                               bool oob_required, bool r=
aw,
> +                                               int page)
> +{
> +       struct marvell_nand_chip *marvell_nand =3D to_marvell_nand(chip);
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +       const struct marvell_hw_ecc_layout *lt =3D to_marvell_nand(chip)-=
>layout;
> +       struct marvell_nfc_op nfc_op =3D {
> +               .ndcb[0] =3D NDCB0_CMD_TYPE(TYPE_WRITE) |
> +                          NDCB0_ADDR_CYC(marvell_nand->addr_cyc) |
> +                          NDCB0_CMD1(NAND_CMD_SEQIN) |
> +                          NDCB0_CMD2(NAND_CMD_PAGEPROG) |
> +                          NDCB0_DBC,
> +               .ndcb[1] =3D NDCB1_ADDRS(page),
> +               .ndcb[2] =3D NDCB2_ADDR5(page),
> +       };
> +       int oob_bytes =3D 0;
> +       int ret;
> +
> +       /* NFCv2 needs more information about the operation being execute=
d */
> +       if (nfc->caps->is_nfcv2)
> +               nfc_op.ndcb[0] |=3D NDCB0_CMD_XTYPE(XTYPE_MONOLITHIC_RW);
> +
> +       ret =3D marvell_nfc_prepare_cmd(chip);
> +       if (ret)
> +               return ret;
> +
> +       if (oob_required) {
> +               marvell_nfc_enable_spare(chip);
> +               oob_bytes =3D lt->spare_bytes;
> +               if (raw)
> +                       oob_bytes +=3D lt->ecc_bytes;
> +       }
> +
> +       marvell_nfc_send_cmd(chip, &nfc_op);
> +       ret =3D marvell_nfc_end_cmd(chip, NDSR_WRDREQ,
> +                                 "WRDREQ while loading FIFO (data)");
> +       if (ret)
> +               return ret;
> +
> +       /* Write the page then the OOB area */
> +       if (nfc->use_dma) {
> +               memcpy(nfc->dma_buf, buf, lt->data_bytes);
> +               if (oob_required)
> +                       memcpy(nfc->dma_buf + lt->data_bytes, chip->oob_p=
oi,
> +                              oob_bytes);
> +               marvell_nfc_xfer_data_dma(nfc, DMA_TO_DEVICE, lt->data_by=
tes +
> +                                         lt->ecc_bytes + lt->spare_bytes=
);
> +       } else {
> +               marvell_nfc_xfer_data_out_pio(nfc, buf, lt->data_bytes);
> +               if (oob_required)
> +                       marvell_nfc_xfer_data_out_pio(nfc, chip->oob_poi,
> +                                                     oob_bytes);
> +       }
> +
> +       ret =3D marvell_nfc_wait_cmdd(chip);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D marvell_nfc_wait_op(chip,
> +                                 chip->data_interface.timings.sdr.tPROG_=
max);
> +       if (ret)
> +               return ret;
> +
> +       if (oob_required)
> +               marvell_nfc_disable_spare(chip);
> +
> +       return 0;
> +}
> +
> +static int marvell_nfc_hw_ecc_hmg_write_page_raw(struct mtd_info *mtd,
> +                                                struct nand_chip *chip,
> +                                                const u8 *buf,
> +                                                int oob_required, int pa=
ge)
> +{
> +       return marvell_nfc_hw_ecc_hmg_do_write_page(chip, buf, oob_requir=
ed,
> +                                                   true, page);
> +}
> +
> +static int marvell_nfc_hw_ecc_hmg_write_page(struct mtd_info *mtd,
> +                                            struct nand_chip *chip,
> +                                            const u8 *buf,
> +                                            int oob_required, int page)
> +{
> +       int ret;
> +
> +       /*
> +        * Reading/Writing a given page must always be performed with the=
 same
> +        * configuration regarding the state of the SPARE_EN bit or ECC b=
ytes
> +        * will not be present at the same location (writing only data, w=
ithout
> +        * SPARE_EN will put the ECC bytes at the beginning of the OOB ar=
ea,
> +        * while writing with the SPARE_EN bit (hence, also writing free =
OOB
> +        * bytes) will put first the spare bytes then, at the end of the =
OOB
> +        * area, the ECC bytes. Choices has been made to always read/writ=
e OOB
> +        * area (padding with 0xFF is handled by the core for writes).
> +        */
> +
> +       marvell_nfc_enable_hw_ecc(chip);
> +       ret =3D marvell_nfc_hw_ecc_hmg_do_write_page(chip, buf, true, fal=
se,
> +                                                  page);
> +       marvell_nfc_disable_hw_ecc(chip);
> +
> +       return ret;
> +}
> +
> +/*
> + * Spare area in Hamming layouts is not protected by the ECC engine (eve=
n if
> + * it appears before the ECC bytes when reading), the ->write_oob_raw() =
function
> + * also stands for ->write_oob().
> + */
> +static int marvell_nfc_hw_ecc_hmg_write_oob_raw(struct mtd_info *mtd,
> +                                               struct nand_chip *chip,
> +                                               int page)
> +{
> +       /* Invalidate page cache */
> +       chip->pagebuf =3D -1;
> +
> +       memset(chip->data_buf, 0xFF, mtd->writesize);
> +
> +       return marvell_nfc_hw_ecc_hmg_do_write_page(chip, chip->data_buf,=
 true,
> +                                                   true, page);
> +}
> +
> +/* BCH read helpers */
> +static int marvell_nfc_hw_ecc_bch_read_page_raw(struct mtd_info *mtd,
> +                                               struct nand_chip *chip, u=
8 *buf,
> +                                               int oob_required, int pag=
e)
> +{
> +       const struct marvell_hw_ecc_layout *lt =3D to_marvell_nand(chip)-=
>layout;
> +       u8 *oob =3D chip->oob_poi;
> +       int chunk_size =3D lt->data_bytes + lt->spare_bytes + lt->ecc_byt=
es;
> +       int ecc_offset =3D (lt->full_chunk_cnt * lt->spare_bytes) +
> +               (lt->last_chunk_cnt * lt->last_spare_bytes);
> +       int nchunks =3D lt->full_chunk_cnt + lt->last_chunk_cnt;
> +       int data_len =3D lt->data_bytes;
> +       int spare_len =3D lt->spare_bytes;
> +       int ecc_len =3D lt->ecc_bytes;
> +       int chunk;
> +
> +       if (oob_required)
> +               memset(chip->oob_poi, 0xFF, mtd->oobsize);
> +
> +       nand_read_page_op(chip, page, 0, NULL, 0);
> +
> +       for (chunk =3D 0; chunk < nchunks; chunk++) {
> +               int offset_in_page =3D chunk * chunk_size;
> +
> +               /* Update last chunk length */
> +               if (chunk >=3D lt->full_chunk_cnt) {
> +                       data_len =3D lt->last_data_bytes;
> +                       spare_len =3D lt->last_spare_bytes;
> +                       ecc_len =3D lt->last_ecc_bytes;
> +               }
> +
> +               nand_change_read_column_op(chip, offset_in_page, buf,
> +                                          lt->data_bytes, false);
> +               buf +=3D lt->data_bytes;
> +
> +               if (!oob_required)
> +                       continue;
> +
> +               offset_in_page +=3D data_len;
> +               nand_change_read_column_op(chip, offset_in_page,
> +                                          oob + (lt->spare_bytes * chunk=
),
> +                                          spare_len, false);
> +
> +               offset_in_page +=3D spare_len;
> +               nand_change_read_column_op(chip, offset_in_page,
> +                                          oob + ecc_offset +
> +                                          (ALIGN(lt->ecc_bytes, 32) * ch=
unk),
> +                                          ecc_len, false);
> +       }
> +
> +       return 0;
> +}
> +
> +static void marvell_nfc_hw_ecc_bch_read_chunk(struct nand_chip *chip, in=
t chunk,
> +                                             u8 *data, unsigned int data=
_len,
> +                                             u8 *spare, unsigned int spa=
re_len,
> +                                             int page)
> +{
> +       struct marvell_nand_chip *marvell_nand =3D to_marvell_nand(chip);
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +       const struct marvell_hw_ecc_layout *lt =3D to_marvell_nand(chip)-=
>layout;
> +       int nchunks =3D lt->full_chunk_cnt + lt->last_chunk_cnt;
> +       int i, ret;
> +       struct marvell_nfc_op nfc_op =3D {
> +               .ndcb[0] =3D NDCB0_CMD_TYPE(TYPE_READ) |
> +                          NDCB0_ADDR_CYC(marvell_nand->addr_cyc) |
> +                          NDCB0_LEN_OVRD,
> +               .ndcb[1] =3D NDCB1_ADDRS(page),
> +               .ndcb[2] =3D NDCB2_ADDR5(page),
> +       };
> +
> +       /*
> +        * Reading spare area is mandatory when using HW ECC or read oper=
ation
> +        * will trigger uncorrectable ECC errors, but do not read ECC her=
e.
> +        */
> +       nfc_op.ndcb[3] =3D data_len + spare_len;
> +
> +       ret =3D marvell_nfc_prepare_cmd(chip);
> +       if (ret)
> +               return;
> +
> +       if (chunk =3D=3D 0)
> +               nfc_op.ndcb[0] |=3D NDCB0_DBC |
> +                                 NDCB0_CMD1(NAND_CMD_READ0) |
> +                                 NDCB0_CMD2(NAND_CMD_READSTART);
> +
> +       /*
> +        * Trigger the naked read operation only on the last chunk.
> +        * Otherwise, use monolithic read.
> +        */
> +       if (chunk < nchunks - 1)
> +               nfc_op.ndcb[0] |=3D NDCB0_CMD_XTYPE(XTYPE_MONOLITHIC_RW);
> +       else
> +               nfc_op.ndcb[0] |=3D NDCB0_CMD_XTYPE(XTYPE_LAST_NAKED_RW);
> +
> +       marvell_nfc_send_cmd(chip, &nfc_op);
> +
> +       /*
> +        * According to the datasheet, when reading from NDDB
> +        * with BCH enabled, after each 32 bytes reads, we
> +        * have to make sure that the NDSR.RDDREQ bit is set.
> +        *
> +        * Drain the FIFO, 8 32-bit reads at a time, and skip
> +        * the polling on the last read.
> +        *
> +        * Length is a multiple of 32 bytes, hence it is a multiple of 8 =
too.
> +        *
> +        */
> +
> +       for (i =3D 0; i < data_len; i +=3D FIFO_DEPTH * BCH_SEQ_READS) {
> +               marvell_nfc_end_cmd(chip, NDSR_RDDREQ,
> +                                   "RDDREQ while draining FIFO (data)");
> +               marvell_nfc_xfer_data_in_pio(nfc, data,
> +                                            FIFO_DEPTH * BCH_SEQ_READS);
> +               data +=3D FIFO_DEPTH * BCH_SEQ_READS;
> +       }
> +
> +       for (i =3D 0; i < spare_len; i +=3D FIFO_DEPTH * BCH_SEQ_READS) {
> +               marvell_nfc_end_cmd(chip, NDSR_RDDREQ,
> +                                   "RDDREQ while draining FIFO (OOB)");
> +               marvell_nfc_xfer_data_in_pio(nfc, spare,
> +                                            FIFO_DEPTH * BCH_SEQ_READS);
> +               spare +=3D FIFO_DEPTH * BCH_SEQ_READS;
> +       }
> +}
> +
> +static int marvell_nfc_hw_ecc_bch_read_page(struct mtd_info *mtd,
> +                                           struct nand_chip *chip,
> +                                           u8 *buf, int oob_required,
> +                                           int page)
> +{
> +       const struct marvell_hw_ecc_layout *lt =3D to_marvell_nand(chip)-=
>layout;
> +       int nchunks =3D lt->full_chunk_cnt + lt->last_chunk_cnt;
> +       int data_len =3D lt->data_bytes;
> +       int spare_len =3D lt->spare_bytes;
> +       u8 *data =3D buf;
> +       u8 *spare =3D chip->oob_poi;
> +       int max_bitflips =3D 0;
> +       int chunk, ecc_offset_in_page, ecc_offset_in_oob_buf, ecc_len;
> +
> +       /*
> +        * With BCH, OOB is not fully used (and thus not read entirely), =
not
> +        * expected bytes could show up at the end of the OOB buffer if n=
ot
> +        * explicitly erased.
> +        */
> +       if (oob_required)
> +               memset(chip->oob_poi, 0xFF, mtd->oobsize);
> +
> +       marvell_nfc_enable_hw_ecc(chip);
> +
> +       for (chunk =3D 0; chunk < nchunks; chunk++) {
> +               /* Update length for the last chunk */
> +               if (chunk >=3D lt->full_chunk_cnt) {
> +                       data_len =3D lt->last_data_bytes;
> +                       spare_len =3D lt->last_spare_bytes;
> +               }
> +
> +               /* Read the chunk and detect number of bitflips */
> +               marvell_nfc_hw_ecc_bch_read_chunk(chip, chunk, data, data=
_len,
> +                                                 spare, spare_len, page)=
;
> +               marvell_nfc_hw_ecc_correct(chip, data, data_len,
> +                                          spare, spare_len, &max_bitflip=
s);
> +
> +               data +=3D data_len;
> +               spare +=3D spare_len;
> +       }
> +
> +       marvell_nfc_disable_hw_ecc(chip);
> +
> +       if (!oob_required)
> +               return max_bitflips;
> +
> +       /*
> +        * Re-read ECC bytes without ECC enabled, else it is garbage and =
it
> +        * fails the ->correct() call.
> +        */
> +       ecc_len =3D lt->ecc_bytes;
> +       ecc_offset_in_oob_buf =3D
> +               (lt->full_chunk_cnt * lt->spare_bytes) +
> +               (lt->last_chunk_cnt * lt->last_spare_bytes);
> +       ecc_offset_in_page =3D lt->data_bytes + lt->spare_bytes;
> +
> +       for (chunk =3D 0; chunk < nchunks;) {
> +               /* Do the actual raw read of the ECC bytes */
> +               nand_change_read_column_op(chip, ecc_offset_in_page,
> +                                          chip->oob_poi + ecc_offset_in_=
oob_buf,
> +                                          ecc_len, false);
> +
> +               chunk++;
> +
> +               /* When using a "last chunk", the ECC size might vary */
> +               if (chunk >=3D lt->full_chunk_cnt)
> +                       ecc_len =3D lt->last_ecc_bytes;
> +
> +               /* Increment the offsets where ECC will be read and writt=
en */
> +               ecc_offset_in_oob_buf +=3D ALIGN(lt->ecc_bytes, 32);
> +               ecc_offset_in_page +=3D lt->ecc_bytes;
> +               if (chunk < lt->full_chunk_cnt)
> +                       ecc_offset_in_page +=3D lt->data_bytes + lt->spar=
e_bytes;
> +               else
> +                       ecc_offset_in_page +=3D lt->last_data_bytes +
> +                               lt->last_spare_bytes;
> +       }
> +
> +       return max_bitflips;
> +}
> +
> +static int marvell_nfc_hw_ecc_bch_read_oob_raw(struct mtd_info *mtd,
> +                                              struct nand_chip *chip, in=
t page)
> +{
> +       /* Invalidate page cache */
> +       chip->pagebuf =3D -1;
> +
> +       return chip->ecc.read_page_raw(mtd, chip, chip->data_buf, true, p=
age);
> +}
> +
> +static int marvell_nfc_hw_ecc_bch_read_oob(struct mtd_info *mtd,
> +                                          struct nand_chip *chip, int pa=
ge)
> +{
> +       /* Invalidate page cache */
> +       chip->pagebuf =3D -1;
> +
> +       return chip->ecc.read_page(mtd, chip, chip->data_buf, true, page)=
;
> +}
> +
> +/* BCH write helpers */
> +static int marvell_nfc_hw_ecc_bch_write_page_raw(struct mtd_info *mtd,
> +                                                struct nand_chip *chip,
> +                                                const u8 *buf,
> +                                                int oob_required, int pa=
ge)
> +{
> +       const struct marvell_hw_ecc_layout *lt =3D to_marvell_nand(chip)-=
>layout;
> +       int nchunks =3D lt->full_chunk_cnt + lt->last_chunk_cnt;
> +       int full_chunk_size =3D lt->data_bytes + lt->spare_bytes + lt->ec=
c_bytes;
> +       int data_len =3D lt->data_bytes;
> +       int spare_len =3D lt->spare_bytes;
> +       int ecc_len =3D lt->ecc_bytes;
> +       int oob_len =3D spare_len + ecc_len;
> +       int spare_offset =3D 0;
> +       int ecc_offset =3D
> +               (lt->full_chunk_cnt * lt->spare_bytes) +
> +               (lt->last_chunk_cnt * lt->last_spare_bytes);
> +       int chunk;
> +
> +       nand_prog_page_begin_op(chip, page, 0, NULL, 0);
> +
> +       for (chunk =3D 0; chunk < nchunks; chunk++) {
> +               if (chunk >=3D lt->full_chunk_cnt) {
> +                       data_len =3D lt->last_data_bytes;
> +                       spare_len =3D lt->last_spare_bytes;
> +                       ecc_len =3D lt->last_ecc_bytes;
> +                       oob_len =3D spare_len + ecc_len;
> +               }
> +
> +               /* Point to the column of the next chunk */
> +               nand_change_write_column_op(chip, chunk * full_chunk_size=
,
> +                                           NULL, 0, false);
> +
> +               /* Write the data */
> +               nand_write_data_op(chip, buf + (chunk * lt->data_bytes),
> +                                  data_len, false);
> +
> +               if (!oob_required)
> +                       continue;
> +
> +               /* Write the spare bytes */
> +               if (spare_len)
> +                       nand_write_data_op(chip, chip->oob_poi + spare_of=
fset,
> +                                          spare_len, false);
> +
> +               /* Write the ECC bytes */
> +               if (ecc_len)
> +                       nand_write_data_op(chip, chip->oob_poi + ecc_offs=
et,
> +                                          ecc_len, false);
> +
> +               spare_offset +=3D spare_len;
> +               ecc_offset +=3D ALIGN(ecc_len, 32);
> +       }
> +
> +       return nand_prog_page_end_op(chip);
> +}
> +
> +static int
> +marvell_nfc_hw_ecc_bch_write_chunk(struct nand_chip *chip, int chunk,
> +                                  const u8 *data, unsigned int data_len,
> +                                  const u8 *spare, unsigned int spare_le=
n,
> +                                  int page)
> +{
> +       struct marvell_nand_chip *marvell_nand =3D to_marvell_nand(chip);
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +       const struct marvell_hw_ecc_layout *lt =3D to_marvell_nand(chip)-=
>layout;
> +       int nchunks =3D lt->full_chunk_cnt + lt->last_chunk_cnt;
> +       int ret;
> +       struct marvell_nfc_op nfc_op =3D {
> +               .ndcb[0] =3D NDCB0_CMD_TYPE(TYPE_WRITE) | NDCB0_LEN_OVRD,
> +               .ndcb[3] =3D data_len + spare_len,
> +       };
> +
> +       /*
> +        * First operation dispatches the CMD_SEQIN command, issue the ad=
dress
> +        * cycles and asks for the first chunk of data.
> +        * All operations in the middle (if any) will issue a naked write=
 and
> +        * also ask for data.
> +        * Last operation dispatches the PAGEPROG command and also asks f=
or the
> +        * last chunk of data.
> +        */
> +       if (chunk =3D=3D 0) {
> +               nfc_op.ndcb[0] |=3D NDCB0_CMD_XTYPE(XTYPE_WRITE_DISPATCH)=
 |
> +                                 NDCB0_ADDR_CYC(marvell_nand->addr_cyc) =
|
> +                                 NDCB0_CMD1(NAND_CMD_SEQIN);
> +               nfc_op.ndcb[1] |=3D NDCB1_ADDRS(page);
> +               nfc_op.ndcb[2] |=3D NDCB2_ADDR5(page);
> +       } else if (chunk < nchunks - 1) {
> +               nfc_op.ndcb[0] |=3D NDCB0_CMD_XTYPE(XTYPE_NAKED_RW);
> +       } else {
> +               nfc_op.ndcb[0] |=3D NDCB0_CMD2(NAND_CMD_PAGEPROG) | NDCB0=
_DBC |
> +                                 NDCB0_CMD_XTYPE(XTYPE_LAST_NAKED_RW);
> +       }
> +
> +       ret =3D marvell_nfc_prepare_cmd(chip);
> +       if (ret)
> +               return ret;
> +
> +       marvell_nfc_send_cmd(chip, &nfc_op);
> +       ret =3D marvell_nfc_end_cmd(chip, NDSR_WRDREQ,
> +                                 "WRDREQ while loading FIFO (data)");
> +       if (ret)
> +               return ret;
> +
> +       /* Transfer the contents */
> +       iowrite32_rep(nfc->regs + NDDB, data, FIFO_REP(data_len));
> +       iowrite32_rep(nfc->regs + NDDB, spare, FIFO_REP(spare_len));
> +
> +       return 0;
> +}
> +
> +static int marvell_nfc_hw_ecc_bch_write_page(struct mtd_info *mtd,
> +                                            struct nand_chip *chip,
> +                                            const u8 *buf,
> +                                            int oob_required, int page)
> +{
> +       const struct marvell_hw_ecc_layout *lt =3D to_marvell_nand(chip)-=
>layout;
> +       int nchunks =3D lt->full_chunk_cnt + lt->last_chunk_cnt;
> +       const u8 *data =3D buf;
> +       const u8 *spare =3D chip->oob_poi;
> +       int data_len =3D lt->data_bytes;
> +       int spare_len =3D lt->spare_bytes;
> +       int chunk, ret;
> +
> +       /* Spare data will be written anyway, so clear it to avoid garbag=
e */
> +       if (!oob_required)
> +               memset(chip->oob_poi, 0xFF, mtd->oobsize);
> +
> +       marvell_nfc_enable_hw_ecc(chip);
> +
> +       for (chunk =3D 0; chunk < nchunks; chunk++) {
> +               if (chunk >=3D lt->full_chunk_cnt) {
> +                       data_len =3D lt->last_data_bytes;
> +                       spare_len =3D lt->last_spare_bytes;
> +               }
> +
> +               marvell_nfc_hw_ecc_bch_write_chunk(chip, chunk, data, dat=
a_len,
> +                                                  spare, spare_len, page=
);
> +               data +=3D data_len;
> +               spare +=3D spare_len;
> +
> +               /*
> +                * Waiting only for CMDD or PAGED is not enough, ECC are
> +                * partially written. No flag is set once the operation i=
s
> +                * really finished but the ND_RUN bit is cleared, so wait=
 for it
> +                * before stepping into the next command.
> +                */
> +               marvell_nfc_wait_ndrun(chip);
> +       }
> +
> +       ret =3D marvell_nfc_wait_op(chip,
> +                                 chip->data_interface.timings.sdr.tPROG_=
max);
> +
> +       marvell_nfc_disable_hw_ecc(chip);
> +
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static int marvell_nfc_hw_ecc_bch_write_oob_raw(struct mtd_info *mtd,
> +                                               struct nand_chip *chip,
> +                                               int page)
> +{
> +       /* Invalidate page cache */
> +       chip->pagebuf =3D -1;
> +
> +       memset(chip->data_buf, 0xFF, mtd->writesize);
> +
> +       return chip->ecc.write_page_raw(mtd, chip, chip->data_buf, true, =
page);
> +}
> +
> +static int marvell_nfc_hw_ecc_bch_write_oob(struct mtd_info *mtd,
> +                                           struct nand_chip *chip, int p=
age)
> +{
> +       /* Invalidate page cache */
> +       chip->pagebuf =3D -1;
> +
> +       memset(chip->data_buf, 0xFF, mtd->writesize);
> +
> +       return chip->ecc.write_page(mtd, chip, chip->data_buf, true, page=
);
> +}
> +
> +/* NAND framework ->exec_op() hooks and related helpers */
> +static void marvell_nfc_parse_instructions(struct nand_chip *chip,
> +                                          const struct nand_subop *subop=
,
> +                                          struct marvell_nfc_op *nfc_op)
> +{
> +       const struct nand_op_instr *instr =3D NULL;
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +       bool first_cmd =3D true;
> +       unsigned int op_id;
> +       int i;
> +
> +       /* Reset the input structure as most of its fields will be OR'ed =
*/
> +       memset(nfc_op, 0, sizeof(struct marvell_nfc_op));
> +
> +       for (op_id =3D 0; op_id < subop->ninstrs; op_id++) {
> +               unsigned int offset, naddrs;
> +               const u8 *addrs;
> +               int len =3D nand_subop_get_data_len(subop, op_id);
> +
> +               instr =3D &subop->instrs[op_id];
> +
> +               switch (instr->type) {
> +               case NAND_OP_CMD_INSTR:
> +                       if (first_cmd)
> +                               nfc_op->ndcb[0] |=3D
> +                                       NDCB0_CMD1(instr->ctx.cmd.opcode)=
;
> +                       else
> +                               nfc_op->ndcb[0] |=3D
> +                                       NDCB0_CMD2(instr->ctx.cmd.opcode)=
 |
> +                                       NDCB0_DBC;
> +
> +                       nfc_op->cle_ale_delay_ns =3D instr->delay_ns;
> +                       first_cmd =3D false;
> +                       break;
> +
> +               case NAND_OP_ADDR_INSTR:
> +                       offset =3D nand_subop_get_addr_start_off(subop, o=
p_id);
> +                       naddrs =3D nand_subop_get_num_addr_cyc(subop, op_=
id);
> +                       addrs =3D &instr->ctx.addr.addrs[offset];
> +
> +                       nfc_op->ndcb[0] |=3D NDCB0_ADDR_CYC(naddrs);
> +
> +                       for (i =3D 0; i < min_t(unsigned int, 4, naddrs);=
 i++)
> +                               nfc_op->ndcb[1] |=3D addrs[i] << (8 * i);
> +
> +                       if (naddrs >=3D 5)
> +                               nfc_op->ndcb[2] |=3D NDCB2_ADDR5(addrs[5]=
);
> +                       if (naddrs >=3D 6)
> +                               nfc_op->ndcb[3] |=3D NDCB3_ADDR6(addrs[6]=
);
> +                       if (naddrs =3D=3D 7)
> +                               nfc_op->ndcb[3] |=3D NDCB3_ADDR7(addrs[7]=
);
> +
> +                       nfc_op->cle_ale_delay_ns =3D instr->delay_ns;
> +                       break;
> +
> +               case NAND_OP_DATA_IN_INSTR:
> +                       nfc_op->data_instr =3D instr;
> +                       nfc_op->data_instr_idx =3D op_id;
> +                       nfc_op->ndcb[0] |=3D NDCB0_CMD_TYPE(TYPE_READ);
> +                       if (nfc->caps->is_nfcv2) {
> +                               nfc_op->ndcb[0] |=3D
> +                                       NDCB0_CMD_XTYPE(XTYPE_MONOLITHIC_=
RW) |
> +                                       NDCB0_LEN_OVRD;
> +                               nfc_op->ndcb[3] |=3D round_up(len, FIFO_D=
EPTH);
> +                       }
> +                       nfc_op->data_delay_ns =3D instr->delay_ns;
> +                       break;
> +
> +               case NAND_OP_DATA_OUT_INSTR:
> +                       nfc_op->data_instr =3D instr;
> +                       nfc_op->data_instr_idx =3D op_id;
> +                       nfc_op->ndcb[0] |=3D NDCB0_CMD_TYPE(TYPE_WRITE);
> +                       if (nfc->caps->is_nfcv2) {
> +                               nfc_op->ndcb[0] |=3D
> +                                       NDCB0_CMD_XTYPE(XTYPE_MONOLITHIC_=
RW) |
> +                                       NDCB0_LEN_OVRD;
> +                               nfc_op->ndcb[3] |=3D round_up(len, FIFO_D=
EPTH);
> +                       }
> +                       nfc_op->data_delay_ns =3D instr->delay_ns;
> +                       break;
> +
> +               case NAND_OP_WAITRDY_INSTR:
> +                       nfc_op->rdy_timeout_ms =3D instr->ctx.waitrdy.tim=
eout_ms;
> +                       nfc_op->rdy_delay_ns =3D instr->delay_ns;
> +                       break;
> +               }
> +       }
> +}
> +
> +static int marvell_nfc_xfer_data_pio(struct nand_chip *chip,
> +                                    const struct nand_subop *subop,
> +                                    struct marvell_nfc_op *nfc_op)
> +{
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +       const struct nand_op_instr *instr =3D nfc_op->data_instr;
> +       unsigned int op_id =3D nfc_op->data_instr_idx;
> +       unsigned int len =3D nand_subop_get_data_len(subop, op_id);
> +       unsigned int offset =3D nand_subop_get_data_start_off(subop, op_i=
d);
> +       bool reading =3D (instr->type =3D=3D NAND_OP_DATA_IN_INSTR);
> +       int ret;
> +
> +       if (instr->ctx.data.force_8bit)
> +               marvell_nfc_force_byte_access(chip, true);
> +
> +       if (reading) {
> +               u8 *in =3D instr->ctx.data.buf.in + offset;
> +
> +               ret =3D marvell_nfc_xfer_data_in_pio(nfc, in, len);
> +       } else {
> +               const u8 *out =3D instr->ctx.data.buf.out + offset;
> +
> +               ret =3D marvell_nfc_xfer_data_out_pio(nfc, out, len);
> +       }
> +
> +       if (instr->ctx.data.force_8bit)
> +               marvell_nfc_force_byte_access(chip, false);
> +
> +       return ret;
> +}
> +
> +static int marvell_nfc_monolithic_access_exec(struct nand_chip *chip,
> +                                             const struct nand_subop *su=
bop)
> +{
> +       struct marvell_nfc_op nfc_op;
> +       bool reading;
> +       int ret;
> +
> +       marvell_nfc_parse_instructions(chip, subop, &nfc_op);
> +       reading =3D (nfc_op.data_instr->type =3D=3D NAND_OP_DATA_IN_INSTR=
);
> +
> +       ret =3D marvell_nfc_prepare_cmd(chip);
> +       if (ret)
> +               return ret;
> +
> +       marvell_nfc_send_cmd(chip, &nfc_op);
> +       ret =3D marvell_nfc_end_cmd(chip, NDSR_RDDREQ | NDSR_WRDREQ,
> +                                 "RDDREQ/WRDREQ while draining raw data"=
);
> +       if (ret)
> +               return ret;
> +
> +       cond_delay(nfc_op.cle_ale_delay_ns);
> +
> +       if (reading) {
> +               if (nfc_op.rdy_timeout_ms) {
> +                       ret =3D marvell_nfc_wait_op(chip, nfc_op.rdy_time=
out_ms);
> +                       if (ret)
> +                               return ret;
> +               }
> +
> +               cond_delay(nfc_op.rdy_delay_ns);
> +       }
> +
> +       marvell_nfc_xfer_data_pio(chip, subop, &nfc_op);
> +       ret =3D marvell_nfc_wait_cmdd(chip);
> +       if (ret)
> +               return ret;
> +
> +       cond_delay(nfc_op.data_delay_ns);
> +
> +       if (!reading) {
> +               if (nfc_op.rdy_timeout_ms) {
> +                       ret =3D marvell_nfc_wait_op(chip, nfc_op.rdy_time=
out_ms);
> +                       if (ret)
> +                               return ret;
> +               }
> +
> +               cond_delay(nfc_op.rdy_delay_ns);
> +       }
> +
> +       /*
> +        * NDCR ND_RUN bit should be cleared automatically at the end of =
each
> +        * operation but experience shows that the behavior is buggy when=
 it
> +        * comes to writes (with LEN_OVRD). Clear it by hand in this case=
.
> +        */
> +       if (!reading) {
> +               struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controll=
er);
> +
> +               writel_relaxed(readl(nfc->regs + NDCR) & ~NDCR_ND_RUN,
> +                              nfc->regs + NDCR);
> +       }
> +
> +       return 0;
> +}
> +
> +static int marvell_nfc_naked_access_exec(struct nand_chip *chip,
> +                                        const struct nand_subop *subop)
> +{
> +       struct marvell_nfc_op nfc_op;
> +       int ret;
> +
> +       marvell_nfc_parse_instructions(chip, subop, &nfc_op);
> +
> +       /*
> +        * Naked access are different in that they need to be flagged as =
naked
> +        * by the controller. Reset the controller registers fields that =
inform
> +        * on the type and refill them according to the ongoing operation=
.
> +        */
> +       nfc_op.ndcb[0] &=3D ~(NDCB0_CMD_TYPE(TYPE_MASK) |
> +                           NDCB0_CMD_XTYPE(XTYPE_MASK));
> +       switch (subop->instrs[0].type) {
> +       case NAND_OP_CMD_INSTR:
> +               nfc_op.ndcb[0] |=3D NDCB0_CMD_TYPE(TYPE_NAKED_CMD);
> +               break;
> +       case NAND_OP_ADDR_INSTR:
> +               nfc_op.ndcb[0] |=3D NDCB0_CMD_TYPE(TYPE_NAKED_ADDR);
> +               break;
> +       case NAND_OP_DATA_IN_INSTR:
> +               nfc_op.ndcb[0] |=3D NDCB0_CMD_TYPE(TYPE_READ) |
> +                                 NDCB0_CMD_XTYPE(XTYPE_LAST_NAKED_RW);
> +               break;
> +       case NAND_OP_DATA_OUT_INSTR:
> +               nfc_op.ndcb[0] |=3D NDCB0_CMD_TYPE(TYPE_WRITE) |
> +                                 NDCB0_CMD_XTYPE(XTYPE_LAST_NAKED_RW);
> +               break;
> +       default:
> +               /* This should never happen */
> +               break;
> +       }
> +
> +       ret =3D marvell_nfc_prepare_cmd(chip);
> +       if (ret)
> +               return ret;
> +
> +       marvell_nfc_send_cmd(chip, &nfc_op);
> +
> +       if (!nfc_op.data_instr) {
> +               ret =3D marvell_nfc_wait_cmdd(chip);
> +               cond_delay(nfc_op.cle_ale_delay_ns);
> +               return ret;
> +       }
> +
> +       ret =3D marvell_nfc_end_cmd(chip, NDSR_RDDREQ | NDSR_WRDREQ,
> +                                 "RDDREQ/WRDREQ while draining raw data"=
);
> +       if (ret)
> +               return ret;
> +
> +       marvell_nfc_xfer_data_pio(chip, subop, &nfc_op);
> +       ret =3D marvell_nfc_wait_cmdd(chip);
> +       if (ret)
> +               return ret;
> +
> +       /*
> +        * NDCR ND_RUN bit should be cleared automatically at the end of =
each
> +        * operation but experience shows that the behavior is buggy when=
 it
> +        * comes to writes (with LEN_OVRD). Clear it by hand in this case=
.
> +        */
> +       if (subop->instrs[0].type =3D=3D NAND_OP_DATA_OUT_INSTR) {
> +               struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controll=
er);
> +
> +               writel_relaxed(readl(nfc->regs + NDCR) & ~NDCR_ND_RUN,
> +                              nfc->regs + NDCR);
> +       }
> +
> +       return 0;
> +}
> +
> +static int marvell_nfc_naked_waitrdy_exec(struct nand_chip *chip,
> +                                         const struct nand_subop *subop)
> +{
> +       struct marvell_nfc_op nfc_op;
> +       int ret;
> +
> +       marvell_nfc_parse_instructions(chip, subop, &nfc_op);
> +
> +       ret =3D marvell_nfc_wait_op(chip, nfc_op.rdy_timeout_ms);
> +       cond_delay(nfc_op.rdy_delay_ns);
> +
> +       return ret;
> +}
> +
> +static int marvell_nfc_read_id_type_exec(struct nand_chip *chip,
> +                                        const struct nand_subop *subop)
> +{
> +       struct marvell_nfc_op nfc_op;
> +       int ret;
> +
> +       marvell_nfc_parse_instructions(chip, subop, &nfc_op);
> +       nfc_op.ndcb[0] &=3D ~NDCB0_CMD_TYPE(TYPE_READ);
> +       nfc_op.ndcb[0] |=3D NDCB0_CMD_TYPE(TYPE_READ_ID);
> +
> +       ret =3D marvell_nfc_prepare_cmd(chip);
> +       if (ret)
> +               return ret;
> +
> +       marvell_nfc_send_cmd(chip, &nfc_op);
> +       ret =3D marvell_nfc_end_cmd(chip, NDSR_RDDREQ,
> +                                 "RDDREQ while reading ID");
> +       if (ret)
> +               return ret;
> +
> +       cond_delay(nfc_op.cle_ale_delay_ns);
> +
> +       if (nfc_op.rdy_timeout_ms) {
> +               ret =3D marvell_nfc_wait_op(chip, nfc_op.rdy_timeout_ms);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       cond_delay(nfc_op.rdy_delay_ns);
> +
> +       marvell_nfc_xfer_data_pio(chip, subop, &nfc_op);
> +       ret =3D marvell_nfc_wait_cmdd(chip);
> +       if (ret)
> +               return ret;
> +
> +       cond_delay(nfc_op.data_delay_ns);
> +
> +       return 0;
> +}
> +
> +static int marvell_nfc_read_status_exec(struct nand_chip *chip,
> +                                       const struct nand_subop *subop)
> +{
> +       struct marvell_nfc_op nfc_op;
> +       int ret;
> +
> +       marvell_nfc_parse_instructions(chip, subop, &nfc_op);
> +       nfc_op.ndcb[0] &=3D ~NDCB0_CMD_TYPE(TYPE_READ);
> +       nfc_op.ndcb[0] |=3D NDCB0_CMD_TYPE(TYPE_STATUS);
> +
> +       ret =3D marvell_nfc_prepare_cmd(chip);
> +       if (ret)
> +               return ret;
> +
> +       marvell_nfc_send_cmd(chip, &nfc_op);
> +       ret =3D marvell_nfc_end_cmd(chip, NDSR_RDDREQ,
> +                                 "RDDREQ while reading status");
> +       if (ret)
> +               return ret;
> +
> +       cond_delay(nfc_op.cle_ale_delay_ns);
> +
> +       if (nfc_op.rdy_timeout_ms) {
> +               ret =3D marvell_nfc_wait_op(chip, nfc_op.rdy_timeout_ms);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       cond_delay(nfc_op.rdy_delay_ns);
> +
> +       marvell_nfc_xfer_data_pio(chip, subop, &nfc_op);
> +       ret =3D marvell_nfc_wait_cmdd(chip);
> +       if (ret)
> +               return ret;
> +
> +       cond_delay(nfc_op.data_delay_ns);
> +
> +       return 0;
> +}
> +
> +static int marvell_nfc_reset_cmd_type_exec(struct nand_chip *chip,
> +                                          const struct nand_subop *subop=
)
> +{
> +       struct marvell_nfc_op nfc_op;
> +       int ret;
> +
> +       marvell_nfc_parse_instructions(chip, subop, &nfc_op);
> +       nfc_op.ndcb[0] |=3D NDCB0_CMD_TYPE(TYPE_RESET);
> +
> +       ret =3D marvell_nfc_prepare_cmd(chip);
> +       if (ret)
> +               return ret;
> +
> +       marvell_nfc_send_cmd(chip, &nfc_op);
> +       ret =3D marvell_nfc_wait_cmdd(chip);
> +       if (ret)
> +               return ret;
> +
> +       cond_delay(nfc_op.cle_ale_delay_ns);
> +
> +       ret =3D marvell_nfc_wait_op(chip, nfc_op.rdy_timeout_ms);
> +       if (ret)
> +               return ret;
> +
> +       cond_delay(nfc_op.rdy_delay_ns);
> +
> +       return 0;
> +}
> +
> +static int marvell_nfc_erase_cmd_type_exec(struct nand_chip *chip,
> +                                          const struct nand_subop *subop=
)
> +{
> +       struct marvell_nfc_op nfc_op;
> +       int ret;
> +
> +       marvell_nfc_parse_instructions(chip, subop, &nfc_op);
> +       nfc_op.ndcb[0] |=3D NDCB0_CMD_TYPE(TYPE_ERASE);
> +
> +       ret =3D marvell_nfc_prepare_cmd(chip);
> +       if (ret)
> +               return ret;
> +
> +       marvell_nfc_send_cmd(chip, &nfc_op);
> +       ret =3D marvell_nfc_wait_cmdd(chip);
> +       if (ret)
> +               return ret;
> +
> +       cond_delay(nfc_op.cle_ale_delay_ns);
> +
> +       ret =3D marvell_nfc_wait_op(chip, nfc_op.rdy_timeout_ms);
> +       if (ret)
> +               return ret;
> +
> +       cond_delay(nfc_op.rdy_delay_ns);
> +
> +       return 0;
> +}
> +
> +static const struct nand_op_parser marvell_nfcv2_op_parser =3D NAND_OP_P=
ARSER(
> +       /* Monolithic reads/writes */
> +       NAND_OP_PARSER_PATTERN(
> +               marvell_nfc_monolithic_access_exec,
> +               NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +               NAND_OP_PARSER_PAT_ADDR_ELEM(true, MAX_ADDRESS_CYC_NFCV2)=
,
> +               NAND_OP_PARSER_PAT_CMD_ELEM(true),
> +               NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
> +               NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, MAX_CHUNK_SIZE)),
> +       NAND_OP_PARSER_PATTERN(
> +               marvell_nfc_monolithic_access_exec,
> +               NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +               NAND_OP_PARSER_PAT_ADDR_ELEM(false, MAX_ADDRESS_CYC_NFCV2=
),
> +               NAND_OP_PARSER_PAT_DATA_OUT_ELEM(false, MAX_CHUNK_SIZE),
> +               NAND_OP_PARSER_PAT_CMD_ELEM(true),
> +               NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
> +       /* Naked commands */
> +       NAND_OP_PARSER_PATTERN(
> +               marvell_nfc_naked_access_exec,
> +               NAND_OP_PARSER_PAT_CMD_ELEM(false)),
> +       NAND_OP_PARSER_PATTERN(
> +               marvell_nfc_naked_access_exec,
> +               NAND_OP_PARSER_PAT_ADDR_ELEM(false, MAX_ADDRESS_CYC_NFCV2=
)),
> +       NAND_OP_PARSER_PATTERN(
> +               marvell_nfc_naked_access_exec,
> +               NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, MAX_CHUNK_SIZE)),
> +       NAND_OP_PARSER_PATTERN(
> +               marvell_nfc_naked_access_exec,
> +               NAND_OP_PARSER_PAT_DATA_OUT_ELEM(false, MAX_CHUNK_SIZE)),
> +       NAND_OP_PARSER_PATTERN(
> +               marvell_nfc_naked_waitrdy_exec,
> +               NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
> +       );
> +
> +static const struct nand_op_parser marvell_nfcv1_op_parser =3D NAND_OP_P=
ARSER(
> +       /* Naked commands not supported, use a function for each pattern =
*/
> +       NAND_OP_PARSER_PATTERN(
> +               marvell_nfc_read_id_type_exec,
> +               NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +               NAND_OP_PARSER_PAT_ADDR_ELEM(false, MAX_ADDRESS_CYC_NFCV1=
),
> +               NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 8)),
> +       NAND_OP_PARSER_PATTERN(
> +               marvell_nfc_erase_cmd_type_exec,
> +               NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +               NAND_OP_PARSER_PAT_ADDR_ELEM(false, MAX_ADDRESS_CYC_NFCV1=
),
> +               NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +               NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
> +       NAND_OP_PARSER_PATTERN(
> +               marvell_nfc_read_status_exec,
> +               NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +               NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 1)),
> +       NAND_OP_PARSER_PATTERN(
> +               marvell_nfc_reset_cmd_type_exec,
> +               NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +               NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
> +       NAND_OP_PARSER_PATTERN(
> +               marvell_nfc_naked_waitrdy_exec,
> +               NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
> +       );
> +
> +static int marvell_nfc_exec_op(struct nand_chip *chip,
> +                              const struct nand_operation *op,
> +                              bool check_only)
> +{
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +
> +       if (nfc->caps->is_nfcv2)
> +               return nand_op_parser_exec_op(chip, &marvell_nfcv2_op_par=
ser,
> +                                             op, check_only);
> +       else
> +               return nand_op_parser_exec_op(chip, &marvell_nfcv1_op_par=
ser,
> +                                             op, check_only);
> +}
> +
> +/*
> + * HW ECC layouts, identical to old pxa3xx_nand driver,
> + * to be fully backward compatible.
> + */
> +static int marvell_nand_ooblayout_ecc(struct mtd_info *mtd, int section,
> +                                     struct mtd_oob_region *oobregion)
> +{
> +       struct nand_chip *chip =3D mtd_to_nand(mtd);
> +       const struct marvell_hw_ecc_layout *lt =3D to_marvell_nand(chip)-=
>layout;
> +       int nchunks =3D lt->full_chunk_cnt;
> +
> +       if (section >=3D nchunks)
> +               return -ERANGE;
> +
> +       oobregion->offset =3D ((lt->spare_bytes + lt->ecc_bytes) * sectio=
n) +
> +               lt->spare_bytes;
> +       oobregion->length =3D lt->ecc_bytes;
> +
> +       return 0;
> +}
> +
> +static int marvell_nand_ooblayout_free(struct mtd_info *mtd, int section=
,
> +                                      struct mtd_oob_region *oobregion)
> +{
> +       struct nand_chip *chip =3D mtd_to_nand(mtd);
> +       const struct marvell_hw_ecc_layout *lt =3D to_marvell_nand(chip)-=
>layout;
> +       int nchunks =3D lt->full_chunk_cnt;
> +
> +       if (section >=3D nchunks)
> +               return -ERANGE;
> +
> +       if (!lt->spare_bytes)
> +               return 0;
> +
> +       oobregion->offset =3D section * (lt->spare_bytes + lt->ecc_bytes)=
;
> +       oobregion->length =3D lt->spare_bytes;
> +       if (!section) {
> +               /*
> +                * Bootrom looks in bytes 0 & 5 for bad blocks for the
> +                * 4KB page / 4bit BCH combination.
> +                */
> +               if (mtd->writesize =3D=3D 4096 && lt->data_bytes =3D=3D 2=
048) {
> +                       oobregion->offset +=3D 6;
> +                       oobregion->length -=3D 6;
> +               } else {
> +                       oobregion->offset +=3D 2;
> +                       oobregion->length -=3D 2;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct mtd_ooblayout_ops marvell_nand_ooblayout_ops =3D {
> +       .ecc =3D marvell_nand_ooblayout_ecc,
> +       .free =3D marvell_nand_ooblayout_free,
> +};
> +
> +static int marvell_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
> +                                        struct nand_ecc_ctrl *ecc)
> +{
> +       struct nand_chip *chip =3D mtd_to_nand(mtd);
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +       const struct marvell_hw_ecc_layout *l;
> +       int i;
> +
> +       if (!nfc->caps->is_nfcv2 &&
> +           (mtd->writesize + mtd->oobsize > MAX_CHUNK_SIZE)) {
> +               dev_err(nfc->dev,
> +                       "NFCv1: writesize (%d) cannot be bigger than a ch=
unk (%d)\n",
> +                       mtd->writesize, MAX_CHUNK_SIZE - mtd->oobsize);
> +               return -ENOTSUPP;
> +       }
> +
> +       to_marvell_nand(chip)->layout =3D NULL;
> +       for (i =3D 0; i < ARRAY_SIZE(marvell_nfc_layouts); i++) {
> +               l =3D &marvell_nfc_layouts[i];
> +               if (mtd->writesize =3D=3D l->writesize &&
> +                   ecc->size =3D=3D l->chunk && ecc->strength =3D=3D l->=
strength) {
> +                       to_marvell_nand(chip)->layout =3D l;
> +                       break;
> +               }
> +       }
> +
> +       if (!to_marvell_nand(chip)->layout ||
> +           (!nfc->caps->is_nfcv2 && ecc->strength > 1)) {
> +               dev_err(nfc->dev,
> +                       "ECC strength %d at page size %d is not supported=
\n",
> +                       ecc->strength, mtd->writesize);
> +               return -ENOTSUPP;
> +       }
> +
> +       mtd_set_ooblayout(mtd, &marvell_nand_ooblayout_ops);
> +       ecc->steps =3D l->full_chunk_cnt + l->last_chunk_cnt;
> +       ecc->size =3D l->data_bytes;
> +
> +       if (ecc->strength =3D=3D 1) {
> +               chip->ecc.algo =3D NAND_ECC_HAMMING;
> +               ecc->read_page_raw =3D marvell_nfc_hw_ecc_hmg_read_page_r=
aw;
> +               ecc->read_page =3D marvell_nfc_hw_ecc_hmg_read_page;
> +               ecc->read_oob_raw =3D marvell_nfc_hw_ecc_hmg_read_oob_raw=
;
> +               ecc->read_oob =3D ecc->read_oob_raw;
> +               ecc->write_page_raw =3D marvell_nfc_hw_ecc_hmg_write_page=
_raw;
> +               ecc->write_page =3D marvell_nfc_hw_ecc_hmg_write_page;
> +               ecc->write_oob_raw =3D marvell_nfc_hw_ecc_hmg_write_oob_r=
aw;
> +               ecc->write_oob =3D ecc->write_oob_raw;
> +       } else {
> +               chip->ecc.algo =3D NAND_ECC_BCH;
> +               ecc->strength =3D 16;
> +               ecc->read_page_raw =3D marvell_nfc_hw_ecc_bch_read_page_r=
aw;
> +               ecc->read_page =3D marvell_nfc_hw_ecc_bch_read_page;
> +               ecc->read_oob_raw =3D marvell_nfc_hw_ecc_bch_read_oob_raw=
;
> +               ecc->read_oob =3D marvell_nfc_hw_ecc_bch_read_oob;
> +               ecc->write_page_raw =3D marvell_nfc_hw_ecc_bch_write_page=
_raw;
> +               ecc->write_page =3D marvell_nfc_hw_ecc_bch_write_page;
> +               ecc->write_oob_raw =3D marvell_nfc_hw_ecc_bch_write_oob_r=
aw;
> +               ecc->write_oob =3D marvell_nfc_hw_ecc_bch_write_oob;
> +       }
> +
> +       return 0;
> +}
> +
> +static int marvell_nand_ecc_init(struct mtd_info *mtd,
> +                                struct nand_ecc_ctrl *ecc)
> +{
> +       struct nand_chip *chip =3D mtd_to_nand(mtd);
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +       int ret;
> +
> +       if ((ecc->mode !=3D NAND_ECC_NONE) && (!ecc->size || !ecc->streng=
th)) {
> +               if (chip->ecc_step_ds && chip->ecc_strength_ds) {
> +                       ecc->size =3D chip->ecc_step_ds;
> +                       ecc->strength =3D chip->ecc_strength_ds;
> +               } else {
> +                       dev_info(nfc->dev,
> +                                "No minimum ECC strength, using 1b/512B\=
n");
> +                       ecc->size =3D 512;
> +                       ecc->strength =3D 1;
> +               }
> +       }
> +
> +       switch (ecc->mode) {
> +       case NAND_ECC_HW:
> +               ret =3D marvell_nand_hw_ecc_ctrl_init(mtd, ecc);
> +               if (ret)
> +                       return ret;
> +               break;
> +       case NAND_ECC_NONE:
> +               chip->ecc.algo =3D 0;
> +       case NAND_ECC_SOFT:
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static u8 bbt_pattern[] =3D {'M', 'V', 'B', 'b', 't', '0' };
> +static u8 bbt_mirror_pattern[] =3D {'1', 't', 'b', 'B', 'V', 'M' };
> +
> +static struct nand_bbt_descr bbt_main_descr =3D {
> +       .options =3D NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRIT=
E |
> +                  NAND_BBT_2BIT | NAND_BBT_VERSION,
> +       .offs =3D 8,
> +       .len =3D 6,
> +       .veroffs =3D 14,
> +       .maxblocks =3D 8, /* Last 8 blocks in each chip */
> +       .pattern =3D bbt_pattern
> +};
> +
> +static struct nand_bbt_descr bbt_mirror_descr =3D {
> +       .options =3D NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRIT=
E |
> +                  NAND_BBT_2BIT | NAND_BBT_VERSION,
> +       .offs =3D 8,
> +       .len =3D 6,
> +       .veroffs =3D 14,
> +       .maxblocks =3D 8, /* Last 8 blocks in each chip */
> +       .pattern =3D bbt_mirror_pattern
> +};
> +
> +static int marvell_nfc_setup_data_interface(struct mtd_info *mtd, int ch=
ipnr,
> +                                           const struct nand_data_interf=
ace
> +                                           *conf)
> +{
> +       struct nand_chip *chip =3D mtd_to_nand(mtd);
> +       struct marvell_nand_chip *marvell_nand =3D to_marvell_nand(chip);
> +       struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);
> +       unsigned int period_ns =3D 1000000000 / clk_get_rate(nfc->ecc_clk=
) * 2;
> +       const struct nand_sdr_timings *sdr;
> +       struct marvell_nfc_timings nfc_tmg;
> +       int read_delay;
> +
> +       sdr =3D nand_get_sdr_timings(conf);
> +       if (IS_ERR(sdr))
> +               return PTR_ERR(sdr);
> +
> +       /*
> +        * SDR timings are given in pico-seconds while NFC timings must b=
e
> +        * expressed in NAND controller clock cycles, which is half of th=
e
> +        * frequency of the accessible ECC clock retrieved by clk_get_rat=
e().
> +        * This is not written anywhere in the datasheet but was observed
> +        * with an oscilloscope.
> +        *
> +        * NFC datasheet gives equations from which thoses calculations
> +        * are derived, they tend to be slightly more restrictives than t=
he
> +        * given core timings and may improve the overall speed.
> +        */
> +       nfc_tmg.tRP =3D TO_CYCLES(DIV_ROUND_UP(sdr->tRC_min, 2), period_n=
s) - 1;
> +       nfc_tmg.tRH =3D nfc_tmg.tRP;
> +       nfc_tmg.tWP =3D TO_CYCLES(DIV_ROUND_UP(sdr->tWC_min, 2), period_n=
s) - 1;
> +       nfc_tmg.tWH =3D nfc_tmg.tWP;
> +       nfc_tmg.tCS =3D TO_CYCLES(sdr->tCS_min, period_ns);
> +       nfc_tmg.tCH =3D TO_CYCLES(sdr->tCH_min, period_ns) - 1;
> +       nfc_tmg.tADL =3D TO_CYCLES(sdr->tADL_min, period_ns);
> +       /*
> +        * Read delay is the time of propagation from SoC pins to NFC int=
ernal
> +        * logic. With non-EDO timings, this is MIN_RD_DEL_CNT clock cycl=
es. In
> +        * EDO mode, an additional delay of tRH must be taken into accoun=
t so
> +        * the data is sampled on the falling edge instead of the rising =
edge.
> +        */
> +       read_delay =3D sdr->tRC_min >=3D 30000 ?
> +               MIN_RD_DEL_CNT : MIN_RD_DEL_CNT + nfc_tmg.tRH;
> +
> +       nfc_tmg.tAR =3D TO_CYCLES(sdr->tAR_min, period_ns);
> +       /*
> +        * tWHR and tRHW are supposed to be read to write delays (and vic=
e
> +        * versa) but in some cases, ie. when doing a change column, they=
 must
> +        * be greater than that to be sure tCCS delay is respected.
> +        */
> +       nfc_tmg.tWHR =3D TO_CYCLES(max_t(int, sdr->tWHR_min, sdr->tCCS_mi=
n),
> +                                period_ns) - 2,
> +       nfc_tmg.tRHW =3D TO_CYCLES(max_t(int, sdr->tRHW_min, sdr->tCCS_mi=
n),
> +                                period_ns);
> +
> +       /* Use WAIT_MODE (wait for RB line) instead of only relying on de=
lays */
> +       nfc_tmg.tR =3D TO_CYCLES(sdr->tWB_max, period_ns);
> +
> +       if (chipnr < 0)
> +               return 0;
> +
> +       marvell_nand->ndtr0 =3D
> +               NDTR0_TRP(nfc_tmg.tRP) |
> +               NDTR0_TRH(nfc_tmg.tRH) |
> +               NDTR0_ETRP(nfc_tmg.tRP) |
> +               NDTR0_TWP(nfc_tmg.tWP) |
> +               NDTR0_TWH(nfc_tmg.tWH) |
> +               NDTR0_TCS(nfc_tmg.tCS) |
> +               NDTR0_TCH(nfc_tmg.tCH) |
> +               NDTR0_RD_CNT_DEL(read_delay) |
> +               NDTR0_SELCNTR |
> +               NDTR0_TADL(nfc_tmg.tADL);
> +
> +       marvell_nand->ndtr1 =3D
> +               NDTR1_TAR(nfc_tmg.tAR) |
> +               NDTR1_TWHR(nfc_tmg.tWHR) |
> +               NDTR1_TRHW(nfc_tmg.tRHW) |
> +               NDTR1_WAIT_MODE |
> +               NDTR1_TR(nfc_tmg.tR);
> +
> +       writel_relaxed(marvell_nand->ndtr0, nfc->regs + NDTR0);
> +       writel_relaxed(marvell_nand->ndtr1, nfc->regs + NDTR1);
> +
> +       return 0;
> +}
> +
> +static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc=
 *nfc,
> +                                 struct device_node *np)
> +{
> +       struct pxa3xx_nand_platform_data *pdata =3D dev_get_platdata(dev)=
;
> +       struct marvell_nand_chip *marvell_nand;
> +       struct mtd_info *mtd;
> +       struct nand_chip *chip;
> +       int nsels, ret, i;
> +       u32 cs, rb;
> +
> +       /*
> +        * The legacy "num-cs" property indicates the number of CS on the=
 only
> +        * chip connected to the controller (legacy bindings does not sup=
port
> +        * more than one chip). CS are only incremented one by one while =
the RB
> +        * pin is always the #0.
> +        *
> +        * When not using legacy bindings, a couple of "reg" and "marvell=
,rb"
> +        * properties must be filled. For each chip, expressed as a subno=
de,
> +        * "reg" points to the CS lines and "marvell,rb" to the RB line.
> +        */
> +       if (pdata) {
> +               nsels =3D 1;
> +       } else if (nfc->caps->legacy_of_bindings) {
> +               if (!of_get_property(np, "num-cs", &nsels)) {
> +                       dev_err(dev, "missing num-cs property\n");
> +                       return -EINVAL;
> +               }
> +       } else {
> +               if (!of_get_property(np, "reg", &nsels)) {
> +                       dev_err(dev, "missing reg property\n");
> +                       return -EINVAL;
> +               }
> +       }
> +
> +       if (!pdata)
> +               nsels /=3D sizeof(u32);
> +       if (!nsels) {
> +               dev_err(dev, "invalid reg property size\n");
> +               return -EINVAL;
> +       }
> +
> +       /* Alloc the nand chip structure */
> +       marvell_nand =3D devm_kzalloc(dev, sizeof(*marvell_nand) +
> +                                   (nsels *
> +                                    sizeof(struct marvell_nand_chip_sel)=
),
> +                                   GFP_KERNEL);
> +       if (!marvell_nand) {
> +               dev_err(dev, "could not allocate chip structure\n");
> +               return -ENOMEM;
> +       }
> +
> +       marvell_nand->nsels =3D nsels;
> +       marvell_nand->selected_die =3D -1;
> +
> +       for (i =3D 0; i < nsels; i++) {
> +               if (pdata || nfc->caps->legacy_of_bindings) {
> +                       /*
> +                        * Legacy bindings use the CS lines in natural
> +                        * order (0, 1, ...)
> +                        */
> +                       cs =3D i;
> +               } else {
> +                       /* Retrieve CS id */
> +                       ret =3D of_property_read_u32_index(np, "reg", i, =
&cs);
> +                       if (ret) {
> +                               dev_err(dev, "could not retrieve reg prop=
erty: %d\n",
> +                                       ret);
> +                               return ret;
> +                       }
> +               }
> +
> +               if (cs >=3D nfc->caps->max_cs_nb) {
> +                       dev_err(dev, "invalid reg value: %u (max CS =3D %=
d)\n",
> +                               cs, nfc->caps->max_cs_nb);
> +                       return -EINVAL;
> +               }
> +
> +               if (test_and_set_bit(cs, &nfc->assigned_cs)) {
> +                       dev_err(dev, "CS %d already assigned\n", cs);
> +                       return -EINVAL;
> +               }
> +
> +               /*
> +                * The cs variable represents the chip select id, which m=
ust be
> +                * converted in bit fields for NDCB0 and NDCB2 to select =
the
> +                * right chip. Unfortunately, due to a lack of informatio=
n on
> +                * the subject and incoherent documentation, the user sho=
uld not
> +                * use CS1 and CS3 at all as asserting them is not suppor=
ted in
> +                * a reliable way (due to multiplexing inside ADDR5 field=
).
> +                */
> +               marvell_nand->sels[i].cs =3D cs;
> +               switch (cs) {
> +               case 0:
> +               case 2:
> +                       marvell_nand->sels[i].ndcb0_csel =3D 0;
> +                       break;
> +               case 1:
> +               case 3:
> +                       marvell_nand->sels[i].ndcb0_csel =3D NDCB0_CSEL;
> +                       break;
> +               default:
> +                       return -EINVAL;
> +               }
> +
> +               /* Retrieve RB id */
> +               if (pdata || nfc->caps->legacy_of_bindings) {
> +                       /* Legacy bindings always use RB #0 */
> +                       rb =3D 0;
> +               } else {
> +                       ret =3D of_property_read_u32_index(np, "marvell,r=
b", i,
> +                                                        &rb);
> +                       if (ret) {
> +                               dev_err(dev,
> +                                       "could not retrieve RB property: =
%d\n",
> +                                       ret);
> +                               return ret;
> +                       }
> +               }
> +
> +               if (rb >=3D nfc->caps->max_rb_nb) {
> +                       dev_err(dev, "invalid reg value: %u (max RB =3D %=
d)\n",
> +                               rb, nfc->caps->max_rb_nb);
> +                       return -EINVAL;
> +               }
> +
> +               marvell_nand->sels[i].rb =3D rb;
> +       }
> +
> +       chip =3D &marvell_nand->chip;
> +       chip->controller =3D &nfc->controller;
> +       nand_set_flash_node(chip, np);
> +
> +       chip->exec_op =3D marvell_nfc_exec_op;
> +       chip->select_chip =3D marvell_nfc_select_chip;
> +       if (nfc->caps->is_nfcv2 &&
> +           !of_property_read_bool(np, "marvell,nand-keep-config"))
> +               chip->setup_data_interface =3D marvell_nfc_setup_data_int=
erface;
> +
> +       mtd =3D nand_to_mtd(chip);
> +       mtd->dev.parent =3D dev;
> +
> +       /*
> +        * Default to HW ECC engine mode. If the nand-ecc-mode property i=
s given
> +        * in the DT node, this entry will be overwritten in nand_scan_id=
ent().
> +        */
> +       chip->ecc.mode =3D NAND_ECC_HW;
> +
> +       ret =3D nand_scan_ident(mtd, marvell_nand->nsels, NULL);
> +       if (ret) {
> +               dev_err(dev, "could not identify the nand chip\n");
> +               return ret;
> +       }
> +
> +       if (pdata && pdata->flash_bbt)
> +               chip->bbt_options |=3D NAND_BBT_USE_FLASH;
> +
> +       if (chip->bbt_options & NAND_BBT_USE_FLASH) {
> +               /*
> +                * We'll use a bad block table stored in-flash and don't
> +                * allow writing the bad block marker to the flash.
> +                */
> +               chip->bbt_options |=3D NAND_BBT_NO_OOB_BBM;
> +               chip->bbt_td =3D &bbt_main_descr;
> +               chip->bbt_md =3D &bbt_mirror_descr;
> +       }
> +
> +       /*
> +        * With RA_START bit set in NDCR, columns takes two address cycle=
s. This
> +        * means addressing a chip with more than 256 pages needs a fifth
> +        * address cycle. Addressing a chip using CS 2 or 3 should also n=
eeds
> +        * this additional cycle but due to insistance in the documentati=
on and
> +        * lack of hardware to test this situation, this case has been dr=
opped
> +        * and is not supported by this driver.
> +        */
> +       marvell_nand->addr_cyc =3D 4;
> +       if (chip->options & NAND_ROW_ADDR_3)
> +               marvell_nand->addr_cyc =3D 5;
> +
> +       if (pdata) {
> +               chip->ecc.size =3D pdata->ecc_step_size;
> +               chip->ecc.strength =3D pdata->ecc_strength;
> +       }
> +
> +       ret =3D marvell_nand_ecc_init(mtd, &chip->ecc);
> +       if (ret) {
> +               dev_err(dev, "ECC init failed: %d\n", ret);
> +               return ret;
> +       }
> +
> +       if (chip->ecc.mode =3D=3D NAND_ECC_HW) {
> +               /*
> +                * Subpage write not available with hardware ECC, prohibi=
t also
> +                * subpage read as in userspace subpage acces would still=
 be
> +                * allowed and subpage write, if used, would lead to nume=
rous
> +                * uncorrectable ECC errors.
> +                */
> +               chip->options |=3D NAND_NO_SUBPAGE_WRITE;
> +       }
> +
> +       if (pdata || nfc->caps->legacy_of_bindings) {
> +               /*
> +                * We keep the MTD name unchanged to avoid breaking platf=
orms
> +                * where the MTD cmdline parser is used and the bootloade=
r
> +                * has not been updated to use the new naming scheme.
> +                */
> +               mtd->name =3D "pxa3xx_nand-0";
> +       } else if (!mtd->name) {
> +               /*
> +                * If the new bindings are used and the bootloader has no=
t been
> +                * updated to pass a new mtdparts parameter on the cmdlin=
e, you
> +                * should define the following property in your NAND node=
, ie:
> +                *
> +                *      label =3D "main-storage";
> +                *
> +                * This way, mtd->name will be set by the core when
> +                * nand_set_flash_node() is called.
> +                */
> +               mtd->name =3D devm_kasprintf(nfc->dev, GFP_KERNEL,
> +                                          "%s:nand.%d", dev_name(nfc->de=
v),
> +                                          marvell_nand->sels[0].cs);
> +               if (!mtd->name) {
> +                       dev_err(nfc->dev, "Failed to allocate mtd->name\n=
");
> +                       return -ENOMEM;
> +               }
> +       }
> +
> +       ret =3D nand_scan_tail(mtd);
> +       if (ret) {
> +               dev_err(dev, "nand_scan_tail failed: %d\n", ret);
> +               return ret;
> +       }
> +
> +       if (pdata)
> +               /* Legacy bindings support only one chip */
> +               ret =3D mtd_device_register(mtd, pdata->parts[0],
> +                                         pdata->nr_parts[0]);
> +       else
> +               ret =3D mtd_device_register(mtd, NULL, 0);
> +       if (ret) {
> +               dev_err(dev, "failed to register mtd device: %d\n", ret);
> +               nand_release(mtd);
> +               return ret;
> +       }
> +
> +       list_add_tail(&marvell_nand->node, &nfc->chips);
> +
> +       return 0;
> +}
> +
> +static int marvell_nand_chips_init(struct device *dev, struct marvell_nf=
c *nfc)
> +{
> +       struct device_node *np =3D dev->of_node;
> +       struct device_node *nand_np;
> +       int max_cs =3D nfc->caps->max_cs_nb;
> +       int nchips;
> +       int ret;
> +
> +       if (!np)
> +               nchips =3D 1;
> +       else
> +               nchips =3D of_get_child_count(np);
> +
> +       if (nchips > max_cs) {
> +               dev_err(dev, "too many NAND chips: %d (max =3D %d CS)\n",=
 nchips,
> +                       max_cs);
> +               return -EINVAL;
> +       }
> +
> +       /*
> +        * Legacy bindings do not use child nodes to exhibit NAND chip
> +        * properties and layout. Instead, NAND properties are mixed with=
 the
> +        * controller's and a single subnode presents the memory layout.
> +        */
> +       if (nfc->caps->legacy_of_bindings) {
> +               ret =3D marvell_nand_chip_init(dev, nfc, np);
> +               return ret;
> +       }
> +
> +       for_each_child_of_node(np, nand_np) {
> +               ret =3D marvell_nand_chip_init(dev, nfc, nand_np);
> +               if (ret) {
> +                       of_node_put(nand_np);
> +                       return ret;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static void marvell_nand_chips_cleanup(struct marvell_nfc *nfc)
> +{
> +       struct marvell_nand_chip *entry, *temp;
> +
> +       list_for_each_entry_safe(entry, temp, &nfc->chips, node) {
> +               nand_release(nand_to_mtd(&entry->chip));
> +               list_del(&entry->node);
> +       }
> +}
> +
> +static int marvell_nfc_init_dma(struct marvell_nfc *nfc)
> +{
> +       struct platform_device *pdev =3D container_of(nfc->dev,
> +                                                   struct platform_devic=
e,
> +                                                   dev);
> +       struct dma_slave_config config =3D {};
> +       struct resource *r;
> +       dma_cap_mask_t mask;
> +       struct pxad_param param;
> +       int ret;
> +
> +       if (!IS_ENABLED(CONFIG_PXA_DMA)) {
> +               dev_warn(nfc->dev,
> +                        "DMA not enabled in configuration\n");
> +               return -ENOTSUPP;
> +       }
> +
> +       ret =3D dma_set_mask_and_coherent(nfc->dev, DMA_BIT_MASK(32));
> +       if (ret)
> +               return ret;
> +
> +       r =3D platform_get_resource(pdev, IORESOURCE_DMA, 0);
> +       if (!r) {
> +               dev_err(nfc->dev, "No resource defined for data DMA\n");
> +               return -ENXIO;
> +       }
> +
> +       param.drcmr =3D r->start;
> +       param.prio =3D PXAD_PRIO_LOWEST;
> +       dma_cap_zero(mask);
> +       dma_cap_set(DMA_SLAVE, mask);
> +       nfc->dma_chan =3D
> +               dma_request_slave_channel_compat(mask, pxad_filter_fn,
> +                                                &param, nfc->dev,
> +                                                "data");
> +       if (!nfc->dma_chan) {
> +               dev_err(nfc->dev,
> +                       "Unable to request data DMA channel\n");
> +               return -ENODEV;
> +       }
> +
> +       r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!r)
> +               return -ENXIO;
> +
> +       config.src_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> +       config.dst_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> +       config.src_addr =3D r->start + NDDB;
> +       config.dst_addr =3D r->start + NDDB;
> +       config.src_maxburst =3D 32;
> +       config.dst_maxburst =3D 32;
> +       ret =3D dmaengine_slave_config(nfc->dma_chan, &config);
> +       if (ret < 0) {
> +               dev_err(nfc->dev, "Failed to configure DMA channel\n");
> +               return ret;
> +       }
> +
> +       /*
> +        * DMA must act on length multiple of 32 and this length may be
> +        * bigger than the destination buffer. Use this buffer instead
> +        * for DMA transfers and then copy the desired amount of data to
> +        * the provided buffer.
> +        */
> +       nfc->dma_buf =3D kmalloc(MAX_CHUNK_SIZE, GFP_DMA);
> +       if (!nfc->dma_buf)
> +               return -ENOMEM;
> +
> +       nfc->use_dma =3D true;
> +
> +       return 0;
> +}
> +
> +static int marvell_nfc_init(struct marvell_nfc *nfc)
> +{
> +       struct device_node *np =3D nfc->dev->of_node;
> +
> +       /*
> +        * Some SoCs like A7k/A8k need to enable manually the NAND
> +        * controller, gated clocks and reset bits to avoid being bootloa=
der
> +        * dependent. This is done through the use of the System Function=
s
> +        * registers.
> +        */
> +       if (nfc->caps->need_system_controller) {
> +               struct regmap *sysctrl_base =3D syscon_regmap_lookup_by_p=
handle(
> +                       np, "marvell,system-controller");
> +               u32 reg;
> +
> +               if (IS_ERR(sysctrl_base))
> +                       return PTR_ERR(sysctrl_base);
> +
> +               reg =3D GENCONF_SOC_DEVICE_MUX_NFC_EN |
> +                       GENCONF_SOC_DEVICE_MUX_ECC_CLK_RST |
> +                       GENCONF_SOC_DEVICE_MUX_ECC_CORE_RST |
> +                       GENCONF_SOC_DEVICE_MUX_NFC_INT_EN;
> +               regmap_write(sysctrl_base, GENCONF_SOC_DEVICE_MUX, reg);
> +
> +               regmap_read(sysctrl_base, GENCONF_CLK_GATING_CTRL, &reg);
> +               reg |=3D GENCONF_CLK_GATING_CTRL_ND_GATE;
> +               regmap_write(sysctrl_base, GENCONF_CLK_GATING_CTRL, reg);
> +
> +               regmap_read(sysctrl_base, GENCONF_ND_CLK_CTRL, &reg);
> +               reg |=3D GENCONF_ND_CLK_CTRL_EN;
> +               regmap_write(sysctrl_base, GENCONF_ND_CLK_CTRL, reg);
> +       }
> +
> +       /* Configure the DMA if appropriate */
> +       if (!nfc->caps->is_nfcv2)
> +               marvell_nfc_init_dma(nfc);
> +
> +       /*
> +        * ECC operations and interruptions are only enabled when specifi=
cally
> +        * needed. ECC shall not be activated in the early stages (fails =
probe).
> +        * Arbiter flag, even if marked as "reserved", must be set (empir=
ical).
> +        */
> +       writel_relaxed(NDCR_RA_START | NDCR_ALL_INT | NDCR_ND_ARB_EN |
> +                      (nfc->caps->is_nfcv2 ?
> +                       0 : NDCR_RD_ID_CNT(NFCV1_READID_LEN)),
> +                      nfc->regs + NDCR);
> +       writel_relaxed(0xFFFFFFFF, nfc->regs + NDSR);
> +       writel_relaxed(0, nfc->regs + NDECCCTRL);
> +
> +       return 0;
> +}
> +
> +static int marvell_nfc_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct resource *r;
> +       struct marvell_nfc *nfc;
> +       int ret;
> +       int irq;
> +
> +       nfc =3D devm_kzalloc(&pdev->dev, sizeof(struct marvell_nfc),
> +                          GFP_KERNEL);
> +       if (!nfc)
> +               return -ENOMEM;
> +
> +       nfc->dev =3D dev;
> +       nand_hw_control_init(&nfc->controller);
> +       INIT_LIST_HEAD(&nfc->chips);
> +
> +       r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       nfc->regs =3D devm_ioremap_resource(dev, r);
> +       if (IS_ERR(nfc->regs))
> +               return PTR_ERR(nfc->regs);
> +
> +       irq =3D platform_get_irq(pdev, 0);
> +       if (irq < 0) {
> +               dev_err(dev, "failed to retrieve irq\n");
> +               return irq;
> +       }
> +
> +       nfc->ecc_clk =3D devm_clk_get(&pdev->dev, NULL);
> +       if (IS_ERR(nfc->ecc_clk))
> +               return PTR_ERR(nfc->ecc_clk);
> +
> +       ret =3D clk_prepare_enable(nfc->ecc_clk);
> +       if (ret)
> +               return ret;
> +
> +       marvell_nfc_disable_int(nfc, NDCR_ALL_INT);
> +       marvell_nfc_clear_int(nfc, NDCR_ALL_INT);
> +       ret =3D devm_request_irq(dev, irq, marvell_nfc_isr,
> +                              0, "marvell-nfc", nfc);
> +       if (ret)
> +               goto unprepare_clk;
> +
> +       /* Get NAND controller capabilities */
> +       if (pdev->id_entry)
> +               nfc->caps =3D (void *)pdev->id_entry->driver_data;
> +       else
> +               nfc->caps =3D of_device_get_match_data(&pdev->dev);
> +
> +       if (!nfc->caps) {
> +               dev_err(dev, "Could not retrieve NFC caps\n");
> +               ret =3D -EINVAL;
> +               goto unprepare_clk;
> +       }
> +
> +       /* Init the controller and then probe the chips */
> +       ret =3D marvell_nfc_init(nfc);
> +       if (ret)
> +               goto unprepare_clk;
> +
> +       platform_set_drvdata(pdev, nfc);
> +
> +       ret =3D marvell_nand_chips_init(dev, nfc);
> +       if (ret)
> +               goto unprepare_clk;
> +
> +       return 0;
> +
> +unprepare_clk:
> +       clk_disable_unprepare(nfc->ecc_clk);
> +
> +       return ret;
> +}
> +
> +static int marvell_nfc_remove(struct platform_device *pdev)
> +{
> +       struct marvell_nfc *nfc =3D platform_get_drvdata(pdev);
> +
> +       marvell_nand_chips_cleanup(nfc);
> +
> +       if (nfc->use_dma) {
> +               dmaengine_terminate_all(nfc->dma_chan);
> +               dma_release_channel(nfc->dma_chan);
> +       }
> +
> +       clk_disable_unprepare(nfc->ecc_clk);
> +
> +       return 0;
> +}
> +
> +static const struct marvell_nfc_caps marvell_armada_8k_nfc_caps =3D {
> +       .max_cs_nb =3D 4,
> +       .max_rb_nb =3D 2,
> +       .need_system_controller =3D true,
> +       .is_nfcv2 =3D true,
> +};
> +
> +static const struct marvell_nfc_caps marvell_armada370_nfc_caps =3D {
> +       .max_cs_nb =3D 4,
> +       .max_rb_nb =3D 2,
> +       .is_nfcv2 =3D true,
> +};
> +
> +static const struct marvell_nfc_caps marvell_pxa3xx_nfc_caps =3D {
> +       .max_cs_nb =3D 2,
> +       .max_rb_nb =3D 1,
> +       .use_dma =3D true,
> +};
> +
> +static const struct marvell_nfc_caps marvell_armada_8k_nfc_legacy_caps =
=3D {
> +       .max_cs_nb =3D 4,
> +       .max_rb_nb =3D 2,
> +       .need_system_controller =3D true,
> +       .legacy_of_bindings =3D true,
> +       .is_nfcv2 =3D true,
> +};
> +
> +static const struct marvell_nfc_caps marvell_armada370_nfc_legacy_caps =
=3D {
> +       .max_cs_nb =3D 4,
> +       .max_rb_nb =3D 2,
> +       .legacy_of_bindings =3D true,
> +};
> +
> +static const struct marvell_nfc_caps marvell_pxa3xx_nfc_legacy_caps =3D =
{
> +       .max_cs_nb =3D 2,
> +       .max_rb_nb =3D 1,
> +       .legacy_of_bindings =3D true,
> +};
> +
> +static const struct platform_device_id marvell_nfc_platform_ids[] =3D {
> +       {
> +               .name =3D "pxa3xx-nand",
> +               .driver_data =3D (kernel_ulong_t)&marvell_pxa3xx_nfc_lega=
cy_caps,
> +       },
> +       { /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(platform, marvell_nfc_platform_ids);
> +
> +static const struct of_device_id marvell_nfc_of_ids[] =3D {
> +       {
> +               .compatible =3D "marvell,armada-8k-nand-controller",
> +               .data =3D &marvell_armada_8k_nfc_caps,
> +       },
> +       {
> +               .compatible =3D "marvell,armada370-nand-controller",
> +               .data =3D &marvell_armada370_nfc_caps,
> +       },
> +       {
> +               .compatible =3D "marvell,pxa3xx-nand-controller",
> +               .data =3D &marvell_pxa3xx_nfc_caps,
> +       },
> +       /* Support for old/deprecated bindings: */
> +       {
> +               .compatible =3D "marvell,armada-8k-nand",
> +               .data =3D &marvell_armada_8k_nfc_legacy_caps,
> +       },
> +       {
> +               .compatible =3D "marvell,armada370-nand",
> +               .data =3D &marvell_armada370_nfc_legacy_caps,
> +       },
> +       {
> +               .compatible =3D "marvell,pxa3xx-nand",
> +               .data =3D &marvell_pxa3xx_nfc_legacy_caps,
> +       },
> +       { /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, marvell_nfc_of_ids);
> +
> +static struct platform_driver marvell_nfc_driver =3D {
> +       .driver =3D {
> +               .name           =3D "marvell-nfc",
> +               .of_match_table =3D marvell_nfc_of_ids,
> +       },
> +       .id_table =3D marvell_nfc_platform_ids,
> +       .probe =3D marvell_nfc_probe,
> +       .remove =3D marvell_nfc_remove,
> +};
> +module_platform_driver(marvell_nfc_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Marvell NAND controller driver");
> --
> 2.11.0
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
