From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC 2/4] irqchip, gicv3-its:Workaround for HiSilicon erratum
 161010801
Date: Tue, 24 Jan 2017 14:15:05 +0000
Message-ID: <20170124141505.GD7572@leverpostej>
References: <5886262C.6070108@huawei.com>
 <58875B0D.4080303@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <58875B0D.4080303-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: marc.zyngier-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 24, 2017 at 01:47:57PM +0000, Shameerali Kolothum Thodi wrote:
> The HiSilicon erratum 161010801 describes the limitation of certain
> HiSilicon platforms to support the SMMU mappings for MSI transactions.
> 
> On these platforms GICv3 ITS translator is presented with the deviceID
> by extending the MSI payload data to 64 bits to include the deviceID.
> Hence, the PCIe controller on this platforms has to differentiate the
> MSI payload against other DMA payload and has to modify the MSI payload.
> This basically makes it difficult for this platforms to have a SMMU
> translation for MSI.

Do you mean that the PCIe root controller looking at the (virtual)
addresses of DMA and comparing these against the (physical) address of
the ITS in order to determine if a write is an MSI?

I can't see anything in this patch specifically enabling bypass for
MSIs. Do writes to the ITS (physical) address always bypass the SMMU,
and go straight to the ITS? Regardless of translation applied to other
DMA?

It sounds like this will have severe implications for virtualization.

> Also these platforms doesn't have a proper IIDR
> register to use the existing IIDR based quirk mechanism.

What exactly is wrong with the IIDR on these platforms? That sounds like
an erratum as of itself.

What precise value do reads of the IIDR return? Or do reads result in
other erroneous behaviour?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
