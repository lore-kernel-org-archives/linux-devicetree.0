From: Bharat Kumar Gogada <bharat.kumar.gogada-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH V2 3/5] PCI: xilinx: Modifying AXI PCIe Host Bridge
 driver to  work on both  Zynq and Microblaze
Date: Wed, 27 Jan 2016 14:33:45 +0000
Message-ID: <8520D5D51A55D047800579B09414719825873DA8@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1452620173-4905-1-git-send-email-bharatku@xilinx.com>
 <1452620173-4905-4-git-send-email-bharatku@xilinx.com>
 <4734542.KZZp0TeeeM@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4734542.KZZp0TeeeM@wuerfel>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org" <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org" <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "yinghai-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <yinghai-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "russell.joyce-3oYoeGyd3e21Qrn1Bg8BZw@public.gmane.org" <russell.joyce-3oYoeGyd3e21Qrn1Bg8BZw@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-p
List-Id: devicetree@vger.kernel.org

> Subject: Re: [PATCH V2 3/5] PCI: xilinx: Modifying AXI PCIe Host Bridge driver
> to work on both Zynq and Microblaze
> 
> On Tuesday 12 January 2016 23:06:11 Bharat Kumar Gogada wrote:
> > Modifying Xilinx AXI PCIe Host Bridge Soft IP driver to work on both
> > Zynq and Microblaze Architectures.
> > With these modifications drivers/pci/host/pcie-xilinx.c, will work on
> > both Zynq and Microblaze Architectures.
> >
> > Signed-off-by: Bharat Kumar Gogada <bharatku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > Signed-off-by: Ravi Kiran Gummaluri <rgummal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> 
> I think this patch should be split into three, as you are doing three unrelated
> things here.
> 
Agreed, will send as different patches in next series.
> > ---
> > --- a/drivers/pci/host/pcie-xilinx.c
> > +++ b/drivers/pci/host/pcie-xilinx.c
> > @@ -92,7 +92,12 @@
> >  #define ECAM_DEV_NUM_SHIFT		12
> >
> >  /* Number of MSI IRQs */
> > -#define XILINX_NUM_MSI_IRQS		128
> > +#define XILINX_NUM_MSI_IRQS	128
> > +#ifdef CONFIG_ARM
> > +#define TOT_NR_IRQS		XILINX_NUM_MSI_IRQS
> > +#else
> > +#define TOT_NR_IRQS		(NR_IRQS + XILINX_NUM_MSI_IRQS)
> > +#endif
> 
> Something looks wrong here in the microblaze variant. What does NR_IRQS
> have to do with it?
> 
> > @@ -238,15 +243,20 @@ static void xilinx_pcie_destroy_msi(unsigned int
> irq)
> >   */
> >  static int xilinx_pcie_assign_msi(struct xilinx_pcie_port *port)  {
> > +	int irq;
> >  	int pos;
> >
> >  	pos = find_first_zero_bit(msi_irq_in_use, XILINX_NUM_MSI_IRQS);
> > -	if (pos < XILINX_NUM_MSI_IRQS)
> > +	irq = pos;
> > +#ifdef CONFIG_MICROBLAZE
> > +	irq = XILINX_NUM_MSI_IRQS + pos;
> > +#endif
> 
> 
> 	if (IS_ENABLED(CONFIG_MICROBLAZE))
> 		irq = XILINX_NUM_MSI_IRQS + pos;
> 
Agreed.
> > @@ -705,7 +715,9 @@ static int xilinx_pcie_probe(struct
> > platform_device *pdev)  #endif
> >  	pci_scan_child_bus(bus);
> >  	pci_assign_unassigned_bus_resources(bus);
> > +#ifdef CONFIG_ARM
> >  	pci_fixup_irqs(pci_common_swizzle, of_irq_parse_and_map_pci);
> > +#endif
> >  	pci_bus_add_devices(bus);
> >  	platform_set_drvdata(pdev, port);
> 
> Here it looks like microblaze gets it right. I'm not sure why we still need the
> pci_fixup_irqs() on ARM, but my feeling is that this should be fixed in
> common code.
In arm pci_fixup_irqs is called by pci_common_init_dev (arch/arm/kernel/bios32.c), since this API is removed now, I was calling it separately.

Bharat

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
