From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v10 4/6] PCI: hisi: Add PCIe host support for HiSilicon SoC Hip05
Date: Tue, 13 Oct 2015 13:12:12 +0200
Message-ID: <6336414.HvfCQcuT3Y@wuerfel>
References: <1444445957-239522-1-git-send-email-wangzhou1@hisilicon.com> <1444445957-239522-5-git-send-email-wangzhou1@hisilicon.com> <20151012213545.GA17479@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151012213545.GA17479@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, james.morse-5wv7dgnIgG8@public.gmane.org, Liviu.Dudau-5wv7dgnIgG8@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhangjukuo-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, qiuzhenfa-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liudongdong3-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, qiujiang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 12 October 2015 16:35:45 Bjorn Helgaas wrote:
> 
> > +{
> > +     u64 addr;
> > +     struct device_node *msi_node;
> > +     struct resource res;
> > +     struct device_node *np = pp->dev->of_node;
> > +     struct hisi_pcie *pcie = to_hisi_pcie(pp);
> > +
> > +     msi_node = of_parse_phandle(np, "msi-parent", 0);
> > +     if (!msi_node) {
> > +             dev_err(pp->dev, "failed to find msi-parent\n");
> > +             return -EINVAL;
> > +     }
> > +     of_address_to_resource(msi_node, 0, &res);
> 
> Does this use the "msi-parent" node in the same way as other drivers
> do?  I'm sure there must be other places where we extract struct
> resource information from an "msi-parent" node, but I don't see them.
> 
> I'm trying to verify that this isn't some kind of incompatible
> extension of the "msi-parent" property.  I cc'd Arnd and Rob (DT
> experts).

This is not ok, what this does is that it relies on a particular
implementation of the MSI controller and directly accesses its
registers.

Instead, it should reference only the msi irq domain and let the
driver for the MSI controller access the registers. Otherwise this
code has to be rewritten once the same PCI host code appears in
a machine that has a real GICv2m or GICv3.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
