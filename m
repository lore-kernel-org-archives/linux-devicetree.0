From: Manish Narani <MNARANI@xilinx.com>
Subject: RE: [PATCH v5 3/4] edac: synopsys: Add EDAC ECC support for ZynqMP
 DDRC
Date: Thu, 6 Sep 2018 16:14:52 +0000
Message-ID: <DM6PR02MB52273E288A625F7BD59BB2FFC1010@DM6PR02MB5227.namprd02.prod.outlook.com>
References: <1535722070-10394-1-git-send-email-manish.narani@xilinx.com>
 <1535722070-10394-4-git-send-email-manish.narani@xilinx.com>
 <20180905101935.GD2237@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180905101935.GD2237@zn.tnic>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Borislav Petkov <bp@alien8.de>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Srinivas Goud <sgoud@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Michal Simek <michals@xilinx.com>, Anirudha Sarangi <anirudh@xilinx.com>, "olof@lixom.net" <olof@lixom.net>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Boris,

Thanks for the review.

> -----Original Message-----
> From: Borislav Petkov [mailto:bp@alien8.de]
> Sent: Wednesday, September 5, 2018 3:50 PM
> To: Manish Narani <MNARANI@xilinx.com>
> Cc: robh+dt@kernel.org; mark.rutland@arm.com; Michal Simek
> <michals@xilinx.com>; mchehab@kernel.org; leoyang.li@nxp.com;
> amit.kucheria@linaro.org; olof@lixom.net; Srinivas Goud <sgoud@xilinx.com>;
> Anirudha Sarangi <anirudh@xilinx.com>; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> edac@vger.kernel.org
> Subject: Re: [PATCH v5 3/4] edac: synopsys: Add EDAC ECC support for ZynqMP
> DDRC
> 
> On Fri, Aug 31, 2018 at 06:57:49PM +0530, Manish Narani wrote:
> > Add EDAC ECC support for ZynqMP DDRC IP. Also add support for ECC
> > Error Injection in ZynqMP. The corrected and uncorrected error
> > interrupts support is added. The Row, Column, Bank, Bank Group and
> > Rank bits positions are determined via Address Map registers of Synopsys
> DDRC.
> > Minor indentation changes are also done for better readability.
> >
> > Signed-off-by: Manish Narani <manish.narani@xilinx.com>
> > ---
> >  drivers/edac/Kconfig         |    2 +-
> >  drivers/edac/synopsys_edac.c | 1054
> > +++++++++++++++++++++++++++++++++++++-----
> >  2 files changed, 937 insertions(+), 119 deletions(-)
> 
> ...
> 
> > @@ -222,11 +408,77 @@ static int synps_edac_geterror_info(struct
> > synps_edac_priv *priv)  }
> >
> >  /**
> > + * zynqmp_geterror_info - Get the current ECC error info
> > + * @priv:	DDR memory controller private instance data
> > + *
> > + * Get the ECC error information from the ECC registers and clear the
> > +error
> > + * status bits in the ECC registers.
> > + *
> > + * Return: 0 if there is no error, otherwise return 1  */ static int
> > +zynqmp_geterror_info(struct synps_edac_priv *priv) {
> > +	void __iomem *base;
> > +	struct synps_ecc_status *p;
> > +	u32 regval, clearval = 0;
> > +
> > +	if (!priv)
> > +		return 1;
> 
> Same as for the previous patch: why are you testing this since you're
> dereferencing it before calling this function?

Okay.

> 
> ...
> 
> > @@ -258,10 +536,46 @@ static void synps_edac_handle_error(struct
> > mem_ctl_info *mci,  }
> >
> >  /**
> > + * synps_edac_intr_handler - Interrupt Handler for ECC interrupts
> > + * @irq:        irq number
> > + * @dev_id:     device id pointer
> > + *
> > + * This is the ISR called by EDAC core interrupt thread.
> 
> There's an "EDAC core interrupt thread"?!? This is the first time I hear of it.
> 
> Try again.

Okay. I will update this in v6.

> 
> > + * This is used to check and post ECC errors.
> > + *
> > + * Return: IRQ_NONE, if interrupt not set or IRQ_HANDLED otherwise.
> > + */
> > +static irqreturn_t synps_edac_intr_handler(int irq, void *dev_id) {
> > +	struct mem_ctl_info *mci = dev_id;
> > +	struct synps_edac_priv *priv = mci->pvt_info;
> > +	const struct synps_platform_data *p_data = priv->p_data;
> > +	int status, regval;
> > +
> > +	regval = readl(priv->baseaddr + DDR_QOS_IRQ_STAT_OFST);
> > +	regval &= (DDR_QOSCE_MASK | DDR_QOSUE_MASK);
> > +	if (!(regval & ECC_CE_UE_INTR_MASK))
> > +		return IRQ_NONE;
> > +
> > +	status = p_data->geterror_info(priv);
> > +	if (status)
> > +		return IRQ_NONE;
> > +
> > +	priv->ce_cnt += priv->stat.ce_cnt;
> > +	priv->ue_cnt += priv->stat.ue_cnt;
> > +	synps_edac_handle_error(mci, &priv->stat);
> > +
> > +	edac_dbg(3, "Total error count ce %d ue %d\n",
> 
> "ce" and "ue" are also abbreviations and should be in caps.

Okay. Will be taken care in v6.

> 
> ...
> 
> > +static DEVICE_ATTR_RW(inject_data_error);
> > +static DEVICE_ATTR_RW(inject_data_poison);
> > +
> > +static int synps_edac_create_sysfs_attributes(struct mem_ctl_info
> > +*mci) {
> > +	int rc;
> > +
> > +	rc = device_create_file(&mci->dev, &dev_attr_inject_data_error);
> > +	if (rc < 0)
> > +		return rc;
> > +	rc = device_create_file(&mci->dev, &dev_attr_inject_data_poison);
> > +	if (rc < 0)
> > +		return rc;
> > +	return 0;
> > +}
> 
> I think I'm having a deja-vu:
> 
> Last time I said:
> 
> "More importantly, you need to put all that injection functionality behind
> CONFIG_EDAC_DEBUG - you don't want to expose the injection capabilities on
> a production machine."
> 
> and you said:
> 
> "I agree. I will update the same by keeping the above mentioned macro."
> 
> But maybe you've misunderstood me.

I missed it in v5. Sorry for the inconvenience. Will update that in v6.

> 
> Grep the other EDAC drivers to find out how to hide the injection functionality
> behind CONFIG_EDAC_DEBUG.
> 
> And maybe this patch is becoming huuge and too unwieldy to review properly
> and for you to incorporate all the feedback.
> 
> Therefore, please split it in single patches, each of which is doing different
> things:
> 
> 1. fixup/change comments
> 2. add defines
> 3. add functionality X
> 4. add functionality Y
> ...
> 5. add injection
> 6. tie it all together

Will do the same in v6.

Thanks,
Manish Narani
