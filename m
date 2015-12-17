From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4] of: fix declaration of of_io_request_and_map
Date: Thu, 17 Dec 2015 14:01:43 +0100
Message-ID: <5672B237.2070605@linaro.org>
References: <1449564475-10724-1-git-send-email-sudipm.mukherjee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449564475-10724-1-git-send-email-sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudip Mukherjee <sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/08/2015 09:47 AM, Sudip Mukherjee wrote:
> We are having build failure with linux-next for sparc allmodconfig wi=
th
> the error messages:
>
> drivers/built-in.o: In function `meson6_timer_init':
> meson6_timer.c:(.init.text+0x5fe8): undefined reference to `of_io_req=
uest_and_map'
> drivers/built-in.o: In function `mtk_timer_init':
> mtk_timer.c:(.init.text+0x6af0): undefined reference to `of_io_reques=
t_and_map'
> drivers/built-in.o: In function `asm9260_timer_init':
> asm9260_timer.c:(.init.text+0x6c48): undefined reference to `of_io_re=
quest_and_map'
>
> CONFIG_OF is defined for sparc so it is expected that we have a
> definition of of_io_request_and_map() but of/address.c is only compil=
ed
> if it is !SPARC. In other words, CONFIG_OF_ADDRESS is not defined for
> sparc so we get the build failure.

Yes, there is an inconsistency.

of_io_request_and_map is defined in address.c and this one is compiled=20
only if CONFIG_OF_ADDRESS=3Dy

on the other side, of_io_request_and_map is declared under CONFIG_OF.

So to be consistent, it should be under CONFIG_OF_ADDRESS ifdefs.

Also, of_iomap is declared several times, under CONFIG_OF_ADDRESS and=20
CONFIG_OF.

Perhaps there is a reason why this is done this way.

=46or the best of my knowledge:

Acked-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> Fixes: e572f844ca66 ("clocksource/drivers/meson6: Add the COMPILE_TES=
T option")
> Fixes: bec8c4617611 ("clocksource/drivers/mediatek: Add the COMPILE_T=
EST option")
> Fixes: 4a373b45f94a ("clocksource/drivers/asm9260: Add the COMPILE_TE=
ST option")
> Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Sudip Mukherjee <sudip-ofJRbWXBVFamYgehrs7/Lw@public.gmane.org>
> ---
>
> v1: had a complicated set of #ifdefs
> v2: i messed up and resulted in build failure of some other arch wher=
e
> CONFIG_OF is not defined.
> v3: tested with allmodconfig of x86_64, defconfig of alpha and mips.
> v4: changed subject and commit message. And the of_io_request_and_map=
()
> is moved under existing #ifdef instead of defining one more section.
>
>
>   include/linux/of_address.h | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/include/linux/of_address.h b/include/linux/of_address.h
> index 507daad..4d6c50a 100644
> --- a/include/linux/of_address.h
> +++ b/include/linux/of_address.h
> @@ -36,6 +36,8 @@ extern struct device_node *of_find_matching_node_by=
_address(
>   					const struct of_device_id *matches,
>   					u64 base_address);
>   extern void __iomem *of_iomap(struct device_node *device, int index=
);
> +void __iomem *of_io_request_and_map(struct device_node *device,
> +				    int index, const char *name);
>
>   /* Extract an address from a device, returns the region size and
>    * the address space flags too. The PCI version uses a BAR number
> @@ -58,6 +60,14 @@ extern int of_dma_get_range(struct device_node *np=
, u64 *dma_addr,
>   extern bool of_dma_is_coherent(struct device_node *np);
>   #else /* CONFIG_OF_ADDRESS */
>
> +#include <linux/io.h>
> +
> +static inline void __iomem *of_io_request_and_map(struct device_node=
 *device,
> +						  int index, const char *name)
> +{
> +	return IOMEM_ERR_PTR(-EINVAL);
> +}
> +
>   static inline u64 of_translate_address(struct device_node *np,
>   				       const __be32 *addr)
>   {
> @@ -112,8 +122,6 @@ static inline bool of_dma_is_coherent(struct devi=
ce_node *np)
>   extern int of_address_to_resource(struct device_node *dev, int inde=
x,
>   				  struct resource *r);
>   void __iomem *of_iomap(struct device_node *node, int index);
> -void __iomem *of_io_request_and_map(struct device_node *device,
> -					int index, const char *name);
>   #else
>
>   #include <linux/io.h>
> @@ -128,12 +136,6 @@ static inline void __iomem *of_iomap(struct devi=
ce_node *device, int index)
>   {
>   	return NULL;
>   }
> -
> -static inline void __iomem *of_io_request_and_map(struct device_node=
 *device,
> -					int index, const char *name)
> -{
> -	return IOMEM_ERR_PTR(-EINVAL);
> -}
>   #endif
>
>   #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_PCI)
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
