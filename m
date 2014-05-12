From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC] Describing arbitrary bus mastering relationships in DT
Date: Mon, 12 May 2014 20:10:38 +0200
Message-ID: <25333129.urqEa0mCI8@wuerfel>
References: <20140501173248.GD3732@e103592.cambridge.arm.com> <20140509105638.GB3921@e103592.cambridge.arm.com> <5370F484.9030209@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5370F484.9030209-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shaik Ameer Basha <shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Grant Grundler <grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 12 May 2014 10:19:16 Stephen Warren wrote:
> On 05/09/2014 04:56 AM, Dave Martin wrote:
> > On Fri, May 02, 2014 at 09:06:43PM +0200, Arnd Bergmann wrote:
> >> On Friday 02 May 2014 12:50:17 Stephen Warren wrote:
> ...
> >>> Now, perhaps there are devices which themselves control whether
> >>> transactions are sent to the IOMMU or direct to RAM, but I'm not
> >>> familiar with them. Is the GPU in that category, since it has its own
> >>> GMMU, albeit chained into the SMMU IIRC?
> >>
> >> Devices with a built-in IOMMU such as most GPUs are also easy enough
> >> to handle: There is no reason to actually show the IOMMU in DT and
> >> we can just treat the GPU as a black box.
> > 
> > It's impossible for such a built-in IOMMU to be shared with other
> > devices, so that's probably reasonable.
> 
> I don't believe that's true.
> 
> For example, on Tegra, the CPU (and likely anything that can bus-master
> the relevant bus) can send transactions into the GPU, which can then
> turn them around towards RAM, and those likely then go through the MMU
> inside the GPU.
> 
> IIRC, the current Nouveau support for Tegra even makes use of that
> feature, although I think that's a temporary thing that we're hoping to
> get rid of once the Tegra support in Nouveau gets more mature.

But the important point here is that you wouldn't use the dma-mapping
API to manage this. First of all, the CPU is special anyway, but also
if you do a device-to-device DMA into the GPU address space and that
ends up being redirected to memory through the IOMMU, you still wouldn't
manage the I/O page tables through the interfaces of the device doing the
DMA, but through some private interface of the GPU.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
