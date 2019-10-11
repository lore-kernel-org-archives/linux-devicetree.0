From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH 0/2] iommu/arm-smmu: Add an optional "input-address-size"
 property
Date: Fri, 11 Oct 2019 16:55:25 -0700
Message-ID: <20191011235524.GA20683@Asurada-Nvidia.nvidia.com>
References: <20191011034609.13319-1-nicoleotsuka@gmail.com>
 <e99e07c2-88c6-e4d8-af80-c46d36bc6cd0@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e99e07c2-88c6-e4d8-af80-c46d36bc6cd0@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, robh+dt@kernel.org, mark.rutland@arm.com, will@kernel.org, vdumpa@nvidia.com, iommu@lists.linux-foundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 11, 2019 at 10:16:28AM +0100, Robin Murphy wrote:
> On 2019-10-11 4:46 am, Nicolin Chen wrote:
> > This series of patches add an optional DT property to allow an SoC to
> > specify how many bits being physically connected to its SMMU instance,
> > depending on the SoC design.
> 
> This has come up before, and it doesn't work in general because a single
> SMMU instance can have many master interfaces, with potentially different
> sizes of address bus wired up to each. It's also a conceptually-wrong
> approach anyway, since this isn't a property of the SMMU; it's a property of
> the interconnect(s) upstream of the SMMU.
> 
> IIRC you were working on Tegra - if so, Thierry already has a plan, see this
> thread:
> https://lore.kernel.org/linux-arm-kernel/20190930133510.GA1904140@ulmo/

Thanks for the reply and link!
