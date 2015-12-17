From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4] of: fix declaration of of_io_request_and_map
Date: Thu, 17 Dec 2015 11:55:28 -0600
Message-ID: <CAL_Jsq+f-LLfN4Q4bLFGhXj9KRb4aj7TRExuAUZbxrEtSbAW5Q@mail.gmail.com>
References: <1449564475-10724-1-git-send-email-sudipm.mukherjee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449564475-10724-1-git-send-email-sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudip Mukherjee <sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 8, 2015 at 2:47 AM, Sudip Mukherjee
<sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> We are having build failure with linux-next for sparc allmodconfig with
> the error messages:
>
> drivers/built-in.o: In function `meson6_timer_init':
> meson6_timer.c:(.init.text+0x5fe8): undefined reference to `of_io_request_and_map'
> drivers/built-in.o: In function `mtk_timer_init':
> mtk_timer.c:(.init.text+0x6af0): undefined reference to `of_io_request_and_map'
> drivers/built-in.o: In function `asm9260_timer_init':
> asm9260_timer.c:(.init.text+0x6c48): undefined reference to `of_io_request_and_map'
>
> CONFIG_OF is defined for sparc so it is expected that we have a
> definition of of_io_request_and_map() but of/address.c is only compiled
> if it is !SPARC. In other words, CONFIG_OF_ADDRESS is not defined for
> sparc so we get the build failure.
>
> Fixes: e572f844ca66 ("clocksource/drivers/meson6: Add the COMPILE_TEST option")
> Fixes: bec8c4617611 ("clocksource/drivers/mediatek: Add the COMPILE_TEST option")
> Fixes: 4a373b45f94a ("clocksource/drivers/asm9260: Add the COMPILE_TEST option")
> Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Sudip Mukherjee <sudip-ofJRbWXBVFamYgehrs7/Lw@public.gmane.org>

Moved the include out of the ifdefs and applied, thanks.

Rob

> ---
>
> v1: had a complicated set of #ifdefs
> v2: i messed up and resulted in build failure of some other arch where
> CONFIG_OF is not defined.
> v3: tested with allmodconfig of x86_64, defconfig of alpha and mips.
> v4: changed subject and commit message. And the of_io_request_and_map()
> is moved under existing #ifdef instead of defining one more section.
>
>
>  include/linux/of_address.h | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/include/linux/of_address.h b/include/linux/of_address.h
> index 507daad..4d6c50a 100644
> --- a/include/linux/of_address.h
> +++ b/include/linux/of_address.h
> @@ -36,6 +36,8 @@ extern struct device_node *of_find_matching_node_by_address(
>                                         const struct of_device_id *matches,
>                                         u64 base_address);
>  extern void __iomem *of_iomap(struct device_node *device, int index);
> +void __iomem *of_io_request_and_map(struct device_node *device,
> +                                   int index, const char *name);
>
>  /* Extract an address from a device, returns the region size and
>   * the address space flags too. The PCI version uses a BAR number
> @@ -58,6 +60,14 @@ extern int of_dma_get_range(struct device_node *np, u64 *dma_addr,
>  extern bool of_dma_is_coherent(struct device_node *np);
>  #else /* CONFIG_OF_ADDRESS */
>
> +#include <linux/io.h>
> +
> +static inline void __iomem *of_io_request_and_map(struct device_node *device,
> +                                                 int index, const char *name)
> +{
> +       return IOMEM_ERR_PTR(-EINVAL);
> +}
> +
>  static inline u64 of_translate_address(struct device_node *np,
>                                        const __be32 *addr)
>  {
> @@ -112,8 +122,6 @@ static inline bool of_dma_is_coherent(struct device_node *np)
>  extern int of_address_to_resource(struct device_node *dev, int index,
>                                   struct resource *r);
>  void __iomem *of_iomap(struct device_node *node, int index);
> -void __iomem *of_io_request_and_map(struct device_node *device,
> -                                       int index, const char *name);
>  #else
>
>  #include <linux/io.h>
> @@ -128,12 +136,6 @@ static inline void __iomem *of_iomap(struct device_node *device, int index)
>  {
>         return NULL;
>  }
> -
> -static inline void __iomem *of_io_request_and_map(struct device_node *device,
> -                                       int index, const char *name)
> -{
> -       return IOMEM_ERR_PTR(-EINVAL);
> -}
>  #endif
>
>  #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_PCI)
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
