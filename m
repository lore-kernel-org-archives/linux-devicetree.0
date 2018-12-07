From: Jianjun Wang <jianjun.wang@mediatek.com>
Subject: Re: [PATCH 2/2] PCI: mediatek: Add controller support for MT7629
Date: Fri, 7 Dec 2018 20:56:37 +0800
Message-ID: <1544187397.10946.27.camel@mhfsdcap03>
References: <1544058553-10936-1-git-send-email-jianjun.wang@mediatek.com>
         <1544058553-10936-3-git-send-email-jianjun.wang@mediatek.com>
         <1544075633.3753.11.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544075633.3753.11.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Honghui Zhang <honghui.zhang@mediatek.com>
Cc: ryder.lee@mediatek.com, bhelgaas@google.com, robh+dt@kernel.org, lorenzo.pieralisi@arm.com, matthias.bgg@gmail.com, linux-pci@vger.kernel.org, mark.rutland@arm.com, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, youlin.pei@mediatek.com
List-Id: devicetree@vger.kernel.org

On Thu, 2018-12-06 at 13:53 +0800, Honghui Zhang wrote:
> On Thu, 2018-12-06 at 09:09 +0800, Jianjun Wang wrote:
> > MT7629 is an arm platform SoC which has the same PCIe IP with MT7622.
> > 
> > The read value of BAR0 is 0xffff_ffff, it's size will be calculated as 4GB
> > in arm64 but bogus alignment values at arm32, the pcie device and devices
> 
> :s /the pcie device /the bridge device
> 
> > behind this bridge will not be enabled. Fix it's BAR0 resource size to
> > guarantee the pcie devices will be enabled correctly.
> > 
> > The HW default value of its device id is invalid, fix it's device id to
> > match the hardware implementation.
> > 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > ---
> >  drivers/pci/controller/pcie-mediatek.c | 26 ++++++++++++++++++++++++++
> >  include/linux/pci_ids.h                |  1 +
> >  2 files changed, 27 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> > index d20cf461ba00..f8937cc3c87c 100644
> > --- a/drivers/pci/controller/pcie-mediatek.c
> > +++ b/drivers/pci/controller/pcie-mediatek.c
> > @@ -73,6 +73,7 @@
> >  #define PCIE_MSI_VECTOR		0x0c0
> >  
> >  #define PCIE_CONF_VEND_ID	0x100
> > +#define PCIE_CONF_DEVICE_ID	0x102
> >  #define PCIE_CONF_CLASS_ID	0x106
> >  
> >  #define PCIE_INT_MASK		0x420
> > @@ -135,12 +136,14 @@ struct mtk_pcie_port;
> >  /**
> >   * struct mtk_pcie_soc - differentiate between host generations
> >   * @need_fix_class_id: whether this host's class ID needed to be fixed or not
> > + * @need_fix_device_id: whether this host's device ID needed to be fixed or not
> >   * @ops: pointer to configuration access functions
> >   * @startup: pointer to controller setting functions
> >   * @setup_irq: pointer to initialize IRQ functions
> >   */
> >  struct mtk_pcie_soc {
> >  	bool need_fix_class_id;
> > +	bool need_fix_device_id;
> >  	struct pci_ops *ops;
> >  	int (*startup)(struct mtk_pcie_port *port);
> >  	int (*setup_irq)(struct mtk_pcie_port *port, struct device_node *node);
> > @@ -692,6 +695,11 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
> >  		writew(val, port->base + PCIE_CONF_CLASS_ID);
> >  	}
> >  
> > +	if (soc->need_fix_device_id) {
> > +		val = PCI_DEVICE_ID_MEDIATEK_7629;
> > +		writew(val, port->base + PCIE_CONF_DEVICE_ID);
> > +	}
> > +
> >  	/* 100ms timeout value should be enough for Gen1/2 training */
> >  	err = readl_poll_timeout(port->base + PCIE_LINK_STATUS_V2, val,
> >  				 !!(val & PCIE_PORT_LINKUP_V2), 20,
> > @@ -1238,11 +1246,29 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7622 = {
> >  	.setup_irq = mtk_pcie_setup_irq,
> >  };
> >  
> > +static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
> > +	.need_fix_class_id = true,
> > +	.need_fix_device_id = true,
> > +	.ops = &mtk_pcie_ops_v2,
> > +	.startup = mtk_pcie_startup_port_v2,
> > +	.setup_irq = mtk_pcie_setup_irq,
> > +};
> > +
> > +static void mtk_fixup_bar_size(struct pci_dev *dev)
> > +{
> > +	struct resource *dev_res = &dev->resource[0];
> > +	/* 32bit resource length will calculate size to 0, set it smaller */
> > +	dev_res->end = 0xfffffffe;
> > +}
> 
> I'm not sure assign the BAR0 size in driver to fit in the bogus
> alignment is a good idea. Seems the size value of 0xffff_fffe also is an
> arbitrary value.
> Do we have a chance to change the resource framework code to make it
> adopt this scenario?
> 
> Thanks.

I'm afraid not, the resource size length defined by phys_addr_t, which
related to the hardware's physical address length. 
It will be much more better if the BAR0 size is not related with the
pcie to axi window, when we set the window to 4GB, the BAR0 size still
have initial value, and we can set the BAR0 size value or just disable
it independently.
The BAR0 size value need bigger than the MMIO space size, so the
software will think it's a invalid resource but not a bogus alignment
one, since we can't disable the BAR0 by hardware, and the flow of enable
devices will keep going. 
> 
> > +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_MEDIATEK, PCI_DEVICE_ID_MEDIATEK_7629,
> > +			 mtk_fixup_bar_size);
> > +
> >  static const struct of_device_id mtk_pcie_ids[] = {
> >  	{ .compatible = "mediatek,mt2701-pcie", .data = &mtk_pcie_soc_v1 },
> >  	{ .compatible = "mediatek,mt7623-pcie", .data = &mtk_pcie_soc_v1 },
> >  	{ .compatible = "mediatek,mt2712-pcie", .data = &mtk_pcie_soc_mt2712 },
> >  	{ .compatible = "mediatek,mt7622-pcie", .data = &mtk_pcie_soc_mt7622 },
> > +	{ .compatible = "mediatek,mt7629-pcie", .data = &mtk_pcie_soc_mt7629 },
> >  	{},
> >  };
> >  
> > diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> > index 69f0abe1ba1a..77b278bac3a8 100644
> > --- a/include/linux/pci_ids.h
> > +++ b/include/linux/pci_ids.h
> > @@ -2126,6 +2126,7 @@
> >  #define PCI_VENDOR_ID_MYRICOM		0x14c1
> >  
> >  #define PCI_VENDOR_ID_MEDIATEK		0x14c3
> > +#define PCI_DEVICE_ID_MEDIATEK_7629	0x7629
> >  
> >  #define PCI_VENDOR_ID_TITAN		0x14D2
> >  #define PCI_DEVICE_ID_TITAN_010L	0x8001
> 
> 
