From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] PCI: mediatek: Add Mediatek PCIe host controller
 support
Date: Mon, 22 May 2017 11:27:45 +0800
Message-ID: <1495423665.21021.6.camel@mtkswgap22>
References: <1494382020-26790-1-git-send-email-ryder.lee@mediatek.com>
         <1494382020-26790-2-git-send-email-ryder.lee@mediatek.com>
         <CAP=VYLrjeq57S+o0bBBH4oi8Bgwp=XgTsdO8RkWY8xuJyhLP9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAP=VYLrjeq57S+o0bBBH4oi8Bgwp=XgTsdO8RkWY8xuJyhLP9g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Red Hung <red.hung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 2017-05-20 at 15:46 -0400, Paul Gortmaker wrote:
> On Tue, May 9, 2017 at 10:06 PM, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > Add support for the Mediatek PCIe Gen2 controller which can
> > be found on MT7623 series SoCs.
> >
> > Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/pci/host/Kconfig         |  11 +
> >  drivers/pci/host/Makefile        |   1 +
> >  drivers/pci/host/pcie-mediatek.c | 563 +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 575 insertions(+)
> >  create mode 100644 drivers/pci/host/pcie-mediatek.c
> >
> > diff --git a/drivers/pci/host/Kconfig b/drivers/pci/host/Kconfig
> > index f7c1d4d..aef0de9 100644
> > --- a/drivers/pci/host/Kconfig
> > +++ b/drivers/pci/host/Kconfig
> > @@ -174,6 +174,17 @@ config PCIE_ROCKCHIP
> >           There is 1 internal PCIe port available to support GEN2 with
> >           4 slots.
> >
> > +config PCIE_MEDIATEK
> > +       bool "Mediatek PCIe controller"
> 
> You've got bool here and correctly use the builtin register
> function, but you still have a couple stray references to
> the module.h header and MODULE macros.  Can you
> please also clean them up and resend with those gone?
> 
> Thanks,
> Paul.
> --

> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> 
> [....]
> 
> > +};
> > +MODULE_DEVICE_TABLE(of, mtk_pcie_ids);
> > +
> > +static struct platform_driver mtk_pcie_driver = {
> > +       .probe = mtk_pcie_probe,
> > +       .driver = {
> > +               .name = "mtk-pcie",
> > +               .of_match_table = mtk_pcie_ids,
> > +               .suppress_bind_attrs = true,
> > +       },
> > +};
> > +
> > +builtin_platform_driver(mtk_pcie_driver);
> > +
> > +MODULE_DESCRIPTION("Mediatek PCIe host controller driver.");
> > +MODULE_LICENSE("GPL v2");


I've already removed them at patch v5. Thanks a lot, Paul!


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
