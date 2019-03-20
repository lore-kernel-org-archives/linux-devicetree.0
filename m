From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH] arm64: dts: juno: Enable smmu_pcie for Juno r1/r2
Date: Wed, 20 Mar 2019 19:44:50 +0800
Message-ID: <20190320114450.GB17539@leoy-ThinkPad-X240s>
References: <20190320083105.8954-1-leo.yan@linaro.org>
 <2566ce76-a8b2-c8ac-9f3f-4b99101f7661@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2566ce76-a8b2-c8ac-9f3f-4b99101f7661@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Robin,

On Wed, Mar 20, 2019 at 11:24:18AM +0000, Robin Murphy wrote:
> Hi Leo,
> 
> On 20/03/2019 08:31, Leo Yan wrote:
> > Though PCIe controller has been enabled on Juno r1/r2, but it misses to
> > enable its connected SMMU.  From the testing, even without set this SMMU
> > status property to 'okay', the PCIe NIC device still works well.  Since
> > the SMMU is not enabled in DT binding and its iommu_groups is not
> > created properly, finally this prevents to enable vfio-pci for NIC
> > device with KVM.
> 
> FWIW, whilst it might appear to be fine, there are still potential issues
> once the DMA API sees this SMMU and starts using it, which is why this
> particular change remains as one of my oldest local hacks that I've never
> yet considered upstreamable.
> 
> The IOMMU DMA ops happen to work for light usage now as a side-effect of
> 122fac030e912 combined with the current top-down allocation behaviour, but
> as soon as IOVA usage/fragmentation leads to 32-bit DMA addresses below
> 0x8000000, or full 40-bit addresses, being allocated then data loss and
> other problems will happen (for the reasons explained on the other thread).
> Similarly, it's also going to be fragile to any internal changes in the IOVA
> allocator.
>
> Until we have a decent solution for handling such 'windowed' DMA
> restrictions (there do exist other systems with similar behaviour) I'd be
> very wary of enabling the PCIe SMMU for all users who may not be aware of
> the caveats. Given that the lack of stream IDs and SR-IOV support prevents
> Juno from being a realistic virtualisation platform anyway, I'm not
> convinced there's enough benefit to justify the risk.

Ah, I didn't connect the 'windowde' DMA restriction with the IOMMU
property setting in dt, which actually is deliberate.

Please drop this patch and will leave it to you.  Thanks a lot for
related info.

[...]

Thanks,
Leo Yan
