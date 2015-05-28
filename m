From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH v1 1/3] PCI: designware: Add ARM64 support
Date: Thu, 28 May 2015 14:30:57 +0200
Message-ID: <4282256.8pP4M6Uy35@wuerfel>
References: <000001d096a9$27bf43f0$773dcbd0$@com> <2095085.CuXXeGT0Wg@wuerfel> <5566FD5C.4050708@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5566FD5C.4050708-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, zhudacai-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Zhang Jukuo' <zhangjukuo-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, 'Gabriele Paoloni' <gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Pratyush Anand' <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Richard Zhu' <Richard.Zhu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, 'Zhichang Yuan' <yuanzhichang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, 'Kishon Vijay Abraham I' <kishon-l0cyMroinI0@public.gmane.org>, qiuzhenfa-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Bjorn Helgaas' <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, 'Liviu Dudau' <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, 'Liguozhu' <liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, 'Lucas Stach' <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 28 May 2015 19:34:52 Zhou Wang wrote:
> > @@ -462,9 +453,6 @@ static void pcibios_init_hw(struct device *parent, struct hw_pci *hw,
> >               if (!sys)
> >                       panic("PCI: unable to allocate sys data!");
> >  
> > -#ifdef CONFIG_PCI_MSI
> > -             sys->msi_ctrl = hw->msi_ctrl;
> > -#endif
> >               sys->busnr   = busnr;
> >               sys->swizzle = hw->swizzle;
> >               sys->map_irq = hw->map_irq;
> > @@ -493,6 +481,9 @@ static void pcibios_init_hw(struct device *parent, struct hw_pci *hw,
> >                               panic("PCI: unable to scan bus!");
> >  
> >                       busnr = sys->bus->busn_res.end + 1;
> > +#ifdef CONFIG_PCI_MSI
> > +                     bus->msi = hw->msi_ctrl;
> > +#endif
> >  
> >                       list_add(&sys->node, head);
> >               } else {
> > 
> 
> Hi Arnd,
> 
> I think it does not work in above way(with adaptation as Fabrice mentioned).
> As the msi controller is passed to secondary bus one by one during the process of enumeration.
> Here we just set msi controller for root bus.

Ah, too bad. I guess you are right, the bus->msi pointer here would
really need to be set between pci_create_root_bus() and pci_scan_child_bus(),
but we currently don't run any ARM specific code between the two.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
