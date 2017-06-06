From: Jean-Philippe Brucker <jean-philippe.brucker-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: juno: Enable some SMMUs
Date: Tue, 6 Jun 2017 16:45:38 +0100
Message-ID: <5e24adfa-3342-f331-1ed3-ed32ebf164cb@arm.com>
References: <eeb81dbbd7ddfbbccb961c0f20c5cb90f120e89f.1495110010.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <eeb81dbbd7ddfbbccb961c0f20c5cb90f120e89f.1495110010.git.robin.murphy-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, liviu.dudau-5wv7dgnIgG8@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On 18/05/17 13:23, Robin Murphy wrote:
> The IOMMU-backed DMA API support has now been in place for a while and
> proven stable, so there's no real need to keep most of Juno's SMMUs
> disabled. The USB, HDLCDs, and CoreSight ETR all just need to map RAM
> buffers for DMA - enabling their SMMUs obviates CPU bounce buffering for
> USB's streaming DMA to the upper memory bank, and lets the other two
> allocate their relatively large coherent buffers without pressuring CMA.
> 
> Some more software work is still needed for the DMA-330 and PCIe before
> those can accommodate SMMU translation correctly in all cases, so we
> leave those alone for now.

Out of curiosity, what is missing for DMA-330? I can use dmatest over SMMU
on my juno-r1 by enabling the node, but I don't have any complex workload
yet. Guest pass-through is really unreliable and I'm trying to figure out why.

Thanks,
Jean
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
