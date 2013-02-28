From: Dinh Nguyen <dinguyen@altera.com>
Subject: Re: [PATCH v9 0/4] Add generic driver for on-chip SRAM
Date: Thu, 28 Feb 2013 09:51:58 -0600
Message-ID: <1362066718.20662.2.camel@linux-builds1>
References: <1360770402-23091-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1360770402-23091-1-git-send-email-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, Fabio Estevam <fabio.estevam@freescale.com>, Matt Porter <mporter@ti.com>, Dong Aisheng <dong.aisheng@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Richard Zhao <richard.zhao@freescale.com>, Javier Martin <javier.martin@vista-silicon.com>, kernel@pengutronix.de, Huang Shijie <shijie8@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On Wed, 2013-02-13 at 16:46 +0100, Philipp Zabel wrote:
> These patches add support to configure on-chip SRAM via device-tree
> node or platform data and to obtain the resulting genalloc pool from
> the struct device pointer or a phandle pointing at the device tree node.
> This allows drivers to allocate SRAM with the genalloc API without
> hard-coding the genalloc pool pointer.
> 
> The on-chip SRAM on i.MX53 and i.MX6q can be registered via device tree
> and changed to use the simple generic SRAM driver:
> 
>                 ocram: ocram@00900000 {
>                         compatible = "fsl,imx-ocram", "mmio-sram";
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
> Changes since v8:
>  - The sram driver now matches against the "mmio-sram" compatible string.
>  - Removed a whitespace error in the device tree binding documentation.
> 
> regards
> Philipp
> 
> ---
>  Documentation/devicetree/bindings/media/coda.txt |   30 ++++++
>  Documentation/devicetree/bindings/misc/sram.txt  |   16 +++
>  arch/arm/boot/dts/imx53.dtsi                     |    5 +
>  arch/arm/boot/dts/imx6q.dtsi                     |    6 ++
>  drivers/media/platform/Kconfig                   |    1 -
>  drivers/media/platform/coda.c                    |   45 +++++---
>  drivers/misc/Kconfig                             |    9 ++
>  drivers/misc/Makefile                            |    1 +
>  drivers/misc/sram.c                              |  121 ++++++++++++++++++++++
>  include/linux/genalloc.h                         |   15 +++
>  include/linux/platform_data/coda.h               |   18 ++++
>  lib/genalloc.c                                   |   81 +++++++++++++++
>  12 files changed, 333 insertions(+), 15 deletions(-)
> 

Sorry the late comment, with this patch I think you can probably remove:

linux/platform_data/imx-iram.himx-iram.h
mach-imx/iram_alloc.c


I don't see any usage of iram_init except for coda.

Dinh


> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
> 
