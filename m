From: Tobias Regnery <tobias.regnery-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: add stub for of_n_addr_cells
Date: Mon, 27 Mar 2017 07:54:54 +0200
Message-ID: <20170327055454.c6kj4keeudqn4bps@builder>
References: <20170324103940.30902-1-tobias.regnery@gmail.com>
 <CAK8P3a3ojRSpC3GVU6P05GEtj7AHxrYD_ZrAZaa68KT14H9Hew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a3ojRSpC3GVU6P05GEtj7AHxrYD_ZrAZaa68KT14H9Hew-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 24.03.17, Arnd Bergmann wrote:
> On Fri, Mar 24, 2017 at 11:39 AM, Tobias Regnery
> <tobias.regnery-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > With CONFIG_OF=n and CONFIG_COMPILE_TEST=y the rcar pci-e driver fails to
> > build on arm:
> >
> > drivers/pci/host/pcie-rcar.c: In function 'pci_dma_range_parser_init':
> > drivers/pci/host/pcie-rcar.c:1035:16: error: implicit declaration of function 'of_n_addr_cells' [-Werror=implicit-function-declaration]
> >   parser->pna = of_n_addr_cells(node);
> >                 ^~~~~~~~~~~~~~~
> >
> > Fix this by adding an inline stub for of_n_addr_cells
> >
> > Signed-off-by: Tobias Regnery <tobias.regnery-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> > This is against next-20140324
> >
> >  include/linux/of.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/include/linux/of.h b/include/linux/of.h
> > index 21e6323de0f3..9978c918222e 100644
> > --- a/include/linux/of.h
> > +++ b/include/linux/of.h
> > @@ -710,6 +710,11 @@ static inline struct device_node *of_get_cpu_node(int cpu,
> >         return NULL;
> >  }
> >
> > +static inline int of_n_addr_cells(struct device_node *np)
> > +{
> > +       return 0;
> > +}
> > +
> 
> This looks good, but we should also do the same thing for of_n_size_cells().
> 
> I think I sent something like this a few years ago, but never resubmitted it
> when it was ignored at first.
> 
>         Arnd

This seems sensible, I can send an updated patch with this change or I can 
send it as a separate patch, whatever the maintainers prefer.

--
Tobias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
