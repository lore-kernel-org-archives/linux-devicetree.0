From: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH pre-v3 08/14] mtd: nand: add sunxi NAND
 flash controller support
Date: Thu, 30 Jan 2014 16:04:38 +0100
Message-ID: <52EA6A06.3020801@gmail.com>
References: <1391006064-28890-1-git-send-email-b.brezillon.dev@gmail.com> <1391089176-8147-1-git-send-email-b.brezillon.dev@gmail.com> <20140130143641.GZ15937@n2100.arm.linux.org.uk>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDE6NB73YAMBBDWUVGLQKGQESFOWWKQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140130143641.GZ15937-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Russel,

On 30/01/2014 15:36, Russell King - ARM Linux wrote:
> Boris,
>
> Can you please explain to me why you mail all your patches _To:_ me?
> As in, why do I appear in the To: line of all the patches you seem to
> mail out, whether or not they're relevant to me.  I see this very
> regularly from you - virtually all patches I see on the LAKML mailing
> list from you are always sent To: me as well.
>
> Take for instance this one.  It doesn't match up with anything in
> MAINTAINERS for me.  It doesn't even touch a file that I've touched.
> Yet somehow you think that I should be in the To: header.
>
> Being in the To: header means that you expect the recipient to do
> something with your email.  The Cc: header is to circulate copies of
> your email to people who may be interested.
>
> I'm neither for this stuff.  Please stop this.

Sorry for the inconvenience.

I'm using get_maintainer.pl script to retrieve the list of concerned
people, and you appears in that list for patches 10,11,12 and 14 of this
series.
Moreover I was told to send the whole series (not just specific patches
to people who might be concerned).

I obviously misuse this script, so please tell me how I should know which
patch I should send to whom.

Thanks.

Best Regards,

Boris

>
> Thanks.
>
> On Thu, Jan 30, 2014 at 02:39:36PM +0100, Boris BREZILLON wrote:
>> Add support for the sunxi NAND Flash Controller (NFC).
>>
>> Signed-off-by: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> Hello,
>>
>> This version fixes a bug in the R/B GPIO config block.
>> The timing config order is now respected, but I'll wait for Jason work
>> regarding timing config in NAND core code before posting the 3rd version
>> of this series.
>>
>> Best Regards,
>>
>> Boris
>>
>> Changes since v2:
>>   - fix R/B GPIO retrieval/config bug
>>   - fix timings configuration order (set mode 0 -> scan -> set best supp=
orted
>>     mode)
>>
>>   drivers/mtd/nand/Kconfig      |    6 +
>>   drivers/mtd/nand/Makefile     |    1 +
>>   drivers/mtd/nand/sunxi_nand.c |  758 +++++++++++++++++++++++++++++++++=
++++++++
>>   3 files changed, 765 insertions(+)
>>   create mode 100644 drivers/mtd/nand/sunxi_nand.c
>>
>> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>> index 93ae6a6..784dd42 100644
>> --- a/drivers/mtd/nand/Kconfig
>> +++ b/drivers/mtd/nand/Kconfig
>> @@ -510,4 +510,10 @@ config MTD_NAND_XWAY
>>   	  Enables support for NAND Flash chips on Lantiq XWAY SoCs. NAND is a=
ttached
>>   	  to the External Bus Unit (EBU).
>>  =20
>> +config MTD_NAND_SUNXI
>> +	tristate "Support for NAND on Allwinner SoCs"
>> +	depends on ARCH_SUNXI
>> +	help
>> +	  Enables support for NAND Flash chips on Allwinner SoCs.
>> +
>>   endif # MTD_NAND
>> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
>> index bbea7a6..e3b4a34 100644
>> --- a/drivers/mtd/nand/Makefile
>> +++ b/drivers/mtd/nand/Makefile
>> @@ -49,5 +49,6 @@ obj-$(CONFIG_MTD_NAND_JZ4740)		+=3D jz4740_nand.o
>>   obj-$(CONFIG_MTD_NAND_GPMI_NAND)	+=3D gpmi-nand/
>>   obj-$(CONFIG_MTD_NAND_XWAY)		+=3D xway_nand.o
>>   obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+=3D bcm47xxnflash/
>> +obj-$(CONFIG_MTD_NAND_SUNXI)		+=3D sunxi_nand.o
>>  =20
>>   nand-objs :=3D nand_base.o nand_bbt.o
>> diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand=
.c
>> new file mode 100644
>> index 0000000..1014b2a
>> --- /dev/null
>> +++ b/drivers/mtd/nand/sunxi_nand.c
>> @@ -0,0 +1,758 @@
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
>> +enum sunxi_nand_rb_type {
>> +	RB_NONE,
>> +	RB_NATIVE,
>> +	RB_GPIO,
>> +};
>> +
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
>> +struct sunxi_nand_chip {
>> +	struct list_head node;
>> +	struct nand_chip nand;
>> +	struct mtd_info mtd;
>> +	char default_name[MAX_NAME_SIZE];
>> +	unsigned long clk_rate;
>> +	int selected;
>> +	int nsels;
>> +	struct sunxi_nand_chip_sel sels[0];
>> +};
>> +
>> +static inline struct sunxi_nand_chip *to_sunxi_nand(struct mtd_info *mt=
d)
>> +{
>> +	return container_of(mtd, struct sunxi_nand_chip, mtd);
>> +}
>> +
>> +struct sunxi_nfc {
>> +	struct nand_hw_control controller;
>> +	void __iomem *regs;
>> +	int irq;
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
>> +	else if (!wait_for_completion_timeout(&nfc->complete,
>> +					      msecs_to_jiffies(timeout_ms)))
>> +		return -ETIMEDOUT;
>> +
>> +	return 0;
>> +}
>> +
>> +static int sunxi_nfc_dev_ready(struct mtd_info *mtd)
>> +{
>> +	struct sunxi_nand_chip *sunxi_nand =3D to_sunxi_nand(mtd);
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
>> +		dev_err(&mtd->dev, "cannot check R/B NAND status!");
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static void sunxi_nfc_select_chip(struct mtd_info *mtd, int chip)
>> +{
>> +	struct sunxi_nand_chip *sunxi_nand =3D to_sunxi_nand(mtd);
>> +	struct nand_chip *nand =3D &sunxi_nand->nand;
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
>> +	struct sunxi_nand_chip *sunxi_nand =3D to_sunxi_nand(mtd);
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
>> +	struct sunxi_nand_chip *sunxi_nand =3D to_sunxi_nand(mtd);
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
>> +	struct sunxi_nand_chip *sunxi_nand =3D to_sunxi_nand(mtd);
>> +	struct sunxi_nfc *nfc =3D to_sunxi_nfc(sunxi_nand->nand.controller);
>> +	u32 tmp;
>> +
>> +	while ((readl(nfc->regs + NFC_REG_ST) & NFC_CMD_FIFO_STATUS))
>> +		;
>> +
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
>> +
>> +	ret =3D onfi_get_async_timing_mode(&chip->nand);
>> +	if (ret =3D=3D ONFI_TIMING_MODE_UNKNOWN) {
>> +		ret =3D of_get_nand_onfi_timing_mode(np);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> +
>> +	ret =3D fls(ret);
>> +	if (!ret)
>> +		return -EINVAL;
>> +
>> +	timings =3D onfi_async_timing_mode_to_sdr_timings(ret - 1);
>> +	if (IS_ERR(timings))
>> +		return PTR_ERR(timings);
>> +
>> +	return sunxi_nand_chip_set_timings(chip, timings);
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
>> +	u32 strength;
>> +	u32 blk_size;
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
>> +	nand->controller =3D &nfc->controller;
>> +	nand->select_chip =3D sunxi_nfc_select_chip;
>> +	nand->cmd_ctrl =3D sunxi_nfc_cmd_ctrl;
>> +	nand->read_buf =3D sunxi_nfc_read_buf;
>> +	nand->write_buf =3D sunxi_nfc_write_buf;
>> +	nand->read_byte =3D sunxi_nfc_read_byte;
>> +
>> +	nand->ecc.mode =3D of_get_nand_ecc_mode(np);
>> +	if (of_get_nand_on_flash_bbt(np))
>> +		nand->bbt_options |=3D NAND_BBT_USE_FLASH;
>> +
>> +	mtd =3D &chip->mtd;
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
>> +	if (nand->ecc.mode =3D=3D NAND_ECC_SOFT_BCH) {
>> +		if (!of_get_nand_ecc_level(np, &strength, &blk_size)) {
>> +			nand->ecc_step_ds =3D blk_size;
>> +			nand->ecc_strength_ds =3D strength;
>> +		}
>> +
>> +		nand->ecc.size =3D nand->ecc_step_ds;
>> +		nand->ecc.bytes =3D (((nand->ecc_strength_ds *
>> +				     fls(8 * nand->ecc_step_ds)) + 7) / 8);
>> +	}
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
>> +	},
>> +	.probe =3D sunxi_nfc_probe,
>> +};
>> +module_platform_driver(sunxi_nfc_driver);
>> +
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_AUTHOR("Boris BREZILLON");
>> +MODULE_DESCRIPTION("Allwinner NAND Flash Controller driver");
>> +MODULE_ALIAS("platform:sunxi_nfc");
>> --=20
>> 1.7.9.5
>>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/groups/opt_out.
