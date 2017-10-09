From: Miquel RAYNAL <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 1/1] mtd: nand: pxa3xx: Set FORCE_CSX bit to
 ARMADA370 variants.
Date: Mon, 9 Oct 2017 08:18:48 +0200
Message-ID: <20171009081848.49681975@xps13>
References: <20170928005756.3938-1-kalyan.kinthada@alliedtelesis.co.nz>
        <20170928005756.3938-2-kalyan.kinthada@alliedtelesis.co.nz>
        <20171005094138.11b73a0e@xps13>
        <c6832720-7c58-4afe-2d1b-76bb9397299e@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c6832720-7c58-4afe-2d1b-76bb9397299e-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalyan Kinthada <Kalyan.Kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "richard-/L3Ra7n9ekc@public.gmane.org" <richard-/L3Ra7n9ekc@public.gmane.org>, "cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org" <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Kalyan,

On Mon, 9 Oct 2017 02:31:30 +0000
Kalyan Kinthada <Kalyan.Kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org> wrote:

> On 05/10/17 20:41, Miquel RAYNAL wrote:
> > Hello Kalyan,
> >
> > On Thu, 28 Sep 2017 13:57:56 +1300
> > Kalyan Kinthada <kalyan.kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org> wrote:
> >  
> >> When the arbitration between NOR and NAND flash is enabled
> >> the <FORCE_CSX> field bit[21] in the Data Flash Control Register
> >> needs to be set to 1 according to guidleine GL-5830741 mentioned  
> > Typo: guideline ^  
> I will correct this typo in the next patch version.
> >> in Marvell Errata document MV-S501377-00, Rev. D.  
> > Thanks for that, I checked it.
> >  
> >> This commit sets the FORCE_CSX bit to 1 for all
> >> ARMADA370 variants as the arbitration is always enabled by default.
> >> This change does not apply for pxa3xx variants because the
> >> FORCE_CSX bit does not exist/reserved on the NFCv1.  
> > Sorry to bother you again but I am reworking the pxa3xx_nand driver
> > and so I would like to deeply understand why this is needed because
> > I will have to integrate it in my work too.
> >
> > So please tell me what is your setup, do you really use NAND/NOR
> > arbitration? Do you have not-Don't Care CS NAND chips? I have some
> > doubts because even if the spec precises in the NAND controller
> > chapter that arbitration is always enabled by default, the bit 27
> > (NfArbiterEn) in the SoC Device Multiplex Register at offset
> > 0x00018208 is actually at 0 by default (disabled). Did you enable
> > this bit manually ? I checked with devmem on my setup and this bit
> > was unset.  
> Yes, my setup use NAND/NOR arbitration and use a Don't
> care CS Nand Chip. The bit 27 at offset 0x00018208 is set to 1
> by default in my case. I did not manually set the bit 27 to 1.

Actually if you use Don't Care CS NAND chips you should not need the
force CS bit, as it is mentioned in the guidelines you pointed, this
bit is only useful for *not* don't care CS NAND chips (and the name
"force CS" is pretty straight forward too!).

Otherwise what bootloader and kernel do you use to have this
bit set by default? You may also want to check if this bit is set by
your bootloader by stopping it before it loads Linux and check manually
the value of this bit with 'md' (on U-Boot).

Thank you,
Miquèl

> 
> Please let me now if you have any other question or do you want me
> to send the updated patch version with the typo fixed.
> 
> Thank You,
> Kalyan
> 
> >
> > Thank you for your time,
> > Miquèl
> >  
> >> The NDCR_ND_MODE conflicts with the new NDCR_FORCE_CSX but is
> >> unused so remove it along with NDCR_NAND_MODE.
> >>
> >> Signed-off-by: Kalyan Kinthada
> >> <kalyan.kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org> ---  
> >
> >  
> >>   drivers/mtd/nand/pxa3xx_nand.c | 9 +++++++--
> >>   1 file changed, 7 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/mtd/nand/pxa3xx_nand.c
> >> b/drivers/mtd/nand/pxa3xx_nand.c index 85cff68643e0..a6a7a5af7bed
> >> 100644 --- a/drivers/mtd/nand/pxa3xx_nand.c
> >> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> >> @@ -67,8 +67,7 @@
> >>   #define NDCR_DWIDTH_M		(0x1 << 26)
> >>   #define NDCR_PAGE_SZ		(0x1 << 24)
> >>   #define NDCR_NCSX		(0x1 << 23)
> >> -#define NDCR_ND_MODE		(0x3 << 21)
> >> -#define NDCR_NAND_MODE   	(0x0)
> >> +#define NDCR_FORCE_CSX		(0x1 << 21)
> >>   #define NDCR_CLR_PG_CNT		(0x1 << 20)
> >>   #define NFCV1_NDCR_ARB_CNTL	(0x1 << 19)
> >>   #define NFCV2_NDCR_STOP_ON_UNCOR	(0x1 << 19)
> >> @@ -1464,6 +1463,9 @@ static int pxa3xx_nand_config_ident(struct
> >> pxa3xx_nand_info *info) info->chunk_size = PAGE_CHUNK_SIZE;
> >>   	info->reg_ndcr = 0x0; /* enable all interrupts */
> >>   	info->reg_ndcr |= (pdata->enable_arbiter) ?
> >> NDCR_ND_ARB_EN : 0;
> >> +	/* Set FORCE_CSX bit for all ARMADA370 Variants. Ref#:
> >> GL-5830741 */
> >> +	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
> >> +		info->reg_ndcr |= NDCR_FORCE_CSX;
> >>   	info->reg_ndcr |= NDCR_RD_ID_CNT(READ_ID_BYTES);
> >>   	info->reg_ndcr |= NDCR_SPARE_EN;
> >>   
> >> @@ -1498,6 +1500,9 @@ static void pxa3xx_nand_detect_config(struct
> >> pxa3xx_nand_info *info) info->reg_ndcr = ndcr &
> >>   		~(NDCR_INT_MASK | NDCR_ND_ARB_EN |
> >> NFCV1_NDCR_ARB_CNTL); info->reg_ndcr |= (pdata->enable_arbiter) ?
> >> NDCR_ND_ARB_EN : 0;
> >> +	/* Set FORCE_CSX bit for all ARMADA370 Variants. Ref#:
> >> GL-5830741 */
> >> +	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
> >> +		info->reg_ndcr |= NDCR_FORCE_CSX;
> >>   	info->ndtr0cs0 = nand_readl(info, NDTR0CS0);
> >>   	info->ndtr1cs0 = nand_readl(info, NDTR1CS0);
> >>   }  
> >
> >  



-- 
Miquel Raynal, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
