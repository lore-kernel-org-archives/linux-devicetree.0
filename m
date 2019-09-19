From: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH 3/8] iommu/arm-smmu-v3: Support platform SSID
Date: Thu, 19 Sep 2019 16:51:22 +0200
Message-ID: <20190919145122.GA1013538@lophozonia>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
 <20190610184714.6786-4-jean-philippe.brucker@arm.com>
 <63d4a71a-8e3f-f663-34bc-6647971b7e4b@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <63d4a71a-8e3f-f663-34bc-6647971b7e4b@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Auger Eric <eric.auger@redhat.com>
Cc: will@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, jacob.jun.pan@linux.intel.com, joro@8bytes.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, robh+dt@kernel.org, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Eric,

Sorry for the delay. I'll see if I can resend this for v5.5, although I
can't do much testing at the moment.

On Mon, Jul 08, 2019 at 09:58:22AM +0200, Auger Eric wrote:
> Hi Jean,
> 
> On 6/10/19 8:47 PM, Jean-Philippe Brucker wrote:
> > For platform devices that support SubstreamID (SSID), firmware provides
> > the number of supported SSID bits. Restrict it to what the SMMU supports
> > and cache it into master->ssid_bits.
> The commit message may give the impression the master's ssid_bits field
> only is used for platform devices.

Ok maybe I should add that this field will be used for PCI PASID as
well.

> > @@ -2097,6 +2098,16 @@ static int arm_smmu_add_device(struct device *dev)
> >  		}
> >  	}
> >  
> > +	master->ssid_bits = min(smmu->ssid_bits, fwspec->num_pasid_bits);
> In case the device is a PCI device, what is the value taken by
> fwspec->num_pasid_bits?

It would be zero, as firmware only specifies a value for platform
devices. For a PCI device, patch 8/8 fills master->ssid_bits from the
PCIe PASID capability.

> > +	/*
> > +	 * If the SMMU doesn't support 2-stage CD, limit the linear
> > +	 * tables to a reasonable number of contexts, let's say
> > +	 * 64kB / sizeof(ctx_desc) = 1024 = 2^10
> ctx_desc is 26B so 11bits would be OK

This refers to the size of the hardware context descriptor, not struct
arm_smmu_ctx_desc. Next version moves this to a define and makes it
clearer.

Thanks,
Jean
