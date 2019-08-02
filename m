From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/8] of/fdt: add function to get the SoC wide DMA
 addressable memory size
Date: Fri, 2 Aug 2019 11:17:26 -0600
Message-ID: <CAL_JsqKF5nh3hcdLTG5+6RU3_TnFrNX08vD6qZ8wawoA3WSRpA@mail.gmail.com>
References: <20190731154752.16557-1-nsaenzjulienne@suse.de> <20190731154752.16557-4-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731154752.16557-4-nsaenzjulienne@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, wahrenst@gmx.net, Marc Zyngier <marc.zyngier@arm.com>, Robin Murphy <robin.murphy@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Linux IOMMU <iommu@lists.linux-foundation.org>, linux-mm@kvack.org, Frank Rowand <frowand.list@gmail.com>, phill@raspberryi.org, Florian Fainelli <f.fainelli@gmail.com>, Will Deacon <will@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>, Matthias Brugger <mbrugger@suse.com>, Andrew Morton <akpm@linux-foundation.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 31, 2019 at 9:48 AM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Some SoCs might have multiple interconnects each with their own DMA
> addressing limitations. This function parses the 'dma-ranges' on each of
> them and tries to guess the maximum SoC wide DMA addressable memory
> size.
>
> This is specially useful for arch code in order to properly setup CMA
> and memory zones.

We already have a way to setup CMA in reserved-memory, so why is this
needed for that?

I have doubts this can really be generic...

>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> ---
>
>  drivers/of/fdt.c       | 72 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of_fdt.h |  2 ++
>  2 files changed, 74 insertions(+)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 9cdf14b9aaab..f2444c61a136 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -953,6 +953,78 @@ int __init early_init_dt_scan_chosen_stdout(void)
>  }
>  #endif
>
> +/**
> + * early_init_dt_dma_zone_size - Look at all 'dma-ranges' and provide the
> + * maximum common dmable memory size.
> + *
> + * Some devices might have multiple interconnects each with their own DMA
> + * addressing limitations. For example the Raspberry Pi 4 has the following:
> + *
> + * soc {
> + *     dma-ranges = <0xc0000000  0x0 0x00000000  0x3c000000>;
> + *     [...]
> + * }
> + *
> + * v3dbus {
> + *     dma-ranges = <0x00000000  0x0 0x00000000  0x3c000000>;
> + *     [...]
> + * }
> + *
> + * scb {
> + *     dma-ranges = <0x0 0x00000000  0x0 0x00000000  0xfc000000>;
> + *     [...]
> + * }
> + *
> + * Here the area addressable by all devices is [0x00000000-0x3bffffff]. Hence
> + * the function will write in 'data' a size of 0x3c000000.
> + *
> + * Note that the implementation assumes all interconnects have the same physical
> + * memory view and that the mapping always start at the beginning of RAM.

Not really a valid assumption for general code.

> + */
> +int __init early_init_dt_dma_zone_size(unsigned long node, const char *uname,
> +                                      int depth, void *data)

Don't use the old fdt scanning interface with depth/data. It's not
really needed now because you can just use libfdt calls.

> +{
> +       const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
> +       u64 phys_addr, dma_addr, size;
> +       u64 *dma_zone_size = data;
> +       int dma_addr_cells;
> +       const __be32 *reg;
> +       const void *prop;
> +       int len;
> +
> +       if (depth == 0)
> +               *dma_zone_size = 0;
> +
> +       /*
> +        * We avoid pci host controllers as they have their own way of using
> +        * 'dma-ranges'.
> +        */
> +       if (type && !strcmp(type, "pci"))
> +               return 0;
> +
> +       reg = of_get_flat_dt_prop(node, "dma-ranges", &len);
> +       if (!reg)
> +               return 0;
> +
> +       prop = of_get_flat_dt_prop(node, "#address-cells", NULL);
> +       if (prop)
> +               dma_addr_cells = be32_to_cpup(prop);
> +       else
> +               dma_addr_cells = 1; /* arm64's default addr_cell size */

Relying on the defaults has been a dtc error longer than arm64 has
existed. If they are missing, just bail.

> +
> +       if (len < (dma_addr_cells + dt_root_addr_cells + dt_root_size_cells))
> +               return 0;
> +
> +       dma_addr = dt_mem_next_cell(dma_addr_cells, &reg);
> +       phys_addr = dt_mem_next_cell(dt_root_addr_cells, &reg);
> +       size = dt_mem_next_cell(dt_root_size_cells, &reg);
> +
> +       if (!*dma_zone_size || *dma_zone_size > size)
> +               *dma_zone_size = size;
> +
> +       return 0;
> +}

It's possible to have multiple levels of nodes and dma-ranges. You
need to handle that case too.

Doing that and handling differing address translations will be
complicated. IMO, I'd just do:

if (of_fdt_machine_is_compatible(blob, "brcm,bcm2711"))
    dma_zone_size = XX;

2 lines of code is much easier to maintain than 10s of incomplete code
and is clearer who needs this. Maybe if we have dozens of SoCs with
this problem we should start parsing dma-ranges.

Rob
