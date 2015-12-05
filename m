From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] of: fix build failure
Date: Sat, 5 Dec 2015 12:09:41 +0100
Message-ID: <CAMuHMdWLURXVQNbTv4O9znB-dEH5_kFgPbTYuR5TgOcaDNrSJw@mail.gmail.com>
References: <20151203011814.GC5727@sirena.org.uk>
	<1449131890-21675-1-git-send-email-sudipm.mukherjee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449131890-21675-1-git-send-email-sudipm.mukherjee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Linux-Next <linux-next@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Sudip

On Thu, Dec 3, 2015 at 9:38 AM, Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
> We are having build failure with next-20151202 for sparc allmodconfig
> with the error messages:
> undefined reference to 'of_io_request_and_map'
>
> CONFIG_OF is defined for sparc so it is expected that we have a
> definition of of_io_request_and_map() but of/address.c is only compiled
> if it is !SPARC.

No, it's compiled depending on CONFIG_OF_ADDRESS...

> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> ---
>
> build log is at:
> https://travis-ci.org/sudipm-mukherjee/parport/builds/94541627
>
> patch has been build tested with sparc allmodconfig and x86_64
> allmodconfig.
>
>  include/linux/of_address.h | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/of_address.h b/include/linux/of_address.h
> index 507daad..7bf4603 100644
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
> @@ -136,6 +134,19 @@ static inline void __iomem *of_io_request_and_map(struct device_node *device,
>  }
>  #endif
>
> +#if defined(CONFIG_OF) && !defined(CONFIG_SPARC)

... hence wouldn't it be better to use "#ifdef CONFIG_OF_ADDRESS" instead?

> +void __iomem *of_io_request_and_map(struct device_node *device,
> +                                       int index, const char *name);
> +#else
> +#include <linux/io.h>
> +
> +static inline void __iomem *of_io_request_and_map(struct device_node *device,
> +                                       int index, const char *name)
> +{
> +       return IOMEM_ERR_PTR(-EINVAL);
> +}
> +#endif /* CONFIG_OF && !CONFIG_SPARC */
> +

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
