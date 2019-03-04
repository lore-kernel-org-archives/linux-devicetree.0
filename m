From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 7/9] mtd: rawnand: ingenic: Add support for the JZ4740
Date: Mon, 04 Mar 2019 19:28:49 +0100
Message-ID: <1551724129.4932.5@crapouillou.net>
References: <20190209192305.4434-1-paul@crapouillou.net>
        <20190209192305.4434-7-paul@crapouillou.net> <20190304113412.24b64e3d@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304113412.24b64e3d@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Mon, Mar 4, 2019 at 11:34 AM, Miquel Raynal=20
<miquel.raynal@bootlin.com> wrote:
> Hi Paul,
>=20
> Paul Cercueil <paul@crapouillou.net <mailto:paul@crapouillou.net>>=20
> wrote on Sat,  9 Feb 2019 16:23:03
> -0300:
>=20
>>  Add support for probing the ingenic-nand driver on the JZ4740 SoC=20
>> from
>>  Ingenic, and the jz4740-ecc driver to support the JZ4740-specific
>>  ECC hardware.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net=20
>> <mailto:paul@crapouillou.net>>
>>  ---
>>=20
>>  Changes:
>>=20
>>  v2: New patch
>>=20
>>  v3: Also add support for the hardware ECC of the JZ4740 in this=20
>> patch
>>=20
>>  v4: - Fix formatting issues
>>      - Add MODULE_* macros
>>=20
>>   drivers/mtd/nand/raw/ingenic/Kconfig        |  10 ++
>>   drivers/mtd/nand/raw/ingenic/Makefile       |   1 +
>>   drivers/mtd/nand/raw/ingenic/ingenic_nand.c |  48 +++++--
>>   drivers/mtd/nand/raw/ingenic/jz4740_ecc.c   | 196=20
>> ++++++++++++++++++++++++++++
>>   4 files changed, 244 insertions(+), 11 deletions(-)
>>   create mode 100644 drivers/mtd/nand/raw/ingenic/jz4740_ecc.c
>>=20
>=20
> [...]
>=20
>>   	switch (chip->ecc.mode) {
>>   	case NAND_ECC_HW:
>>  @@ -270,8 +279,8 @@ static int ingenic_nand_init_chip(struct=20
>> platform_device *pdev,
>>   		return -ENOMEM;
>>   	mtd->dev.parent =3D dev;
>>=20
>>  -	chip->legacy.IO_ADDR_R =3D cs->base + OFFSET_DATA;
>>  -	chip->legacy.IO_ADDR_W =3D cs->base + OFFSET_DATA;
>>  +	chip->legacy.IO_ADDR_R =3D cs->base + nfc->soc_info->data_offset;
>>  +	chip->legacy.IO_ADDR_W =3D cs->base + nfc->soc_info->data_offset;
>>   	chip->legacy.chip_delay =3D RB_DELAY_US;
>>   	chip->options =3D NAND_NO_SUBPAGE_WRITE;
>>   	chip->legacy.select_chip =3D ingenic_nand_select_chip;
>=20
> I think Boris already asked for it, but it would be really great that
> you update this driver to not use any legacy interface anymore.

I thought I'd send a patch later. But I don't mind doing the update in
this patchset.

>>  diff --git a/drivers/mtd/nand/raw/ingenic/jz4740_ecc.c=20
>> b/drivers/mtd/nand/raw/ingenic/jz4740_ecc.c
>>  new file mode 100644
>>  index 000000000000..83b42881720e
>>  --- /dev/null
>>  +++ b/drivers/mtd/nand/raw/ingenic/jz4740_ecc.c
>>  @@ -0,0 +1,196 @@
>>  +// SPDX-License-Identifier: GPL-2.0
>>  +/*
>>  + * JZ4740 ECC controller driver
>>  + *
>>  + * Copyright (c) 2019 Paul Cercueil <paul@crapouillou.net=20
>> <mailto:paul@crapouillou.net>>
>>  + *
>>  + * based on jz4740-nand.c
>>  + */
>>  +
>>  +#include <linux/bitops.h>
>>  +#include <linux/device.h>
>>  +#include <linux/io.h>
>>  +#include <linux/module.h>
>>  +#include <linux/of_platform.h>
>>  +#include <linux/platform_device.h>
>>  +
>>  +#include "ingenic_ecc.h"
>>  +
>>  +#define JZ_REG_NAND_ECC_CTRL	0x00
>>  +#define JZ_REG_NAND_DATA	0x04
>>  +#define JZ_REG_NAND_PAR0	0x08
>>  +#define JZ_REG_NAND_PAR1	0x0C
>>  +#define JZ_REG_NAND_PAR2	0x10
>>  +#define JZ_REG_NAND_IRQ_STAT	0x14
>>  +#define JZ_REG_NAND_IRQ_CTRL	0x18
>>  +#define JZ_REG_NAND_ERR(x)	(0x1C + ((x) << 2))
>>  +
>>  +#define JZ_NAND_ECC_CTRL_PAR_READY	BIT(4)
>>  +#define JZ_NAND_ECC_CTRL_ENCODING	BIT(3)
>>  +#define JZ_NAND_ECC_CTRL_RS		BIT(2)
>>  +#define JZ_NAND_ECC_CTRL_RESET		BIT(1)
>>  +#define JZ_NAND_ECC_CTRL_ENABLE		BIT(0)
>>  +
>>  +#define JZ_NAND_STATUS_ERR_COUNT	(BIT(31) | BIT(30) | BIT(29))
>>  +#define JZ_NAND_STATUS_PAD_FINISH	BIT(4)
>>  +#define JZ_NAND_STATUS_DEC_FINISH	BIT(3)
>>  +#define JZ_NAND_STATUS_ENC_FINISH	BIT(2)
>>  +#define JZ_NAND_STATUS_UNCOR_ERROR	BIT(1)
>>  +#define JZ_NAND_STATUS_ERROR		BIT(0)
>>  +
>>  +static const uint8_t empty_block_ecc[] =3D {
>>  +	0xcd, 0x9d, 0x90, 0x58, 0xf4, 0x8b, 0xff, 0xb7, 0x6f
>>  +};
>>  +
>>  +static void jz4740_ecc_init(struct ingenic_ecc *ecc, bool encode)
>>  +{
>>  +	uint32_t reg;
>>  +
>>  +	/* Clear interrupt status */
>>  +	writel(0, ecc->base + JZ_REG_NAND_IRQ_STAT);
>>  +
>>  +	/* Initialize and enable ECC hardware */
>>  +	reg =3D readl(ecc->base + JZ_REG_NAND_ECC_CTRL);
>>  +	reg |=3D JZ_NAND_ECC_CTRL_RESET;
>>  +	reg |=3D JZ_NAND_ECC_CTRL_ENABLE;
>>  +	reg |=3D JZ_NAND_ECC_CTRL_RS;
>>  +	if (encode)
>>  +		reg |=3D JZ_NAND_ECC_CTRL_ENCODING;
>>  +	else
>>  +		reg &=3D ~JZ_NAND_ECC_CTRL_ENCODING;
>>  +
>>  +	writel(reg, ecc->base + JZ_REG_NAND_ECC_CTRL);
>>  +}
>>  +
>>  +static int jz4740_ecc_calculate(struct ingenic_ecc *ecc,
>>  +				struct ingenic_ecc_params *params,
>>  +				const u8 *buf, u8 *ecc_code)
>>  +{
>>  +	uint32_t reg, status;
>>  +	unsigned int timeout =3D 1000;
>>  +	int i;
>>  +
>>  +	jz4740_ecc_init(ecc, true);
>>  +
>>  +	do {
>>  +		status =3D readl(ecc->base + JZ_REG_NAND_IRQ_STAT);
>>  +	} while (!(status & JZ_NAND_STATUS_ENC_FINISH) && --timeout);
>>  +
>>  +	if (timeout =3D=3D 0)
>>  +		return -ETIMEDOUT;
>>  +
>>  +	reg =3D readl(ecc->base + JZ_REG_NAND_ECC_CTRL);
>>  +	reg &=3D ~JZ_NAND_ECC_CTRL_ENABLE;
>>  +	writel(reg, ecc->base + JZ_REG_NAND_ECC_CTRL);
>>  +
>>  +	for (i =3D 0; i < params->bytes; ++i)
>>  +		ecc_code[i] =3D readb(ecc->base + JZ_REG_NAND_PAR0 + i);
>>  +
>>  +	/* If the written data is completely 0xff, we also want to write=20
>> 0xff as
>>  +	 * ecc, otherwise we will get in trouble when doing subpage=20
>> writes.
>>  +	 */
>=20
> Comment formatting
>=20
> s/ecc/ECC/ in plain English
>=20
>>  +	if (memcmp(ecc_code, empty_block_ecc,=20
>> ARRAY_SIZE(empty_block_ecc)) =3D=3D 0)
>>  +		memset(ecc_code, 0xff, ARRAY_SIZE(empty_block_ecc));
>>  +
>>  +	return 0;
>>  +}
>>  +
>=20
>=20
> Thanks,
> Miqu=E8l

=
