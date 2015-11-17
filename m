From: Bharat Kumar Gogada <bharat.kumar.gogada-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v8] PCI: Xilinx-NWL-PCIe: Added support for Xilinx NWL
 PCIe Host Controller
Date: Tue, 17 Nov 2015 13:27:39 +0000
Message-ID: <8520D5D51A55D047800579B0941471982585CD78@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1447223619-30945-1-git-send-email-bharatku@xilinx.com>
	<5649F2D9.7070902@arm.com>	<564A5255.3020603@broadcom.com>
	<8520D5D51A55D047800579B0941471982585CBDA@XAP-PVEXMBX01.xlnx.xilinx.com>
 <20151117092100.76babf7f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151117092100.76babf7f-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "tinamdar-qTEPVZfXA3Y@public.gmane.org" <tinamdar-qTEPVZfXA3Y@public.gmane.org>, "treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "m-karicheri2-l0cyMroinI0@public.gmane.org" <m-karicheri2-l0cyMroinI0@public.gmane.org>, "hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org" <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, "dhdang-qTEPVZfXA3Y@public.gmane.org" <dhdang-qTEPVZfXA3Y@public.gmane.org>, "sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>l
List-Id: devicetree@vger.kernel.org

> 
> On Tue, 17 Nov 2015 04:59:39 +0000
> Bharat Kumar Gogada <bharat.kumar.gogada-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> 
> > > On 11/16/2015 7:14 AM, Marc Zyngier wrote:
> > > > On 11/11/15 06:33, Bharat Kumar Gogada wrote:
> > > >> Adding PCIe Root Port driver for Xilinx PCIe NWL bridge IP.
> > > >>
> > > >> Signed-off-by: Bharat Kumar Gogada <bharatku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > > >> Signed-off-by: Ravi Kiran Gummaluri <rgummal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > > >> ---
> > > >> Added logic to allocate contiguous hwirq in nwl_irq_domain_alloc
> > > function.
> > > >> Moved MSI functionality to separate functions.
> > > >> Changed error return values.
> > > >> ---
> > > >>   .../devicetree/bindings/pci/xilinx-nwl-pcie.txt    |   68 ++
> > > >>   drivers/pci/host/Kconfig                           |   16 +-
> > > >>   drivers/pci/host/Makefile                          |    1 +
> > > >>   drivers/pci/host/pcie-xilinx-nwl.c                 | 1062
> > > ++++++++++++++++++++
> > > >>   4 files changed, 1144 insertions(+), 3 deletions(-)
> > > >>   create mode 100644
> > > >> Documentation/devicetree/bindings/pci/xilinx-nwl-
> > > pcie.txt
> > > >>   create mode 100644 drivers/pci/host/pcie-xilinx-nwl.c
> > > >>
> > > >
> > > > [...]
> > > >
> > > >> +static int nwl_pcie_enable_msi(struct nwl_pcie *pcie, struct
> > > >> +pci_bus
> > > >> +*bus) {
> > > >> +	struct platform_device *pdev = to_platform_device(pcie-
> >dev);
> > > >> +	struct nwl_msi *msi = &pcie->msi;
> > > >> +	unsigned long base;
> > > >> +	int ret;
> > > >> +
> > > >> +	mutex_init(&msi->lock);
> > > >> +
> > > >> +	/* Check for msii_present bit */
> > > >> +	ret = nwl_bridge_readl(pcie, I_MSII_CAPABILITIES) &
> MSII_PRESENT;
> > > >> +	if (!ret) {
> > > >> +		dev_err(pcie->dev, "MSI not present\n");
> > > >> +		ret = -EIO;
> > > >> +		goto err;
> > > >> +	}
> > > >> +
> > > >> +	/* Enable MSII */
> > > >> +	nwl_bridge_writel(pcie, nwl_bridge_readl(pcie,
> I_MSII_CONTROL) |
> > > >> +			  MSII_ENABLE, I_MSII_CONTROL);
> > > >> +
> > > >> +	/* Enable MSII status */
> > > >> +	nwl_bridge_writel(pcie, nwl_bridge_readl(pcie,
> I_MSII_CONTROL) |
> > > >> +			  MSII_STATUS_ENABLE, I_MSII_CONTROL);
> > > >> +
> > > >> +	/* setup AFI/FPCI range */
> > > >> +	msi->pages = __get_free_pages(GFP_KERNEL, 0);
> > > >> +	base = virt_to_phys((void *)msi->pages);
> > > >> +	nwl_bridge_writel(pcie, lower_32_bits(base),
> I_MSII_BASE_LO);
> > > >> +	nwl_bridge_writel(pcie, upper_32_bits(base),
> I_MSII_BASE_HI);
> > > >
> > > > BTW, you still haven't answered my question as to why you need to
> > > > waste a page of memory here, and why putting a device address
> > > > doesn't
> > > work.
> > > >
> > > > As this is (to the best of my knowledge) the only driver doing so,
> > > > I'd really like you to explain the rational behind this.
> > >
> > > Might not be the only driver doing so after I start sending out
> > > patches for the iProc MSI support (soon), :)
> > >
> > > I'm not sure how it works for the Xilinx NWL controller, which
> > > Bharat should be able to help to explain. But for the iProc MSI
> > > controller, there's no device I/O memory reserved for MSI posted writes
> in the ASIC.
> > > Therefore one needs to reserve host memory for these writes.
> > > >
> >
> > Our SoC doesn't reserve any memory for MSI, hence we need to assign a
> > memory space for it out of RAM.
> 
> Question to both of you: Does the write make it to memory? Or is it sampled
> by the bridge and dropped?
> 
No, write will not do any modification in memory, it is consumed by bridge.

> What happens if you replace the page in RAM with a dummy address?
What do you mean by dummy address ?

Regards,
Bharat


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
