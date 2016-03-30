From: Eric Auger <eric.auger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 11/13] dtb: amd: Add PCIe SMMU device tree node
Date: Wed, 30 Mar 2016 17:57:08 +0200
Message-ID: <56FBF754.7020804@linaro.org>
References: <1453929121-12171-1-git-send-email-Suravee.Suthikulpanit@amd.com>
 <20160128111453.GG17123@leverpostej> <56AA07AA.7050701@arm.com>
 <6645680.g0j8d12m6d@wuerfel> <20160128142751.GA775@arm.com>
 <56FBF2B7.8090601@linaro.org> <20160330154538.GA10224@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160330154538.GA10224-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, leo.duran-5C7GfCeVMHo@public.gmane.org, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, thomas.lendacky-5C7GfCeVMHo@public.gmane.org, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "eric.auger-qxv4g6HH51o@public.gmane.org" <eric.auger-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Will,
On 03/30/2016 05:45 PM, Will Deacon wrote:
> Hi Eric,
> 
> On Wed, Mar 30, 2016 at 05:37:27PM +0200, Eric Auger wrote:
>> On 01/28/2016 03:27 PM, Will Deacon wrote:
>>> On Thu, Jan 28, 2016 at 03:17:33PM +0100, Arnd Bergmann wrote:
>>>> On Thursday 28 January 2016 12:20:58 Robin Murphy wrote:
>>>>>>
>>>>> Any IDs specified here would only apply to DMA by the "platform device" 
>>>>> side of the host controller itself (as would an equivalent "iommus" 
>>>>> property on pcie0 once I finish the SMMUv2 generic binding support I'm 
>>>>> working on). In terms of PCI devices, the "mmu-masters" property is 
>>>>> overloaded such that only its existence matters, to identify that there 
>>>>> _is_ a relationship between the SMMU and the PCI bus(es) behind that 
>>>>> host controller.
>>>>
>>>> I wasn't aware that this was actually still specified. I had hoped
>>>> we were getting rid of mmu-masters before anyone actually started
>>>> using it, but now I see it in ns2.dtsi and fsl-ls2080a.dtsi.
>>>>
>>>> Does anyone know what happened to the plan to use the iommu DT binding
>>>> for the ARM SMMU instead? Do we now have to support both ways indefinitely?
>>>
>>> We always did -- Seattle used the mmu-masters binding before the generic
>>> binding even existed. Robin has been working on patches to get of_xlate
>>> up and running, but it got held up by Laurent's series which didn't end
>>> up going anywhere.
>>>
>> Up to now I have used the PCI smmu description as described in Suravee's
>> patch and this does not work anymore with 4.6-rc1 since the default
>> domain was introduced. So now I see 2 SMRs matching a single streamid
>> (in my case 256, one steming from the "platform device" side of the host
>> controller and one steming from the PCI device) and this causes SMCF
>> (stream match conflict fault). So PCIe PF does not work.
> 
> Sorry about that, it wasn't intentional. In fact, I wrote commit
> cbf8277ef456 ("iommu/arm-smmu: Treat IOMMU_DOMAIN_DMA as bypass for now")
> specifically to avoid this breakage, after seeing it myself with VFIO
> and an S2CR-based configuration. It looks like the check just needs moving
> higher up (i.e. before we initialise the SMRs).
> 
> Does that fix it for you?
Yes this fixes the issue for me, thanks! I guess you will send that patch?

So eventually what is the right way to describe the smmu-masters (~
future of that patch)?

Best Regards

Eric
> 
> Will
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
