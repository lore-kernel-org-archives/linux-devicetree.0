From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v7 0/4] Add generic driver for on-chip SRAM
Date: Tue, 04 Dec 2012 09:53:38 +0100
Message-ID: <1354611218.3410.11.camel@pizza.hi.pengutronix.de>
References: <1353680655-21624-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1353680655-21624-1-git-send-email-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Shawn Guo <shawn.guo@linaro.org>, Richard Zhao <richard.zhao@freescale.com>, Huang Shijie <shijie8@gmail.com>, Dong Aisheng <dong.aisheng@linaro.org>, Matt Porter <mporter@ti.com>, Fabio Estevam <fabio.estevam@freescale.com>, Javier Martin <javier.martin@vista-silicon.com>, kernel@pengutronix.de, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, 2012-11-23 at 15:24 +0100, Philipp Zabel wrote:
> These patches add support to configure on-chip SRAM via device-tree
> node or platform data and to obtain the resulting genalloc pool from
> the physical address or a phandle pointing at the device tree node.
> This allows drivers to allocate SRAM with the genalloc API without
> hard-coding the genalloc pool pointer.

are there any further comments on this series?

> The on-chip SRAM on i.MX53 and i.MX6q can be registered via device tree
> and changed to use the simple generic SRAM driver:
> 
>                 ocram: ocram@00900000 {
>                         compatible = "fsl,imx-ocram", "sram";
>                         reg = <0x00900000 0x3f000>;
>                 };
> 
> A driver that needs to allocate SRAM buffers, like the video processing
> unit on i.MX53, can retrieve the genalloc pool from a phandle in the
> device tree using of_get_named_gen_pool(node, "iram", 0) from patch 1:
> 
>                 vpu@63ff4000 {
>                         /* ... */
>                         iram = <&ocram>;
>                 };
> 
> The allocation granularity is hard-coded to 32 bytes for now,
> until a way to configure it can be agreed upon. There is overhead
> for bigger SRAMs, where only a much coarser allocation granularity
> is needed: At 32 bytes minimum allocation size, a 256 KiB SRAM
> needs a 1 KiB bitmap to track allocations.
> 
> Once everybody is ok with it, could the first two patches be merged
> through the char-misc tree? I'll resend the i.MX and coda patches to
> the respective lists afterwards.

Arnd, Greg, would you take the first patch "genalloc: add a global pool
list, allow to find pools by phys address" into the char-misc tree if
there are no vetoes? Or should I try and get it merged separately,
first?

regards
Philipp

> Changes since v6:
>  - Reduced the hard coded allocation granularity to 32 bytes.
> 
> regards
> Philipp
> 
> ---
>  Documentation/devicetree/bindings/misc/sram.txt |   17 ++++
>  arch/arm/boot/dts/imx53.dtsi                    |    5 +
>  arch/arm/boot/dts/imx6q.dtsi                    |    6 ++
>  drivers/media/platform/Kconfig                  |    3 +-
>  drivers/media/platform/coda.c                   |   47 ++++++---
>  drivers/misc/Kconfig                            |    9 ++
>  drivers/misc/Makefile                           |    1 +
>  drivers/misc/sram.c                             |  121 +++++++++++++++++++++++
>  include/linux/genalloc.h                        |   14 +++
>  lib/genalloc.c                                  |   67 +++++++++++++
>  10 files changed, 274 insertions(+), 16 deletions(-)
