From: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 5/9] mtd: nand: add sunxi NAND flash
 controller support
Date: Fri, 09 May 2014 18:47:22 +0200
Message-ID: <536D069A.40401@gmail.com>
References: <1394647664-8258-1-git-send-email-b.brezillon.dev@gmail.com> <1394647664-8258-6-git-send-email-b.brezillon.dev@gmail.com> <20140509160341.GA6984@arch.cereza>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDE6NB73YAMBBIUNWSNQKGQEOKE2JPQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140509160341.GA6984-nAQHv47ARr+vIlHkl8J1cg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?ISO-8859-1?Q?Emilio_L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 09/05/2014 18:03, Ezequiel Garcia wrote:
> Hello Boris,
>
> Sorry for the review delay.
>
> Emilio, if you have hardware to test this, it would be nice to give
> Boris some Tested-by?
>
> On 12 Mar 07:07 PM, Boris BREZILLON wrote:
>> Add support for the sunxi NAND Flash Controller (NFC).
>>
>> Signed-off-by: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/mtd/nand/Kconfig      |    6 +
>>  drivers/mtd/nand/Makefile     |    1 +
>>  drivers/mtd/nand/sunxi_nand.c | 1276 ++++++++++++++++++++++++++++++++++=
+++++++
>>  3 files changed, 1283 insertions(+)
>>  create mode 100644 drivers/mtd/nand/sunxi_nand.c
>>
>> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>> index 90ff447..8a28c06 100644
>> --- a/drivers/mtd/nand/Kconfig
>> +++ b/drivers/mtd/nand/Kconfig
>> @@ -510,4 +510,10 @@ config MTD_NAND_XWAY
>>  	  Enables support for NAND Flash chips on Lantiq XWAY SoCs. NAND is at=
tached
>>  	  to the External Bus Unit (EBU).
>> =20
>> +config MTD_NAND_SUNXI
>> +	tristate "Support for NAND on Allwinner SoCs"
>> +	depends on ARCH_SUNXI
>> +	help
>> +	  Enables support for NAND Flash chips on Allwinner SoCs.
>> +
>>  endif # MTD_NAND
>> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
>> index 0b8a822..34f45d8 100644
>> --- a/drivers/mtd/nand/Makefile
>> +++ b/drivers/mtd/nand/Makefile
>> @@ -49,5 +49,6 @@ obj-$(CONFIG_MTD_NAND_JZ4740)		+=3D jz4740_nand.o
>>  obj-$(CONFIG_MTD_NAND_GPMI_NAND)	+=3D gpmi-nand/
>>  obj-$(CONFIG_MTD_NAND_XWAY)		+=3D xway_nand.o
>>  obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+=3D bcm47xxnflash/
>> +obj-$(CONFIG_MTD_NAND_SUNXI)		+=3D sunxi_nand.o
>> =20
>>  nand-objs :=3D nand_base.o nand_bbt.o
>> diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand=
.c
>> new file mode 100644
>> index 0000000..e93cc44
>> --- /dev/null
>> +++ b/drivers/mtd/nand/sunxi_nand.c
>> @@ -0,0 +1,1276 @@
>> +/*
>> + * Copyright (C) 2013 Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> + *
>> + * Derived from:
>> + *	https://github.com/yuq/sunxi-nfc-mtd
>> + *	Copyright (C) 2013 Qiang Yu <yuq825-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> + *
>> + *	https://github.com/hno/Allwinner-Info
>> + *	Copyright (C) 2013 Henrik Nordstr=F6m <Henrik Nordstr=F6m>
>> + *
>> + *	Copyright (C) 2013 Dmitriy B. <rzk333-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> + *	Copyright (C) 2013 Sergey Lapin <slapin-9cOl001CZnBAfugRpC6u6w@public.gmane.org>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#include <linux/dma-mapping.h>
>> +#include <linux/slab.h>
>> +#include <linux/module.h>
>> +#include <linux/moduleparam.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of_gpio.h>
>> +#include <linux/of_mtd.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mtd/nand.h>
>> +#include <linux/mtd/partitions.h>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/dmaengine.h>
>> +#include <linux/gpio.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +
>> +#define NFC_REG_CTL		0x0000
>> +#define NFC_REG_ST		0x0004
>> +#define NFC_REG_INT		0x0008
>> +#define NFC_REG_TIMING_CTL	0x000C
>> +#define NFC_REG_TIMING_CFG	0x0010
>> +#define NFC_REG_ADDR_LOW	0x0014
>> +#define NFC_REG_ADDR_HIGH	0x0018
>> +#define NFC_REG_SECTOR_NUM	0x001C
>> +#define NFC_REG_CNT		0x0020
>> +#define NFC_REG_CMD		0x0024
>> +#define NFC_REG_RCMD_SET	0x0028
>> +#define NFC_REG_WCMD_SET	0x002C
>> +#define NFC_REG_IO_DATA		0x0030
>> +#define NFC_REG_ECC_CTL		0x0034
>> +#define NFC_REG_ECC_ST		0x0038
>> +#define NFC_REG_DEBUG		0x003C
>> +#define NFC_REG_ECC_CNT0	0x0040
>> +#define NFC_REG_ECC_CNT1	0x0044
>> +#define NFC_REG_ECC_CNT2	0x0048
>> +#define NFC_REG_ECC_CNT3	0x004c
>> +#define NFC_REG_USER_DATA_BASE	0x0050
>> +#define NFC_REG_SPARE_AREA	0x00A0
>> +#define NFC_RAM0_BASE		0x0400
>> +#define NFC_RAM1_BASE		0x0800
>> +
>> +/*define bit use in NFC_CTL*/
> nit: Use BIT() for these?

Okay.

>
>> +#define NFC_EN				(1 << 0)
>> +#define NFC_RESET			(1 << 1)
>> +#define NFC_BUS_WIDYH			(1 << 2)
>> +#define NFC_RB_SEL			(1 << 3)
>> +#define NFC_CE_SEL			(7 << 24)
>> +#define NFC_CE_CTL			(1 << 6)
>> +#define NFC_CE_CTL1			(1 << 7)
>> +#define NFC_PAGE_SIZE			(0xf << 8)
>> +#define NFC_SAM				(1 << 12)
>> +#define NFC_RAM_METHOD			(1 << 14)
>> +#define NFC_DEBUG_CTL			(1 << 31)
>> +
>> +/*define bit use in NFC_ST*/
>> +#define NFC_RB_B2R			(1 << 0)
>> +#define NFC_CMD_INT_FLAG		(1 << 1)
>> +#define NFC_DMA_INT_FLAG		(1 << 2)
>> +#define NFC_CMD_FIFO_STATUS		(1 << 3)
>> +#define NFC_STA				(1 << 4)
>> +#define NFC_NATCH_INT_FLAG		(1 << 5)
>> +#define NFC_RB_STATE0			(1 << 8)
>> +#define NFC_RB_STATE1			(1 << 9)
>> +#define NFC_RB_STATE2			(1 << 10)
>> +#define NFC_RB_STATE3			(1 << 11)
>> +
>> +/*define bit use in NFC_INT*/
>> +#define NFC_B2R_INT_ENABLE		(1 << 0)
>> +#define NFC_CMD_INT_ENABLE		(1 << 1)
>> +#define NFC_DMA_INT_ENABLE		(1 << 2)
>> +#define NFC_INT_MASK			(NFC_B2R_INT_ENABLE | \
>> +					 NFC_CMD_INT_ENABLE | \
>> +					 NFC_DMA_INT_ENABLE)
>> +
>> +
>> +/*define bit use in NFC_CMD*/
>> +#define NFC_CMD_LOW_BYTE		(0xff << 0)
>> +#define NFC_CMD_HIGH_BYTE		(0xff << 8)
>> +#define NFC_ADR_NUM			(0x7 << 16)
>> +#define NFC_SEND_ADR			(1 << 19)
>> +#define NFC_ACCESS_DIR			(1 << 20)
>> +#define NFC_DATA_TRANS			(1 << 21)
>> +#define NFC_SEND_CMD1			(1 << 22)
>> +#define NFC_WAIT_FLAG			(1 << 23)
>> +#define NFC_SEND_CMD2			(1 << 24)
>> +#define NFC_SEQ				(1 << 25)
>> +#define NFC_DATA_SWAP_METHOD		(1 << 26)
>> +#define NFC_ROW_AUTO_INC		(1 << 27)
>> +#define NFC_SEND_CMD3			(1 << 28)
>> +#define NFC_SEND_CMD4			(1 << 29)
>> +#define NFC_CMD_TYPE			(3 << 30)
>> +
>> +/* define bit use in NFC_RCMD_SET*/
>> +#define NFC_READ_CMD			(0xff << 0)
>> +#define NFC_RANDOM_READ_CMD0		(0xff << 8)
>> +#define NFC_RANDOM_READ_CMD1		(0xff << 16)
>> +
>> +/*define bit use in NFC_WCMD_SET*/
>> +#define NFC_PROGRAM_CMD			(0xff << 0)
>> +#define NFC_RANDOM_WRITE_CMD		(0xff << 8)
>> +#define NFC_READ_CMD0			(0xff << 16)
>> +#define NFC_READ_CMD1			(0xff << 24)
>> +
>> +/*define bit use in NFC_ECC_CTL*/
>> +#define NFC_ECC_EN			(1 << 0)
>> +#define NFC_ECC_PIPELINE		(1 << 3)
>> +#define NFC_ECC_EXCEPTION		(1 << 4)
>> +#define NFC_ECC_BLOCK_SIZE		(1 << 5)
>> +#define NFC_RANDOM_EN			(1 << 9)
>> +#define NFC_RANDOM_DIRECTION		(1 << 10)
>> +#define NFC_ECC_MODE_SHIFT		12
>> +#define NFC_ECC_MODE			(0xf << NFC_ECC_MODE_SHIFT)
>> +#define NFC_RANDOM_SEED			(0x7fff << 16)
>> +
>> +
>> +
> Kill and avoid these extra empty lines.

Sure.

>
>> +enum sunxi_nand_rb_type {
>> +	RB_NONE,
>> +	RB_NATIVE,
>> +	RB_GPIO,
>> +};
>> +
> Can you add some documentation about this read-back stuff?

This has nothing to do with read-back, RB means ready/busy :-).

> I know documenting is not a super-fun activity, but it's a bit tough
> to review otherwise.

Okay, I'll try to spend more time documenting non obvious stuff ;-)

>
>> +struct sunxi_nand_rb {
>> +	enum sunxi_nand_rb_type type;
>> +	union {
>> +		int gpio;
>> +		int nativeid;
>> +	} info;
>> +};
>> +
>> +struct sunxi_nand_chip_sel {
>> +	u8 cs;
>> +	struct sunxi_nand_rb rb;
>> +};
>> +
>> +#define DEFAULT_NAME_FORMAT	"nand@%d"
>> +#define MAX_NAME_SIZE		(sizeof("nand@") + 2)
>> +
>> +struct sunxi_nand_hw_ecc {
>> +	int mode;
>> +	struct nand_ecclayout layout;
>> +};
>> +
>> +struct sunxi_nand_chip {
>> +	struct list_head node;
>> +	struct nand_chip nand;
>> +	struct mtd_info mtd;
>> +	char default_name[MAX_NAME_SIZE];
>> +	unsigned long clk_rate;
>> +	int selected;
>> +	int nsels;
>> +	struct sunxi_nand_chip_sel sels[0];
> Hm... you prepare the whole multiple chip support but you really support =
a
> single chip? I'd say drop entirely and support just a single chip, it'll
> make the driver much cleaner. We can always add the support later, after
> proper testing.

Really, I spent so much time supporting multiple chips!
No I'm kidding :-), this was pretty simple, hence I added multiple chips
support right away.

Anyway, even if I drop this multiple chip support I want to keep the DT
bindings as proposed (one node for the controller and the nand chip
defined as child node of this controller node) to avoid breaking the DT
ABI in future versions.

>> +};
>> +
>> +static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *n=
and)
>> +{
>> +	return container_of(nand, struct sunxi_nand_chip, nand);
>> +}
>> +
>> +struct sunxi_nfc {
>> +	struct nand_hw_control controller;
>> +	void __iomem *regs;
>> +	int irq;
> You don't seem to need the irq stored anywhere, as you're using
> devm_request_irq.

Okay, I'll drop this field.

>
>> +	struct clk *ahb_clk;
>> +	struct clk *sclk;
>> +	unsigned long assigned_cs;
>> +	unsigned long clk_rate;
>> +	struct list_head chips;
>> +	struct completion complete;
>> +};
>> +
>> +static inline struct sunxi_nfc *to_sunxi_nfc(struct nand_hw_control *ct=
rl)
>> +{
>> +	return container_of(ctrl, struct sunxi_nfc, controller);
>> +}
>> +
>> +static irqreturn_t sunxi_nfc_interrupt(int irq, void *dev_id)
>> +{
>> +	struct sunxi_nfc *nfc =3D dev_id;
>> +	u32 st =3D readl(nfc->regs + NFC_REG_ST);
>> +	u32 ien =3D readl(nfc->regs + NFC_REG_INT);
>> +
>> +	if (!(ien & st))
>> +		return IRQ_NONE;
>> +
>> +	if ((ien & st) =3D=3D ien)
>> +		complete(&nfc->complete);
>> +
>> +	writel(st & NFC_INT_MASK, nfc->regs + NFC_REG_ST);
>> +	writel(~st & ien & NFC_INT_MASK, nfc->regs + NFC_REG_INT);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int sunxi_nfc_wait_int(struct sunxi_nfc *nfc, u32 flags,
>> +			      unsigned int timeout_ms)
>> +{
>> +	init_completion(&nfc->complete);
>> +
>> +	writel(flags, nfc->regs + NFC_REG_INT);
>> +	if (!timeout_ms)
>> +		wait_for_completion(&nfc->complete);
> In the same vein as infinite loops (see below), I'd avoid this no-timeout=
 wait.
> Or maybe you can *guarantee* it'll be always completed?

Sure, I'll just return an error is timeout_ms is set to 0.

>
>> +	else if (!wait_for_completion_timeout(&nfc->complete,
>> +					      msecs_to_jiffies(timeout_ms)))
>> +		return -ETIMEDOUT;
>> +
>> +	return 0;
>> +}
>> +
>> +static int sunxi_nfc_dev_ready(struct mtd_info *mtd)
>> +{
>> +	struct nand_chip *nand =3D mtd->priv;
>> +	struct sunxi_nand_chip *sunxi_nand =3D to_sunxi_nand(nand);
>> +	struct sunxi_nfc *nfc =3D to_sunxi_nfc(sunxi_nand->nand.controller);
>> +	struct sunxi_nand_rb *rb;
>> +	unsigned long timeo =3D (sunxi_nand->nand.state =3D=3D FL_ERASING ? 40=
0 : 20);
>> +	int ret;
>> +
>> +	if (sunxi_nand->selected < 0)
>> +		return 0;
>> +
>> +	rb =3D &sunxi_nand->sels[sunxi_nand->selected].rb;
>> +
>> +	switch (rb->type) {
>> +	case RB_NATIVE:
>> +		ret =3D !!(readl(nfc->regs + NFC_REG_ST) &
>> +			 (NFC_RB_STATE0 << rb->info.nativeid));
>> +		if (ret)
>> +			break;
>> +
>> +		sunxi_nfc_wait_int(nfc, NFC_RB_B2R, timeo);
>> +		ret =3D !!(readl(nfc->regs + NFC_REG_ST) &
>> +			 (NFC_RB_STATE0 << rb->info.nativeid));
>> +		break;
>> +	case RB_GPIO:
>> +		ret =3D gpio_get_value(rb->info.gpio);
>> +		break;
>> +	case RB_NONE:
>> +	default:
>> +		ret =3D 0;
>> +		pr_err("cannot check R/B NAND status!");
> I'd suggest avoiding this kind of pr_err. The user won't know
> who's saying this. Try using dev_err or pr_fmt.

I cannot use devm here, because this function might be called before
mtd_info registration (called from nand_scan_ident).
I'll define the pr_fmt macro instead.

>
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static void sunxi_nfc_select_chip(struct mtd_info *mtd, int chip)
>> +{
>> +	struct nand_chip *nand =3D mtd->priv;
>> +	struct sunxi_nand_chip *sunxi_nand =3D to_sunxi_nand(nand);
>> +	struct sunxi_nfc *nfc =3D to_sunxi_nfc(sunxi_nand->nand.controller);
>> +	struct sunxi_nand_chip_sel *sel;
>> +	u32 ctl;
>> +
>> +	if (chip > 0 && chip >=3D sunxi_nand->nsels)
>> +		return;
>> +
>> +	if (chip =3D=3D sunxi_nand->selected)
>> +		return;
>> +
>> +	ctl =3D readl(nfc->regs + NFC_REG_CTL) &
>> +	      ~(NFC_CE_SEL | NFC_RB_SEL | NFC_EN);
>> +
>> +	if (chip >=3D 0) {
>> +		sel =3D &sunxi_nand->sels[chip];
>> +
>> +		ctl |=3D (sel->cs << 24) | NFC_EN |
>> +		       (((nand->page_shift - 10) & 0xf) << 8);
>> +		if (sel->rb.type =3D=3D RB_NONE) {
>> +			nand->dev_ready =3D NULL;
>> +		} else {
>> +			nand->dev_ready =3D sunxi_nfc_dev_ready;
>> +			if (sel->rb.type =3D=3D RB_NATIVE)
>> +				ctl |=3D (sel->rb.info.nativeid << 3);
>> +		}
>> +
>> +		writel(mtd->writesize, nfc->regs + NFC_REG_SPARE_AREA);
>> +
>> +		if (nfc->clk_rate !=3D sunxi_nand->clk_rate) {
>> +			clk_set_rate(nfc->sclk, sunxi_nand->clk_rate);
>> +			nfc->clk_rate =3D sunxi_nand->clk_rate;
>> +		}
>> +	}
>> +
>> +	writel(ctl, nfc->regs + NFC_REG_CTL);
>> +
>> +	sunxi_nand->selected =3D chip;
>> +}
>> +
>> +static void sunxi_nfc_read_buf(struct mtd_info *mtd, uint8_t *buf, int =
len)
>> +{
>> +	struct nand_chip *nand =3D mtd->priv;
>> +	struct sunxi_nand_chip *sunxi_nand =3D to_sunxi_nand(nand);
>> +	struct sunxi_nfc *nfc =3D to_sunxi_nfc(sunxi_nand->nand.controller);
>> +	int cnt;
>> +	int offs =3D 0;
>> +	u32 tmp;
>> +
>> +	while (len > offs) {
>> +		cnt =3D len - offs;
>> +		if (cnt > 1024)
>> +			cnt =3D 1024;
>> +
>> +		while ((readl(nfc->regs + NFC_REG_ST) & NFC_CMD_FIFO_STATUS))
>> +			;
> How about avoiding the infinite loop?

Okay, just have to figure out what the appropriate timeout is.

>
>> +		writel(cnt, nfc->regs + NFC_REG_CNT);
>> +		tmp =3D NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD;
>> +		writel(tmp, nfc->regs + NFC_REG_CMD);
>> +		sunxi_nfc_wait_int(nfc, NFC_CMD_INT_FLAG, 0);
>> +		if (buf)
>> +			memcpy_fromio(buf + offs, nfc->regs + NFC_RAM0_BASE,
>> +				      cnt);
>> +		offs +=3D cnt;
>> +	}
>> +}
>> +
>> +static void sunxi_nfc_write_buf(struct mtd_info *mtd, const uint8_t *bu=
f,
>> +				int len)
>> +{
>> +	struct nand_chip *nand =3D mtd->priv;
>> +	struct sunxi_nand_chip *sunxi_nand =3D to_sunxi_nand(nand);
>> +	struct sunxi_nfc *nfc =3D to_sunxi_nfc(sunxi_nand->nand.controller);
>> +	int cnt;
>> +	int offs =3D 0;
>> +	u32 tmp;
>> +
>> +	while (len > offs) {
>> +		cnt =3D len - offs;
>> +		if (cnt > 1024)
>> +			cnt =3D 1024;
>> +
>> +		while ((readl(nfc->regs + NFC_REG_ST) & NFC_CMD_FIFO_STATUS))
>> +			;
> Ditto.

Same as above, I'll have to find an appropriate timeout value.

>
>> +		writel(cnt, nfc->regs + NFC_REG_CNT);
>> +		memcpy_toio(nfc->regs + NFC_RAM0_BASE, buf + offs, cnt);
>> +		tmp =3D NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
>> +		      NFC_ACCESS_DIR;
>> +		writel(tmp, nfc->regs + NFC_REG_CMD);
>> +		sunxi_nfc_wait_int(nfc, NFC_CMD_INT_FLAG, 0);
>> +		offs +=3D cnt;
>> +	}
>> +}
>> +
>> +static uint8_t sunxi_nfc_read_byte(struct mtd_info *mtd)
>> +{
>> +	uint8_t ret;
>> +
>> +	sunxi_nfc_read_buf(mtd, &ret, 1);
>> +
>> +	return ret;
>> +}
>> +
>> +static void sunxi_nfc_cmd_ctrl(struct mtd_info *mtd, int dat,
>> +			       unsigned int ctrl)
>> +{
>> +	struct nand_chip *nand =3D mtd->priv;
>> +	struct sunxi_nand_chip *sunxi_nand =3D to_sunxi_nand(nand);
>> +	struct sunxi_nfc *nfc =3D to_sunxi_nfc(sunxi_nand->nand.controller);
>> +	u32 tmp;
>> +
>> +	while ((readl(nfc->regs + NFC_REG_ST) & NFC_CMD_FIFO_STATUS))
>> +		;
>> +
> Ditto.
>
>> +	if (ctrl & NAND_CTRL_CHANGE) {
>> +		tmp =3D readl(nfc->regs + NFC_REG_CTL);
>> +		if (ctrl & NAND_NCE)
>> +			tmp |=3D NFC_CE_CTL;
>> +		else
>> +			tmp &=3D ~NFC_CE_CTL;
>> +		writel(tmp, nfc->regs + NFC_REG_CTL);
>> +	}
>> +
>> +	if (dat =3D=3D NAND_CMD_NONE)
>> +		return;
>> +
>> +	if (ctrl & NAND_CLE) {
>> +		writel(NFC_SEND_CMD1 | dat, nfc->regs + NFC_REG_CMD);
>> +	} else {
>> +		writel(dat, nfc->regs + NFC_REG_ADDR_LOW);
>> +		writel(NFC_SEND_ADR, nfc->regs + NFC_REG_CMD);
>> +	}
>> +
>> +	sunxi_nfc_wait_int(nfc, NFC_CMD_INT_FLAG, 0);
>> +}
>> +
>> +static int sunxi_nfc_hw_ecc_read_page(struct mtd_info *mtd,
>> +				      struct nand_chip *chip, uint8_t *buf,
>> +				      int oob_required, int page)
>> +{
>> +	struct sunxi_nfc *nfc =3D to_sunxi_nfc(chip->controller);
>> +	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
>> +	struct nand_ecclayout *layout =3D ecc->layout;
>> +	struct sunxi_nand_hw_ecc *data =3D ecc->priv;
>> +	int steps =3D mtd->writesize / ecc->size;
>> +	unsigned int max_bitflips =3D 0;
>> +	int offset;
>> +	u32 tmp;
>> +	int i;
>> +	int cnt;
>> +
>> +	tmp =3D readl(nfc->regs + NFC_REG_ECC_CTL);
>> +	tmp &=3D ~(NFC_ECC_MODE | NFC_ECC_PIPELINE | NFC_ECC_BLOCK_SIZE |
>> +		 NFC_ECC_BLOCK_SIZE);
>> +	tmp |=3D NFC_ECC_EN | (data->mode << NFC_ECC_MODE_SHIFT);
>> +
>> +	writel(tmp, nfc->regs + NFC_REG_ECC_CTL);
>> +
>> +	for (i =3D 0; i < steps; i++) {
>> +		if (i)
>> +			chip->cmdfunc(mtd, NAND_CMD_RNDOUT, i * ecc->size, -1);
>> +
>> +		offset =3D mtd->writesize + layout->eccpos[i * ecc->bytes] - 4;
>> +
>> +		chip->read_buf(mtd, NULL, ecc->size);
>> +
>> +		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, offset, -1);
>> +		while ((readl(nfc->regs + NFC_REG_ST) & NFC_CMD_FIFO_STATUS))
>> +			;
>> +
> Ditto.
>
>> +		tmp =3D NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | (1 << 30);
>> +		writel(tmp, nfc->regs + NFC_REG_CMD);
>> +		sunxi_nfc_wait_int(nfc, NFC_CMD_INT_FLAG, 0);
>> +		memcpy_fromio(buf + (i * ecc->size),
>> +			      nfc->regs + NFC_RAM0_BASE, ecc->size);
>> +
>> +		if (readl(nfc->regs + NFC_REG_ECC_ST) & 0x1) {
>> +			mtd->ecc_stats.failed++;
>> +		} else {
>> +			tmp =3D readl(nfc->regs + NFC_REG_ECC_CNT0) & 0xff;
>> +			mtd->ecc_stats.corrected +=3D tmp;
>> +			max_bitflips =3D max_t(unsigned int, max_bitflips, tmp);
>> +		}
>> +
>> +		if (oob_required) {
>> +			chip->cmdfunc(mtd, NAND_CMD_RNDOUT, offset, -1);
>> +			while ((readl(nfc->regs + NFC_REG_ST) &
>> +			       NFC_CMD_FIFO_STATUS))
>> +				;
> Ditto.
>
>> +			offset -=3D mtd->writesize;
>> +			chip->read_buf(mtd, chip->oob_poi + offset,
>> +				      ecc->bytes + 4);
>> +		}
>> +	}
>> +
>> +	if (oob_required) {
>> +		cnt =3D ecc->layout->oobfree[0].length - 4;
>> +		if (cnt > 0) {
>> +			chip->cmdfunc(mtd, NAND_CMD_RNDOUT, mtd->writesize,
>> +				      -1);
>> +			chip->read_buf(mtd, chip->oob_poi, cnt);
>> +		}
>> +	}
>> +
>> +	tmp =3D readl(nfc->regs + NFC_REG_ECC_CTL);
>> +	tmp &=3D ~NFC_ECC_EN;
>> +
>> +	writel(tmp, nfc->regs + NFC_REG_ECC_CTL);
>> +
>> +	return max_bitflips;
>> +}
>> +
>> +static int sunxi_nfc_hw_ecc_write_page(struct mtd_info *mtd,
>> +				       struct nand_chip *chip,
>> +				       const uint8_t *buf, int oob_required)
>> +{
>> +	struct sunxi_nfc *nfc =3D to_sunxi_nfc(chip->controller);
>> +	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
>> +	struct nand_ecclayout *layout =3D ecc->layout;
>> +	struct sunxi_nand_hw_ecc *data =3D ecc->priv;
>> +	int offset;
>> +	u32 tmp;
>> +	int i;
>> +	int cnt;
>> +
>> +	tmp =3D readl(nfc->regs + NFC_REG_ECC_CTL);
>> +	tmp &=3D ~(NFC_ECC_MODE | NFC_ECC_PIPELINE | NFC_ECC_BLOCK_SIZE |
>> +		 NFC_ECC_BLOCK_SIZE);
>> +	tmp |=3D NFC_ECC_EN | (data->mode << NFC_ECC_MODE_SHIFT);
>> +
>> +	writel(tmp, nfc->regs + NFC_REG_ECC_CTL);
>> +
>> +	for (i =3D 0; i < mtd->writesize / ecc->size; i++) {
>> +		if (i)
>> +			chip->cmdfunc(mtd, NAND_CMD_RNDIN, i * ecc->size, -1);
>> +
>> +		chip->write_buf(mtd, buf + (i * ecc->size), ecc->size);
>> +
>> +		offset =3D layout->eccpos[i * ecc->bytes] - 4 + mtd->writesize;
>> +
>> +		/* Fill OOB data in */
>> +		if (oob_required) {
>> +			tmp =3D 0xffffffff;
>> +			memcpy_toio(nfc->regs + NFC_REG_USER_DATA_BASE, &tmp,
>> +				    4);
>> +		} else {
>> +			memcpy_toio(nfc->regs + NFC_REG_USER_DATA_BASE,
>> +				    chip->oob_poi + offset - mtd->writesize,
>> +				    4);
>> +		}
>> +
>> +		chip->cmdfunc(mtd, NAND_CMD_RNDIN, offset, -1);
>> +		while ((readl(nfc->regs + NFC_REG_ST) &
>> +		       NFC_CMD_FIFO_STATUS))
>> +			;
>> +
> Ditto.
>
>> +		tmp =3D NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ACCESS_DIR |
>> +		      (1 << 30);
>> +		writel(tmp, nfc->regs + NFC_REG_CMD);
>> +		sunxi_nfc_wait_int(nfc, NFC_CMD_INT_FLAG, 0);
>> +	}
>> +
>> +	if (oob_required) {
>> +		cnt =3D ecc->layout->oobfree[0].length - 4;
>> +		if (cnt > 0) {
>> +			chip->cmdfunc(mtd, NAND_CMD_RNDIN, mtd->writesize, -1);
>> +			chip->write_buf(mtd, chip->oob_poi, cnt);
>> +		}
>> +	}
>> +
>> +	tmp =3D readl(nfc->regs + NFC_REG_ECC_CTL);
>> +	tmp &=3D ~(NFC_ECC_EN | NFC_ECC_PIPELINE);
>> +
>> +	writel(tmp, nfc->regs + NFC_REG_ECC_CTL);
>> +
>> +	return 0;
>> +}
>> +
>> +static int sunxi_nfc_hw_syndrome_ecc_read_page(struct mtd_info *mtd,
>> +					       struct nand_chip *chip,
>> +					       uint8_t *buf, int oob_required,
>> +					       int page)
>> +{
>> +	struct sunxi_nfc *nfc =3D to_sunxi_nfc(chip->controller);
>> +	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
>> +	struct sunxi_nand_hw_ecc *data =3D ecc->priv;
>> +	int steps =3D mtd->writesize / ecc->size;
>> +	unsigned int max_bitflips =3D 0;
>> +	uint8_t *oob =3D chip->oob_poi;
>> +	int offset =3D 0;
>> +	int cnt;
>> +	u32 tmp;
>> +	int i;
>> +
>> +	tmp =3D readl(nfc->regs + NFC_REG_ECC_CTL);
>> +	tmp &=3D ~(NFC_ECC_MODE | NFC_ECC_PIPELINE | NFC_ECC_BLOCK_SIZE |
>> +		 NFC_ECC_BLOCK_SIZE);
>> +	tmp |=3D NFC_ECC_EN | (data->mode << NFC_ECC_MODE_SHIFT);
>> +
>> +	writel(tmp, nfc->regs + NFC_REG_ECC_CTL);
>> +
>> +	for (i =3D 0; i < steps; i++) {
>> +		chip->read_buf(mtd, NULL, ecc->size);
>> +
>> +		tmp =3D NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | (1 << 30);
>> +		writel(tmp, nfc->regs + NFC_REG_CMD);
>> +		sunxi_nfc_wait_int(nfc, NFC_CMD_INT_FLAG, 0);
>> +		memcpy_fromio(buf, nfc->regs + NFC_RAM0_BASE, ecc->size);
>> +		buf +=3D ecc->size;
>> +		offset +=3D ecc->size;
>> +
>> +		if (readl(nfc->regs + NFC_REG_ECC_ST) & 0x1) {
>> +			mtd->ecc_stats.failed++;
>> +		} else {
>> +			tmp =3D readl(nfc->regs + NFC_REG_ECC_CNT0) & 0xff;
>> +			mtd->ecc_stats.corrected +=3D tmp;
>> +			max_bitflips =3D max_t(unsigned int, max_bitflips, tmp);
>> +		}
>> +
>> +		if (oob_required) {
>> +			chip->cmdfunc(mtd, NAND_CMD_RNDOUT, offset, -1);
>> +			chip->read_buf(mtd, oob, ecc->bytes + ecc->prepad);
>> +			oob +=3D ecc->bytes + ecc->prepad;
>> +		}
>> +
>> +		offset +=3D ecc->bytes + ecc->prepad;
>> +	}
>> +
>> +	if (oob_required) {
>> +		cnt =3D mtd->oobsize - (oob - chip->oob_poi);
>> +		if (cnt > 0) {
>> +			chip->cmdfunc(mtd, NAND_CMD_RNDOUT, offset, -1);
>> +			chip->read_buf(mtd, oob, cnt);
>> +		}
>> +	}
>> +
>> +	writel(readl(nfc->regs + NFC_REG_ECC_CTL) & ~NFC_ECC_EN,
>> +	       nfc->regs + NFC_REG_ECC_CTL);
>> +
>> +	return max_bitflips;
>> +}
>> +
>> +static int sunxi_nfc_hw_syndrome_ecc_write_page(struct mtd_info *mtd,
>> +						struct nand_chip *chip,
>> +						const uint8_t *buf,
>> +						int oob_required)
>> +{
>> +	struct sunxi_nfc *nfc =3D to_sunxi_nfc(chip->controller);
>> +	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
>> +	struct sunxi_nand_hw_ecc *data =3D ecc->priv;
>> +	int steps =3D mtd->writesize / ecc->size;
>> +	uint8_t *oob =3D chip->oob_poi;
>> +	int offset =3D 0;
>> +	int cnt;
>> +	u32 tmp;
>> +	int i;
>> +
>> +	tmp =3D readl(nfc->regs + NFC_REG_ECC_CTL);
>> +	tmp &=3D ~(NFC_ECC_MODE | NFC_ECC_PIPELINE | NFC_ECC_BLOCK_SIZE |
>> +		 NFC_ECC_BLOCK_SIZE);
>> +	tmp |=3D NFC_ECC_EN | (data->mode << NFC_ECC_MODE_SHIFT);
>> +
>> +	writel(tmp, nfc->regs + NFC_REG_ECC_CTL);
>> +
>> +	for (i =3D 0; i < steps; i++) {
>> +		chip->write_buf(mtd, buf + (i * ecc->size), ecc->size);
>> +		offset +=3D ecc->size;
>> +
>> +		/* Fill OOB data in */
>> +		if (oob_required) {
>> +			tmp =3D 0xffffffff;
>> +			memcpy_toio(nfc->regs + NFC_REG_USER_DATA_BASE, &tmp,
>> +				    4);
>> +		} else {
>> +			memcpy_toio(nfc->regs + NFC_REG_USER_DATA_BASE, oob ,
>> +				    4);
>> +		}
>> +
>> +		tmp =3D NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ACCESS_DIR |
>> +		      (1 << 30);
>> +		writel(tmp, nfc->regs + NFC_REG_CMD);
>> +		sunxi_nfc_wait_int(nfc, NFC_CMD_INT_FLAG, 0);
>> +
>> +		offset +=3D ecc->bytes + ecc->prepad;
>> +		oob +=3D ecc->bytes + ecc->prepad;
>> +	}
>> +
>> +	if (oob_required) {
>> +		cnt =3D mtd->oobsize - (oob - chip->oob_poi);
>> +		if (cnt > 0) {
>> +			chip->cmdfunc(mtd, NAND_CMD_RNDIN, offset, -1);
>> +			chip->write_buf(mtd, oob, cnt);
>> +		}
>> +	}
>> +
>> +	tmp =3D readl(nfc->regs + NFC_REG_ECC_CTL);
>> +	tmp &=3D ~(NFC_ECC_EN | NFC_ECC_PIPELINE);
>> +
>> +	writel(tmp, nfc->regs + NFC_REG_ECC_CTL);
>> +
>> +	return 0;
>> +}
>> +
>> +static int sunxi_nand_chip_set_timings(struct sunxi_nand_chip *chip,
>> +				       const struct nand_sdr_timings *timings)
>> +{
>> +	u32 min_clk_period =3D 0;
>> +
>> +	/* T1 <=3D> tCLS */
>> +	if (timings->tCLS_min > min_clk_period)
>> +		min_clk_period =3D timings->tCLS_min;
>> +
>> +	/* T2 <=3D> tCLH */
>> +	if (timings->tCLH_min > min_clk_period)
>> +		min_clk_period =3D timings->tCLH_min;
>> +
>> +	/* T3 <=3D> tCS */
>> +	if (timings->tCS_min > min_clk_period)
>> +		min_clk_period =3D timings->tCS_min;
>> +
>> +	/* T4 <=3D> tCH */
>> +	if (timings->tCH_min > min_clk_period)
>> +		min_clk_period =3D timings->tCH_min;
>> +
>> +	/* T5 <=3D> tWP */
>> +	if (timings->tWP_min > min_clk_period)
>> +		min_clk_period =3D timings->tWP_min;
>> +
>> +	/* T6 <=3D> tWH */
>> +	if (timings->tWH_min > min_clk_period)
>> +		min_clk_period =3D timings->tWH_min;
>> +
>> +	/* T7 <=3D> tALS */
>> +	if (timings->tALS_min > min_clk_period)
>> +		min_clk_period =3D timings->tALS_min;
>> +
>> +	/* T8 <=3D> tDS */
>> +	if (timings->tDS_min > min_clk_period)
>> +		min_clk_period =3D timings->tDS_min;
>> +
>> +	/* T9 <=3D> tDH */
>> +	if (timings->tDH_min > min_clk_period)
>> +		min_clk_period =3D timings->tDH_min;
>> +
>> +	/* T10 <=3D> tRR */
>> +	if (timings->tRR_min > (min_clk_period * 3))
>> +		min_clk_period =3D (timings->tRR_min + 2) / 3;
>> +
>> +	/* T11 <=3D> tALH */
>> +	if (timings->tALH_min > min_clk_period)
>> +		min_clk_period =3D timings->tALH_min;
>> +
>> +	/* T12 <=3D> tRP */
>> +	if (timings->tRP_min > min_clk_period)
>> +		min_clk_period =3D timings->tRP_min;
>> +
>> +	/* T13 <=3D> tREH */
>> +	if (timings->tREH_min > min_clk_period)
>> +		min_clk_period =3D timings->tREH_min;
>> +
>> +	/* T14 <=3D> tRC */
>> +	if (timings->tRC_min > (min_clk_period * 2))
>> +		min_clk_period =3D (timings->tRC_min + 1) / 2;
>> +
>> +	/* T15 <=3D> tWC */
>> +	if (timings->tWC_min > (min_clk_period * 2))
>> +		min_clk_period =3D (timings->tWC_min + 1) / 2;
>> +
>> +
>> +	/* min_clk_period =3D (NAND-clk-period * 2) */
>> +	if (min_clk_period < 1000)
>> +		min_clk_period =3D 1000;
>> +
>> +	min_clk_period /=3D 1000;
>> +	chip->clk_rate =3D (2 * 1000000000) / min_clk_period;
>> +
>> +	/* TODO: configure T16-T19 */
>> +
>> +	return 0;
>> +}
>> +
>> +static int sunxi_nand_chip_init_timings(struct sunxi_nand_chip *chip,
>> +					struct device_node *np)
>> +{
>> +	const struct nand_sdr_timings *timings;
>> +	int ret;
>> +	int mode;
>> +
>> +	mode =3D onfi_get_async_timing_mode(&chip->nand);
>> +	if (mode =3D=3D ONFI_TIMING_MODE_UNKNOWN) {
>> +		mode =3D of_get_nand_onfi_timing_mode(np);
>> +		if (mode < 0)
>> +			mode =3D 1;
>> +
>> +		mode =3D fls(mode) - 1;
>> +		if (mode < 0)
>> +			mode =3D 0;
>> +	} else {
>> +		uint8_t feature[ONFI_SUBFEATURE_PARAM_LEN] =3D {};
>> +		mode =3D fls(mode) - 1;
>> +		if (mode < 0)
>> +			mode =3D 0;
>> +
>> +		feature[0] =3D mode;
>> +		ret =3D chip->nand.onfi_set_features(&chip->mtd, &chip->nand,
>> +						ONFI_FEATURE_ADDR_TIMING_MODE,
>> +						feature);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	timings =3D onfi_async_timing_mode_to_sdr_timings(mode);
>> +	if (IS_ERR(timings))
>> +		return PTR_ERR(timings);
>> +
>> +	return sunxi_nand_chip_set_timings(chip, timings);
>> +}
>> +
>> +static int sunxi_nand_hw_common_ecc_ctrl_init(struct mtd_info *mtd,
>> +					      struct nand_ecc_ctrl *ecc,
>> +					      struct device_node *np)
>> +{
>> +	struct sunxi_nand_hw_ecc *data;
>> +	struct nand_ecclayout *layout;
>> +	int nsectors;
>> +	int ret;
>> +
>> +	if (!ecc->strength || !ecc->size)
>> +		return -EINVAL;
>> +
>> +	data =3D kzalloc(sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	/* Add ECC info retrieval from DT */
>> +	if (ecc->strength <=3D 16) {
>> +		ecc->strength =3D 16;
>> +		data->mode =3D 0;
>> +	} else if (ecc->strength <=3D 24) {
>> +		ecc->strength =3D 24;
>> +		data->mode =3D 1;
>> +	} else if (ecc->strength <=3D 28) {
>> +		ecc->strength =3D 28;
>> +		data->mode =3D 2;
>> +	} else if (ecc->strength <=3D 32) {
>> +		ecc->strength =3D 32;
>> +		data->mode =3D 3;
>> +	} else if (ecc->strength <=3D 40) {
>> +		ecc->strength =3D 40;
>> +		data->mode =3D 4;
>> +	} else if (ecc->strength <=3D 48) {
>> +		ecc->strength =3D 48;
>> +		data->mode =3D 5;
>> +	} else if (ecc->strength <=3D 56) {
>> +		ecc->strength =3D 56;
>> +		data->mode =3D 6;
>> +	} else if (ecc->strength <=3D 60) {
>> +		ecc->strength =3D 60;
>> +		data->mode =3D 7;
>> +	} else if (ecc->strength <=3D 64) {
>> +		ecc->strength =3D 64;
>> +		data->mode =3D 8;
>> +	} else {
>> +		pr_err("unsupported strength\n");
>
>
>> +		return -ENOTSUPP;
> You're leaking the 'data' allocated above in here.

Oops, I'll fix that.

>
>> +	}
>> +
>> +	/* HW ECC always request ECC bytes for 1024 bytes blocks */
>> +	ecc->bytes =3D ((ecc->strength * fls(8 * 1024)) + 7) / 8;
>> +
>> +	/* HW ECC always work with even numbers of ECC bytes */
>> +	if (ecc->bytes % 2)
>> +		ecc->bytes++;
>> +
>> +	layout =3D &data->layout;
>> +	nsectors =3D mtd->writesize / ecc->size;
>> +
>> +	if (mtd->oobsize < ((ecc->bytes + 4) * nsectors)) {
>> +		ret =3D -EINVAL;
>> +		goto err;
>> +	}
>> +
>> +	layout->eccbytes =3D (ecc->bytes * nsectors);
>> +
>> +	ecc->layout =3D layout;
>> +	ecc->priv =3D data;
>> +
>> +	return 0;
>> +
>> +err:
>> +	kfree(data);
>> +
>> +	return ret;
>> +}
>> +
>> +static void sunxi_nand_hw_common_ecc_ctrl_cleanup(struct nand_ecc_ctrl =
*ecc)
>> +{
>> +	kfree(ecc->priv);
>> +}
>> +
>> +static int sunxi_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
>> +				       struct nand_ecc_ctrl *ecc,
>> +				       struct device_node *np)
>> +{
>> +	struct nand_ecclayout *layout;
>> +	int nsectors;
>> +	int i, j;
>> +	int ret;
>> +
>> +	ret =3D sunxi_nand_hw_common_ecc_ctrl_init(mtd, ecc, np);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ecc->read_page =3D sunxi_nfc_hw_ecc_read_page;
>> +	ecc->write_page =3D sunxi_nfc_hw_ecc_write_page;
>> +	layout =3D ecc->layout;
>> +	nsectors =3D mtd->writesize / ecc->size;
>> +	/*
>> +	 * The first 2 bytes are used for BB markers.
>> +	 * We merge the 4 user available bytes from HW ECC with this
>> +	 * first section, hence why the + 2 operation (- 2 + 4).
>> +	 */
>> +	layout->oobfree[0].length =3D mtd->oobsize + 2 -
>> +				    ((ecc->bytes + 4) * nsectors);
>> +	layout->oobfree[0].offset =3D 2;
>> +	for (i =3D 0; i < nsectors; i++) {
>> +		/*
>> +		 * The first 4 ECC block bytes are already counted in the first
>> +		 * oobfree entry.
>> +		 */
>> +		if (i) {
>> +			layout->oobfree[i].offset =3D
>> +				layout->oobfree[i - 1].offset +
>> +				layout->oobfree[i - 1].length +
>> +				ecc->bytes;
>> +			layout->oobfree[i].length =3D 4;
>> +		}
>> +
>> +		for (j =3D 0; j < ecc->bytes; j++)
>> +			layout->eccpos[(ecc->bytes * i) + j] =3D
>> +					layout->oobfree[i].offset +
>> +					layout->oobfree[i].length + j;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int sunxi_nand_hw_syndrome_ecc_ctrl_init(struct mtd_info *mtd,
>> +						struct nand_ecc_ctrl *ecc,
>> +						struct device_node *np)
>> +{
>> +	struct nand_ecclayout *layout;
>> +	int nsectors;
>> +	int i;
>> +	int ret;
>> +
>> +	ret =3D sunxi_nand_hw_common_ecc_ctrl_init(mtd, ecc, np);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ecc->prepad =3D 4;
>> +	ecc->read_page =3D sunxi_nfc_hw_syndrome_ecc_read_page;
>> +	ecc->write_page =3D sunxi_nfc_hw_syndrome_ecc_write_page;
>> +
>> +	layout =3D ecc->layout;
>> +	nsectors =3D mtd->writesize / ecc->size;
>> +
>> +	for (i =3D 0; i < (ecc->bytes * nsectors); i++)
>> +		layout->eccpos[i] =3D i;
>> +
>> +	layout->oobfree[0].length =3D mtd->oobsize - i;
>> +	layout->oobfree[0].offset =3D i;
>> +
>> +	return 0;
>> +}
>> +
>> +static void sunxi_nand_ecc_cleanup(struct nand_ecc_ctrl *ecc)
>> +{
>> +	switch (ecc->mode) {
>> +	case NAND_ECC_HW:
>> +	case NAND_ECC_HW_SYNDROME:
>> +		sunxi_nand_hw_common_ecc_ctrl_cleanup(ecc);
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +}
>> +
>> +static int sunxi_nand_ecc_init(struct mtd_info *mtd, struct nand_ecc_ct=
rl *ecc,
>> +			       struct device_node *np)
>> +{
>> +	struct nand_chip *nand =3D mtd->priv;
>> +	int ecc_step_size, ecc_strength;
>> +	int ret;
>> +
>> +	ecc_step_size =3D of_get_nand_ecc_step_size(np);
>> +	ecc_strength =3D of_get_nand_ecc_strength(np);
>> +	if (ecc_step_size > 0 && ecc_strength > 0) {
>> +		ecc->size =3D ecc_step_size;
>> +		ecc->strength =3D ecc_strength;
>> +	} else {
>> +		ecc->size =3D nand->ecc_step_ds;
>> +		ecc->strength =3D nand->ecc_strength_ds;
>> +	}
>> +
> Shouldn't you check the devicetree value is not weaker than the ONFI-obta=
ined?

I can definitely do that.

>
>> +	ecc->mode =3D of_get_nand_ecc_mode(np);
>> +	switch (ecc->mode) {
>> +	case NAND_ECC_SOFT_BCH:
>> +		if (!ecc->size || !ecc->strength)
>> +			return -EINVAL;
>> +		ecc->bytes =3D ((ecc->strength * fls(8 * ecc->size)) + 7) / 8;
>> +		break;
>> +	case NAND_ECC_HW:
>> +		ret =3D sunxi_nand_hw_ecc_ctrl_init(mtd, ecc, np);
>> +		if (ret)
>> +			return ret;
>> +		break;
>> +	case NAND_ECC_HW_SYNDROME:
>> +		ret =3D sunxi_nand_hw_syndrome_ecc_ctrl_init(mtd, ecc, np);
>> +		if (ret)
>> +			return ret;
>> +		break;
>> +	case NAND_ECC_NONE:
>> +	case NAND_ECC_SOFT:
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *n=
fc,
>> +				struct device_node *np)
>> +{
>> +	const struct nand_sdr_timings *timings;
>> +	struct sunxi_nand_chip *chip;
>> +	struct mtd_part_parser_data ppdata;
>> +	struct mtd_info *mtd;
>> +	struct nand_chip *nand;
>> +	int nsels;
>> +	int ret;
>> +	int i;
>> +	u32 tmp;
>> +
>> +	if (!of_get_property(np, "reg", &nsels))
>> +		return -EINVAL;
>> +
>> +	nsels /=3D sizeof(u32);
>> +	if (!nsels)
>> +		return -EINVAL;
>> +
>> +	chip =3D devm_kzalloc(dev,
>> +			    sizeof(*chip) +
>> +			    (nsels * sizeof(struct sunxi_nand_chip_sel)),
>> +			    GFP_KERNEL);
>> +	if (!chip)
>> +		return -ENOMEM;
>> +
>> +	chip->nsels =3D nsels;
>> +	chip->selected =3D -1;
>> +
>> +	for (i =3D 0; i < nsels; i++) {
>> +		ret =3D of_property_read_u32_index(np, "reg", i, &tmp);
>> +		if (ret)
>> +			return ret;
>> +
>> +		if (tmp > 7)
>> +			return -EINVAL;
>> +
>> +		if (test_and_set_bit(tmp, &nfc->assigned_cs))
>> +			return -EINVAL;
>> +
>> +		chip->sels[i].cs =3D tmp;
>> +
>> +		if (!of_property_read_u32_index(np, "allwinner,rb", i, &tmp) &&
>> +		    tmp < 2) {
>> +			chip->sels[i].rb.type =3D RB_NATIVE;
>> +			chip->sels[i].rb.info.nativeid =3D tmp;
>> +		} else {
>> +			ret =3D of_get_named_gpio(np, "rb-gpios", i);
>> +			if (ret >=3D 0) {
>> +				tmp =3D ret;
>> +				chip->sels[i].rb.type =3D RB_GPIO;
>> +				chip->sels[i].rb.info.gpio =3D tmp;
>> +				ret =3D devm_gpio_request(dev, tmp, "nand-rb");
>> +				if (ret)
>> +					return ret;
>> +
>> +				ret =3D gpio_direction_input(tmp);
>> +				if (ret)
>> +					return ret;
>> +			} else {
>> +				chip->sels[i].rb.type =3D RB_NONE;
>> +			}
>> +		}
>> +	}
>> +
>> +	timings =3D onfi_async_timing_mode_to_sdr_timings(0);
>> +	if (IS_ERR(timings))
>> +		return PTR_ERR(timings);
>> +
>> +	ret =3D sunxi_nand_chip_set_timings(chip, timings);
>> +
>> +	nand =3D &chip->nand;
>> +	/* Default tR value specified in the ONFI spec (chapter 4.15.1) */
>> +	nand->chip_delay =3D 200;
>> +	nand->controller =3D &nfc->controller;
>> +	nand->select_chip =3D sunxi_nfc_select_chip;
>> +	nand->cmd_ctrl =3D sunxi_nfc_cmd_ctrl;
>> +	nand->read_buf =3D sunxi_nfc_read_buf;
>> +	nand->write_buf =3D sunxi_nfc_write_buf;
>> +	nand->read_byte =3D sunxi_nfc_read_byte;
>> +
>> +	if (of_get_nand_on_flash_bbt(np))
>> +		nand->bbt_options |=3D NAND_BBT_USE_FLASH;
>> +
>> +	mtd =3D &chip->mtd;
>> +	mtd->dev.parent =3D dev;
>> +	mtd->priv =3D nand;
>> +	mtd->owner =3D THIS_MODULE;
>> +
>> +	ret =3D nand_scan_ident(mtd, nsels, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D sunxi_nand_chip_init_timings(chip, np);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D sunxi_nand_ecc_init(mtd, &nand->ecc, np);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D nand_scan_tail(mtd);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (of_property_read_string(np, "nand-name", &mtd->name)) {
>> +		snprintf(chip->default_name, MAX_NAME_SIZE,
>> +			 DEFAULT_NAME_FORMAT, chip->sels[i].cs);
>> +		mtd->name =3D chip->default_name;
>> +	}
>> +
>> +	ppdata.of_node =3D np;
>> +	ret =3D mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
>> +	if (!ret)
> Aren't you leaking the BBT resources allocated in nand_scan_tail? I **thi=
nk**
> you need to call nand_release if the mtd device register fails.

Absolutely, I'll call nand_release before returning the error code.

>
>> +		return ret;
>> +
>> +	list_add_tail(&chip->node, &nfc->chips);
>> +
>> +	return 0;
>> +}
>> +
>> +static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *=
nfc)
>> +{
>> +	struct device_node *np =3D dev->of_node;
>> +	struct device_node *nand_np;
>> +	int nchips =3D of_get_child_count(np);
>> +	int ret;
>> +
>> +	if (nchips > 8)
>> +		return -EINVAL;
>> +
>> +	for_each_child_of_node(np, nand_np) {
>> +		ret =3D sunxi_nand_chip_init(dev, nfc, nand_np);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
>> +{
>> +	struct sunxi_nand_chip *chip;
>> +
>> +	while (!list_empty(&nfc->chips)) {
>> +		chip =3D list_first_entry(&nfc->chips, struct sunxi_nand_chip,
>> +					node);
>> +		nand_release(&chip->mtd);
>> +		sunxi_nand_ecc_cleanup(&chip->nand.ecc);
>> +	}
>> +}
>> +
>> +static int sunxi_nfc_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev =3D &pdev->dev;
>> +	struct resource *r;
>> +	struct sunxi_nfc *nfc;
>> +	int ret;
>> +
>> +	nfc =3D devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
>> +	if (!nfc) {
>> +		dev_err(dev, "failed to allocate NFC struct\n");
> OOM message not needed.

I'll drop it.

>
>> +		return -ENOMEM;
>> +	}
>> +
>> +	spin_lock_init(&nfc->controller.lock);
>> +	init_waitqueue_head(&nfc->controller.wq);
>> +	INIT_LIST_HEAD(&nfc->chips);
>> +
>> +	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	nfc->regs =3D devm_ioremap_resource(dev, r);
>> +	if (IS_ERR(nfc->regs)) {
>> +		dev_err(dev, "failed to remap iomem\n");
> Message not needed, see devm_ioremap_resource() documentation.

ditto.

>
>> +		return PTR_ERR(nfc->regs);
>> +	}
>> +
>> +	nfc->irq =3D platform_get_irq(pdev, 0);
>> +	if (nfc->irq < 0) {
>> +		dev_err(dev, "failed to retrieve irq\n");
>> +		return nfc->irq;
>> +	}
>> +
>> +	nfc->ahb_clk =3D devm_clk_get(dev, "ahb_clk");
>> +	if (IS_ERR(nfc->ahb_clk)) {
>> +		dev_err(dev, "failed to retrieve ahb_clk\n");
>> +		return PTR_ERR(nfc->ahb_clk);
>> +	}
>> +
>> +	ret =3D clk_prepare_enable(nfc->ahb_clk);
>> +	if (ret)
>> +		return ret;
>> +
>> +	nfc->sclk =3D devm_clk_get(dev, "sclk");
>> +	if (IS_ERR(nfc->sclk)) {
>> +		dev_err(dev, "failed to retrieve nand_clk\n");
>> +		ret =3D PTR_ERR(nfc->sclk);
>> +		goto out_ahb_clk_unprepare;
>> +	}
>> +
>> +	ret =3D clk_prepare_enable(nfc->sclk);
>> +	if (ret)
>> +		goto out_ahb_clk_unprepare;
>> +
>> +	/* Reset NFC */
>> +	writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RESET,
>> +	       nfc->regs + NFC_REG_CTL);
>> +	while (readl(nfc->regs + NFC_REG_CTL) & NFC_RESET)
>> +		;
> Again: maybe you should avoid potentially infinite loop, no matter what.
>
>> +
>> +	writel(0, nfc->regs + NFC_REG_INT);
>> +	ret =3D devm_request_irq(dev, nfc->irq, sunxi_nfc_interrupt,
>> +			       0, "sunxi-nand", nfc);
>> +	if (ret)
>> +		goto out_sclk_unprepare;
>> +
>> +	platform_set_drvdata(pdev, nfc);
>> +
>> +	writel(0x100, nfc->regs + NFC_REG_TIMING_CTL);
>> +	writel(0x7ff, nfc->regs + NFC_REG_TIMING_CFG);
> Hm... can you remove the magic numbers?

I wish I could, but unfortunately I don't enough information from the
datasheet and reverse engineering work to know what these registers are
used for and these value encodes.

I'll add a TODO comment to state that we're missing informations here
and that it should be reworked as soon as we get these informations.

>
>> +
>> +	ret =3D sunxi_nand_chips_init(dev, nfc);
>> +	if (ret) {
>> +		dev_err(dev, "failed to init nand chips\n");
>> +		goto out_sclk_unprepare;
>> +	}
>> +
>> +	return 0;
>> +
>> +out_sclk_unprepare:
>> +	clk_disable_unprepare(nfc->sclk);
>> +out_ahb_clk_unprepare:
>> +	clk_disable_unprepare(nfc->ahb_clk);
>> +
>> +	return ret;
>> +}
>> +
>> +static int sunxi_nfc_remove(struct platform_device *pdev)
>> +{
>> +	struct sunxi_nfc *nfc =3D platform_get_drvdata(pdev);
>> +
>> +	sunxi_nand_chips_cleanup(nfc);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id sunxi_nfc_ids[] =3D {
>> +	{ .compatible =3D "allwinner,sun4i-nand" },
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, sunxi_nfc_ids);
>> +
>> +static struct platform_driver sunxi_nfc_driver =3D {
>> +	.driver =3D {
>> +		.name =3D "sunxi_nand",
>> +		.owner =3D THIS_MODULE,
>> +		.of_match_table =3D of_match_ptr(sunxi_nfc_ids),
> Redundant of_match_ptr. See 5576bc7bef2919dd2b185bffb768bf9c0da76788.

I'll drop it.

>
> I think that's all I can spot, without knowing the hardware details.


Thanks a lot for your review.

Best Regards,

Boris

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
