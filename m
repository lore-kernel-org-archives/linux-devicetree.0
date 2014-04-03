From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH RFC 3/3] nand: pl353: Add driver for arm pl353 smc nand interface
Date: Thu, 3 Apr 2014 11:34:41 -0300
Message-ID: <CAAEAJfCxP_Adk5=Jdi6c4PrrQuj8p_tUJPv2tJyC96hXZMMD1w@mail.gmail.com>
References: <1395944467-26291-1-git-send-email-punnaia@xilinx.com>
	<04cb5d02-db4c-4a4c-ba3c-3a5958e42324@VA3EHSMHS036.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <04cb5d02-db4c-4a4c-ba3c-3a5958e42324-+Ck8Kgl/v09DUMyIFHz4objjLBE8jN/0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, Pekon Gupta <pekon-l0cyMroinI0@public.gmane.org>, jussi.kivilinna-X3B1VOXEql0@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ivan.khoronzhuk-l0cyMroinI0@public.gmane.org, joern-PCqxUs/MD9bYtjvyW6yDsg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, kalluripunnaiahchoudary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 27 March 2014 15:21, Punnaiah Choudary Kalluri
<punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> Add driver for arm pl353 static memory controller nand interface.
> This controller is used in xilinx zynq soc for interfacing the nand
> flash memory.
>
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/mtd/nand/Kconfig      |    8 +
>  drivers/mtd/nand/Makefile     |    1 +
>  drivers/mtd/nand/pl353_nand.c | 1122 +++++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 1131 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/mtd/nand/pl353_nand.c
>
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 90ff447..31c1d0c 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -510,4 +510,12 @@ config MTD_NAND_XWAY
>           Enables support for NAND Flash chips on Lantiq XWAY SoCs. N=
AND is attached
>           to the External Bus Unit (EBU).
>
> +config MTD_NAND_PL353
> +       tristate "ARM Pl353 NAND flash driver"
> +       depends on MTD_NAND && ARM
> +       select PL353_SMC
> +       help
> +         This enables access to the NAND flash device on PL353 SMC
> +         controller.
> +
>  endif # MTD_NAND
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index 542b568..a4c2679 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -49,5 +49,6 @@ obj-$(CONFIG_MTD_NAND_JZ4740)         +=3D jz4740_n=
and.o
>  obj-$(CONFIG_MTD_NAND_GPMI_NAND)       +=3D gpmi-nand/
>  obj-$(CONFIG_MTD_NAND_XWAY)            +=3D xway_nand.o
>  obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)   +=3D bcm47xxnflash/
> +obj-$(CONFIG_MTD_NAND_PL353)           +=3D pl353_nand.o
>
>  nand-objs :=3D nand_base.o nand_bbt.o
> diff --git a/drivers/mtd/nand/pl353_nand.c b/drivers/mtd/nand/pl353_n=
and.c
> new file mode 100644
> index 0000000..ee74545
> --- /dev/null
> +++ b/drivers/mtd/nand/pl353_nand.c
> @@ -0,0 +1,1122 @@
> +/*
> + * ARM PL353 NAND Flash Controller Driver
> + *
> + * Copyright (C) 2009 - 2014 Xilinx, Inc.
> + *
> + * This driver is based on plat_nand.c and mxc_nand.c drivers
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify it under
> + * the terms of the GNU General Public License version 2 as publishe=
d by the
> + * Free Software Foundation; either version 2 of the License, or (at=
 your
> + * option) any later version.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/ioport.h>
> +#include <linux/irq.h>
> +#include <linux/memory/pl353-smc.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/nand_ecc.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#define PL353_NAND_DRIVER_NAME "pl353-nand"
> +
> +/* NAND flash driver defines */
> +#define PL353_NAND_CMD_PHASE   1       /* End command valid in comma=
nd phase */
> +#define PL353_NAND_DATA_PHASE  2       /* End command valid in data =
phase */
> +#define PL353_NAND_ECC_SIZE    512     /* Size of data for ECC opera=
tion */
> +
> +/* Flash memory controller operating parameters */
> +
> +#define PL353_NAND_ECC_CONFIG  (BIT(4)  |      /* ECC read at end of=
 page */ \
> +                                (0 << 5))      /* No Jumping */
> +
> +/* AXI Address definitions */
> +#define START_CMD_SHIFT                3
> +#define END_CMD_SHIFT          11
> +#define END_CMD_VALID_SHIFT    20
> +#define ADDR_CYCLES_SHIFT      21
> +#define CLEAR_CS_SHIFT         21
> +#define ECC_LAST_SHIFT         10
> +#define COMMAND_PHASE          (0 << 19)
> +#define DATA_PHASE             BIT(19)
> +
> +#define PL353_NAND_ECC_LAST    BIT(ECC_LAST_SHIFT)     /* Set ECC_La=
st */
> +#define PL353_NAND_CLEAR_CS    BIT(CLEAR_CS_SHIFT)     /* Clear chip=
 select */
> +
> +#define ONDIE_ECC_FEATURE_ADDR 0x90
> +#define PL353_NAND_ECC_BUSY_TIMEOUT    (1 * HZ)
> +#define PL353_NAND_DEV_BUSY_TIMEOUT    (1 * HZ)
> +#define PL353_NAND_LAST_TRANSFER_LENGTH        4
> +
> +/* Inline function for the NAND controller register write */
> +static inline void pl353_nand_write32(void __iomem *addr, u32 val)
> +{
> +       writel_relaxed((val), (addr));
> +}
> +

Hm... you can just use writel_relaxed instead of this dummy helper.

> +/**
> + * struct pl353_nand_command_format - Defines NAND flash command for=
mat
> + * @start_cmd:         First cycle command (Start command)
> + * @end_cmd:           Second cycle command (Last command)
> + * @addr_cycles:       Number of address cycles required to send the=
 address
> + * @end_cmd_valid:     The second cycle command is valid for cmd or =
data phase
> + */
> +struct pl353_nand_command_format {
> +       int start_cmd;
> +       int end_cmd;
> +       u8 addr_cycles;
> +       u8 end_cmd_valid;
> +};
> +
> +/**
> + * struct pl353_nand_info - Defines the NAND flash driver instance
> + * @chip:              NAND chip information structure
> + * @mtd:               MTD information structure
> + * @parts:             Pointer to the mtd_partition structure
> + * @nand_base:         Virtual address of the NAND flash device
> + * @end_cmd_pending:   End command is pending
> + * @end_cmd:           End command
> + */
> +struct pl353_nand_info {
> +       struct nand_chip chip;
> +       struct mtd_info mtd;
> +       struct mtd_partition *parts;

I can't see this "parts" field being used anywhere. What am I missing?

> +       void __iomem *nand_base;
> +       unsigned long end_cmd_pending;
> +       unsigned long end_cmd;
> +};
> +
> +/*
> + * The NAND flash operations command format
> + */
> +static const struct pl353_nand_command_format pl353_nand_commands[] =
=3D {
> +       {NAND_CMD_READ0, NAND_CMD_READSTART, 5, PL353_NAND_CMD_PHASE}=
,
> +       {NAND_CMD_RNDOUT, NAND_CMD_RNDOUTSTART, 2, PL353_NAND_CMD_PHA=
SE},
> +       {NAND_CMD_READID, NAND_CMD_NONE, 1, NAND_CMD_NONE},
> +       {NAND_CMD_STATUS, NAND_CMD_NONE, 0, NAND_CMD_NONE},
> +       {NAND_CMD_SEQIN, NAND_CMD_PAGEPROG, 5, PL353_NAND_DATA_PHASE}=
,
> +       {NAND_CMD_RNDIN, NAND_CMD_NONE, 2, NAND_CMD_NONE},
> +       {NAND_CMD_ERASE1, NAND_CMD_ERASE2, 3, PL353_NAND_CMD_PHASE},
> +       {NAND_CMD_RESET, NAND_CMD_NONE, 0, NAND_CMD_NONE},
> +       {NAND_CMD_PARAM, NAND_CMD_NONE, 1, NAND_CMD_NONE},
> +       {NAND_CMD_GET_FEATURES, NAND_CMD_NONE, 1, NAND_CMD_NONE},
> +       {NAND_CMD_SET_FEATURES, NAND_CMD_NONE, 1, NAND_CMD_NONE},
> +       {NAND_CMD_NONE, NAND_CMD_NONE, 0, 0},
> +       /* Add all the flash commands supported by the flash device a=
nd Linux */
> +       /*
> +        * The cache program command is not supported by driver becau=
se driver
> +        * cant differentiate between page program and cached page pr=
ogram from
> +        * start command, these commands can be differentiated throug=
h end
> +        * command, which doesn't fit in to the driver design. The ca=
che program
> +        * command is not supported by NAND subsystem also, look at 1=
612 line
> +        * number (in nand_write_page function) of nand_base.c file.
> +        * {NAND_CMD_SEQIN, NAND_CMD_CACHEDPROG, 5, PL353_NAND_YES},
> +        */
> +};
> +
> +/* Define default oob placement schemes for large and small page dev=
ices */
> +static struct nand_ecclayout nand_oob_16 =3D {
> +       .eccbytes =3D 3,
> +       .eccpos =3D {0, 1, 2},
> +       .oobfree =3D {
> +               {.offset =3D 8,
> +                . length =3D 8} }
> +};
> +
> +static struct nand_ecclayout nand_oob_64 =3D {
> +       .eccbytes =3D 12,
> +       .eccpos =3D {
> +                  52, 53, 54, 55, 56, 57,
> +                  58, 59, 60, 61, 62, 63},
> +       .oobfree =3D {
> +               {.offset =3D 2,
> +                .length =3D 50} }
> +};
> +
> +static struct nand_ecclayout ondie_nand_oob_64 =3D {
> +       .eccbytes =3D 32,
> +
> +       .eccpos =3D {
> +               8, 9, 10, 11, 12, 13, 14, 15,
> +               24, 25, 26, 27, 28, 29, 30, 31,
> +               40, 41, 42, 43, 44, 45, 46, 47,
> +               56, 57, 58, 59, 60, 61, 62, 63
> +       },
> +
> +       .oobfree =3D {
> +               { .offset =3D 4, .length =3D 4 },
> +               { .offset =3D 20, .length =3D 4 },
> +               { .offset =3D 36, .length =3D 4 },
> +               { .offset =3D 52, .length =3D 4 }
> +       }
> +};
> +
> +/* Generic flash bbt decriptors */
> +static uint8_t bbt_pattern[] =3D { 'B', 'b', 't', '0' };
> +static uint8_t mirror_pattern[] =3D { '1', 't', 'b', 'B' };
> +
> +static struct nand_bbt_descr bbt_main_descr =3D {
> +       .options =3D NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_=
WRITE
> +               | NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP=
,
> +       .offs =3D 4,
> +       .len =3D 4,
> +       .veroffs =3D 20,
> +       .maxblocks =3D 4,
> +       .pattern =3D bbt_pattern
> +};
> +
> +static struct nand_bbt_descr bbt_mirror_descr =3D {
> +       .options =3D NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_=
WRITE
> +               | NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP=
,
> +       .offs =3D 4,
> +       .len =3D 4,
> +       .veroffs =3D 20,
> +       .maxblocks =3D 4,
> +       .pattern =3D mirror_pattern
> +};
> +
> +/**
> + * pl353_nand_calculate_hwecc - Calculate Hardware ECC
> + * @mtd:       Pointer to the mtd_info structure
> + * @data:      Pointer to the page data
> + * @ecc_code:  Pointer to the ECC buffer where ECC data needs to be =
stored
> + *
> + * This function retrieves the Hardware ECC data from the controller=
 and returns
> + * ECC data back to the MTD subsystem.
> + *
> + * Return:     0 on success or error value on failure
> + */
> +static int pl353_nand_calculate_hwecc(struct mtd_info *mtd,
> +                               const u8 *data, u8 *ecc_code)
> +{
> +       u32 ecc_value, ecc_status;
> +       u8 ecc_reg, ecc_byte;
> +       unsigned long timeout =3D jiffies + PL353_NAND_ECC_BUSY_TIMEO=
UT;
> +
> +       /* Wait till the ECC operation is complete or timeout */
> +       do {
> +               if (pl353_smc_ecc_is_busy())
> +                       cpu_relax();
> +               else
> +                       break;
> +       } while (!time_after_eq(jiffies, timeout));
> +
> +       if (time_after_eq(jiffies, timeout)) {
> +               pr_err("%s timed out\n", __func__);
> +               return -ETIMEDOUT;
> +       }
> +
> +       for (ecc_reg =3D 0; ecc_reg < 4; ecc_reg++) {
> +               /* Read ECC value for each block */
> +               ecc_value =3D pl353_smc_get_ecc_val(ecc_reg);
> +               ecc_status =3D (ecc_value >> 24) & 0xFF;
> +               /* ECC value valid */
> +               if (ecc_status & 0x40) {
> +                       for (ecc_byte =3D 0; ecc_byte < 3; ecc_byte++=
) {
> +                               /* Copy ECC bytes to MTD buffer */
> +                               *ecc_code =3D ecc_value & 0xFF;
> +                               ecc_value =3D ecc_value >> 8;
> +                               ecc_code++;
> +                       }
> +               } else {
> +                       pr_warn("%s status failed\n", __func__);
> +                       return -1;
> +               }
> +       }
> +       return 0;
> +}
> +
> +/**
> + * onehot - onehot function
> + * @value:     Value to check for onehot
> + *
> + * This function checks whether a value is onehot or not.
> + * onehot is if and only if onebit is set.
> + *
> + * Return:     1 if it is onehot else 0
> + */
> +static int onehot(unsigned short value)
> +{
> +       return (value & (value - 1)) =3D=3D 0;
> +}
> +
> +/**
> + * pl353_nand_correct_data - ECC correction function
> + * @mtd:       Pointer to the mtd_info structure
> + * @buf:       Pointer to the page data
> + * @read_ecc:  Pointer to the ECC value read from spare data area
> + * @calc_ecc:  Pointer to the calculated ECC value
> + *
> + * This function corrects the ECC single bit errors & detects 2-bit =
errors.
> + *
> + * Return:     0 if no ECC errors found
> + *             1 if single bit error found and corrected.
> + *             -1 if multiple ECC errors found.
> + */
> +static int pl353_nand_correct_data(struct mtd_info *mtd, unsigned ch=
ar *buf,
> +                               unsigned char *read_ecc,
> +                               unsigned char *calc_ecc)
> +{
> +       unsigned char bit_addr;
> +       unsigned int byte_addr;
> +       unsigned short ecc_odd, ecc_even, read_ecc_lower, read_ecc_up=
per;
> +       unsigned short calc_ecc_lower, calc_ecc_upper;
> +
> +       read_ecc_lower =3D (read_ecc[0] | (read_ecc[1] << 8)) & 0xfff=
;
> +       read_ecc_upper =3D ((read_ecc[1] >> 4) | (read_ecc[2] << 4)) =
& 0xfff;
> +
> +       calc_ecc_lower =3D (calc_ecc[0] | (calc_ecc[1] << 8)) & 0xfff=
;
> +       calc_ecc_upper =3D ((calc_ecc[1] >> 4) | (calc_ecc[2] << 4)) =
& 0xfff;
> +
> +       ecc_odd =3D read_ecc_lower ^ calc_ecc_lower;
> +       ecc_even =3D read_ecc_upper ^ calc_ecc_upper;
> +
> +       if ((ecc_odd =3D=3D 0) && (ecc_even =3D=3D 0))
> +               return 0;       /* no error */
> +
> +       if (ecc_odd =3D=3D (~ecc_even & 0xfff)) {
> +               /* bits [11:3] of error code is byte offset */
> +               byte_addr =3D (ecc_odd >> 3) & 0x1ff;
> +               /* bits [2:0] of error code is bit offset */
> +               bit_addr =3D ecc_odd & 0x7;
> +               /* Toggling error bit */
> +               buf[byte_addr] ^=3D (1 << bit_addr);
> +               return 1;
> +       }
> +
> +       if (onehot(ecc_odd | ecc_even) =3D=3D 1)
> +               return 1; /* one error in parity */
> +
> +       return -1; /* Uncorrectable error */
> +}
> +
> +/**
> + * pl353_nand_read_oob - [REPLACABLE] the most common OOB data read =
function
> + * @mtd:       Pointer to the mtd info structure
> + * @chip:      Pointer to the NAND chip info structure
> + * @page:      Page number to read
> + *
> + * Return:     Always return zero
> + */
> +static int pl353_nand_read_oob(struct mtd_info *mtd, struct nand_chi=
p *chip,
> +                           int page)
> +{
> +       unsigned long data_phase_addr;
> +       uint8_t *p;
> +
> +       chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
> +
> +       p =3D chip->oob_poi;
> +       chip->read_buf(mtd, p,
> +                       (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENG=
TH));
> +       p +=3D (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +       data_phase_addr =3D (unsigned long __force)chip->IO_ADDR_R;
> +       data_phase_addr |=3D PL353_NAND_CLEAR_CS;
> +       chip->IO_ADDR_R =3D (void __iomem * __force)data_phase_addr;
> +       chip->read_buf(mtd, p, PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +       return 0;
> +}
> +
> +/**
> + * pl353_nand_write_oob - [REPLACABLE] the most common OOB data writ=
e function
> + * @mtd:       Pointer to the mtd info structure
> + * @chip:      Pointer to the NAND chip info structure
> + * @page:      Page number to write
> + *
> + * Return:     Zero on success and EIO on failure
> + */
> +static int pl353_nand_write_oob(struct mtd_info *mtd, struct nand_ch=
ip *chip,
> +                            int page)
> +{
> +       int status =3D 0;
> +       const uint8_t *buf =3D chip->oob_poi;
> +       unsigned long data_phase_addr;
> +
> +       chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize, page);
> +
> +       chip->write_buf(mtd, buf,
> +                       (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENG=
TH));
> +       buf +=3D (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +       data_phase_addr =3D (unsigned long __force)chip->IO_ADDR_W;
> +       data_phase_addr |=3D PL353_NAND_CLEAR_CS;
> +       data_phase_addr |=3D (1 << END_CMD_VALID_SHIFT);
> +       chip->IO_ADDR_W =3D (void __iomem * __force)data_phase_addr;
> +       chip->write_buf(mtd, buf, PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +       /* Send command to program the OOB data */
> +       chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> +       status =3D chip->waitfunc(mtd, chip);
> +
> +       return status & NAND_STATUS_FAIL ? -EIO : 0;
> +}
> +
> +/**
> + * pl353_nand_read_page_raw - [Intern] read raw page data without ec=
c
> + * @mtd:               Pointer to the mtd info structure
> + * @chip:              Pointer to the NAND chip info structure
> + * @buf:               Pointer to the data buffer
> + * @oob_required:      Caller requires OOB data read to chip->oob_po=
i
> + * @page:              Page number to read
> + *
> + * Return:     Always return zero
> + */
> +static int pl353_nand_read_page_raw(struct mtd_info *mtd,
> +                               struct nand_chip *chip,
> +                               uint8_t *buf, int oob_required, int p=
age)
> +{
> +       unsigned long data_phase_addr;
> +       uint8_t *p;
> +
> +       chip->read_buf(mtd, buf, mtd->writesize);
> +
> +       p =3D chip->oob_poi;
> +       chip->read_buf(mtd, p,
> +                       (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENG=
TH));
> +       p +=3D (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +       data_phase_addr =3D (unsigned long __force)chip->IO_ADDR_R;
> +       data_phase_addr |=3D PL353_NAND_CLEAR_CS;
> +       chip->IO_ADDR_R =3D (void __iomem * __force)data_phase_addr;
> +
> +       chip->read_buf(mtd, p, PL353_NAND_LAST_TRANSFER_LENGTH);
> +       return 0;
> +}
> +
> +/**
> + * pl353_nand_write_page_raw - [Intern] raw page write function
> + * @mtd:               Pointer to the mtd info structure
> + * @chip:              Pointer to the NAND chip info structure
> + * @buf:               Pointer to the data buffer
> + * @oob_required:      Caller requires OOB data read to chip->oob_po=
i
> + *
> + * Return:     Always return zero
> + */
> +static int pl353_nand_write_page_raw(struct mtd_info *mtd,
> +                                   struct nand_chip *chip,
> +                                   const uint8_t *buf, int oob_requi=
red)
> +{
> +       unsigned long data_phase_addr;
> +       uint8_t *p;
> +
> +       chip->write_buf(mtd, buf, mtd->writesize);
> +
> +       p =3D chip->oob_poi;
> +       chip->write_buf(mtd, p,
> +                       (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENG=
TH));
> +       p +=3D (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +       data_phase_addr =3D (unsigned long __force)chip->IO_ADDR_W;
> +       data_phase_addr |=3D PL353_NAND_CLEAR_CS;
> +       data_phase_addr |=3D (1 << END_CMD_VALID_SHIFT);
> +       chip->IO_ADDR_W =3D (void __iomem * __force)data_phase_addr;
> +
> +       chip->write_buf(mtd, p, PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +       return 0;
> +}
> +
> +/**
> + * nand_write_page_hwecc - Hardware ECC based page write function
> + * @mtd:               Pointer to the mtd info structure
> + * @chip:              Pointer to the NAND chip info structure
> + * @buf:               Pointer to the data buffer
> + * @oob_required:      Caller requires OOB data read to chip->oob_po=
i
> + *
> + * This functions writes data and hardware generated ECC values in t=
o the page.
> + *
> + * Return:     Always return zero
> + */
> +static int pl353_nand_write_page_hwecc(struct mtd_info *mtd,
> +                                   struct nand_chip *chip, const uin=
t8_t *buf,
> +                                   int oob_required)
> +{
> +       int i, eccsize =3D chip->ecc.size;
> +       int eccsteps =3D chip->ecc.steps;
> +       uint8_t *ecc_calc =3D chip->buffers->ecccalc;
> +       const uint8_t *p =3D buf;
> +       uint32_t *eccpos =3D chip->ecc.layout->eccpos;
> +       unsigned long data_phase_addr;
> +       uint8_t *oob_ptr;
> +
> +       for ( ; (eccsteps - 1); eccsteps--) {
> +               chip->write_buf(mtd, p, eccsize);
> +               p +=3D eccsize;
> +       }
> +       chip->write_buf(mtd, p, (eccsize - PL353_NAND_LAST_TRANSFER_L=
ENGTH));
> +       p +=3D (eccsize - PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +       /* Set ECC Last bit to 1 */
> +       data_phase_addr =3D (unsigned long __force)chip->IO_ADDR_W;
> +       data_phase_addr |=3D PL353_NAND_ECC_LAST;
> +       chip->IO_ADDR_W =3D (void __iomem * __force)data_phase_addr;
> +       chip->write_buf(mtd, p, PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +       /* Wait for ECC to be calculated and read the error values */
> +       p =3D buf;
> +       chip->ecc.calculate(mtd, p, &ecc_calc[0]);
> +
> +       for (i =3D 0; i < chip->ecc.total; i++)
> +               chip->oob_poi[eccpos[i]] =3D ~(ecc_calc[i]);
> +
> +       /* Clear ECC last bit */
> +       data_phase_addr =3D (unsigned long __force)chip->IO_ADDR_W;
> +       data_phase_addr &=3D ~PL353_NAND_ECC_LAST;
> +       chip->IO_ADDR_W =3D (void __iomem * __force)data_phase_addr;
> +
> +       /* Write the spare area with ECC bytes */
> +       oob_ptr =3D chip->oob_poi;
> +       chip->write_buf(mtd, oob_ptr,
> +                       (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENG=
TH));
> +
> +       data_phase_addr =3D (unsigned long __force)chip->IO_ADDR_W;
> +       data_phase_addr |=3D PL353_NAND_CLEAR_CS;
> +       data_phase_addr |=3D (1 << END_CMD_VALID_SHIFT);
> +       chip->IO_ADDR_W =3D (void __iomem * __force)data_phase_addr;
> +       oob_ptr +=3D (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH)=
;
> +       chip->write_buf(mtd, oob_ptr, PL353_NAND_LAST_TRANSFER_LENGTH=
);
> +
> +       return 0;
> +}
> +
> +/**
> + * pl353_nand_write_page_swecc - [REPLACABLE] software ecc based pag=
e write function
> + * @mtd:               Pointer to the mtd info structure
> + * @chip:              Pointer to the NAND chip info structure
> + * @buf:               Pointer to the data buffer
> + * @oob_required:      Caller requires OOB data read to chip->oob_po=
i
> + *
> + * Return:     Always return zero
> + */
> +static int pl353_nand_write_page_swecc(struct mtd_info *mtd,
> +                                   struct nand_chip *chip, const uin=
t8_t *buf,
> +                                   int oob_required)
> +{
> +       int i, eccsize =3D chip->ecc.size;
> +       int eccbytes =3D chip->ecc.bytes;
> +       int eccsteps =3D chip->ecc.steps;
> +       uint8_t *ecc_calc =3D chip->buffers->ecccalc;
> +       const uint8_t *p =3D buf;
> +       uint32_t *eccpos =3D chip->ecc.layout->eccpos;
> +
> +       /* Software ecc calculation */
> +       for (i =3D 0; eccsteps; eccsteps--, i +=3D eccbytes, p +=3D e=
ccsize)
> +               chip->ecc.calculate(mtd, p, &ecc_calc[i]);
> +
> +       for (i =3D 0; i < chip->ecc.total; i++)
> +               chip->oob_poi[eccpos[i]] =3D ecc_calc[i];
> +
> +       chip->ecc.write_page_raw(mtd, chip, buf, 1);
> +
> +       return 0;
> +}
> +
> +/**
> + * pl353_nand_read_page_hwecc - Hardware ECC based page read functio=
n
> + * @mtd:               Pointer to the mtd info structure
> + * @chip:              Pointer to the NAND chip info structure
> + * @buf:               Pointer to the buffer to store read data
> + * @oob_required:      Caller requires OOB data read to chip->oob_po=
i
> + * @page:              Page number to read
> + *
> + * This functions reads data and checks the data integrity by compar=
ing hardware
> + * generated ECC values and read ECC values from spare area.
> + *
> + * Return:     0 always and updates ECC operation status in to MTD s=
tructure
> + */
> +static int pl353_nand_read_page_hwecc(struct mtd_info *mtd,
> +                                    struct nand_chip *chip,
> +                                    uint8_t *buf, int oob_required, =
int page)
> +{
> +       int i, stat, eccsize =3D chip->ecc.size;
> +       int eccbytes =3D chip->ecc.bytes;
> +       int eccsteps =3D chip->ecc.steps;
> +       uint8_t *p =3D buf;
> +       uint8_t *ecc_calc =3D chip->buffers->ecccalc;
> +       uint8_t *ecc_code =3D chip->buffers->ecccode;
> +       uint32_t *eccpos =3D chip->ecc.layout->eccpos;
> +       unsigned long data_phase_addr;
> +       uint8_t *oob_ptr;
> +
> +       for ( ; (eccsteps - 1); eccsteps--) {
> +               chip->read_buf(mtd, p, eccsize);
> +               p +=3D eccsize;
> +       }
> +       chip->read_buf(mtd, p, (eccsize - PL353_NAND_LAST_TRANSFER_LE=
NGTH));
> +       p +=3D (eccsize - PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +       /* Set ECC Last bit to 1 */
> +       data_phase_addr =3D (unsigned long __force)chip->IO_ADDR_R;
> +       data_phase_addr |=3D PL353_NAND_ECC_LAST;
> +       chip->IO_ADDR_R =3D (void __iomem * __force)data_phase_addr;
> +       chip->read_buf(mtd, p, PL353_NAND_LAST_TRANSFER_LENGTH);
> +
> +       /* Read the calculated ECC value */
> +       p =3D buf;
> +       chip->ecc.calculate(mtd, p, &ecc_calc[0]);
> +
> +       /* Clear ECC last bit */
> +       data_phase_addr =3D (unsigned long __force)chip->IO_ADDR_R;
> +       data_phase_addr &=3D ~PL353_NAND_ECC_LAST;
> +       chip->IO_ADDR_R =3D (void __iomem * __force)data_phase_addr;
> +
> +       /* Read the stored ECC value */
> +       oob_ptr =3D chip->oob_poi;
> +       chip->read_buf(mtd, oob_ptr,
> +                       (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENG=
TH));
> +
> +       /* de-assert chip select */
> +       data_phase_addr =3D (unsigned long __force)chip->IO_ADDR_R;
> +       data_phase_addr |=3D PL353_NAND_CLEAR_CS;
> +       chip->IO_ADDR_R =3D (void __iomem * __force)data_phase_addr;
> +
> +       oob_ptr +=3D (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH)=
;
> +       chip->read_buf(mtd, oob_ptr, PL353_NAND_LAST_TRANSFER_LENGTH)=
;
> +
> +       for (i =3D 0; i < chip->ecc.total; i++)
> +               ecc_code[i] =3D ~(chip->oob_poi[eccpos[i]]);
> +
> +       eccsteps =3D chip->ecc.steps;
> +       p =3D buf;
> +
> +       /* Check ECC error for all blocks and correct if it is correc=
table */
> +       for (i =3D 0 ; eccsteps; eccsteps--, i +=3D eccbytes, p +=3D =
eccsize) {
> +               stat =3D chip->ecc.correct(mtd, p, &ecc_code[i], &ecc=
_calc[i]);
> +               if (stat < 0)
> +                       mtd->ecc_stats.failed++;
> +               else
> +                       mtd->ecc_stats.corrected +=3D stat;
> +       }
> +       return 0;
> +}
> +
> +/**
> + * pl353_nand_read_page_swecc - [REPLACABLE] software ecc based page=
 read function
> + * @mtd:               Pointer to the mtd info structure
> + * @chip:              Pointer to the NAND chip info structure
> + * @buf:               Pointer to the buffer to store read data
> + * @oob_required:      Caller requires OOB data read to chip->oob_po=
i
> + * @page:              Page number to read
> + *
> + * Return:     Always return zero
> + */
> +static int pl353_nand_read_page_swecc(struct mtd_info *mtd,
> +                                    struct nand_chip *chip,
> +                                    uint8_t *buf,  int oob_required,=
 int page)
> +{
> +       int i, eccsize =3D chip->ecc.size;
> +       int eccbytes =3D chip->ecc.bytes;
> +       int eccsteps =3D chip->ecc.steps;
> +       uint8_t *p =3D buf;
> +       uint8_t *ecc_calc =3D chip->buffers->ecccalc;
> +       uint8_t *ecc_code =3D chip->buffers->ecccode;
> +       uint32_t *eccpos =3D chip->ecc.layout->eccpos;
> +
> +       chip->ecc.read_page_raw(mtd, chip, buf, page, 1);
> +
> +       for (i =3D 0; eccsteps; eccsteps--, i +=3D eccbytes, p +=3D e=
ccsize)
> +               chip->ecc.calculate(mtd, p, &ecc_calc[i]);
> +
> +       for (i =3D 0; i < chip->ecc.total; i++)
> +               ecc_code[i] =3D chip->oob_poi[eccpos[i]];
> +
> +       eccsteps =3D chip->ecc.steps;
> +       p =3D buf;
> +
> +       for (i =3D 0 ; eccsteps; eccsteps--, i +=3D eccbytes, p +=3D =
eccsize) {
> +               int stat;
> +
> +               stat =3D chip->ecc.correct(mtd, p, &ecc_code[i], &ecc=
_calc[i]);
> +               if (stat < 0)
> +                       mtd->ecc_stats.failed++;
> +               else
> +                       mtd->ecc_stats.corrected +=3D stat;
> +       }
> +       return 0;
> +}
> +
> +/**
> + * pl353_nand_select_chip - Select the flash device
> + * @mtd:       Pointer to the mtd info structure
> + * @chip:      Pointer to the NAND chip info structure
> + *
> + * This function is empty as the NAND controller handles chip select=
 line
> + * internally based on the chip address passed in command and data p=
hase.
> + */
> +static void pl353_nand_select_chip(struct mtd_info *mtd, int chip)
> +{
> +       return;
> +}
> +
> +/**
> + * pl353_nand_cmd_function - Send command to NAND device
> + * @mtd:       Pointer to the mtd_info structure
> + * @command:   The command to be sent to the flash device
> + * @column:    The column address for this command, -1 if none
> + * @page_addr: The page address for this command, -1 if none
> + */
> +static void pl353_nand_cmd_function(struct mtd_info *mtd, unsigned i=
nt command,
> +                                int column, int page_addr)
> +{
> +       struct nand_chip *chip =3D mtd->priv;
> +       const struct pl353_nand_command_format *curr_cmd =3D NULL;
> +       struct pl353_nand_info *xnand =3D
> +               container_of(mtd, struct pl353_nand_info, mtd);
> +       void __iomem *cmd_addr;
> +       unsigned long cmd_data =3D 0, end_cmd_valid =3D 0;
> +       unsigned long cmd_phase_addr, data_phase_addr, end_cmd, i;
> +       unsigned long timeout =3D jiffies + PL353_NAND_DEV_BUSY_TIMEO=
UT;
> +
> +       if (xnand->end_cmd_pending) {
> +               /*
> +                * Check for end command if this command request is s=
ame as the
> +                * pending command then return
> +                */
> +               if (xnand->end_cmd =3D=3D command) {
> +                       xnand->end_cmd =3D 0;
> +                       xnand->end_cmd_pending =3D 0;
> +                       return;
> +               }
> +       }
> +
> +       /* Emulate NAND_CMD_READOOB for large page device */
> +       if ((mtd->writesize > PL353_NAND_ECC_SIZE) &&
> +           (command =3D=3D NAND_CMD_READOOB)) {
> +               column +=3D mtd->writesize;
> +               command =3D NAND_CMD_READ0;
> +       }
> +
> +       /* Get the command format */
> +       for (i =3D 0; (pl353_nand_commands[i].start_cmd !=3D NAND_CMD=
_NONE ||
> +                    pl353_nand_commands[i].end_cmd !=3D NAND_CMD_NON=
E); i++)
> +               if (command =3D=3D pl353_nand_commands[i].start_cmd)
> +                       curr_cmd =3D &pl353_nand_commands[i];
> +
> +       if (curr_cmd =3D=3D NULL)
> +               return;
> +
> +       /* Clear interrupt */
> +       pl353_smc_clr_nand_int();
> +
> +       /* Get the command phase address */
> +       if (curr_cmd->end_cmd_valid =3D=3D PL353_NAND_CMD_PHASE)
> +               end_cmd_valid =3D 1;
> +
> +       if (curr_cmd->end_cmd =3D=3D NAND_CMD_NONE)
> +               end_cmd =3D 0x0;
> +       else
> +               end_cmd =3D curr_cmd->end_cmd;
> +
> +       cmd_phase_addr =3D (unsigned long __force)xnand->nand_base   =
     |
> +                        (curr_cmd->addr_cycles << ADDR_CYCLES_SHIFT)=
    |
> +                        (end_cmd_valid << END_CMD_VALID_SHIFT)      =
    |
> +                        (COMMAND_PHASE)                             =
    |
> +                        (end_cmd << END_CMD_SHIFT)                  =
    |
> +                        (curr_cmd->start_cmd << START_CMD_SHIFT);
> +
> +       cmd_addr =3D (void __iomem * __force)cmd_phase_addr;
> +
> +       /* Get the data phase address */
> +       end_cmd_valid =3D 0;
> +
> +       data_phase_addr =3D (unsigned long __force)xnand->nand_base  =
     |
> +                         (0x0 << CLEAR_CS_SHIFT)                    =
     |
> +                         (end_cmd_valid << END_CMD_VALID_SHIFT)     =
     |
> +                         (DATA_PHASE)                               =
     |
> +                         (end_cmd << END_CMD_SHIFT)                 =
     |
> +                         (0x0 << ECC_LAST_SHIFT);
> +
> +       chip->IO_ADDR_R =3D (void __iomem * __force)data_phase_addr;
> +       chip->IO_ADDR_W =3D chip->IO_ADDR_R;
> +
> +       /* Command phase AXI write */
> +       /* Read & Write */
> +       if (column !=3D -1 && page_addr !=3D -1) {
> +               /* Adjust columns for 16 bit bus width */
> +               if (chip->options & NAND_BUSWIDTH_16)
> +                       column >>=3D 1;
> +               cmd_data =3D column;
> +               if (mtd->writesize > PL353_NAND_ECC_SIZE) {
> +                       cmd_data |=3D page_addr << 16;
> +                       /* Another address cycle for devices > 128MiB=
 */
> +                       if (chip->chipsize > (128 << 20)) {
> +                               pl353_nand_write32(cmd_addr, cmd_data=
);
> +                               cmd_data =3D (page_addr >> 16);
> +                       }
> +               } else {
> +                       cmd_data |=3D page_addr << 8;
> +               }
> +       } else if (page_addr !=3D -1) {
> +               /* Erase */
> +               cmd_data =3D page_addr;
> +       } else if (column !=3D -1) {
> +               /*
> +                * Change read/write column, read id etc
> +                * Adjust columns for 16 bit bus width
> +                */
> +               if ((chip->options & NAND_BUSWIDTH_16) &&
> +                       ((command =3D=3D NAND_CMD_READ0) ||
> +                       (command =3D=3D NAND_CMD_SEQIN) ||
> +                       (command =3D=3D NAND_CMD_RNDOUT) ||
> +                       (command =3D=3D NAND_CMD_RNDIN)))
> +                               column >>=3D 1;
> +               cmd_data =3D column;
> +       }
> +
> +       pl353_nand_write32(cmd_addr, cmd_data);
> +
> +       if (curr_cmd->end_cmd_valid) {
> +               xnand->end_cmd =3D curr_cmd->end_cmd;
> +               xnand->end_cmd_pending =3D 1;
> +       }
> +
> +       ndelay(100);
> +
> +       if ((command =3D=3D NAND_CMD_READ0) ||
> +           (command =3D=3D NAND_CMD_RESET) ||
> +           (command =3D=3D NAND_CMD_PARAM) ||
> +           (command =3D=3D NAND_CMD_GET_FEATURES)) {
> +
> +               /* Wait till the device is ready or timeout */
> +               do {
> +                       if (chip->dev_ready(mtd))
> +                               break;
> +                       else
> +                               cpu_relax();
> +               } while (!time_after_eq(jiffies, timeout));
> +
> +               if (time_after_eq(jiffies, timeout))
> +                       pr_err("%s timed out\n", __func__);
> +               return;
> +       }
> +}
> +
> +/**
> + * pl353_nand_read_buf - read chip data into buffer
> + * @mtd:       Pointer to the mtd info structure
> + * @buf:       Pointer to the buffer to store read data
> + * @len:       Number of bytes to read
> + */
> +static void pl353_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, =
int len)
> +{
> +       int i;
> +       struct nand_chip *chip =3D mtd->priv;
> +       unsigned long *ptr =3D (unsigned long *)buf;
> +
> +       len >>=3D 2;
> +       for (i =3D 0; i < len; i++)
> +               ptr[i] =3D readl(chip->IO_ADDR_R);
> +}
> +
> +/**
> + * pl353_nand_write_buf - write buffer to chip
> + * @mtd:       Pointer to the mtd info structure
> + * @buf:       Pointer to the buffer to store read data
> + * @len:       Number of bytes to write
> + */
> +static void pl353_nand_write_buf(struct mtd_info *mtd, const uint8_t=
 *buf,
> +                               int len)
> +{
> +       int i;
> +       struct nand_chip *chip =3D mtd->priv;
> +       unsigned long *ptr =3D (unsigned long *)buf;
> +
> +       len >>=3D 2;
> +
> +       for (i =3D 0; i < len; i++)
> +               writel(ptr[i], chip->IO_ADDR_W);
> +}
> +
> +/**
> + * pl353_nand_device_ready - Check device ready/busy line
> + * @mtd:       Pointer to the mtd_info structure
> + *
> + * Return:     0 on busy or 1 on ready state
> + */
> +static int pl353_nand_device_ready(struct mtd_info *mtd)
> +{
> +       if (pl353_smc_get_nand_int_status_raw()) {
> +               pl353_smc_clr_nand_int();
> +               return 1;
> +       }
> +       return 0;
> +}
> +
> +/**
> + * pl353_nand_detect_ondie_ecc - Get the flash ondie ecc state
> + * @mtd:       Pointer to the mtd_info structure
> + *
> + * This function enables the ondie ecc for the Micron ondie ecc capa=
ble devices
> + *
> + * Return:     1 on detect, 0 if fail to detect
> + */
> +static int pl353_nand_detect_ondie_ecc(struct mtd_info *mtd)
> +{
> +       struct nand_chip *nand_chip =3D mtd->priv;
> +       u8 maf_id, dev_id, i, get_feature;
> +       u8 set_feature[4] =3D { 0x08, 0x00, 0x00, 0x00 };
> +
> +       /* Check if On-Die ECC flash */
> +       nand_chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
> +       nand_chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
> +
> +       /* Read manufacturer and device IDs */
> +       maf_id =3D readb(nand_chip->IO_ADDR_R);
> +       dev_id =3D readb(nand_chip->IO_ADDR_R);
> +
> +       if ((maf_id =3D=3D NAND_MFR_MICRON) &&
> +           ((dev_id =3D=3D 0xf1) || (dev_id =3D=3D 0xa1) ||
> +            (dev_id =3D=3D 0xb1) || (dev_id =3D=3D 0xaa) ||
> +            (dev_id =3D=3D 0xba) || (dev_id =3D=3D 0xda) ||
> +            (dev_id =3D=3D 0xca) || (dev_id =3D=3D 0xac) ||
> +            (dev_id =3D=3D 0xbc) || (dev_id =3D=3D 0xdc) ||
> +            (dev_id =3D=3D 0xcc) || (dev_id =3D=3D 0xa3) ||
> +            (dev_id =3D=3D 0xb3) ||
> +            (dev_id =3D=3D 0xd3) || (dev_id =3D=3D 0xc3))) {
> +
> +               nand_chip->cmdfunc(mtd, NAND_CMD_GET_FEATURES,
> +                                  ONDIE_ECC_FEATURE_ADDR, -1);
> +               get_feature =3D readb(nand_chip->IO_ADDR_R);
> +
> +               if (get_feature & 0x08) {
> +                       return 1;
> +               } else {
> +                       nand_chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES=
,
> +                                          ONDIE_ECC_FEATURE_ADDR, -1=
);
> +                       for (i =3D 0; i < 4; i++)
> +                               writeb(set_feature[i], nand_chip->IO_=
ADDR_W);
> +
> +                       ndelay(1000);
> +
> +                       nand_chip->cmdfunc(mtd, NAND_CMD_GET_FEATURES=
,
> +                                          ONDIE_ECC_FEATURE_ADDR, -1=
);
> +                       get_feature =3D readb(nand_chip->IO_ADDR_R);
> +
> +                       if (get_feature & 0x08)
> +                               return 1;
> +
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +/**
> + * pl353_nand_ecc_init - Initialize the ecc information as per the e=
cc mode
> + * @mtd:       Pointer to the mtd_info structure
> + * @ondie_ecc_state:   ondie ecc status
> + *
> + * This function initializes the ecc block and functional pointers a=
s per the
> + * ecc mode
> + */
> +static void pl353_nand_ecc_init(struct mtd_info *mtd, int ondie_ecc_=
state)
> +{
> +       struct nand_chip *nand_chip =3D mtd->priv;
> +
> +       nand_chip->ecc.mode =3D NAND_ECC_HW;
> +       nand_chip->ecc.read_oob =3D pl353_nand_read_oob;
> +       nand_chip->ecc.read_page_raw =3D pl353_nand_read_page_raw;
> +       nand_chip->ecc.strength =3D 1;
> +       nand_chip->ecc.write_oob =3D pl353_nand_write_oob;
> +       nand_chip->ecc.write_page_raw =3D pl353_nand_write_page_raw;
> +
> +       if (ondie_ecc_state) {
> +               /* bypass the controller ECC block */
> +               pl353_smc_set_ecc_mode(PL353_SMC_ECCMODE_BYPASS);
> +
> +               /*
> +                * The software ECC routines won't work with the
> +                * SMC controller
> +                */
> +               nand_chip->ecc.bytes =3D 0;
> +               nand_chip->ecc.layout =3D &ondie_nand_oob_64;
> +               nand_chip->ecc.read_page =3D pl353_nand_read_page_raw=
;
> +               nand_chip->ecc.write_page =3D pl353_nand_write_page_r=
aw;
> +               nand_chip->ecc.size =3D mtd->writesize;
> +               /*
> +                * On-Die ECC spare bytes offset 8 is used for ECC co=
des
> +                * Use the BBT pattern descriptors
> +                */
> +               nand_chip->bbt_td =3D &bbt_main_descr;
> +               nand_chip->bbt_md =3D &bbt_mirror_descr;
> +       } else {
> +               /* Hardware ECC generates 3 bytes ECC code for each 5=
12 bytes */
> +               nand_chip->ecc.bytes =3D 3;
> +               nand_chip->ecc.calculate =3D pl353_nand_calculate_hwe=
cc;
> +               nand_chip->ecc.correct =3D pl353_nand_correct_data;
> +               nand_chip->ecc.hwctl =3D NULL;
> +               nand_chip->ecc.read_page =3D pl353_nand_read_page_hwe=
cc;
> +               nand_chip->ecc.size =3D PL353_NAND_ECC_SIZE;
> +               nand_chip->ecc.write_page =3D pl353_nand_write_page_h=
wecc;
> +
> +               pl353_smc_set_ecc_pg_size(mtd->writesize);
> +               switch (mtd->writesize) {
> +               case 512:
> +               case 1024:
> +               case 2048:
> +                       pl353_smc_set_ecc_mode(PL353_SMC_ECCMODE_APB)=
;
> +                       break;
> +               default:
> +                       /*
> +                        * The software ECC routines won't work with =
the
> +                        * SMC controller
> +                        */
> +                       nand_chip->ecc.calculate =3D nand_calculate_e=
cc;
> +                       nand_chip->ecc.correct =3D nand_correct_data;
> +                       nand_chip->ecc.read_page =3D pl353_nand_read_=
page_swecc;
> +                       nand_chip->ecc.write_page =3D pl353_nand_writ=
e_page_swecc;
> +                       nand_chip->ecc.size =3D 256;
> +                       break;
> +               }
> +
> +               if (mtd->oobsize =3D=3D 16)
> +                       nand_chip->ecc.layout =3D &nand_oob_16;
> +               else if (mtd->oobsize =3D=3D 64)
> +                       nand_chip->ecc.layout =3D &nand_oob_64;
> +       }
> +}
> +
> +/**
> + * pl353_nand_probe - Probe method for the NAND driver
> + * @pdev:      Pointer to the platform_device structure
> + *
> + * This function initializes the driver data structures and the hard=
ware.
> + *
> + * Return:     0 on success or error value on failure
> + */
> +static int pl353_nand_probe(struct platform_device *pdev)
> +{
> +       struct pl353_nand_info *xnand;
> +       struct mtd_info *mtd;
> +       struct nand_chip *nand_chip;
> +       struct resource *res;
> +       struct mtd_part_parser_data ppdata;
> +       int ondie_ecc_state;
> +
> +       xnand =3D devm_kzalloc(&pdev->dev, sizeof(*xnand), GFP_KERNEL=
);
> +       if (!xnand)
> +               return -ENOMEM;
> +
> +       /* Map physical address of NAND flash */
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       xnand->nand_base =3D devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(xnand->nand_base))
> +               return PTR_ERR(xnand->nand_base);
> +
> +       /* Link the private data with the MTD structure */
> +       mtd =3D &xnand->mtd;
> +       nand_chip =3D &xnand->chip;
> +
> +       nand_chip->priv =3D xnand;
> +       mtd->priv =3D nand_chip;
> +       mtd->owner =3D THIS_MODULE;
> +       mtd->name =3D PL353_NAND_DRIVER_NAME;
> +
> +       /* Set address of NAND IO lines */
> +       nand_chip->IO_ADDR_R =3D xnand->nand_base;
> +       nand_chip->IO_ADDR_W =3D xnand->nand_base;
> +
> +       /* Set the driver entry points for MTD */
> +       nand_chip->cmdfunc =3D pl353_nand_cmd_function;
> +       nand_chip->dev_ready =3D pl353_nand_device_ready;
> +       nand_chip->select_chip =3D pl353_nand_select_chip;
> +
> +       /* If we don't set this delay driver sets 20us by default */
> +       nand_chip->chip_delay =3D 30;
> +
> +       /* Buffer read/write routines */
> +       nand_chip->read_buf =3D pl353_nand_read_buf;
> +       nand_chip->write_buf =3D pl353_nand_write_buf;
> +
> +       /* Set the device option and flash width */
> +       nand_chip->options =3D NAND_BUSWIDTH_AUTO;
> +       nand_chip->bbt_options =3D NAND_BBT_USE_FLASH;
> +
> +       platform_set_drvdata(pdev, xnand);
> +
> +       ondie_ecc_state =3D pl353_nand_detect_ondie_ecc(mtd);
> +
> +       /* first scan to find the device and get the page size */
> +       if (nand_scan_ident(mtd, 1, NULL)) {
> +               dev_err(&pdev->dev, "nand_scan_ident for NAND failed\=
n");
> +               return -ENXIO;
> +       }
> +
> +       pl353_nand_ecc_init(mtd, ondie_ecc_state);
> +       if (nand_chip->options & NAND_BUSWIDTH_16)
> +               pl353_smc_set_buswidth(PL353_SMC_MEM_WIDTH_16);
> +
> +       /* second phase scan */
> +       if (nand_scan_tail(mtd)) {
> +               dev_err(&pdev->dev, "nand_scan_tail for NAND failed\n=
");
> +               return -ENXIO;
> +       }
> +
> +       ppdata.of_node =3D pdev->dev.of_node;
> +
> +       mtd_device_parse_register(&xnand->mtd, NULL, &ppdata, NULL, 0=
);
> +
> +       return 0;
> +}
> +
> +/**
> + * pl353_nand_remove - Remove method for the NAND driver
> + * @pdev:      Pointer to the platform_device structure
> + *
> + * This function is called if the driver module is being unloaded. I=
t frees all
> + * resources allocated to the device.
> + *
> + * Return:     0 on success or error value on failure
> + */
> +static int pl353_nand_remove(struct platform_device *pdev)
> +{
> +       struct pl353_nand_info *xnand =3D platform_get_drvdata(pdev);
> +
> +       /* Release resources, unregister device */
> +       nand_release(&xnand->mtd);
> +       /* kfree(NULL) is safe */
> +       kfree(xnand->parts);
> +
> +       return 0;
> +}
> +
> +/* Match table for device tree binding */
> +static const struct of_device_id pl353_nand_of_match[] =3D {
> +       { .compatible =3D "arm,pl353-nand-r2p1" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, pl353_nand_of_match);
> +
> +/*
> + * pl353_nand_driver - This structure defines the NAND subsystem pla=
tform driver
> + */
> +static struct platform_driver pl353_nand_driver =3D {
> +       .probe          =3D pl353_nand_probe,
> +       .remove         =3D pl353_nand_remove,
> +       .driver         =3D {
> +               .name   =3D PL353_NAND_DRIVER_NAME,
> +               .owner  =3D THIS_MODULE,
> +               .of_match_table =3D pl353_nand_of_match,
> +       },
> +};
> +
> +module_platform_driver(pl353_nand_driver);
> +
> +MODULE_AUTHOR("Xilinx, Inc.");
> +MODULE_ALIAS("platform:" PL353_NAND_DRIVER_NAME);
> +MODULE_DESCRIPTION("ARM PL353 NAND Flash Driver");
> +MODULE_LICENSE("GPL");
> --
> 1.7.4
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



--=20
Ezequiel Garc=EDa, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
