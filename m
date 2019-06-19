From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH 3/8] iommu/arm-smmu-v3: Support platform SSID
Date: Wed, 19 Jun 2019 12:53:46 +0100
Message-ID: <73cfb797-5ae7-b9d9-01ea-fe98a1bed5c3@arm.com>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
 <20190610184714.6786-4-jean-philippe.brucker@arm.com>
 <20190618180851.GK4270@fuggles.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618180851.GK4270@fuggles.cambridge.arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: "joro@8bytes.org" <joro@8bytes.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Robin Murphy <Robin.Murphy@arm.com>, "jacob.jun.pan@linux.intel.com" <jacob.jun.pan@linux.intel.com>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>
List-Id: devicetree@vger.kernel.org

On 18/06/2019 19:08, Will Deacon wrote:
>> +	/*
>> +	 * If the SMMU doesn't support 2-stage CD, limit the linear
>> +	 * tables to a reasonable number of contexts, let's say
>> +	 * 64kB / sizeof(ctx_desc) = 1024 = 2^10
>> +	 */
>> +	if (!(smmu->features & ARM_SMMU_FEAT_2_LVL_CDTAB))
>> +		master->ssid_bits = min(master->ssid_bits, 10U);
> 
> Please introduce a #define for the 10, so that it is computed in the way
> you describe in the comment (a bit like we do for things like queue sizes).

Ok

>> +
>>  	group = iommu_group_get_for_dev(dev);
>>  	if (!IS_ERR(group)) {
>>  		iommu_group_put(group);
>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>> index f04a6df65eb8..04f4f6b95d82 100644
>> --- a/drivers/iommu/of_iommu.c
>> +++ b/drivers/iommu/of_iommu.c
>> @@ -206,8 +206,12 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
>>  			if (err)
>>  				break;
>>  		}
>> -	}
>>  
>> +		fwspec = dev_iommu_fwspec_get(dev);
>> +		if (!err && fwspec)
>> +			of_property_read_u32(master_np, "pasid-num-bits",
>> +					     &fwspec->num_pasid_bits);
>> +	}
> 
> Hmm. Do you know if there's anything in ACPI for this?

Yes, IORT version D introduced a "substream width" field for the Named
component node (platform device). I don't think it existed last time I
checked, so I'll see about supporting it.

Thanks,
Jean
