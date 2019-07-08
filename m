From: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH 8/8] iommu/arm-smmu-v3: Add support for PCI PASID
Date: Mon, 8 Jul 2019 09:58:16 +0200
Message-ID: <b0e3d9a9-6085-b393-1982-3dd95bf5d100@redhat.com>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
 <20190610184714.6786-9-jean-philippe.brucker@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190610184714.6786-9-jean-philippe.brucker@arm.com>
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
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, will.deacon@arm.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jacob.jun.pan@linux.intel.com, joro@8bytes.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, robh+dt@kernel.org, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Jean,

On 6/10/19 8:47 PM, Jean-Philippe Brucker wrote:
> Enable PASID for PCI devices that support it. Since the SSID tables are
> allocated by arm_smmu_attach_dev(), PASID has to be enabled early enough.
> arm_smmu_dev_feature_enable() would be too late, since by that time the
> main DMA domain has already been attached. Do it in add_device() instead.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> ---
>  drivers/iommu/arm-smmu-v3.c | 51 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index 972bfb80f964..a8a516d9ff10 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -2197,6 +2197,49 @@ static void arm_smmu_disable_ats(struct arm_smmu_master *master)
>  	master->ats_enabled = false;
>  }
>  
> +static int arm_smmu_enable_pasid(struct arm_smmu_master *master)
> +{
> +	int ret;
> +	int features;
> +	int num_pasids;
> +	struct pci_dev *pdev;
> +
> +	if (!dev_is_pci(master->dev))
> +		return -ENOSYS;
> +
> +	pdev = to_pci_dev(master->dev);
> +
> +	features = pci_pasid_features(pdev);
> +	if (features < 0)
> +		return -ENOSYS;
> +
> +	num_pasids = pci_max_pasids(pdev);
> +	if (num_pasids <= 0)
> +		return -ENOSYS;
> +
> +	ret = pci_enable_pasid(pdev, features);
> +	if (!ret)
> +		master->ssid_bits = min_t(u8, ilog2(num_pasids),
> +					  master->smmu->ssid_bits);
I don't really get why this setting is conditional to the success of
pci_enabled_pasid and not num_pasids > 0.

If it fails the ssid_bits is set to min(smmu->ssid_bits,
fwspec->num_pasid_bits) anyway.

> +	return ret;
> +}
> +
> +static void arm_smmu_disable_pasid(struct arm_smmu_master *master)
> +{
> +	struct pci_dev *pdev;
> +
> +	if (!dev_is_pci(master->dev))
> +		return;
> +
> +	pdev = to_pci_dev(master->dev);
> +
> +	if (!pdev->pasid_enabled)
> +		return;
> +
> +	pci_disable_pasid(pdev);
> +	master->ssid_bits = 0;
in case of a platform device you leave the ssid_bits to a value != 0. Is
that what you want?
> +}
> +
>  static void arm_smmu_detach_dev(struct arm_smmu_master *master)
>  {
>  	unsigned long flags;
> @@ -2413,6 +2456,9 @@ static int arm_smmu_add_device(struct device *dev)
>  
>  	master->ssid_bits = min(smmu->ssid_bits, fwspec->num_pasid_bits);
>  
> +	/* Note that PASID must be enabled before, and disabled after ATS */
> +	arm_smmu_enable_pasid(master);
In case the call fails, don't you want to handle the error and reset the
ssid_bits?
> +
>  	/*
>  	 * If the SMMU doesn't support 2-stage CD, limit the linear
>  	 * tables to a reasonable number of contexts, let's say
> @@ -2423,7 +2469,7 @@ static int arm_smmu_add_device(struct device *dev)
>  
>  	ret = iommu_device_link(&smmu->iommu, dev);
>  	if (ret)
> -		goto err_free_master;
> +		goto err_disable_pasid;
>  
>  	group = iommu_group_get_for_dev(dev);
>  	if (IS_ERR(group)) {
> @@ -2436,6 +2482,8 @@ static int arm_smmu_add_device(struct device *dev)
>  
>  err_unlink:
>  	iommu_device_unlink(&smmu->iommu, dev);
> +err_disable_pasid:
> +	arm_smmu_disable_pasid(master);
>  err_free_master:
>  	kfree(master);
>  	fwspec->iommu_priv = NULL;
> @@ -2456,6 +2504,7 @@ static void arm_smmu_remove_device(struct device *dev)
>  	arm_smmu_detach_dev(master);
>  	iommu_group_remove_device(dev);
>  	iommu_device_unlink(&smmu->iommu, dev);
> +	arm_smmu_disable_pasid(master);
>  	kfree(master);
>  	iommu_fwspec_free(dev);
>  }
> 
Thanks

Eric
