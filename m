From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 7/9] mtd: rawnand: ingenic: Add support for the
 JZ4740
Date: Mon, 4 Mar 2019 20:07:25 +0100
Message-ID: <20190304200725.28b072a8@xps13>
References: <20190209192305.4434-1-paul@crapouillou.net>
        <20190209192305.4434-7-paul@crapouillou.net>
        <20190304113412.24b64e3d@xps13>
        <1551724129.4932.5@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551724129.4932.5@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Paul,

Paul Cercueil <paul@crapouillou.net> wrote on Mon, 04 Mar 2019 19:28:49
+0100:

> On Mon, Mar 4, 2019 at 11:34 AM, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > Hi Paul,
> > 
> > Paul Cercueil <paul@crapouillou.net <mailto:paul@crapouillou.net>> > wrote on Sat,  9 Feb 2019 16:23:03
> > -0300:
> >   
> >>  Add support for probing the ingenic-nand driver on the JZ4740 SoC >> from
> >>  Ingenic, and the jz4740-ecc driver to support the JZ4740-specific
> >>  ECC hardware.  
> >> >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net >> <mailto:paul@crapouillou.net>>  
> >>  ---  
> >> >>  Changes:
> >> >>  v2: New patch
> >> >>  v3: Also add support for the hardware ECC of the JZ4740 in this >> patch
> >> >>  v4: - Fix formatting issues  
> >>      - Add MODULE_* macros  
> >> >>   drivers/mtd/nand/raw/ingenic/Kconfig        |  10 ++  
> >>   drivers/mtd/nand/raw/ingenic/Makefile       |   1 +
> >>   drivers/mtd/nand/raw/ingenic/ingenic_nand.c |  48 +++++--
> >>   drivers/mtd/nand/raw/ingenic/jz4740_ecc.c   | 196 >> ++++++++++++++++++++++++++++
> >>   4 files changed, 244 insertions(+), 11 deletions(-)
> >>   create mode 100644 drivers/mtd/nand/raw/ingenic/jz4740_ecc.c  
> >> >   
> > [...]
> >   
> >>   	switch (chip->ecc.mode) {
> >>   	case NAND_ECC_HW:
> >>  @@ -270,8 +279,8 @@ static int ingenic_nand_init_chip(struct >> platform_device *pdev,
> >>   		return -ENOMEM;
> >>   	mtd->dev.parent = dev;  
> >> >>  -	chip->legacy.IO_ADDR_R = cs->base + OFFSET_DATA;  
> >>  -	chip->legacy.IO_ADDR_W = cs->base + OFFSET_DATA;
> >>  +	chip->legacy.IO_ADDR_R = cs->base + nfc->soc_info->data_offset;
> >>  +	chip->legacy.IO_ADDR_W = cs->base + nfc->soc_info->data_offset;
> >>   	chip->legacy.chip_delay = RB_DELAY_US;
> >>   	chip->options = NAND_NO_SUBPAGE_WRITE;
> >>   	chip->legacy.select_chip = ingenic_nand_select_chip;  
> > 
> > I think Boris already asked for it, but it would be really great that
> > you update this driver to not use any legacy interface anymore.  
> 
> I thought I'd send a patch later. But I don't mind doing the update in
> this patchset.

Great! No it's okay, don't delay this patch set, doing it in another
thread is fine.
