From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC] Describing arbitrary bus mastering relationships in DT
Date: Mon, 12 May 2014 21:53:41 +0200
Message-ID: <5235938.KqUI5iMopI@wuerfel>
References: <20140501173248.GD3732@e103592.cambridge.arm.com> <25333129.urqEa0mCI8@wuerfel> <537112FC.1040204@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <537112FC.1040204-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shaik Ameer Basha <shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Grant Grundler <grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 12 May 2014 12:29:16 Stephen Warren wrote:
> On 05/12/2014 12:10 PM, Arnd Bergmann wrote:
> > On Monday 12 May 2014 10:19:16 Stephen Warren wrote:
> >> IIRC, the current Nouveau support for Tegra even makes use of that
> >> feature, although I think that's a temporary thing that we're hoping to
> >> get rid of once the Tegra support in Nouveau gets more mature.
> > 
> > But the important point here is that you wouldn't use the dma-mapping
> > API to manage this. First of all, the CPU is special anyway, but also
> > if you do a device-to-device DMA into the GPU address space and that
> > ends up being redirected to memory through the IOMMU, you still wouldn't
> > manage the I/O page tables through the interfaces of the device doing the
> > DMA, but through some private interface of the GPU.
> 
> Why not? If something wants to DMA to a memory region, irrespective of
> whether the GPU MMU (or any MMU) is in between those master transactions
> and the RAM or not, surely the driver should always use the DMA mapping
> API to set that up? Anything else just means using custom APIs, and
> isn't the whole point of the DMA mapping API to provide a standard API
> for that purpose?

It sounds like an abuse of the hardware if you use the GPU's IOMMU
to set up DMA for a random non-GPU DMA master. I'd prefer not to go
there and instead use swiotlb.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
