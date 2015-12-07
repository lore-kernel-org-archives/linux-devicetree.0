From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3] of: fix build failure
Date: Mon, 7 Dec 2015 10:55:59 -0600
Message-ID: <CAL_JsqKW-r-89dpHA-Gu8dxrrKoNxkJa90E8sMYi2KOet94ddg@mail.gmail.com>
References: <1449490849-1833-1-git-send-email-sudipm.mukherjee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449490849-1833-1-git-send-email-sudipm.mukherjee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 7, 2015 at 6:20 AM, Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
> We are having build failure with linux-next for sparc allmodconfig with
> the error messages:

Please come up with a subject more specific than applicable to any
build failure.

> undefined reference to 'of_io_request_and_map'

Specifying on which driver and or commit would be helpful here. Then I
know if I need to flag this for stable or not without having to figure
that out myself. I'm assume something new got enabled for sparc?

> CONFIG_OF is defined for sparc so it is expected that we have a
> definition of of_io_request_and_map() but of/address.c is only compiled
> if it is !SPARC. In other words, CONFIG_OF_ADDRESS is not defined for
> sparc so we get the build failure.
>
> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> ---
>
> v1: had a complicated set of #ifdefs
> v2: i messed up and resulted in build failure of some other arch where
> CONFIG_OF is not defined.
> v3: tested with allmodconfig of x86_64, defconfig of alpha and mips.
>
>  include/linux/of_address.h | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/of_address.h b/include/linux/of_address.h
> index 507daad..02b1265 100644
> --- a/include/linux/of_address.h
> +++ b/include/linux/of_address.h
> @@ -112,8 +112,6 @@ static inline bool of_dma_is_coherent(struct device_node *np)
>  extern int of_address_to_resource(struct device_node *dev, int index,
>                                   struct resource *r);
>  void __iomem *of_iomap(struct device_node *node, int index);
> -void __iomem *of_io_request_and_map(struct device_node *device,
> -                                       int index, const char *name);
>  #else
>
>  #include <linux/io.h>
> @@ -128,13 +126,20 @@ static inline void __iomem *of_iomap(struct device_node *device, int index)
>  {
>         return NULL;
>  }
> +#endif
> +
> +#ifdef CONFIG_OF_ADDRESS

This is the correct protection (Geert is wrong), but please move it to
the existing "#ifdef CONFIG_OF_ADDRESS" section.

> +void __iomem *of_io_request_and_map(struct device_node *device,
> +                                   int index, const char *name);
> +#else
> +#include <linux/io.h>
>
>  static inline void __iomem *of_io_request_and_map(struct device_node *device,
> -                                       int index, const char *name)
> +                                                 int index, const char *name)
>  {
>         return IOMEM_ERR_PTR(-EINVAL);
>  }
> -#endif
> +#endif /* CONFIG_OF_ADDRESS */
>
>  #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_PCI)
>  extern const __be32 *of_get_pci_address(struct device_node *dev, int bar_no,
> --
> 1.9.1
>
