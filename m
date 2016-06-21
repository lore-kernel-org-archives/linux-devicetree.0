From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 4/6] mtd: nand: gpmi: correct bitflip for erased NAND
 page
Date: Tue, 21 Jun 2016 18:18:12 +0200
Message-ID: <20160621181812.50c4321f@bbrezillon>
References: <1465578094-8816-1-git-send-email-han.xu@nxp.com>
 <1465578094-8816-5-git-send-email-han.xu@nxp.com>
 <20160614211401.40c26b37@bbrezillon>
 <CA+EcR22rADB8=CORdLTpSyM2-VaB+EcX5oZfFoVLAfgUVDgN=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <CA+EcR22rADB8=CORdLTpSyM2-VaB+EcX5oZfFoVLAfgUVDgN=Q@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Han Xu <xhnjupt@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, galak@codeaurora.org, Han Xu <han.xu@nxp.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 21 Jun 2016 10:53:48 -0500
Han Xu <xhnjupt@gmail.com> wrote:

> On Tue, Jun 14, 2016 at 2:14 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > On Fri, 10 Jun 2016 12:01:32 -0500
> > Han Xu <han.xu@nxp.com> wrote:
> >  
> >> i.MX6QP and i.MX7D BCH module integrated a new feature to detect the
> >> bitflip number for erased NAND page. So for these two platform, set the
> >> erase threshold to ecc_strength and if bitflip detected, GPMI driver
> >> will correct the data to all 0xFF.
> >>
> >> Signed-off-by: Han Xu <han.xu@nxp.com>
> >> ---
> >>  drivers/mtd/nand/gpmi-nand/bch-regs.h  | 10 ++++++++++
> >>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |  5 +++++
> >>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 27 ++++++++++++++++++++++++++-
> >>  3 files changed, 41 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/gpmi-nand/bch-regs.h
> >> index 228142c..2c44b88 100644
> >> --- a/drivers/mtd/nand/gpmi-nand/bch-regs.h
> >> +++ b/drivers/mtd/nand/gpmi-nand/bch-regs.h
> >> @@ -30,7 +30,13 @@
> >>  #define BM_BCH_CTRL_COMPLETE_IRQ             (1 << 0)
> >>
> >>  #define HW_BCH_STATUS0                               0x00000010
> >> +
> >>  #define HW_BCH_MODE                          0x00000020
> >> +#define BP_BCH_MODE_ERASE_THRESHOLD          0
> >> +#define BM_BCH_MODE_ERASE_THRESHOLD  (0xff << BP_BCH_MODE_ERASE_THRESHOLD)
> >> +#define BF_BCH_MODE_ERASE_THRESHOLD(v)               \
> >> +     (((v) << BP_BCH_MODE_ERASE_THRESHOLD) & BM_BCH_MODE_ERASE_THRESHOLD)
> >> +
> >>  #define HW_BCH_ENCODEPTR                     0x00000030
> >>  #define HW_BCH_DATAPTR                               0x00000040
> >>  #define HW_BCH_METAPTR                               0x00000050
> >> @@ -125,4 +131,8 @@
> >>       )
> >>
> >>  #define HW_BCH_VERSION                               0x00000160
> >> +#define HW_BCH_DEBUG1                                0x00000170
> >> +#define BP_BCH_DEBUG1_ERASED_ZERO_COUNT      0
> >> +#define BM_BCH_DEBUG1_ERASED_ZERO_COUNT              \
> >> +             (0x1ff << BP_BCH_DEBUG1_ERASED_ZERO_COUNT)
> >>  #endif
> >> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> >> index 358ff5d..0b5666a 100644
> >> --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> >> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> >> @@ -298,6 +298,11 @@ int bch_set_geometry(struct gpmi_nand_data *this)
> >>                       | BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this),
> >>                       r->bch_regs + HW_BCH_FLASH0LAYOUT1);
> >>
> >> +     /* Set erase threshold to ecc_strength for mx6qp and mx7 */
> >> +     if (GPMI_IS_MX6QP(this) || GPMI_IS_MX7(this))
> >> +             writel(BF_BCH_MODE_ERASE_THRESHOLD(ecc_strength),
> >> +                     r->bch_regs + HW_BCH_MODE);
> >> +
> >>       /* Set *all* chip selects to use layout 0. */
> >>       writel(0, r->bch_regs + HW_BCH_LAYOUTSELECT);
> >>
> >> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> >> index aedaff3..03bdb4d 100644
> >> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> >> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> >> @@ -1043,6 +1043,7 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
> >>  {
> >>       struct gpmi_nand_data *this = nand_get_controller_data(chip);
> >>       struct bch_geometry *nfc_geo = &this->bch_geometry;
> >> +     void __iomem *bch_regs = this->resources.bch_regs;
> >>       void          *payload_virt;
> >>       dma_addr_t    payload_phys;
> >>       void          *auxiliary_virt;
> >> @@ -1051,6 +1052,8 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
> >>       unsigned char *status;
> >>       unsigned int  max_bitflips = 0;
> >>       int           ret;
> >> +     int bitflips = 0;
> >> +     int bitflip_flag = 0;  
> >
> > Hm, I would choose another name, but I'm not even sure this is really
> > needed (see below).
> >  
> >>
> >>       dev_dbg(this->dev, "page number is : %d\n", page);
> >>       ret = read_page_prepare(this, buf, nfc_geo->payload_size,
> >> @@ -1088,8 +1091,20 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
> >>                          payload_virt, payload_phys);
> >>
> >>       for (i = 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
> >> -             if ((*status == STATUS_GOOD) || (*status == STATUS_ERASED))
> >> +             if (*status == STATUS_GOOD)
> >> +                     continue;
> >> +             if (*status == STATUS_ERASED) {
> >> +                     if (GPMI_IS_MX6QP(this) || GPMI_IS_MX7(this)) {
> >> +                             bitflips = readl(bch_regs + HW_BCH_DEBUG1);  
> >
> > You could use ret here or define a flips variable locally to this code
> > (see what's done for the software correction).
> >
> > BTW, why not memset-ing the data chunk here (as done for the SW
> > correction part). This way you wouldn't need the extra bitflips_flag
> > variable.
> >  
> >> +                             if (bitflips) {
> >> +                                     bitflip_flag = 1;
> >> +                                     max_bitflips = max_t(unsigned int,
> >> +                                                          max_bitflips,
> >> +                                                          bitflips);
> >> +                             }
> >> +                     }
> >>                       continue;
> >> +             }
> >>
> >>               if (*status == STATUS_UNCORRECTABLE) {
> >>                       int eccbits = nfc_geo->ecc_strength * nfc_geo->gf_len;
> >> @@ -1098,6 +1113,10 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
> >>                       int eccbytes;
> >>                       int flips;
> >>
> >> +                     /* shortcut for i.MX7 and i.MX6QP */
> >> +                     if (GPMI_IS_MX6QP(this) || GPMI_IS_MX7(this))  
> >
> > You should increment mtd->ecc_stats.failed in this case.  
> 
> Do you mean update the mtd->ecc_status.corrected when flips happened?
> Nothing failed in this case.

No, I really meant mtd->ecc_stats.failed.
*status == STATUS_UNCORRECTABLE on MX7 and MX6QP really means we have
an uncorrectable, but you're no longer incrementing ecc_stats->failed
because of this 'continue' statement.

So it should be something like:

			if (GPMI_IS_MX6QP(this) || GPMI_IS_MX7(this)) {
				mtd->ecc_status.failed++;
				continue;
			}

> 
> >  
> >> +                             continue;
> >> +
> >>                       /* Read ECC bytes into our internal raw_buffer */
> >>                       offset = nfc_geo->metadata_size * 8;
> >>                       offset += ((8 * nfc_geo->ecc_chunk_size) + eccbits) * (i + 1);
> >> @@ -1182,6 +1201,12 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
> >>               chip->oob_poi[0] = ((uint8_t *) auxiliary_virt)[0];
> >>       }
> >>
> >> +     /* if bitflip occurred in erased page, change data to all 0xff */
> >> +     if (bitflip_flag) {
> >> +             memset(buf, ~0, nfc_geo->payload_size);
> >> +             memset(chip->oob_poi, ~0, mtd->oobsize);
> >> +     }
> >> +
> >>       return max_bitflips;
> >>  }
> >>  
> >
> >
> >
> > --
> > Boris Brezillon, Free Electrons
> > Embedded Linux and Kernel engineering
> > http://free-electrons.com
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/  
> 
> 
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
