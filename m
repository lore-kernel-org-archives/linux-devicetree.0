From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH 8/8] iommu/arm-smmu-v3: Add support for PCI PASID
Date: Tue, 11 Jun 2019 15:35:35 +0100
Message-ID: <3994ac33-e3e5-ba34-a669-c70a76a97e6e@arm.com>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
 <20190610184714.6786-9-jean-philippe.brucker@arm.com>
 <20190611114542.000021f1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190611114542.000021f1@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, will.deacon@arm.com, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, robh+dt@kernel.org, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/06/2019 11:45, Jonathan Cameron wrote:
>> +	pci_disable_pasid(pdev);
>> +	master->ssid_bits = 0;
> 
> If we are being really fussy about ordering, why have this set of
> ssid_bits after pci_disable_pasid rather than before (to reverse order
> of .._enable_pasid)?

Sure, I'll change that

Thanks,
Jean
