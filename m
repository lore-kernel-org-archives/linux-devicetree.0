From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/5] of: reserved_mem: Accessor for acquiring reserved_mem
Date: Thu, 3 Aug 2017 12:45:11 -0500
Message-ID: <CAL_JsqL1Jh2AnWSWfau3LGhvuS1giTg6_r7gPGrHyZ6KRocSYg@mail.gmail.com>
References: <20170803025754.19101-1-bjorn.andersson@linaro.org> <20170803025754.19101-3-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170803025754.19101-3-bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 2, 2017 at 9:57 PM, Bjorn Andersson
<bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> In some cases drivers referencing a reserved-memory region might want to
> remap the entire region, but when defining the reserved-memory by "size"
> the client driver has no means to know the associated base address of
> the reserved memory region.
>
> This patch adds an accessor for such drivers to acquire a handle to
> their associated reserved-memory for this purpose.
>
> A complicating factor for the implementation is that the reserved_mem
> objects are created from the flattened DeviceTree, as such we can't
> use the device_node address for comparison. Fortunately the name of the
> node will be used as "name" of the reserved_mem and will be used when
> building the full_name, so we can compare the "name" with the basename
> of the full_name to find the match.

Maybe we should add the device_node pointer when we unflatten?

>
> Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>
> Changes since v1:
> - Previous patch provided interface to resolve memory-region reference, instead
>   of direct lookup by device_node
>
>  drivers/of/of_reserved_mem.c    | 26 ++++++++++++++++++++++++++
>  include/linux/of_reserved_mem.h |  5 +++++
>  2 files changed, 31 insertions(+)
>
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index d507c3569a88..b40cfce68fd4 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -397,3 +397,29 @@ void of_reserved_mem_device_release(struct device *dev)
>         rmem->ops->device_release(rmem, dev);
>  }
>  EXPORT_SYMBOL_GPL(of_reserved_mem_device_release);
> +
> +/**
> + * of_reserved_mem_get() - acquire reserved_mem from a device node
> + * @np:                node pointer of the desired reserved-memory region
> + *
> + * This function allows drivers to acquire a reference to the reserved_mem
> + * struct based on a device node handle.
> + *
> + * Returns a reserved_mem reference, or NULL on error.
> + */
> +struct reserved_mem *of_reserved_mem_get(struct device_node *np)
> +{
> +       const char *name;
> +       int i;
> +
> +       if (!np->full_name)
> +               return NULL;
> +
> +       name = kbasename(np->full_name);
> +       for (i = 0; i < reserved_mem_count; i++)
> +               if (!strcmp(reserved_mem[i].name, name))
> +                       return &reserved_mem[i];
> +
> +       return NULL;
> +}
> +EXPORT_SYMBOL_GPL(of_reserved_mem_get);
> diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
> index f8e1992d6423..91b1eb5076e4 100644
> --- a/include/linux/of_reserved_mem.h
> +++ b/include/linux/of_reserved_mem.h
> @@ -44,6 +44,7 @@ int early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
>  void fdt_init_reserved_mem(void);
>  void fdt_reserved_mem_save_node(unsigned long node, const char *uname,
>                                phys_addr_t base, phys_addr_t size);
> +struct reserved_mem *of_reserved_mem_get(struct device_node *np);
>  #else
>  static inline int of_reserved_mem_device_init_by_idx(struct device *dev,
>                                         struct device_node *np, int idx)
> @@ -55,6 +56,10 @@ static inline void of_reserved_mem_device_release(struct device *pdev) { }
>  static inline void fdt_init_reserved_mem(void) { }
>  static inline void fdt_reserved_mem_save_node(unsigned long node,
>                 const char *uname, phys_addr_t base, phys_addr_t size) { }
> +static inline struct reserved_mem *of_reserved_mem_get(struct device_node *np)
> +{
> +       return NULL;
> +}
>  #endif
>
>  /**
> --
> 2.12.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
