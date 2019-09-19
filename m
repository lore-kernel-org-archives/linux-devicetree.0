From: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH 8/8] iommu/arm-smmu-v3: Add support for PCI PASID
Date: Thu, 19 Sep 2019 17:10:02 +0200
Message-ID: <20190919151002.GF1013538@lophozonia>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
 <20190610184714.6786-9-jean-philippe.brucker@arm.com>
 <b0e3d9a9-6085-b393-1982-3dd95bf5d100@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b0e3d9a9-6085-b393-1982-3dd95bf5d100@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Auger Eric <eric.auger@redhat.com>
Cc: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, will.deacon@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, jacob.jun.pan@linux.intel.com, joro@8bytes.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, robh+dt@kernel.org, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 08, 2019 at 09:58:16AM +0200, Auger Eric wrote:
> > +	ret = pci_enable_pasid(pdev, features);
> > +	if (!ret)
> > +		master->ssid_bits = min_t(u8, ilog2(num_pasids),
> > +					  master->smmu->ssid_bits);
> I don't really get why this setting is conditional to the success of
> pci_enabled_pasid and not num_pasids > 0.

num_pasids only contains the value of the PCIe PASID capability. If
pci_enable_pasid() fails then we want to leave master->ssid_bits to 0 so
that we report to users that SVA and AUXD aren't supported.

> If it fails the ssid_bits is set to min(smmu->ssid_bits,
> fwspec->num_pasid_bits) anyway.
>
> > +	return ret;
> > +}
> > +
> > +static void arm_smmu_disable_pasid(struct arm_smmu_master *master)
> > +{
> > +	struct pci_dev *pdev;
> > +
> > +	if (!dev_is_pci(master->dev))
> > +		return;
> > +
> > +	pdev = to_pci_dev(master->dev);
> > +
> > +	if (!pdev->pasid_enabled)
> > +		return;
> > +
> > +	pci_disable_pasid(pdev);
> > +	master->ssid_bits = 0;
> in case of a platform device you leave the ssid_bits to a value != 0. Is
> that what you want?

Yes, this is only for PCI devices, there is no standard way of disabling
PASID in platform devices. We just take whatever the firmware gives us.

> > +}
> > +
> >  static void arm_smmu_detach_dev(struct arm_smmu_master *master)
> >  {
> >  	unsigned long flags;
> > @@ -2413,6 +2456,9 @@ static int arm_smmu_add_device(struct device *dev)
> >  
> >  	master->ssid_bits = min(smmu->ssid_bits, fwspec->num_pasid_bits);
> >  
> > +	/* Note that PASID must be enabled before, and disabled after ATS */
> > +	arm_smmu_enable_pasid(master);
> In case the call fails, don't you want to handle the error and reset the
> ssid_bits?

This function fails if the device doesn't support PASID, and we leave
ssid_bits to 0. That said, I think it would be nicer to move the above
line (that deals with fwspec) into arm_smmu_enable_pasid()

Thanks,
Jean
