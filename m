From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH 3/8] iommu/arm-smmu-v3: Support platform SSID
Date: Tue, 11 Jun 2019 15:35:25 +0100
Message-ID: <ea6f9c3b-8a4e-d13c-206e-6c64d1c99d8b@arm.com>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
 <20190610184714.6786-4-jean-philippe.brucker@arm.com>
 <20190611104214.00001f2c@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190611104214.00001f2c@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, will.deacon@arm.com, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, robh+dt@kernel.org, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/06/2019 10:42, Jonathan Cameron wrote:
>> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
>> index 519e40fb23ce..b91df613385f 100644
>> --- a/include/linux/iommu.h
>> +++ b/include/linux/iommu.h
>> @@ -536,6 +536,7 @@ struct iommu_fwspec {
>>  	struct fwnode_handle	*iommu_fwnode;
>>  	void			*iommu_priv;
>>  	u32			flags;
>> +	u32			num_pasid_bits;
> 
> This structure has kernel doc so you need to add something for this.

Good catch

Thanks,
Jean
