From: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH 6/8] iommu/arm-smmu-v3: Support auxiliary domains
Date: Thu, 19 Sep 2019 17:06:34 +0200
Message-ID: <20190919150634.GE1013538@lophozonia>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
 <20190610184714.6786-7-jean-philippe.brucker@arm.com>
 <20190626175959.ubxvb2qn4taclact@willie-the-truck>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190626175959.ubxvb2qn4taclact@willie-the-truck>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will@kernel.org>
Cc: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, joro@8bytes.org, robh+dt@kernel.org, mark.rutland@arm.com, robin.murphy@arm.com, jacob.jun.pan@linux.intel.com, iommu@lists.linux-foundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, eric.auger@redhat.com
List-Id: devicetree@vger.kernel.org

On Wed, Jun 26, 2019 at 06:59:59PM +0100, Will Deacon wrote:
> > @@ -666,8 +668,14 @@ struct arm_smmu_domain {
> >  
> >  	struct iommu_domain		domain;
> >  
> > +	/* Unused in aux domains */
> >  	struct list_head		devices;
> >  	spinlock_t			devices_lock;
> > +
> > +	/* Auxiliary domain stuff */
> > +	struct arm_smmu_domain		*parent;
> > +	ioasid_t			ssid;
> > +	unsigned long			aux_nr_devs;
> 
> Maybe use a union to avoid comments about what is used/unused?

OK

> > +static void arm_smmu_aux_detach_dev(struct iommu_domain *domain, struct device *dev)
> > +{
> > +	struct iommu_domain *parent_domain;
> > +	struct arm_smmu_domain *parent_smmu_domain;
> > +	struct arm_smmu_master *master = dev_to_master(dev);
> > +	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> > +
> > +	if (!arm_smmu_dev_feature_enabled(dev, IOMMU_DEV_FEAT_AUX))
> > +		return;
> > +
> > +	parent_domain = iommu_get_domain_for_dev(dev);
> > +	if (!parent_domain)
> > +		return;
> > +	parent_smmu_domain = to_smmu_domain(parent_domain);
> > +
> > +	mutex_lock(&smmu_domain->init_mutex);
> > +	if (!smmu_domain->aux_nr_devs)
> > +		goto out_unlock;
> > +
> > +	if (!--smmu_domain->aux_nr_devs) {
> > +		arm_smmu_write_ctx_desc(parent_smmu_domain, smmu_domain->ssid,
> > +					NULL);
> > +		/*
> > +		 * TLB doesn't need invalidation since accesses from the device
> > +		 * can't use this domain's ASID once the CD is clear.
> > +		 *
> > +		 * Sadly that doesn't apply to ATCs, which are PASID tagged.
> > +		 * Invalidate all other devices as well, because even though
> > +		 * they weren't 'officially' attached to the auxiliary domain,
> > +		 * they could have formed ATC entries.
> > +		 */
> > +		arm_smmu_atc_inv_domain(smmu_domain, 0, 0);
> 
> I've been struggling to understand the locking here, since both
> arm_smmu_write_ctx_desc and arm_smmu_atc_inv_domain take and release the
> devices_lock for the domain. Is there not a problem with devices coming and
> going in-between the two calls?

Yes, I need to think about this more. I bet there are plenty more issues
like this. For example I don't think I currently prevent the parent
domain from disappearing while auxiliary domains are attached.

> >  static struct iommu_ops arm_smmu_ops = {
> >  	.capable		= arm_smmu_capable,
> >  	.domain_alloc		= arm_smmu_domain_alloc,
> > @@ -2539,6 +2772,13 @@ static struct iommu_ops arm_smmu_ops = {
> >  	.of_xlate		= arm_smmu_of_xlate,
> >  	.get_resv_regions	= arm_smmu_get_resv_regions,
> >  	.put_resv_regions	= arm_smmu_put_resv_regions,
> > +	.dev_has_feat		= arm_smmu_dev_has_feature,
> > +	.dev_feat_enabled	= arm_smmu_dev_feature_enabled,
> > +	.dev_enable_feat	= arm_smmu_dev_enable_feature,
> > +	.dev_disable_feat	= arm_smmu_dev_disable_feature,
> 
> Why can't we use the existing ->capable and ->dev_{get,set}_attr callbacks
> for this?

->capable isn't very useful because it applies to all SMMUs in the
system. The existing ->{get,set}_attr callbacks apply to an
iommu_domain. I think the main reason for doing it on endpoints was that
it would be tedious to keep track of capabilities when attaching and
detaching devices to a domain, especially for drivers that allow
multiple IOMMUs per domain [1]. There were more discussions, and in the
end we agreed on this API for device attributes [2].

Thanks,
Jean

[1] https://lore.kernel.org/lkml/aa1ff748-c2ec-acc0-f1d9-cdff2b131e58@linux.intel.com/
[2] https://lore.kernel.org/linux-iommu/20181207102926.GM16835@8bytes.org/
