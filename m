From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 5/8] arm64: use ZONE_DMA on DMA addressing limited devices
Date: Wed, 31 Jul 2019 18:07:42 +0100
Message-ID: <20190731170742.GC17773@arrakis.emea.arm.com>
References: <20190731154752.16557-1-nsaenzjulienne@suse.de>
 <20190731154752.16557-6-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190731154752.16557-6-nsaenzjulienne@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: hch@lst.de, wahrenst@gmx.net, marc.zyngier@arm.com, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, iommu@lists.linux-foundation.org, linux-mm@kvack.org, Will Deacon <will@kernel.org>, phill@raspberryi.org, f.fainelli@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, eric@anholt.net, mbrugger@suse.com, akpm@linux-foundation.org, frowand.list@gmail.com, m.szyprowski@samsung.com, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 31, 2019 at 05:47:48PM +0200, Nicolas Saenz Julienne wrote:
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 1c4ffabbe1cb..f5279ef85756 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -50,6 +50,13 @@
>  s64 memstart_addr __ro_after_init = -1;
>  EXPORT_SYMBOL(memstart_addr);
>  
> +/*
> + * We might create both a ZONE_DMA and ZONE_DMA32. ZONE_DMA is needed if there
> + * are periferals unable to address the first naturally aligned 4GB of ram.
> + * ZONE_DMA32 will be expanded to cover the rest of that memory. If such
> + * limitations doesn't exist only ZONE_DMA32 is created.
> + */

Shouldn't we instead only create ZONE_DMA to cover the whole 32-bit
range and leave ZONE_DMA32 empty? Can__GFP_DMA allocations fall back
onto ZONE_DMA32?

-- 
Catalin
