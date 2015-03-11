From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pci: of : fix BUG: unable to handle kernel
Date: Wed, 11 Mar 2015 07:35:45 -0500
Message-ID: <CAL_JsqJPvW5q4XwwenFTHrDG4cU5uTd7n-vLKj0mdV9FbVC4Ag@mail.gmail.com>
References: <1426001139-18419-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426001139-18419-1-git-send-email-m-karicheri2-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Suravee Suthikulanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 10, 2015 at 10:25 AM, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org> wrote:
> On some platforms such as that based on x86, ia64 etc, root bus is
> created with parent node passed in as NULL to pci_create_root_bus().
> On these platforms, the patch series "PCI: get DMA configuration from
> parent device" when applied causes kernel crash. So add a check for this
> in of_pci_dma_configure()

Wouldn't these arches have OF disabled and call an empty function?
Regardless, we still need this.

> Signed-off-by: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>

I'm assuming Bjorn will apply this.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  drivers/of/of_pci.c |    4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
> index 86d3c38..a8e485c 100644
> --- a/drivers/of/of_pci.c
> +++ b/drivers/of/of_pci.c
> @@ -129,6 +129,10 @@ void of_pci_dma_configure(struct pci_dev *pci_dev)
>         struct device *dev = &pci_dev->dev;
>         struct device *bridge = pci_get_host_bridge_device(pci_dev);
>
> +       /* Some platforms can have bridge->parent set to NULL */
> +       if (!bridge->parent)
> +               return;
> +
>         of_dma_configure(dev, bridge->parent->of_node);
>         pci_put_host_bridge_device(bridge);
>  }
> --
> 1.7.9.5
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
