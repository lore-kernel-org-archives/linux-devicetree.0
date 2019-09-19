From: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH 4/8] iommu/arm-smmu-v3: Add support for Substream IDs
Date: Thu, 19 Sep 2019 16:57:55 +0200
Message-ID: <20190919145755.GB1013538@lophozonia>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
 <20190610184714.6786-5-jean-philippe.brucker@arm.com>
 <20190626180025.g4clm6qnbbna65de@willie-the-truck>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190626180025.g4clm6qnbbna65de@willie-the-truck>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will@kernel.org>
Cc: joro@8bytes.org, robh+dt@kernel.org, mark.rutland@arm.com, robin.murphy@arm.com, jacob.jun.pan@linux.intel.com, iommu@lists.linux-foundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, eric.auger@redhat.com
List-Id: devicetree@vger.kernel.org

On Wed, Jun 26, 2019 at 07:00:26PM +0100, Will Deacon wrote:
> On Mon, Jun 10, 2019 at 07:47:10PM +0100, Jean-Philippe Brucker wrote:
> > In all stream table entries, we set S1DSS=SSID0 mode, making translations
> > without an SSID use context descriptor 0. Although it would be possible by
> > setting S1DSS=BYPASS, we don't currently support SSID when user selects
> > iommu.passthrough.
> 
> I don't understand your comment here: iommu.passthrough works just as it did
> before, right, since we set bypass in the STE config field so S1DSS is not
> relevant?

What isn't supported is bypassing translation *only* for transactions
without SSID, and using context descriptors for anything with SSID. I
don't know if such a mode would be useful, but I can drop that sentence
to avoid confusion.

> I also notice that SSID0 causes transactions with SSID==0 to
> abort. Is a PASID of 0 reserved, so this doesn't matter?

Yes, we never allocate PASID 0.

> 
> > @@ -1062,33 +1143,90 @@ static u64 arm_smmu_cpu_tcr_to_cd(u64 tcr)
> >  	return val;
> >  }
> >  
> > -static void arm_smmu_write_ctx_desc(struct arm_smmu_device *smmu,
> > -				    struct arm_smmu_s1_cfg *cfg)
> > +static int arm_smmu_write_ctx_desc(struct arm_smmu_domain *smmu_domain,
> > +				   int ssid, struct arm_smmu_ctx_desc *cd)
> >  {
> >  	u64 val;
> > +	bool cd_live;
> > +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> > +	__le64 *cdptr = arm_smmu_get_cd_ptr(&smmu_domain->s1_cfg, ssid);
> >  
> >  	/*
> > -	 * We don't need to issue any invalidation here, as we'll invalidate
> > -	 * the STE when installing the new entry anyway.
> > +	 * This function handles the following cases:
> > +	 *
> > +	 * (1) Install primary CD, for normal DMA traffic (SSID = 0).
> > +	 * (2) Install a secondary CD, for SID+SSID traffic.
> > +	 * (3) Update ASID of a CD. Atomically write the first 64 bits of the
> > +	 *     CD, then invalidate the old entry and mappings.
> > +	 * (4) Remove a secondary CD.
> >  	 */
> > -	val = arm_smmu_cpu_tcr_to_cd(cfg->cd.tcr) |
> > +
> > +	if (!cdptr)
> > +		return -ENOMEM;
> > +
> > +	val = le64_to_cpu(cdptr[0]);
> > +	cd_live = !!(val & CTXDESC_CD_0_V);
> > +
> > +	if (!cd) { /* (4) */
> > +		cdptr[0] = 0;
> 
> Should we be using WRITE_ONCE here? (although I notice we don't seem to
> bother for STEs either...)

Yes, I think it makes sense

Thanks,
Jean
