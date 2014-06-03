From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] of/irq: provide more wrappers for !CONFIG_OF
Date: Tue, 3 Jun 2014 11:36:29 -0500
Message-ID: <CAL_JsqLr7G3Ko43M7ZvOLFc6mE0DnGH-fLcnTevn-3U6FJ7K3Q@mail.gmail.com>
References: <16771871.sfJG2itVJN@wuerfel>
	<CAL_JsqJpP2sEkPC4DUFWTNutjFhUBiKZfNVSpiKHFPfsJzTf6w@mail.gmail.com>
	<5369122.ehEoyIekqa@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5369122.ehEoyIekqa@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Magnus Damm <damm-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, SH-Linux <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Phil Edworthy <phil.edworthy-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 3, 2014 at 10:59 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Tuesday 03 June 2014 10:40:34 Rob Herring wrote:
>> > diff --git a/include/linux/of.h b/include/linux/of.h
>> > index 196b34c..7c29e6c 100644
>> > --- a/include/linux/of.h
>> > +++ b/include/linux/of.h
>> > @@ -511,6 +511,9 @@ static inline struct device_node *of_get_cpu_node(int cpu,
>> >         return NULL;
>> >  }
>> >
>> > +static inline int of_n_addr_cells(struct device_node *np) { return 0; }
>> > +static inline int of_n_size_cells(struct device_node *np) { return 0; }
>>
>> I'm fine with the rest, but I think these should always be used within
>> some higher level function.
>
> Can you apply the rest already?

Yes, sure.

>
>> I can't seem to find where this is used by rcar. BTW, why does rcar
>> pci DT support fail to have any ranges property?
>>
>> Looking at one use in mvebu pci only confirms my position. An
>> of_for_each_ranges helper would be useful in that case.
>
> It's currently in the pci-next, the code using this looks like
>
> +static int pci_dma_range_parser_init(struct of_pci_range_parser *parser,
> +                                    struct device_node *node)
> +{
> +       const int na = 3, ns = 2;
> +       int rlen;
> +
> +       parser->node = node;
> +       parser->pna = of_n_addr_cells(node);
> +       parser->np = parser->pna + na + ns;
> +
> +       parser->range = of_get_property(node, "dma-ranges", &rlen);
> +       if (!parser->range)
> +               return -ENOENT;
> +
> +       parser->end = parser->range + rlen / sizeof(__be32);
> +       return 0;
> +}
> +
> +static int rcar_pcie_parse_map_dma_ranges(struct rcar_pcie *pcie,
> +                                         struct device_node *np)
> +{
> +       struct of_pci_range range;
> +       struct of_pci_range_parser parser;
> +       int index = 0;
> +       int err;
> +
> +       if (pci_dma_range_parser_init(&parser, np))
> +               return -EINVAL;
> +
> +       /* Get the dma-ranges from DT */
> +       for_each_of_pci_range(&parser, &range) {
> +               u64 end = range.cpu_addr + range.size - 1;
> +               dev_dbg(pcie->dev, "0x%08x 0x%016llx..0x%016llx -> 0x%016llx\n",
> +                       range.flags, range.cpu_addr, end, range.pci_addr);
> +
> +               err = rcar_pcie_inbound_ranges(pcie, &range, &index);
> +               if (err)
> +                       return err;
> +       }
> +
> +       return 0;
> +}
>
> Should the first function just be moved into of-pci.c?

Yes, and probably some refactoring with the "ranges" version of it too.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
