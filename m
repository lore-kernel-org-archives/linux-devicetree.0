From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Subject: RE: [PATCH v6 2/2] mtd: nand: Add support for Arasan Nand Flash
 Controller
Date: Mon, 5 Dec 2016 13:55:01 +0000
Message-ID: <03CA77BA8AF6F1469AEDFBDA1322A7B76423EE46@XAP-PVEXMBX02.xlnx.xilinx.com>
References: <1480911066-26157-1-git-send-email-punnaia@xilinx.com>
 <1480911066-26157-2-git-send-email-punnaia@xilinx.com>
 <7a8fe6c9-b53f-a16f-19f7-6ce4a83672a2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <7a8fe6c9-b53f-a16f-19f7-6ce4a83672a2@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Marek Vasut <marek.vasut@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>, "richard@nod.at" <richard@nod.at>, "cyrille.pitchen@atmel.com" <cyrille.pitchen@atmel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek <michals@xilinx.com>, "kalluripunnaiahchoudary@gmail.com" <kalluripunnaiahchoudary@gmail.com>, "kpc528@gmail.com" <kpc528@gmail.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Marek,

  Thanks for the review and comments.

> -----Original Message-----
> From: Marek Vasut [mailto:marek.vasut@gmail.com]
> Sent: Monday, December 05, 2016 10:10 AM
> To: Punnaiah Choudary Kalluri <punnaia@xilinx.com>;
> dwmw2@infradead.org; computersforpeace@gmail.com;
> boris.brezillon@free-electrons.com; richard@nod.at;
> cyrille.pitchen@atmel.com; robh+dt@kernel.org; mark.rutland@arm.com
> Cc: linux-kernel@vger.kernel.org; linux-mtd@lists.infradead.org;
> devicetree@vger.kernel.org; Michal Simek <michals@xilinx.com>;
> kalluripunnaiahchoudary@gmail.com; kpc528@gmail.com; Punnaiah
> Choudary Kalluri <punnaia@xilinx.com>
> Subject: Re: [PATCH v6 2/2] mtd: nand: Add support for Arasan Nand Flash
> Controller
> 
> On 12/05/2016 05:11 AM, Punnaiah Choudary Kalluri wrote:
> > Added the basic driver for Arasan Nand Flash Controller used in
> > Zynq UltraScale+ MPSoC. It supports only Hw Ecc and upto 24bit
> > correction.
> 
> Ummm, NAND, ECC, can you fix the acronyms to be in caps ?
>
 
Ok

> > Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> > ---
> > Chnages in v6:
> > - Addressed most of the Brian and Boris comments
> > - Separated the nandchip from the nand controller
> > - Removed the ecc lookup table from driver
> > - Now use framework nand waitfunction and readoob
> > - Fixed the compiler warning
> > - Adapted the new frameowrk changes related to ecc and ooblayout
> > - Disabled the clocks after the nand_reelase
> > - Now using only one completion object
> > - Boris suggessions like adapting cmd_ctrl and rework on read/write byte
> >   are not implemented and i will patch them later
> > - Also check_erased_ecc_chunk for erase and check for is_vmalloc_addr
> will
> >   implement later once the basic driver is mainlined.
> > Changes in v5:
> > - Renamed the driver filei as arasan_nand.c
> > - Fixed all comments relaqted coding style
> > - Fixed comments related to propagating the errors
> > - Modified the anfc_write_page_hwecc as per the write_page
> >   prototype
> > Changes in v4:
> > - Added support for onfi timing mode configuration
> > - Added clock supppport
> > - Added support for multiple chipselects
> > Changes in v3:
> > - Removed unused variables
> > - Avoided busy loop and used jifies based implementation
> > - Fixed compiler warnings "right shift count >= width of type"
> > - Removed unneeded codei and improved error reporting
> > - Added onfi version check to ensure reading the valid address cycles
> > Changes in v2:
> > - Added missing of.h to avoid kbuild system report erro
> > ---
> >  drivers/mtd/nand/Kconfig       |   8 +
> >  drivers/mtd/nand/Makefile      |   1 +
> >  drivers/mtd/nand/arasan_nand.c | 974
> +++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 983 insertions(+)
> >  create mode 100644 drivers/mtd/nand/arasan_nand.c
> >
> > diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> > index 7b7a887..e831f4e 100644
> > --- a/drivers/mtd/nand/Kconfig
> > +++ b/drivers/mtd/nand/Kconfig
> > @@ -569,4 +569,12 @@ config MTD_NAND_MTK
> >  	  Enables support for NAND controller on MTK SoCs.
> >  	  This controller is found on mt27xx, mt81xx, mt65xx SoCs.
> >
> > +config MTD_NAND_ARASAN
> > +	tristate "Support for Arasan Nand Flash controller"
> > +	depends on HAS_IOMEM
> > +	depends on HAS_DMA
> > +	help
> > +	  Enables the driver for the Arasan Nand Flash controller on
> > +	  Zynq UltraScale+ MPSoC.
> > +
> >  endif # MTD_NAND
> > diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> > index cafde6f..44b8b00 100644
> > --- a/drivers/mtd/nand/Makefile
> > +++ b/drivers/mtd/nand/Makefile
> > @@ -58,5 +58,6 @@ obj-$(CONFIG_MTD_NAND_HISI504)	        +=
> hisi504_nand.o
> >  obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
> >  obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
> >  obj-$(CONFIG_MTD_NAND_MTK)		+= mtk_nand.o mtk_ecc.o
> > +obj-$(CONFIG_MTD_NAND_ARASAN)		+= arasan_nand.o
> 
> Keep the list at least reasonably sorted.

Ok

> 
> >  nand-objs := nand_base.o nand_bbt.o nand_timings.o
> > diff --git a/drivers/mtd/nand/arasan_nand.c
> b/drivers/mtd/nand/arasan_nand.c
> > new file mode 100644
> > index 0000000..6b0670e
> > --- /dev/null
> > +++ b/drivers/mtd/nand/arasan_nand.c
> > @@ -0,0 +1,974 @@
> > +/*
> > + * Arasan Nand Flash Controller Driver
> 
> NAND
> 
> > + * Copyright (C) 2014 - 2015 Xilinx, Inc.
> 
> It's 2016 now ...

Sorry :). Yes, I will update.

> 
> > + * This program is free software; you can redistribute it and/or modify it
> under
> > + * the terms of the GNU General Public License version 2 as published by
> the
> > + * Free Software Foundation; either version 2 of the License, or (at your
> > + * option) any later version.
> > + */
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io-64-nonatomic-lo-hi.h>
> > +#include <linux/module.h>
> > +#include <linux/mtd/mtd.h>
> > +#include <linux/mtd/nand.h>
> > +#include <linux/mtd/partitions.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define DRIVER_NAME			"arasan_nand"
> > +#define EVNT_TIMEOUT			1000
> 
> Rename to EVENT_TIMEOUT_<units> to make this less cryptic

Ok.

> 
> > +#define STATUS_TIMEOUT			2000
> 
> DTTO

Thanks. Just realized that it is unused. I will remove this.

> 
> > +#define PKT_OFST			0x00
> > +#define MEM_ADDR1_OFST			0x04
> > +#define MEM_ADDR2_OFST			0x08
> > +#define CMD_OFST			0x0C
> > +#define PROG_OFST			0x10
> > +#define INTR_STS_EN_OFST		0x14
> > +#define INTR_SIG_EN_OFST		0x18
> > +#define INTR_STS_OFST			0x1C
> > +#define READY_STS_OFST			0x20
> > +#define DMA_ADDR1_OFST			0x24
> > +#define FLASH_STS_OFST			0x28
> > +#define DATA_PORT_OFST			0x30
> > +#define ECC_OFST			0x34
> > +#define ECC_ERR_CNT_OFST		0x38
> > +#define ECC_SPR_CMD_OFST		0x3C
> > +#define ECC_ERR_CNT_1BIT_OFST		0x40
> > +#define ECC_ERR_CNT_2BIT_OFST		0x44
> > +#define DMA_ADDR0_OFST			0x50
> > +#define DATA_INTERFACE_REG		0x6C
> 
> Why are some things suffixed with _OFST and some with _REG ? Consistency
> please. Using ARASAN_ prefix, ie. #define ARASAN_FOO 0xbar to define
> regs would be nice.
> 

Ok. I will maintain the consistency. Since all these definitions for arasan controller
and I feel adding the prefix is no value and some places it will go beyond 80 col limit.
Different reviewers have different opinions here. I am following the above convention.  

> > +#define PKT_CNT_SHIFT			12
> > +
> > +#define ECC_ENABLE			BIT(31)
> > +#define DMA_EN_MASK			GENMASK(27, 26)
> > +#define DMA_ENABLE			0x2
> > +#define DMA_EN_SHIFT			26
> > +#define REG_PAGE_SIZE_MASK		GENMASK(25, 23)
> > +#define REG_PAGE_SIZE_SHIFT		23
> > +#define REG_PAGE_SIZE_512		0
> > +#define REG_PAGE_SIZE_1K		5
> > +#define REG_PAGE_SIZE_2K		1
> > +#define REG_PAGE_SIZE_4K		2
> > +#define REG_PAGE_SIZE_8K		3
> > +#define REG_PAGE_SIZE_16K		4
> > +#define CMD2_SHIFT			8
> > +#define ADDR_CYCLES_SHIFT		28
> > +
> > +#define XFER_COMPLETE			BIT(2)
> > +#define READ_READY			BIT(1)
> > +#define WRITE_READY			BIT(0)
> > +#define MBIT_ERROR			BIT(3)
> > +#define ERR_INTRPT			BIT(4)
> > +
> > +#define PROG_PGRD			BIT(0)
> > +#define PROG_ERASE			BIT(2)
> > +#define PROG_STATUS			BIT(3)
> > +#define PROG_PGPROG			BIT(4)
> > +#define PROG_RDID			BIT(6)
> > +#define PROG_RDPARAM			BIT(7)
> > +#define PROG_RST			BIT(8)
> > +#define PROG_GET_FEATURE		BIT(9)
> > +#define PROG_SET_FEATURE		BIT(10)
> > +
> > +#define ONFI_STATUS_FAIL		BIT(0)
> > +#define ONFI_STATUS_READY		BIT(6)
> > +
> > +#define PG_ADDR_SHIFT			16
> > +#define BCH_MODE_SHIFT			25
> > +#define BCH_EN_SHIFT			27
> > +#define ECC_SIZE_SHIFT			16
> > +
> > +#define MEM_ADDR_MASK			GENMASK(7, 0)
> > +#define BCH_MODE_MASK			GENMASK(27, 25)
> > +
> > +#define CS_MASK				GENMASK(31, 30)
> > +#define CS_SHIFT			30
> > +
> > +#define PAGE_ERR_CNT_MASK		GENMASK(16, 8)
> > +#define PKT_ERR_CNT_MASK		GENMASK(7, 0)
> > +
> > +#define NVDDR_MODE			BIT(9)
> > +#define NVDDR_TIMING_MODE_SHIFT		3
> > +
> > +#define ONFI_ID_LEN			8
> > +#define TEMP_BUF_SIZE			512
> > +#define NVDDR_MODE_PACKET_SIZE		8
> > +#define SDR_MODE_PACKET_SIZE		4
> > +
> > +#define ONFI_DATA_INTERFACE_NVDDR      (1 << 4)
> 
> BIT() ?

Sure.

> 
> 
> [...]
> 
> > +struct anfc {
> > +	struct nand_hw_control controller;
> > +	struct list_head chips;
> > +	struct device *dev;
> > +	void __iomem *base;
> > +	int curr_cmd;
> > +	struct clk *clk_sys;
> > +	struct clk *clk_flash;
> > +	bool dma;
> > +	bool err;
> > +	bool iswriteoob;
> > +	u8 buf[TEMP_BUF_SIZE];
> > +	int irq;
> > +	u32 bufshift;
> > +	int csnum;
> > +	struct completion evnt;
> 
> event ?

Ok

> 
> > +};
> 
> [...]
> 
> > +static void anfc_prepare_cmd(struct anfc *nfc, u8 cmd1, u8 cmd2, u8
> dmamode,
> > +			     u32 pagesize, u8 addrcycles)
> > +{
> > +	u32 regval;
> > +
> > +	regval = cmd1 | (cmd2 << CMD2_SHIFT);
> > +	if (dmamode && nfc->dma)
> > +		regval |= DMA_ENABLE << DMA_EN_SHIFT;
> > +	if (addrcycles)
> > +		regval |= addrcycles << ADDR_CYCLES_SHIFT;
> > +	if (pagesize)
> > +		regval |= anfc_page(pagesize) << REG_PAGE_SIZE_SHIFT;
> 
> Drop the if (foo), if it's zero, the regval would be OR'd with zero.

Ok.
> 
> > +	writel(regval, nfc->base + CMD_OFST);
> > +}
> > +
> > +static int anfc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
> > +			  int page)
> > +{
> > +	struct anfc *nfc = to_anfc(chip->controller);
> > +
> > +	nfc->iswriteoob = true;
> > +	chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize, page);
> > +	chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
> > +	nfc->iswriteoob = false;
> > +
> > +	return 0;
> > +}
> > +
> > +static void anfc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
> > +{
> > +	u32 pktcount, pktsize, eccintr = 0;
> > +	unsigned int buf_rd_cnt = 0;
> > +	u32 *bufptr = (u32 *)buf;
> > +	struct nand_chip *chip = mtd_to_nand(mtd);
> > +	struct anfc_nand_chip *achip = to_anfc_nand(chip);
> > +	struct anfc *nfc = to_anfc(chip->controller);
> > +	dma_addr_t paddr;
> > +
> > +	if (nfc->curr_cmd == NAND_CMD_READ0) {
> > +		pktsize = achip->pktsize;
> > +		pktcount = DIV_ROUND_UP(mtd->writesize, pktsize);
> > +		if (!achip->bch)
> > +			eccintr = MBIT_ERROR;
> > +	} else {
> > +		pktsize = len;
> > +		pktcount = 1;
> > +	}
> > +
> > +	anfc_setpktszcnt(nfc, pktsize, pktcount);
> > +
> > +	if (nfc->dma) {
> > +		paddr = dma_map_single(nfc->dev, buf, len,
> DMA_FROM_DEVICE);
> > +		if (dma_mapping_error(nfc->dev, paddr)) {
> > +			dev_err(nfc->dev, "Read buffer mapping error");
> > +			return;
> > +		}
> > +		lo_hi_writeq(paddr, nfc->base + DMA_ADDR0_OFST);
> > +		anfc_enable_intrs(nfc, (XFER_COMPLETE | eccintr));
> > +		writel(PROG_PGRD, nfc->base + PROG_OFST);
> > +		anfc_wait_for_event(nfc);
> > +		dma_unmap_single(nfc->dev, paddr, len,
> DMA_FROM_DEVICE);
> 
> Split this function into anfc_read_buf() and then anfc_read_buf_pio()
> and anfc_read_buf_dma() to avoid this ugliness. Also, does this handle
> any errors in any way ? Looks like it ignores all errors, so please fix.
> 

Ok. Regarding errors, it handles the errors except checking for contiguous
Address region  for the given address. I will add this in next version.

> > +		return;
> > +	}
> > +
> > +	anfc_enable_intrs(nfc, (READ_READY | eccintr));
> > +	writel(PROG_PGRD, nfc->base + PROG_OFST);
> > +
> > +	while (buf_rd_cnt < pktcount) {
> > +		anfc_wait_for_event(nfc);
> > +		buf_rd_cnt++;
> > +
> > +		if (buf_rd_cnt == pktcount)
> > +			anfc_enable_intrs(nfc, XFER_COMPLETE);
> > +
> > +		readsl(nfc->base + DATA_PORT_OFST, bufptr, pktsize/4);
> > +		bufptr += (pktsize / 4);
> > +
> > +		if (buf_rd_cnt < pktcount)
> > +			anfc_enable_intrs(nfc, (READ_READY | eccintr));
> > +	}
> > +
> > +	anfc_wait_for_event(nfc);
> > +}
> > +
> > +static void anfc_write_buf(struct mtd_info *mtd, const uint8_t *buf, int
> len)
> > +{
> > +	u32 pktcount, pktsize;
> > +	unsigned int buf_wr_cnt = 0;
> > +	u32 *bufptr = (u32 *)buf;
> > +	struct nand_chip *chip = mtd_to_nand(mtd);
> > +	struct anfc_nand_chip *achip = to_anfc_nand(chip);
> > +	struct anfc *nfc = to_anfc(chip->controller);
> > +	dma_addr_t paddr;
> > +
> > +	if (nfc->iswriteoob) {
> > +		pktsize = len;
> > +		pktcount = 1;
> > +	} else {
> > +		pktsize = achip->pktsize;
> > +		pktcount = mtd->writesize / pktsize;
> > +	}
> 
> This looks like a copy of the read path. Can these two functions be
> parametrized and merged ?
> 
Ok.

> > +	anfc_setpktszcnt(nfc, pktsize, pktcount);
> > +
> > +	if (nfc->dma) {
> > +		paddr = dma_map_single(nfc->dev, (void *)buf, len,
> > +				       DMA_TO_DEVICE);
> > +		if (dma_mapping_error(nfc->dev, paddr)) {
> > +			dev_err(nfc->dev, "Write buffer mapping error");
> > +			return;
> > +		}
> > +		lo_hi_writeq(paddr, nfc->base + DMA_ADDR0_OFST);
> > +		anfc_enable_intrs(nfc, XFER_COMPLETE);
> > +		writel(PROG_PGPROG, nfc->base + PROG_OFST);
> > +		anfc_wait_for_event(nfc);
> > +		dma_unmap_single(nfc->dev, paddr, len, DMA_TO_DEVICE);
> > +		return;
> > +	}
> > +
> > +	anfc_enable_intrs(nfc, WRITE_READY);
> > +	writel(PROG_PGPROG, nfc->base + PROG_OFST);
> > +
> > +	while (buf_wr_cnt < pktcount) {
> > +		anfc_wait_for_event(nfc);
> > +		buf_wr_cnt++;
> > +		if (buf_wr_cnt == pktcount)
> > +			anfc_enable_intrs(nfc, XFER_COMPLETE);
> > +
> > +		writesl(nfc->base + DATA_PORT_OFST, bufptr, pktsize/4);
> > +		bufptr += (pktsize / 4);
> > +
> > +		if (buf_wr_cnt < pktcount)
> > +			anfc_enable_intrs(nfc, WRITE_READY);
> > +	}
> > +
> > +	anfc_wait_for_event(nfc);
> > +}
> 
> 
> [...]
> 
> > +static void anfc_writefifo(struct anfc *nfc, u32 prog, u32 size, u8 *buf)
> > +{
> > +	u32 *bufptr = (u32 *)buf;
> > +
> > +	anfc_enable_intrs(nfc, WRITE_READY);
> > +
> > +	writel(prog, nfc->base + PROG_OFST);
> > +	anfc_wait_for_event(nfc);
> > +
> > +	anfc_enable_intrs(nfc, XFER_COMPLETE);
> > +	writesl(nfc->base + DATA_PORT_OFST, bufptr, size/4);
> 
> use ioread32_rep and iowrite32_rep , otherwise this won't compile on x86
> with COMPILE_TEST.
> 

Ok. I have just got the kbuild notification for x86 system. I will fix this.


> > +	anfc_wait_for_event(nfc);
> > +}
> > +
> > +static void anfc_readfifo(struct anfc *nfc, u32 prog, u32 size)
> > +{
> > +	u32 *bufptr = (u32 *)nfc->buf;
> > +
> > +	anfc_enable_intrs(nfc, READ_READY);
> > +
> > +	writel(prog, nfc->base + PROG_OFST);
> > +	anfc_wait_for_event(nfc);
> > +
> > +	anfc_enable_intrs(nfc, XFER_COMPLETE);
> > +	readsl(nfc->base + DATA_PORT_OFST, bufptr, size/4);
> 
> See above
> 
> > +	anfc_wait_for_event(nfc);
> > +}
> 
> 
> [...]
> 
> > +static void anfc_select_chip(struct mtd_info *mtd, int num)
> > +{
> > +	u32 val;
> > +	struct nand_chip *chip = mtd_to_nand(mtd);
> > +	struct anfc_nand_chip *achip = to_anfc_nand(chip);
> > +	struct anfc *nfc = to_anfc(chip->controller);
> > +
> > +	if (num == -1)
> > +		return;
> > +
> > +	val = readl(nfc->base + MEM_ADDR2_OFST);
> > +	val = (val & ~(CS_MASK)) | (achip->csnum << CS_SHIFT);
> > +	val = (val & ~(BCH_MODE_MASK)) | (achip->bchmode <<
> BCH_MODE_SHIFT);
> 
> Just rewrite this as a series of val &= ~(foo | bar); val |= baz | quux;
> for clarity sake.
>

 
Ok.

> > +	writel(val, nfc->base + MEM_ADDR2_OFST);
> > +	nfc->csnum = achip->csnum;
> > +	writel(achip->eccval, nfc->base + ECC_OFST);
> > +	writel(achip->inftimeval, nfc->base + DATA_INTERFACE_REG);
> > +}
> > +
> > +static irqreturn_t anfc_irq_handler(int irq, void *ptr)
> > +{
> > +	struct anfc *nfc = ptr;
> > +	u32 regval = 0, status;
> > +
> > +	status = readl(nfc->base + INTR_STS_OFST);
> > +	if (status & XFER_COMPLETE) {
> > +		complete(&nfc->evnt);
> > +		regval |= XFER_COMPLETE;
> 
> Can the complete() be invoked multiple times ? That seems a bit odd.
> 

I will check and fix this.

> > +	}
> > +
> > +	if (status & READ_READY) {
> > +		complete(&nfc->evnt);
> > +		regval |= READ_READY;
> > +	}
> > +
> > +	if (status & WRITE_READY) {
> > +		complete(&nfc->evnt);
> > +		regval |= WRITE_READY;
> > +	}
> > +
> > +	if (status & MBIT_ERROR) {
> > +		nfc->err = true;
> > +		complete(&nfc->evnt);
> > +		regval |= MBIT_ERROR;
> > +	}
> > +
> > +	if (regval) {
> > +		writel(regval, nfc->base + INTR_STS_OFST);
> > +		writel(0, nfc->base + INTR_STS_EN_OFST);
> > +		writel(0, nfc->base + INTR_SIG_EN_OFST);
> > +
> > +		return IRQ_HANDLED;
> > +	}
> > +
> > +	return IRQ_NONE;
> > +}
> > +
> > +static int anfc_onfi_set_features(struct mtd_info *mtd, struct nand_chip
> *chip,
> > +				int addr, uint8_t *subfeature_param)
> > +{
> > +	struct anfc *nfc = to_anfc(chip->controller);
> > +	struct anfc_nand_chip *achip = to_anfc_nand(chip);
> > +	int status;
> > +
> > +	if (!chip->onfi_version || !(le16_to_cpu(chip-
> >onfi_params.opt_cmd)
> > +		& ONFI_OPT_CMD_SET_GET_FEATURES))
> 
> Split this into two conditions to improve readability.
> 

Ok.
> > +		return -EINVAL;
> > +
> > +	chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES, addr, -1);
> > +	anfc_writefifo(nfc, PROG_SET_FEATURE, achip->spktsize,
> > +			subfeature_param);
> > +
> > +	status = chip->waitfunc(mtd, chip);
> > +	if (status & NAND_STATUS_FAIL)
> > +		return -EIO;
> > +
> > +	return 0;
> > +}
> > +
> > +static int anfc_init_timing_mode(struct anfc *nfc,
> > +				 struct anfc_nand_chip *achip)
> > +{
> > +	int mode, err;
> > +	unsigned int feature[2];
> > +	u32 inftimeval;
> > +	struct nand_chip *chip = &achip->chip;
> > +	struct mtd_info *mtd = nand_to_mtd(chip);
> > +
> > +	memset(feature, 0, NVDDR_MODE_PACKET_SIZE);
> > +	/* Get nvddr timing modes */
> > +	mode = onfi_get_sync_timing_mode(chip) & 0xff;
> > +	if (!mode) {
> > +		mode = fls(onfi_get_async_timing_mode(chip)) - 1;
> > +		inftimeval = mode;
> > +	} else {
> > +		mode = fls(mode) - 1;
> > +		inftimeval = NVDDR_MODE | (mode <<
> NVDDR_TIMING_MODE_SHIFT);
> > +		mode |= ONFI_DATA_INTERFACE_NVDDR;
> > +	}
> > +
> > +	feature[0] = mode;
> > +	chip->select_chip(mtd, achip->csnum);
> > +	err = chip->onfi_set_features(mtd, chip,
> ONFI_FEATURE_ADDR_TIMING_MODE,
> > +				      (uint8_t *)feature);
> > +	chip->select_chip(mtd, -1);
> > +	if (err)
> > +		return err;
> > +
> > +	achip->inftimeval = inftimeval;
> > +
> > +	if (mode & ONFI_DATA_INTERFACE_NVDDR)
> > +		achip->spktsize = NVDDR_MODE_PACKET_SIZE;
> > +
> > +	return 0;
> > +}
> 
> [...]
> 
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Xilinx, Inc");
> 
> There should be a contact with email address here.
> 
I think there is an alias for Xilinx, Inc in maintainers list.
If not I will update it.

Regards,
Punnaiah

> > +MODULE_DESCRIPTION("Arasan NAND Flash Controller Driver");
> >
> 
> 
> --
> Best regards,
> Marek Vasut
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
