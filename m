From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] of: add stub for of_n_addr_cells
Date: Fri, 24 Mar 2017 22:23:48 +0100
Message-ID: <CAK8P3a3ojRSpC3GVU6P05GEtj7AHxrYD_ZrAZaa68KT14H9Hew@mail.gmail.com>
References: <20170324103940.30902-1-tobias.regnery@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170324103940.30902-1-tobias.regnery-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tobias Regnery <tobias.regnery-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 24, 2017 at 11:39 AM, Tobias Regnery
<tobias.regnery-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> With CONFIG_OF=n and CONFIG_COMPILE_TEST=y the rcar pci-e driver fails to
> build on arm:
>
> drivers/pci/host/pcie-rcar.c: In function 'pci_dma_range_parser_init':
> drivers/pci/host/pcie-rcar.c:1035:16: error: implicit declaration of function 'of_n_addr_cells' [-Werror=implicit-function-declaration]
>   parser->pna = of_n_addr_cells(node);
>                 ^~~~~~~~~~~~~~~
>
> Fix this by adding an inline stub for of_n_addr_cells
>
> Signed-off-by: Tobias Regnery <tobias.regnery-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> This is against next-20140324
>
>  include/linux/of.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 21e6323de0f3..9978c918222e 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -710,6 +710,11 @@ static inline struct device_node *of_get_cpu_node(int cpu,
>         return NULL;
>  }
>
> +static inline int of_n_addr_cells(struct device_node *np)
> +{
> +       return 0;
> +}
> +

This looks good, but we should also do the same thing for of_n_size_cells().

I think I sent something like this a few years ago, but never resubmitted it
when it was ignored at first.

        Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
