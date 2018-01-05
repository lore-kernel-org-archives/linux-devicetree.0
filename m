From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: Use SPDX license tag for DT files
Date: Thu, 4 Jan 2018 18:01:53 -0800
Message-ID: <3548d411-51a9-a5bc-f4eb-b94381b350e0@gmail.com>
References: <20180104230540.6791-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180104230540.6791-1-robh@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Paul Mackerras <paulus@samba.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>
List-Id: devicetree@vger.kernel.org

On 01/04/18 15:05, Rob Herring wrote:
> Convert remaining DT files to use SPDX-License-Identifier tags.
> 
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/of/Kconfig                              |  1 +
>  drivers/of/address.c                            |  2 +-
>  drivers/of/base.c                               |  6 +-----
>  drivers/of/device.c                             |  1 +
>  drivers/of/dynamic.c                            |  1 +
>  drivers/of/fdt.c                                |  5 +----
>  drivers/of/fdt_address.c                        |  6 +-----
>  drivers/of/irq.c                                |  6 +-----
>  drivers/of/kobj.c                               |  2 +-
>  drivers/of/of_numa.c                            | 13 +------------
>  drivers/of/of_private.h                         |  6 +-----
>  drivers/of/of_reserved_mem.c                    |  6 +-----
>  drivers/of/overlay.c                            |  5 +----
>  drivers/of/pdt.c                                |  6 +-----
>  drivers/of/platform.c                           |  7 +------
>  drivers/of/property.c                           |  6 +-----
>  drivers/of/resolver.c                           |  5 +----
>  drivers/of/unittest-data/overlay_bad_symbol.dts |  1 +
>  include/linux/of.h                              |  6 +-----
>  include/linux/of_dma.h                          |  5 +----
>  include/linux/of_fdt.h                          |  5 +----
>  include/linux/of_gpio.h                         |  6 +-----
>  include/linux/of_graph.h                        |  5 +----
>  include/linux/of_pdt.h                          |  6 +-----
>  include/linux/of_platform.h                     |  7 +------
>  25 files changed, 25 insertions(+), 100 deletions(-)

Reviewed-by: Frank Rowand <frank.rowand@sony.com>

< snip >
