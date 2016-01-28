From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 11/13] dtb: amd: Add PCIe SMMU device tree node
Date: Thu, 28 Jan 2016 14:27:52 +0000
Message-ID: <20160128142751.GA775@arm.com>
References: <1453929121-12171-1-git-send-email-Suravee.Suthikulpanit@amd.com>
 <20160128111453.GG17123@leverpostej>
 <56AA07AA.7050701@arm.com>
 <6645680.g0j8d12m6d@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6645680.g0j8d12m6d@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org, thomas.lendacky-5C7GfCeVMHo@public.gmane.org, leo.duran-5C7GfCeVMHo@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 28, 2016 at 03:17:33PM +0100, Arnd Bergmann wrote:
> On Thursday 28 January 2016 12:20:58 Robin Murphy wrote:
> > >
> > > Will, Robin, thoughts?
> > 
> > Any IDs specified here would only apply to DMA by the "platform device" 
> > side of the host controller itself (as would an equivalent "iommus" 
> > property on pcie0 once I finish the SMMUv2 generic binding support I'm 
> > working on). In terms of PCI devices, the "mmu-masters" property is 
> > overloaded such that only its existence matters, to identify that there 
> > _is_ a relationship between the SMMU and the PCI bus(es) behind that 
> > host controller.
> 
> I wasn't aware that this was actually still specified. I had hoped
> we were getting rid of mmu-masters before anyone actually started
> using it, but now I see it in ns2.dtsi and fsl-ls2080a.dtsi.
> 
> Does anyone know what happened to the plan to use the iommu DT binding
> for the ARM SMMU instead? Do we now have to support both ways indefinitely?

We always did -- Seattle used the mmu-masters binding before the generic
binding even existed. Robin has been working on patches to get of_xlate
up and running, but it got held up by Laurent's series which didn't end
up going anywhere.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
