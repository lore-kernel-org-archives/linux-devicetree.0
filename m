From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] mtd: nand: driver for Conexant Digicolor NAND Flash
 Controller
Date: Thu, 19 Feb 2015 00:17:04 +0100
Message-ID: <20150219001704.40874da0@bbrezillon>
References: <e6a998f130c40cee0a72e23b4f7f65bece0d6b21.1423739332.git.baruch@tkos.co.il>
	<ffec2fc232083355fdb171efb9daf59686ac2fed.1423739332.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ffec2fc232083355fdb171efb9daf59686ac2fed.1423739332.git.baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Baruch,

On Thu, 12 Feb 2015 13:10:19 +0200
Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> wrote:

> This commit adds driver for the NAND flash controller on the CX92755 =
SoC. This
> SoC is one of the Conexant Digicolor series, and this driver should s=
upport
> other SoCs in this series.

I haven't done any coding style review here, so make sure to fix
all errors/warnings reported by checkpatch if any.

>=20
> Only hardware syndrome ECC mode is currently supported.
>=20
> This driver was tested on the Equinox CX92755 EVK, with the Samsung K=
9GAG08U0E
> NAND chip (MLC, 8K pages, 436 bytes OOB). Test included attach of UBI=
 volume,
> mount of UBIFS filesystem, and files read/write.

Could you also run mtd test (kernel module tests) and provide their
results in your next version ?

>=20
> Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
> ---
>  drivers/mtd/nand/Kconfig          |   6 +
>  drivers/mtd/nand/Makefile         |   1 +
>  drivers/mtd/nand/digicolor_nand.c | 616 ++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 623 insertions(+)
>  create mode 100644 drivers/mtd/nand/digicolor_nand.c
>=20
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 7d0150d20432..035f0078e62e 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -524,4 +524,10 @@ config MTD_NAND_SUNXI
>  	help
>  	  Enables support for NAND Flash chips on Allwinner SoCs.
> =20
> +config MTD_NAND_DIGICOLOR
> +	tristate "Support for NAND on Conexant Digicolor SoCs"
> +	depends on ARCH_DIGICOLOR
> +	help
> +	  Enables support for NAND Flash chips on Conexant Digicolor SoCs.
> +
>  endif # MTD_NAND
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index bd38f21d2e28..e7fd578123cd 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -51,5 +51,6 @@ obj-$(CONFIG_MTD_NAND_GPMI_NAND)	+=3D gpmi-nand/
>  obj-$(CONFIG_MTD_NAND_XWAY)		+=3D xway_nand.o
>  obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+=3D bcm47xxnflash/
>  obj-$(CONFIG_MTD_NAND_SUNXI)		+=3D sunxi_nand.o
> +obj-$(CONFIG_MTD_NAND_DIGICOLOR)	+=3D digicolor_nand.o
> =20
>  nand-objs :=3D nand_base.o nand_bbt.o nand_timings.o
> diff --git a/drivers/mtd/nand/digicolor_nand.c b/drivers/mtd/nand/dig=
icolor_nand.c
> new file mode 100644
> index 000000000000..5249953c7eba
> --- /dev/null
> +++ b/drivers/mtd/nand/digicolor_nand.c
> @@ -0,0 +1,616 @@
> +/*
> + *  Driver for Conexant Digicolor NAND Flash Controller
> + *
> + * Author: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
> + *
> + * Copyright (C) 2014, 2015 Paradox Innovation Ltd.
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_mtd.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +
> +#define DRIVER_NAME "digicolor_nand"
> +
> +#define NFC_CONTROL			0x180
> +#define NFC_CONTROL_LOCAL_RESET		BIT(0)
> +#define NFC_CONTROL_ENABLE		BIT(1)
> +#define NFC_CONTROL_BCH_TCONFIG(n)	((n) << 13)
> +#define NFC_CONTROL_BCH_KCONFIG		(77 << 16)
> +#define NFC_CONTROL_BCH_DATA_FIELD_RANGE_1024	BIT(30)
> +
> +#define NFC_STATUS_1			0x18c
> +#define NFC_STATUS_1_CORRECTABLE_ERRORS(reg)	(((reg) >> 16) & 0x7ff)
> +#define NFC_STATUS_1_UNCORRECTED_ERROR	BIT(31)
> +
> +#define NFC_COMMAND			0x1a0
> +#define NFC_COMMAND_CODE_OFF		28
> +#define CMD_CHIP_ENABLE(n)		((~(1 << (n)) & 0xf) << 20)
> +#define CMD_STOP_ON_COMPLETE		BIT(15)
> +#define CMD_ECC_ENABLE			BIT(13)
> +#define CMD_TOGGLE			BIT(13) /* WAIT READY command */
> +#define CMD_ECC_STATUS			BIT(12)
> +#define CMD_RB_DATA			BIT(12) /* WAIT READY command */
> +#define CMD_NUMBER_BYTES(n)		((n) << 8) /* ALE command */

Unless you have good reason to keep this name I would name it
CMD_ADDR_CYCLES.

> +#define CMD_SKIP_LENGTH(n)		(((n) & 0xf) << 8) /* READ/WRITE */
> +#define CMD_SKIP_OFFSET(n)		((n) << 16)
> +#define CMD_RB_MASK(n)			((1 << (n)) & 0xf)
> +#define CMD_IMMEDIATE_DATA		0xff /* bad block mark */
> +
> +#define CMD_CLE				(0 << NFC_COMMAND_CODE_OFF)
> +#define CMD_ALE				(1 << NFC_COMMAND_CODE_OFF)
> +#define CMD_PAGEREAD			(2 << NFC_COMMAND_CODE_OFF)
> +#define CMD_PAGEWRITE			(3 << NFC_COMMAND_CODE_OFF)
> +#define CMD_WAITREADY			(4 << NFC_COMMAND_CODE_OFF)
> +#define CMD_WAIT			(5 << NFC_COMMAND_CODE_OFF)
> +
> +#define NFC_DATA			0x1c0
> +#define ALE_DATA_OFF(n)			(((n)-1)*8)
> +
> +#define NFC_TIMING_CONFIG		0x1c4
> +#define TIMING_ASSERT(clk)		((clk) & 0xff)
> +#define TIMING_DEASSERT(clk)		(((clk) & 0xff) << 8)
> +#define TIMING_SAMPLE(clk)		(((clk) & 0xf) << 24)
> +
> +#define NFC_INTFLAG_CLEAR		0x1c8
> +#define NFC_INT_CMDREG_READY		BIT(8)
> +#define NFC_INT_READ_DATAREG_READY	BIT(9)
> +#define NFC_INT_WRITE_DATAREG_READY	BIT(10)
> +#define NFC_INT_COMMAND_COMPLETE	BIT(11)
> +#define NFC_INT_ECC_STATUS_READY	BIT(12)
> +
> +/* IO registers operations */
> +enum { CMD, DATA_READ, DATA_WRITE, ECC_STATUS };
> +
> +#define INITIAL_TCCS	500 /* ns; from the ONFI spec version 4.0, =C2=A7=
4.17.1 */
> +#define TIMEOUT_MS	100
> +
> +struct digicolor_nfc {
> +	void __iomem		*regs;
> +	struct mtd_info		mtd;
> +	struct nand_chip	nand;
> +	struct device		*dev;
> +
> +	unsigned long		clk_rate;
> +
> +	u32 ale_cmd;
> +	u32 ale_data;
> +	int ale_data_bytes;
> +
> +	u32 nand_cs;
> +	int t_ccs;
> +};

Sorry, you're the first one I'll bother with this.
Even if most drivers are already mixing the NAND chips and NAND
controller concepts, I really think those 2 elements should be properly
separated.

Correct me if I'm wrong, but I'm pretty sure _nfc stands for NAND Flash
Controller, and as such, NFC related fields should be part of your NAND
controller implementation (inherited from the struct nand_hw_control)
and not your NAND chip implementation (inherited from nand_chip).

If you need an example of such NAND chip/NAND controller separation,
you can take a look at the sunxi driver ;-).=20

> +
> +/*
> + * Table of BCH configuration options. The index of this table (0 - =
5) is set
> + * in the BchTconfig field of the NFC_CONTROL register.
> + */
> +struct bch_configs_t {

I haven't seen any struct defined with an _t, AFAIK _t are reserved for
typedef definitions.

> +	int bits;	/* correctable error bits number (strength) per step */
> +	int r_bytes;	/* extra bytes needed per step */
> +} bch_configs[] =3D {
> +	{  6, 11 },
> +	{  7, 13 },
> +	{  8, 14 },
> +	{ 24, 42 },
> +	{ 28, 49 },
> +	{ 30, 53 },
> +};

Just giving my opinion here, but I don't like when values assignment
and struct (or type) definitions are mixed.

> +
> +static int digicolor_nfc_buf_blank(const uint8_t *buf, int len)
> +{
> +	const uint32_t *p =3D (const uint32_t *)buf;
> +	int i;
> +
> +	for (i =3D 0; i < (len >> 2); i++)
> +		if (p[i] !=3D 0xffffffff)
> +			return 0;
> +
> +	return 1;
> +}
> +
> +static bool digicolor_nfc_ready(struct digicolor_nfc *nfc, u32 mask)
> +{
> +	u32 status =3D readl_relaxed(nfc->regs + NFC_INTFLAG_CLEAR);
> +
> +	return !!(status & mask);
> +}
> +
> +static int digicolor_nfc_wait_ready(struct digicolor_nfc *nfc, int o=
p)
> +{
> +	unsigned long timeout =3D jiffies + msecs_to_jiffies(TIMEOUT_MS);
> +	u32 mask;
> +
> +	switch (op) {
> +	case CMD:		mask =3D NFC_INT_CMDREG_READY; break;
> +	case DATA_READ:		mask =3D NFC_INT_READ_DATAREG_READY; break;
> +	case DATA_WRITE:	mask =3D NFC_INT_WRITE_DATAREG_READY; break;
> +	case ECC_STATUS:	mask =3D NFC_INT_ECC_STATUS_READY; break;
> +	}

I had a look at digicolor_nfc_wait_ready callers, and IMHO this
op -> mask conversion is pretty much useless.
Callers already know what they expect and could easily pass flags
directly.

> +
> +	do {
> +		if (digicolor_nfc_ready(nfc, mask))
> +			return 0;
> +	} while (time_before(jiffies, timeout));
> +
> +	dev_err(nfc->dev, "register ready (op: %d) timeout\n", op);
> +	return -ETIMEDOUT;
> +}
> +
> +static void digicolor_nfc_cmd_write(struct digicolor_nfc *nfc, u32 d=
ata)
> +{
> +	if (digicolor_nfc_wait_ready(nfc, CMD))
> +		return;
> +	writel_relaxed(data, nfc->regs + NFC_COMMAND);

Are you sure you shouldn't provide a return code here ?
If the wait_ready call times out, you're just assuming it succeed,
which is not really safe.

> +}
> +
> +static int digicolor_nfc_ecc_status(struct digicolor_nfc *nfc)
> +{
> +	u32 status;
> +
> +	if (digicolor_nfc_wait_ready(nfc, ECC_STATUS))
> +		return -1;

		return -ETIMEDOUT

would be more appropriate (or just returning the
digicolor_nfc_wait_ready result if it's not 0).

> +
> +	status =3D readl_relaxed(nfc->regs + NFC_STATUS_1);
> +	writel_relaxed(NFC_INT_ECC_STATUS_READY, nfc->regs + NFC_INTFLAG_CL=
EAR);
> +
> +	if (status & NFC_STATUS_1_UNCORRECTED_ERROR)
> +		return -1;

		return -EIO;

(or something else, but I don't recall).

> +
> +	return NFC_STATUS_1_CORRECTABLE_ERRORS(status);
> +}
> +
> +static void digicolor_nfc_wait_ns(struct digicolor_nfc *nfc, int wai=
t_ns)
> +{
> +	uint64_t tmp =3D ((uint64_t) nfc->clk_rate * wait_ns);
> +	u8 clk;
> +
> +	do_div(tmp, NSEC_PER_SEC);
> +	clk =3D tmp > 0xff ? 0xff : tmp;
> +	digicolor_nfc_cmd_write(nfc, CMD_WAIT | clk);
> +}
> +
> +static int digicolor_nfc_dev_ready(struct mtd_info *mtd)
> +{
> +	struct nand_chip *chip =3D mtd->priv;
> +	struct digicolor_nfc *nfc =3D chip->priv;
> +	u32 readready;
> +	u32 cs =3D nfc->nand_cs;
> +
> +	readready =3D CMD_WAITREADY | CMD_CHIP_ENABLE(cs) | CMD_RB_MASK(cs)
> +		| CMD_TOGGLE | CMD_RB_DATA;
> +	digicolor_nfc_cmd_write(nfc, readready);
> +
> +	return 1;

Is your device always ready ? What if your digicolor_nfc_cmd_write
timed out ?

> +}
> +
> +static void digicolor_nfc_cmd_ctrl(struct mtd_info *mtd, int cmd,
> +				   unsigned int ctrl)
> +{
> +	struct nand_chip *chip =3D mtd->priv;
> +	struct digicolor_nfc *nfc =3D chip->priv;
> +	u32 cs =3D nfc->nand_cs;
> +
> +	if (ctrl & NAND_CLE) {
> +		digicolor_nfc_cmd_write(nfc,
> +					CMD_CLE | CMD_CHIP_ENABLE(cs) | cmd);
> +		if (cmd =3D=3D NAND_CMD_RNDOUTSTART || cmd =3D=3D NAND_CMD_RNDIN) =
{
> +			digicolor_nfc_wait_ns(nfc, nfc->t_ccs);
> +		} else if (cmd =3D=3D NAND_CMD_RESET) {
> +			digicolor_nfc_wait_ns(nfc, 200);
> +			digicolor_nfc_dev_ready(mtd);
> +		}

These wait and dev_ready calls are supposed to be part of the generic
cmdfunc implementation, did you encounter any issues when relying on th=
e
default implementation ?

> +	} else if (ctrl & NAND_ALE) {
> +		if (ctrl & NAND_CTRL_CHANGE) {
> +			/* First ALE data byte */
> +			nfc->ale_cmd =3D CMD_ALE | CMD_CHIP_ENABLE(cs)
> +				| (cmd & 0xff);
> +			nfc->ale_data_bytes++;
> +			return;
> +		}
> +		/* More ALE data bytes. Assume no more than 5 address cycles */
> +		nfc->ale_data |=3D cmd << ALE_DATA_OFF(nfc->ale_data_bytes++);
> +		return;
> +	} else if (nfc->ale_data_bytes > 0) {
> +		/* Finish ALE */
> +		nfc->ale_cmd |=3D CMD_NUMBER_BYTES(nfc->ale_data_bytes - 1);
> +		digicolor_nfc_cmd_write(nfc, nfc->ale_cmd);
> +		if (nfc->ale_data_bytes > 1)
> +			digicolor_nfc_cmd_write(nfc, nfc->ale_data);
> +		nfc->ale_data_bytes =3D nfc->ale_data =3D 0;
> +	}
> +}
> +
> +static uint8_t digicolor_nfc_rw_byte(struct digicolor_nfc *nfc, int =
byte)
> +{
> +	bool read =3D (byte =3D=3D -1);
> +	u32 cs =3D nfc->nand_cs;
> +
> +	digicolor_nfc_cmd_write(nfc, read ? CMD_PAGEREAD : CMD_PAGEWRITE
> +				| CMD_CHIP_ENABLE(cs));
> +	digicolor_nfc_cmd_write(nfc, 1);
> +
> +	if (digicolor_nfc_wait_ready(nfc, read ? DATA_READ : DATA_WRITE))
> +		return 0;
> +
> +	if (read)
> +		return readl_relaxed(nfc->regs + NFC_DATA);
> +	else
> +		writel_relaxed(byte & 0xff, nfc->regs + NFC_DATA);
> +
> +	return 0;
> +}

Is there a real need to keep read and write handling in the same
function ?
You're testing twice the operation type in a ~10 lines function.
Just move the appropriate code in the following functions.

> +
> +static uint8_t digicolor_nfc_read_byte(struct mtd_info *mtd)
> +{
> +	struct nand_chip *chip =3D mtd->priv;
> +	struct digicolor_nfc *nfc =3D chip->priv;
> +
> +	return digicolor_nfc_rw_byte(nfc, -1);
> +}
> +
> +static void digicolor_nfc_write_byte(struct mtd_info *mtd, uint8_t b=
yte)
> +{
> +	struct nand_chip *chip =3D mtd->priv;
> +	struct digicolor_nfc *nfc =3D chip->priv;
> +
> +	digicolor_nfc_rw_byte(nfc, byte);
> +}
> +
> +static void digicolor_nfc_rw_buf(struct digicolor_nfc *nfc, uint8_t =
*read_buf,
> +				 const uint8_t *write_buf, int len, bool ecc)
> +{
> +	uint32_t *pr =3D (uint32_t *)read_buf;
> +	const uint32_t *pw =3D (const uint32_t *)write_buf;
> +	u32 cs =3D nfc->nand_cs;
> +	int op =3D read_buf ? DATA_READ : DATA_WRITE;
> +	int i;
> +	u32 cmd, data, buf_tail;
> +
> +	cmd =3D read_buf ? CMD_PAGEREAD : CMD_PAGEWRITE;
> +	cmd |=3D CMD_CHIP_ENABLE(cs);
> +	data =3D len & 0xffff;
> +	if (ecc) {
> +		cmd |=3D CMD_ECC_ENABLE | CMD_SKIP_LENGTH(1);
> +		if (op =3D=3D DATA_READ)
> +			cmd |=3D CMD_ECC_STATUS;
> +		if (op =3D=3D DATA_WRITE)
> +			cmd |=3D CMD_IMMEDIATE_DATA;
> +		data |=3D CMD_SKIP_OFFSET(nfc->mtd.writesize);
> +	}
> +
> +	digicolor_nfc_cmd_write(nfc, cmd);
> +	digicolor_nfc_cmd_write(nfc, data);
> +
> +	while (len >=3D 4) {
> +		if (digicolor_nfc_wait_ready(nfc, op))
> +			return;
> +		if (op =3D=3D DATA_READ)
> +			*pr++ =3D readl_relaxed(nfc->regs + NFC_DATA);
> +		else
> +			writel_relaxed(*pw++, nfc->regs + NFC_DATA);
> +		len -=3D 4;
> +	}

How about using readsl/writesl here (instead of this loop) ?

> +
> +	if (len > 0) {
> +		if (digicolor_nfc_wait_ready(nfc, op))
> +			return;
> +		if (op =3D=3D DATA_READ)
> +			buf_tail =3D readl_relaxed(nfc->regs + NFC_DATA);
> +		for (i =3D 0; i < len; i++) {
> +			u8 *tr =3D (u8 *)pr;
> +			const u8 *tw =3D (const u8 *)pw;
> +
> +			if (op =3D=3D DATA_READ) {
> +				tr[i] =3D buf_tail & 0xff;
> +				buf_tail >>=3D 8;
> +			} else {
> +				buf_tail <<=3D 8;
> +				buf_tail |=3D tw[i];
> +			}
> +		}

I still don't get that part, but I guess you have a good reason for
doing that.
Could add a comment explaining what you're doing and why you're doing
it ?

> +		if (op =3D=3D DATA_WRITE)
> +			writel_relaxed(buf_tail, nfc->regs + NFC_DATA);
> +	}
> +}

Again, the code in this function should be dispatched in the
digicolor_nfc_read/write_buf functions.

> +
> +static void digicolor_nfc_read_buf(struct mtd_info *mtd, uint8_t *bu=
f, int len)
> +{
> +	struct nand_chip *chip =3D mtd->priv;
> +	struct digicolor_nfc *nfc =3D chip->priv;
> +
> +	digicolor_nfc_rw_buf(nfc, buf, NULL, len, false);
> +}
> +
> +static void digicolor_nfc_write_buf(struct mtd_info *mtd, const uint=
8_t *buf,
> +				    int len)
> +{
> +	struct nand_chip *chip =3D mtd->priv;
> +	struct digicolor_nfc *nfc =3D chip->priv;
> +
> +	digicolor_nfc_rw_buf(nfc, NULL, buf, len, false);
> +}
> +
> +static int digicolor_nfc_read_page_syndrome(struct mtd_info *mtd,
> +					    struct nand_chip *chip,
> +					    uint8_t *buf, int oob_required,
> +					    int page)
> +{
> +	struct digicolor_nfc *nfc =3D chip->priv;
> +	int step, ecc_stat;
> +	struct nand_oobfree *oobfree =3D &chip->ecc.layout->oobfree[0];
> +	u8 *oob =3D chip->oob_poi + oobfree->offset;
> +	unsigned int max_bitflips =3D 0;
> +
> +	for (step =3D 0; step < chip->ecc.steps; step++) {
> +		digicolor_nfc_rw_buf(nfc, buf, NULL, chip->ecc.size, true);
> +
> +		ecc_stat =3D digicolor_nfc_ecc_status(nfc);

If the returned error is a timeout you might want to stop the whole
operation.

> +		if (ecc_stat < 0 &&
> +		    !digicolor_nfc_buf_blank(buf, chip->ecc.size)) {
> +			mtd->ecc_stats.failed++;
> +		} else if (ecc_stat > 0) {
> +			mtd->ecc_stats.corrected +=3D ecc_stat;
> +			max_bitflips =3D max_t(unsigned int, max_bitflips,
> +					     ecc_stat);
> +		}
> +
> +		buf +=3D chip->ecc.size;
> +	}
> +
> +	if (oob_required)
> +		digicolor_nfc_rw_buf(nfc, oob, NULL, oobfree->length, false);
> +
> +	return max_bitflips;
> +}
> +
> +static int digicolor_nfc_write_page_syndrome(struct mtd_info *mtd,
> +					     struct nand_chip *chip,
> +					     const uint8_t *buf,
> +					     int oob_required)
> +{
> +	struct digicolor_nfc *nfc =3D chip->priv;
> +	struct nand_oobfree *oobfree =3D &chip->ecc.layout->oobfree[0];
> +	u8 *oob =3D chip->oob_poi + oobfree->offset;
> +
> +	digicolor_nfc_rw_buf(nfc, NULL, buf, mtd->writesize, true);
> +
> +	if (oob_required)
> +		digicolor_nfc_rw_buf(nfc, NULL, oob, oobfree->length, false);
> +
> +	return 0;
> +}
> +
> +static int digicolor_nfc_read_oob_syndrome(struct mtd_info *mtd,
> +					   struct nand_chip *chip, int page)
> +{
> +	struct digicolor_nfc *nfc =3D chip->priv;
> +
> +	chip->cmdfunc(mtd, NAND_CMD_READ0, mtd->writesize, page);
> +	digicolor_nfc_rw_buf(nfc, chip->oob_poi, NULL, mtd->oobsize, false)=
;
> +
> +	return 0;
> +}
> +
> +static void digicolor_nfc_hw_init(struct digicolor_nfc *nfc)
> +{
> +	unsigned int ns_per_clk =3D NSEC_PER_SEC / nfc->clk_rate;
> +	u32 timing =3D 0;
> +
> +	writel_relaxed(NFC_CONTROL_LOCAL_RESET, nfc->regs + NFC_CONTROL);
> +	udelay(10);
> +	writel_relaxed(0, nfc->regs + NFC_CONTROL);
> +	udelay(5);
> +	/*
> +	 * Maximum assert/deassert time; asynchronous SDR mode 0
> +	 * Deassert time =3D max(tWH,tREH) =3D 30ns
> +	 * Assert time =3D max(tRC,tRP,tWC,tWP) =3D 100ns
> +	 * Sample time =3D 0
> +	 */
> +	timing |=3D TIMING_DEASSERT(DIV_ROUND_UP(30, ns_per_clk));
> +	timing |=3D TIMING_ASSERT(DIV_ROUND_UP(100, ns_per_clk));
> +	timing |=3D TIMING_SAMPLE(0);
> +	writel_relaxed(timing, nfc->regs + NFC_TIMING_CONFIG);
> +	writel_relaxed(NFC_CONTROL_ENABLE, nfc->regs + NFC_CONTROL);

Helper functions are provided to extract timings from ONFI timing modes
(either those defined by the chip if it supports ONFI commands, or
those extracted from the datasheet):

http://lxr.free-electrons.com/source/include/linux/mtd/nand.h#L976

> +}
> +
> +static int digicolor_nfc_ecc_init(struct digicolor_nfc *nfc,
> +				  struct device_node *np)
> +{
> +	struct mtd_info *mtd =3D &nfc->mtd;
> +	struct nand_chip *chip =3D &nfc->nand;
> +	int bch_data_range, bch_t, steps, mode, i;
> +	u32 ctrl =3D NFC_CONTROL_ENABLE | NFC_CONTROL_BCH_KCONFIG;
> +	struct nand_ecclayout *layout;
> +
> +	mode =3D of_get_nand_ecc_mode(np);
> +	if (mode < 0)
> +		return mode;
> +	if (mode !=3D NAND_ECC_HW_SYNDROME) {
> +		dev_err(nfc->dev, "unsupported ECC mode\n");
> +		return -EINVAL;
> +	}
> +
> +	bch_data_range =3D of_get_nand_ecc_step_size(np);
> +	if (bch_data_range < 0)
> +		return bch_data_range;
> +	if (bch_data_range !=3D 512 && bch_data_range !=3D 1024) {
> +		dev_err(nfc->dev, "unsupported nand-ecc-step-size value\n");
> +		return -EINVAL;
> +	}
> +	if (bch_data_range =3D=3D 1024)
> +		ctrl |=3D NFC_CONTROL_BCH_DATA_FIELD_RANGE_1024;
> +	steps =3D mtd->writesize / bch_data_range;
> +
> +	bch_t =3D of_get_nand_ecc_strength(np);
> +	if (bch_t < 0)
> +		return bch_t;

You should fallback to datasheet values (ecc_strength_ds and
ecc_step_ds) if ECC strength and step are not specified in the DT.

> +	for (i =3D 0; i < ARRAY_SIZE(bch_configs); i++)
> +		if (bch_t =3D=3D bch_configs[i].bits)
> +			break;
> +	if (i >=3D ARRAY_SIZE(bch_configs)) {
> +		dev_err(nfc->dev, "unsupported nand-ecc-strength value %d\n",
> +			bch_t);
> +		return -EINVAL;
> +	}
> +	if (bch_configs[i].r_bytes * steps > (mtd->oobsize-1)) {
> +		dev_err(nfc->dev, "OOB too small for selected ECC strength\n");
> +		return -EINVAL;
> +	}
> +	ctrl |=3D NFC_CONTROL_BCH_TCONFIG(i);
> +
> +	writel_relaxed(ctrl, nfc->regs + NFC_CONTROL);
> +
> +	chip->ecc.size =3D bch_data_range;
> +	chip->ecc.strength =3D bch_t;
> +	chip->ecc.bytes =3D bch_configs[i].r_bytes;
> +	chip->ecc.steps =3D steps;
> +	chip->ecc.mode =3D mode;
> +	chip->ecc.read_page =3D digicolor_nfc_read_page_syndrome;
> +	chip->ecc.write_page =3D digicolor_nfc_write_page_syndrome;
> +	chip->ecc.read_oob =3D digicolor_nfc_read_oob_syndrome;
> +
> +	layout =3D devm_kzalloc(nfc->dev, sizeof(*layout), GFP_KERNEL);
> +	if (layout =3D=3D NULL)
> +		return -ENOMEM;
> +	layout->eccbytes =3D chip->ecc.bytes * steps;
> +	/* leave 1 byte for bad block mark at the beginning of oob */
> +	for (i =3D 0; i < layout->eccbytes; i++)
> +		layout->eccpos[i] =3D i + 1;
> +	layout->oobfree[0].length =3D mtd->oobsize - layout->eccbytes - 1;
> +	layout->oobfree[0].offset =3D layout->eccbytes + 1;
> +
> +	chip->ecc.layout =3D layout;
> +
> +	return 0;
> +}
> +
> +static int digicolor_nfc_probe(struct platform_device *pdev)
> +{
> +	struct mtd_info *mtd;
> +	struct nand_chip *chip;
> +	struct digicolor_nfc *nfc;
> +	struct resource *r;
> +	struct clk *clk;
> +	struct device_node *nand_np;
> +	struct mtd_part_parser_data ppdata;
> +	int irq, ret;
> +	u32 cs;
> +
> +	nfc =3D devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
> +	if (!nfc)
> +		return -ENOMEM;
> +
> +	nfc->dev =3D &pdev->dev;
> +	chip =3D &nfc->nand;
> +	mtd =3D &nfc->mtd;
> +	mtd->priv =3D chip;
> +	mtd->dev.parent =3D &pdev->dev;
> +	mtd->owner =3D THIS_MODULE;
> +	mtd->name =3D DRIVER_NAME;
> +
> +	chip->priv =3D nfc;
> +	chip->cmd_ctrl =3D digicolor_nfc_cmd_ctrl;
> +	chip->read_byte =3D digicolor_nfc_read_byte;
> +	chip->read_buf =3D digicolor_nfc_read_buf;
> +	chip->write_byte =3D digicolor_nfc_write_byte;
> +	chip->write_buf =3D digicolor_nfc_write_buf;
> +	chip->dev_ready =3D digicolor_nfc_dev_ready;
> +
> +	clk =3D devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +	nfc->clk_rate =3D clk_get_rate(clk);
> +
> +	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	nfc->regs =3D devm_ioremap_resource(&pdev->dev, r);
> +	if (IS_ERR(nfc->regs))
> +		return PTR_ERR(nfc->regs);
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (IS_ERR_VALUE(irq))
> +		return irq;
> +
> +	if (of_get_child_count(pdev->dev.of_node) > 1)
> +		dev_warn(&pdev->dev,
> +			 "only one NAND chip is currently supported\n");
> +	nand_np =3D of_get_next_available_child(pdev->dev.of_node, NULL);
> +	if (!nand_np) {
> +		dev_err(&pdev->dev, "missing NAND chip node\n");
> +		return -ENXIO;
> +	}
> +	ret =3D of_property_read_u32(nand_np, "reg", &cs);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s: no valid reg property\n",
> +			nand_np->full_name);
> +		return ret;
> +	}
> +	nfc->nand_cs =3D cs;
> +
> +	nfc->t_ccs =3D INITIAL_TCCS;
> +
> +	digicolor_nfc_hw_init(nfc);
> +
> +	ret =3D nand_scan_ident(mtd, 1, NULL);
> +	if (ret)
> +		return ret;
> +	ret =3D digicolor_nfc_ecc_init(nfc, nand_np);
> +	if (ret)
> +		return ret;
> +	ret =3D nand_scan_tail(mtd);
> +	if (ret)
> +		return ret;
> +
> +	ppdata.of_node =3D nand_np;
> +	ret =3D mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
> +	if (ret) {
> +		nand_release(mtd);
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, nfc);
> +
> +	return 0;
> +}
> +
> +static int digicolor_nfc_remove(struct platform_device *pdev)
> +{
> +	struct digicolor_nfc *nfc =3D platform_get_drvdata(pdev);
> +
> +	nand_release(&nfc->mtd);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id digicolor_nfc_ids[] =3D {
> +	{ .compatible =3D "cnxt,cx92755-nfc" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, sunxi_nfc_ids);

Hm, let me guess, you've based your work on the sunxi driver, isn't
it ? :-)

That's all I got for now.

I might have missed some details, but all in all I really like the way
this driver was designed (but I'm not sure to be objective since this
one is based on the sunxi driver ;-)):
- pretty straightforward implementation
- make use, as much as possible, of the NAND infrastructure (no specifi=
c
  cmdfunc, seems to support raw accesses, ...)

The only missing parts are:
- proper timing configuration
- replace active waits (polling) by passive waits (interrupt +
  waitqueue)

But that should be fixed quite easily.

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
