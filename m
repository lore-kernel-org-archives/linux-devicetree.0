From: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH 3/8] iommu/arm-smmu-v3: Support platform SSID
Date: Mon, 8 Jul 2019 09:58:22 +0200
Message-ID: <63d4a71a-8e3f-f663-34bc-6647971b7e4b@redhat.com>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
 <20190610184714.6786-4-jean-philippe.brucker@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190610184714.6786-4-jean-philippe.brucker@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, will.deacon@arm.com
Cc: joro@8bytes.org, robh+dt@kernel.org, mark.rutland@arm.com, robin.murphy@arm.com, jacob.jun.pan@linux.intel.com, iommu@lists.linux-foundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Jean,

On 6/10/19 8:47 PM, Jean-Philippe Brucker wrote:
> For platform devices that support SubstreamID (SSID), firmware provides
> the number of supported SSID bits. Restrict it to what the SMMU supports
> and cache it into master->ssid_bits.
The commit message may give the impression the master's ssid_bits field
only is used for platform devices.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> ---
>  drivers/iommu/arm-smmu-v3.c | 11 +++++++++++
>  drivers/iommu/of_iommu.c    |  6 +++++-
>  include/linux/iommu.h       |  1 +
>  3 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index 4d5a694f02c2..3254f473e681 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -604,6 +604,7 @@ struct arm_smmu_master {
>  	struct list_head		domain_head;
>  	u32				*sids;
>  	unsigned int			num_sids;
> +	unsigned int			ssid_bits;
>  	bool				ats_enabled		:1;
>  };
>  
> @@ -2097,6 +2098,16 @@ static int arm_smmu_add_device(struct device *dev)
>  		}
>  	}
>  
> +	master->ssid_bits = min(smmu->ssid_bits, fwspec->num_pasid_bits);
In case the device is a PCI device, what is the value taken by
fwspec->num_pasid_bits?
> +
> +	/*
> +	 * If the SMMU doesn't support 2-stage CD, limit the linear
> +	 * tables to a reasonable number of contexts, let's say
> +	 * 64kB / sizeof(ctx_desc) = 1024 = 2^10
ctx_desc is 26B so 11bits would be OK
> +	 */
> +	if (!(smmu->features & ARM_SMMU_FEAT_2_LVL_CDTAB))
> +		master->ssid_bits = min(master->ssid_bits, 10U);
> +
>  	group = iommu_group_get_for_dev(dev);
>  	if (!IS_ERR(group)) {
>  		iommu_group_put(group);
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index f04a6df65eb8..04f4f6b95d82 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -206,8 +206,12 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
>  			if (err)
>  				break;
>  		}
> -	}
>  
> +		fwspec = dev_iommu_fwspec_get(dev);
> +		if (!err && fwspec)
> +			of_property_read_u32(master_np, "pasid-num-bits",
> +					     &fwspec->num_pasid_bits);
> +	}
>  
>  	/*
>  	 * Two success conditions can be represented by non-negative err here:
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 519e40fb23ce..b91df613385f 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -536,6 +536,7 @@ struct iommu_fwspec {
>  	struct fwnode_handle	*iommu_fwnode;
>  	void			*iommu_priv;
>  	u32			flags;
> +	u32			num_pasid_bits;
>  	unsigned int		num_ids;
>  	u32			ids[1];
>  };
> 
Thanks

Eric
