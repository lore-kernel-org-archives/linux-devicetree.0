From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
Subject: Re: [PATCH v2 1/1] mtd: nand: pxa3xx: Set FORCE_CSX bit to
 ARMADA370 variants.
Date: Wed, 27 Sep 2017 11:15:47 +0200
Message-ID: <20170927111547.3536eb2b@xps13>
References: <20170927005516.28374-1-kalyan.kinthada@alliedtelesis.co.nz>
        <20170927005516.28374-2-kalyan.kinthada@alliedtelesis.co.nz>
        <20170927085318.0670a849@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170927085318.0670a849@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com, ezequiel.garcia@free-electrons.com, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, chris.packham@alliedtelesis.co.nz
List-Id: devicetree@vger.kernel.org

On Wed, 27 Sep 2017 08:53:18 +0200
Miquel RAYNAL <miquel.raynal@free-electrons.com> wrote:

> Hello Kalyan,
> 
> On Wed, 27 Sep 2017 13:55:16 +1300
> Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz> wrote:
> 
> > When the arbitration between NOR and NAND flash is enabled
> > the <FORCE_CSX> field bit[21] in the Data Flash Control Register
> > needs to be set to 1 according to guidleine GL-5830741.

I forgot to ask you what is this guideline ? Is this a Marvell
document ? I could not find it. The functional spec clearly states:
"When NOR/NAND hardware arbiter enabled, this bit must be set" but as
you mention it in the commit log and in the code it is worth knowing
what your are referring to.

Also, could you test if this bit introduces a regression or a speed
penalty when using for instance only one NAND chip (so not using
the arbiter even if it is enabled) ?

To do so you may use the flash_speed tool from the mtd-utils package:
http://lists.infradead.org/pipermail/linux-mtd/2017-August/076477.html

Thank you,
Miquèl

> > 
> > This commit sets the FORCE_CSX bit to 1 for all
> > ARMADA370 variants as the arbitration is always enabled by
> > default.  
> 
> Maybe you could mention here that this does not apply for pxa3xx
> variant as this bit does not exist/is reserved on the NFCv1.
> 
> > 
> > Signed-off-by: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
> > ---
> >  drivers/mtd/nand/pxa3xx_nand.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/pxa3xx_nand.c
> > b/drivers/mtd/nand/pxa3xx_nand.c index 85cff68643e0..b2753eea567c
> > 100644 --- a/drivers/mtd/nand/pxa3xx_nand.c
> > +++ b/drivers/mtd/nand/pxa3xx_nand.c
> > @@ -68,6 +68,7 @@
> >  #define NDCR_PAGE_SZ		(0x1 << 24)
> >  #define NDCR_NCSX		(0x1 << 23)
> >  #define NDCR_ND_MODE		(0x3 << 21)
> > +#define NDCR_FORCE_CSX		(0x1 << 21)
> >  #define NDCR_NAND_MODE   	(0x0)  
> 
> The three lines above seems to have the same purpose.
> I had a look to the specs (pxa/370/375/xp/380/390), and I could
> not find any reference to a valid bit 22 in NDCR (it is always
> reserved). Maybe you could delete NDCR_ND_MODE and
> NDCR_NAND_MODE then ?
> 
> >  #define NDCR_CLR_PG_CNT		(0x1 << 20)
> >  #define NFCV1_NDCR_ARB_CNTL	(0x1 << 19)
> > @@ -1464,6 +1465,9 @@ static int pxa3xx_nand_config_ident(struct
> > pxa3xx_nand_info *info) info->chunk_size = PAGE_CHUNK_SIZE;
> >  	info->reg_ndcr = 0x0; /* enable all interrupts */
> >  	info->reg_ndcr |= (pdata->enable_arbiter) ?
> > NDCR_ND_ARB_EN : 0;
> > +	/* Set FORCE_CSX bit for all ARMADAGL-5830741370 Variants.
> > Ref#: GL-5830741*/  
> 
> You miss a space between "GL-5830741" and "*/".
> 
> > +	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
> > +		info->reg_ndcr |= NDCR_FORCE_CSX;
> >  	info->reg_ndcr |= NDCR_RD_ID_CNT(READ_ID_BYTES);
> >  	info->reg_ndcr |= NDCR_SPARE_EN;
> >  
> > @@ -1498,6 +1502,9 @@ static void pxa3xx_nand_detect_config(struct
> > pxa3xx_nand_info *info) info->reg_ndcr = ndcr &
> >  		~(NDCR_INT_MASK | NDCR_ND_ARB_EN |
> > NFCV1_NDCR_ARB_CNTL); info->reg_ndcr |= (pdata->enable_arbiter) ?
> > NDCR_ND_ARB_EN : 0;
> > +	/* Set FORCE_CSX bit for all ARMADA370 Variants. Ref#:
> > GL-5830741*/  
> 
> Same here.
> 
> > +	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
> > +		info->reg_ndcr |= NDCR_FORCE_CSX;
> >  	info->ndtr0cs0 = nand_readl(info, NDTR0CS0);
> >  	info->ndtr1cs0 = nand_readl(info, NDTR1CS0);
> >  }  
> 
> 
> Thanks,
> Miquèl
> 



-- 
Miquel Raynal, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
