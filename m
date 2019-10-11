From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 0/2] iommu/arm-smmu: Add an optional "input-address-size"
 property
Date: Fri, 11 Oct 2019 10:16:28 +0100
Message-ID: <e99e07c2-88c6-e4d8-af80-c46d36bc6cd0@arm.com>
References: <20191011034609.13319-1-nicoleotsuka@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191011034609.13319-1-nicoleotsuka@gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org, robh+dt@kernel.org, mark.rutland@arm.com, will@kernel.org
Cc: vdumpa@nvidia.com, iommu@lists.linux-foundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2019-10-11 4:46 am, Nicolin Chen wrote:
> This series of patches add an optional DT property to allow an SoC to
> specify how many bits being physically connected to its SMMU instance,
> depending on the SoC design.

This has come up before, and it doesn't work in general because a single 
SMMU instance can have many master interfaces, with potentially 
different sizes of address bus wired up to each. It's also a 
conceptually-wrong approach anyway, since this isn't a property of the 
SMMU; it's a property of the interconnect(s) upstream of the SMMU.

IIRC you were working on Tegra - if so, Thierry already has a plan, see 
this thread: 
https://lore.kernel.org/linux-arm-kernel/20190930133510.GA1904140@ulmo/

Robin.

> 
> Nicolin Chen (2):
>    dt-bindings: arm-smmu: Add an optional "input-address-size" property
>    iommu/arm-smmu: Read optional "input-address-size" property
> 
>   Documentation/devicetree/bindings/iommu/arm,smmu.txt |  7 +++++++
>   drivers/iommu/arm-smmu.c                             | 10 ++++++++--
>   2 files changed, 15 insertions(+), 2 deletions(-)
> 
