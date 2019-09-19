From: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH 5/8] iommu/arm-smmu-v3: Add second level of context
 descriptor table
Date: Thu, 19 Sep 2019 17:05:21 +0200
Message-ID: <20190919150521.GD1013538@lophozonia>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
 <20190610184714.6786-6-jean-philippe.brucker@arm.com>
 <3e69caf7-4e8a-4bce-7a89-51e21a0134b1@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3e69caf7-4e8a-4bce-7a89-51e21a0134b1@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Auger Eric <eric.auger@redhat.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jacob.jun.pan@linux.intel.com, joro@8bytes.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, robh+dt@kernel.org, robin.murphy@arm.com
List-Id: devicetree@vger.kernel.org

On Mon, Jul 08, 2019 at 05:13:05PM +0200, Auger Eric wrote:
> >  #define STRTAB_STE_0_S1FMT		GENMASK_ULL(5, 4)
> >  #define STRTAB_STE_0_S1FMT_LINEAR	0
> > +#define STRTAB_STE_0_S1FMT_4K_L2	1
> As you only use 64kB L2, I guess you can remove the 4K define?

I prefer defining all values, but I suppose I can get rid of it.

> > +	cfg->tables = devm_kzalloc(smmu->dev, sizeof(struct arm_smmu_cd_table) *
> > +				   cfg->num_tables, GFP_KERNEL);
> > +	if (!cfg->tables)
> > +		return -ENOMEM;
> goto err_free_l1
> > +
> > +	ret = arm_smmu_alloc_cd_leaf_table(smmu, &cfg->tables[0], num_leaf_entries);
> don't you want to do that only in linear case. In 2-level mode, I
> understand arm_smmu_get_cd_ptr() will do the job.

OK, that might be better

> 
> > +	if (ret)
> > +		goto err_free_l1;
> > +
> > +	if (cfg->l1ptr)
> > +		arm_smmu_write_cd_l1_desc(cfg->l1ptr, &cfg->tables[0]);
> that stuff could be removed as well?

Yes

> By the way I can see that
> arm_smmu_get_cd_ptr() does a arm_smmu_sync_cd after. wouldn't it be
> needed here as well?

No context table is reachable from a STE at this point, so we don't have
to invalidate anything.

> > @@ -1815,7 +1935,7 @@ static void arm_smmu_domain_free(struct iommu_domain *domain)
> >  	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
> >  		struct arm_smmu_s1_cfg *cfg = &smmu_domain->s1_cfg;
> >  
> > -		if (cfg->table.ptr) {
> > +		if (cfg->tables) {
> >  			arm_smmu_free_cd_tables(smmu_domain);
> >  			arm_smmu_bitmap_free(smmu->asid_map, cfg->cd.asid);
> I don't get why the arm_smmu_bitmap_free is dependent on cfg->tables.

Simply because arm_smmu_bitmap_alloc() and arm_smmu_alloc_cd_tables()
are both performed in arm_smmu_domain_finalise_s1(). A domain returned
by arm_smmu_domain_alloc() is not fully initialized, it still needs to
be finalized by arm_smmu_attach_dev(). So here we check whether the
domain has been finalized or not. Zero being a valid ASID in this
driver, we can't check whether cfg->cd.asid is valid, so we check
cfg->tables instead.

And I forgot to clear cfg->tables after failure of domain_finalise in
this series, I'll need to fix it.

Thanks,
Jean
