From: Peter Chen <hzpeterchen@gmail.com>
Subject: Re: [RFC PATCH v2 06/15] usb:cdns3: Adds Host support
Date: Wed, 5 Dec 2018 16:41:49 +0800
Message-ID: <CAL411-pT+BNRzGiRRQe0FmYB18SFaRYBLi1W1NNqmnH9Che_EQ@mail.gmail.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-7-git-send-email-pawell@cadence.com> <5BF80D44.2050600@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5BF80D44.2050600@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rogerq@ti.com
Cc: pawell@cadence.com, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, adouglas@cadence.com, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

> > --- a/drivers/usb/cdns3/Makefile
> > +++ b/drivers/usb/cdns3/Makefile
> > @@ -2,4 +2,5 @@ obj-$(CONFIG_USB_CDNS3)                       += cdns3.o
> >  obj-$(CONFIG_USB_CDNS3_PCI_WRAP)     += cdns3-pci.o
> >
> >  cdns3-y                                      := core.o drd.o
> > +cdns3-$(CONFIG_USB_CDNS3_HOST)          += host.o
> >  cdns3-pci-y                          := cdns3-pci-wrap.o
> > diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> > index dbee4325da7f..4cb820be9ff3 100644
> > --- a/drivers/usb/cdns3/core.c
> > +++ b/drivers/usb/cdns3/core.c
> > @@ -17,6 +17,7 @@
> >
> >  #include "gadget.h"
> >  #include "core.h"
> > +#include "host-export.h"
> >  #include "drd.h"
> >
> >  static inline struct cdns3_role_driver *cdns3_get_current_role_driver(struct cdns3 *cdns)
> > @@ -98,7 +99,8 @@ static int cdns3_core_init_role(struct cdns3 *cdns)
> >       }
> >
> >       if (dr_mode == USB_DR_MODE_OTG || dr_mode == USB_DR_MODE_HOST) {
> > -             //TODO: implements host initialization
> > +             if (cdns3_host_init(cdns))
> > +                     dev_info(dev, "doesn't support host\n");
>
> dev_err()
>
> And you need to error out with error code.

There are two cases for it:
- There is no cdsn3_host_init implementation due to kernel configuration,
- The error happens at cdsn3_host_init

We may need to handle these two different cases.


> > +     struct usb_hcd  *hcd;
> > +
> > +     if (dev)
> > +             hcd = dev_get_drvdata(dev);
> > +     else
> > +             return IRQ_NONE;
> > +
> > +     if (hcd)
> > +             return usb_hcd_irq(cdns->irq, hcd);
> > +     else
> > +             return IRQ_NONE;
>
> Why can't you just reuse the xhci-platform driver and let it manage the IRQ?
> Since it is a shared IRQ, different drivers can request the same IRQ and return IRQ_NONE
> if the IRQ wasn't from their device.
>

When I began to write this code, there are not so many quirks can be
used at xhci-plat.c,
it seems we can re-use this common code at cdns3 driver now, I will
try to integrate it.
Thanks for your suggestion.

Peter

> > +}
> > +
> > +static void cdns3_host_release(struct device *dev)
> > +{
> > +     struct cdns3_host *host = container_of(dev, struct cdns3_host, dev);
> > +
> > +     kfree(host);
> > +}
> > +
> > +static int cdns3_host_start(struct cdns3 *cdns)
> > +{
> > +     struct cdns3_host *host;
> > +     struct device *dev;
> > +     struct device *sysdev;
> > +     struct xhci_hcd *xhci;
> > +     int ret;
> > +
> > +     host = kzalloc(sizeof(*host), GFP_KERNEL);
> > +     if (!host)
> > +             return -ENOMEM;
> > +
> > +     dev = &host->dev;
> > +     dev->release = cdns3_host_release;
> > +     dev->parent = cdns->dev;
> > +     dev_set_name(dev, "xhci-cdns3");
> > +     cdns->host_dev = dev;
> > +     ret = device_register(dev);
> > +     if (ret)
> > +             goto err1;
> > +
> > +     sysdev = cdns->dev;
> > +     /* Try to set 64-bit DMA first */
> > +     if (WARN_ON(!sysdev->dma_mask))
> > +             /* Platform did not initialize dma_mask */
> > +             ret = dma_coerce_mask_and_coherent(sysdev,
> > +                                                DMA_BIT_MASK(64));
> > +     else
> > +             ret = dma_set_mask_and_coherent(sysdev, DMA_BIT_MASK(64));
> > +
> > +     /* If setting 64-bit DMA mask fails, fall back to 32-bit DMA mask */
> > +     if (ret) {
> > +             ret = dma_set_mask_and_coherent(sysdev, DMA_BIT_MASK(32));
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     pm_runtime_set_active(dev);
> > +     pm_runtime_no_callbacks(dev);
> > +     pm_runtime_enable(dev);
> > +     host->hcd = __usb_create_hcd(&xhci_cdns3_hc_driver, sysdev, dev,
> > +                                  dev_name(dev), NULL);
> > +     if (!host->hcd) {
> > +             ret = -ENOMEM;
> > +             goto err2;
> > +     }
> > +
> > +     host->hcd->regs = cdns->xhci_regs;
> > +     host->hcd->rsrc_start = cdns->xhci_res->start;
> > +     host->hcd->rsrc_len = resource_size(cdns->xhci_res);
> > +
> > +     device_wakeup_enable(host->hcd->self.controller);
> > +     xhci = hcd_to_xhci(host->hcd);
> > +
> > +     xhci->main_hcd = host->hcd;
> > +     xhci->shared_hcd = __usb_create_hcd(&xhci_cdns3_hc_driver, sysdev, dev,
> > +                                         dev_name(dev), host->hcd);
> > +     if (!xhci->shared_hcd) {
> > +             ret = -ENOMEM;
> > +             goto err3;
> > +     }
> > +
> > +     host->hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
> > +     xhci->shared_hcd->tpl_support = host->hcd->tpl_support;
> > +     ret = usb_add_hcd(host->hcd, 0, IRQF_SHARED);
> > +     if (ret)
> > +             goto err4;
> > +
> > +     ret = usb_add_hcd(xhci->shared_hcd, 0, IRQF_SHARED);
> > +     if (ret)
> > +             goto err5;
> > +
> > +     device_set_wakeup_capable(dev, true);
>
> All this is being done by the xhci-plat.c
>
> You can make use of it by just creating a xhci-hcd platform device.
>
> e.g.
> platform_device_alloc("xhci-hcd", PLATFORM_DEVID_AUTO);
> platform_device_add_resources() to add IRQ and memory resource.
> platform_device_add_properties() to add any quirks.
> platform_device_add()
>
>
> > +
> > +     return 0;
> > +
> > +err5:
> > +     usb_remove_hcd(host->hcd);
> > +err4:
> > +     usb_put_hcd(xhci->shared_hcd);
> > +err3:
> > +     usb_put_hcd(host->hcd);
> > +err2:
> > +     device_del(dev);
> > +err1:
> > +     put_device(dev);
> > +     cdns->host_dev = NULL;
> > +     return ret;
> > +}
> > +
> > +static void cdns3_host_stop(struct cdns3 *cdns)
> > +{
> > +     struct device *dev = cdns->host_dev;
> > +     struct xhci_hcd *xhci;
> > +     struct usb_hcd  *hcd;
> > +
> > +     if (dev) {
> > +             hcd = dev_get_drvdata(dev);
> > +             xhci = hcd_to_xhci(hcd);
> > +             usb_remove_hcd(xhci->shared_hcd);
> > +             usb_remove_hcd(hcd);
> > +             synchronize_irq(cdns->irq);
> > +             usb_put_hcd(xhci->shared_hcd);
> > +             usb_put_hcd(hcd);
> > +             cdns->host_dev = NULL;
> > +             pm_runtime_set_suspended(dev);
> > +             pm_runtime_disable(dev);
> > +             device_del(dev);
> > +             put_device(dev);
> > +     }
>
> You can replace this with just
>         platform_device_unregister(xhci_dev);
>
> > +}
> > +
> > +#if CONFIG_PM
> > +static int cdns3_host_suspend(struct cdns3 *cdns, bool do_wakeup)
> > +{
> > +     struct device *dev = cdns->host_dev;
> > +     struct xhci_hcd *xhci;
> > +
> > +     if (!dev)
> > +             return 0;
> > +
> > +     xhci = hcd_to_xhci(dev_get_drvdata(dev));
> > +     return xhci_suspend(xhci, do_wakeup);
> > +}
> > +
> > +static int cdns3_host_resume(struct cdns3 *cdns, bool hibernated)
> > +{
> > +     struct device *dev = cdns->host_dev;
> > +     struct xhci_hcd *xhci;
> > +
> > +     if (!dev)
> > +             return 0;
> > +
> > +     xhci = hcd_to_xhci(dev_get_drvdata(dev));
> > +     return xhci_resume(xhci, hibernated);
> > +}
>
> These won't be required any more as xhci-plat is doing this.
>
> > +#endif /* CONFIG_PM */
> > +
> > +int cdns3_host_init(struct cdns3 *cdns)
> > +{
> > +     struct cdns3_role_driver *rdrv;
> > +
> > +     rdrv = devm_kzalloc(cdns->dev, sizeof(*rdrv), GFP_KERNEL);
> > +     if (!rdrv)
> > +             return -ENOMEM;
> > +
> > +     rdrv->start     = cdns3_host_start;
> > +     rdrv->stop      = cdns3_host_stop;
> > +     rdrv->irq       = cdns3_host_irq;
> > +#if CONFIG_PM
> > +     rdrv->suspend   = cdns3_host_suspend;
> > +     rdrv->resume    = cdns3_host_resume;
> > +#endif /* CONFIG_PM */
> > +     rdrv->name      = "host";
> > +     cdns->roles[CDNS3_ROLE_HOST] = rdrv;
> > +
> > +     return 0;
> > +}
> > +
> > +void cdns3_host_remove(struct cdns3 *cdns)
> > +{
> > +     cdns3_host_stop(cdns);
>
> calling cdns3_host_stop() here can lead to problems as Controller might be in
> peripheral mode at this point. The core driver needs to ensure that relevant role
> is stopped before calling cdns3_host_remove().
>
> Here you need to unregister the role driver though.
>
> cdns->roles[CDNS3_ROLE_HOST] = NULL;
>
> > +}
> > +
> > +void __init cdns3_host_driver_init(void)
> > +{
> > +     xhci_init_driver(&xhci_cdns3_hc_driver, &xhci_cdns3_overrides);
> > +}
> >
>
> cheers,
> -roger
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
