From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 0/2] mtd: nand: omap2: Add EDMA support for NAND DMA
 prefetch
Date: Mon, 30 May 2016 11:09:50 +0200
Message-ID: <20160530110950.29ac7a43@bbrezillon>
References: <1462386884-16380-1-git-send-email-fcooper@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462386884-16380-1-git-send-email-fcooper@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Franklin S Cooper Jr <fcooper@ti.com>
Cc: robh+dt@kernel.org, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, rogerq@ti.com, tony@atomide.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, vigneshr@ti.com, nsekhar@ti.com
List-Id: devicetree@vger.kernel.org

Hi Franklin,

On Wed,  4 May 2016 13:34:42 -0500
Franklin S Cooper Jr <fcooper@ti.com> wrote:

> This patchset includes the required patches to enable NAND DMA prefetch
> support when using the EDMA.
> 
> This patchset depends on my previous patchset to enable NAND DMA prefetch
> using the SDMA and Roger's GPMC and NAND rework. Both of these patchsets
> are apart of Boris' NAND next patch. Therefore, these patches are also
> built on top of this branch.
> 
> Also the following patches that fixes GPMC's DMA property are required
> and pulled into other trees but are not currently apart of the above
> branch:
> https://patchwork.ozlabs.org/patch/596014/
> https://patchwork.ozlabs.org/patch/596012/

Applied.

Thanks,

Boris

> 
> Version 2 changes:
> Switched to the new dma_request_chan api which is now preferred.
> Add performance numbers to the commit.
> 
> Franklin S Cooper Jr (2):
>   mtd: nand: omap2: Support parsing dma channel information from DT
>   ARM: OMAP2+: Update GPMC and NAND DT binding documentation
> 
>  Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt | 7 ++++++-
>  Documentation/devicetree/bindings/mtd/gpmc-nand.txt                | 2 +-
>  drivers/mtd/nand/omap2.c                                           | 7 ++-----
>  3 files changed, 9 insertions(+), 7 deletions(-)
> 



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
