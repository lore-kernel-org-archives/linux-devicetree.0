From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH] PCI: altera: Allow building as module
Date: Thu, 30 May 2019 16:07:51 +0100
Message-ID: <20190530150751.GB13993@redmoon>
References: <1556081835-12921-1-git-send-email-ley.foon.tan@intel.com>
 <CAFiDJ5-4vquVtrqpjgk8D6yhng3RFHN6dF4Kh_PGYe_doZtvqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFiDJ5-4vquVtrqpjgk8D6yhng3RFHN6dF4Kh_PGYe_doZtvqw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ley Foon Tan <lftan.linux@gmail.com>
Cc: Ley Foon Tan <ley.foon.tan@intel.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org, linux-pci <linux-pci@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, May 14, 2019 at 01:35:05PM +0800, Ley Foon Tan wrote:
> On Wed, Apr 24, 2019 at 12:57 PM Ley Foon Tan <ley.foon.tan@intel.com> wrote:
> >
> > Altera PCIe Rootport IP is a soft IP and is only available after
> > FPGA image is programmed.
> >
> > Make driver modulable to support use case FPGA image is programmed
> > after kernel is booted. User proram FPGA image in kernel then only load
> > PCIe driver module.
> >
> > Signed-off-by: Ley Foon Tan <ley.foon.tan@intel.com>
> > ---
> >  drivers/pci/controller/Kconfig       |  2 +-
> >  drivers/pci/controller/pcie-altera.c | 28 ++++++++++++++++++++++++++--
> >  2 files changed, 27 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> > index 6012f3059acd..4b550f9cdd56 100644
> > --- a/drivers/pci/controller/Kconfig
> > +++ b/drivers/pci/controller/Kconfig
> > @@ -174,7 +174,7 @@ config PCIE_IPROC_MSI
> >           PCIe controller
> >
> >  config PCIE_ALTERA
> > -       bool "Altera PCIe controller"
> > +       tristate "Altera PCIe controller"
> >         depends on ARM || NIOS2 || ARM64 || COMPILE_TEST
> >         help
> >           Say Y here if you want to enable PCIe controller support on Altera
> > diff --git a/drivers/pci/controller/pcie-altera.c b/drivers/pci/controller/pcie-altera.c
> > index 27edcebd1726..6c86bc69ace8 100644
> > --- a/drivers/pci/controller/pcie-altera.c
> > +++ b/drivers/pci/controller/pcie-altera.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/interrupt.h>
> >  #include <linux/irqchip/chained_irq.h>
> >  #include <linux/init.h>
> > +#include <linux/module.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_device.h>
> >  #include <linux/of_irq.h>
> > @@ -705,6 +706,13 @@ static int altera_pcie_init_irq_domain(struct altera_pcie *pcie)
> >         return 0;
> >  }
> >
> > +static int altera_pcie_irq_teardown(struct altera_pcie *pcie)
> > +{
> > +       irq_set_chained_handler_and_data(pcie->irq, NULL, NULL);
> > +       irq_domain_remove(pcie->irq_domain);
> > +       irq_dispose_mapping(pcie->irq);
> > +}
> > +
> >  static int altera_pcie_parse_dt(struct altera_pcie *pcie)
> >  {
> >         struct device *dev = &pcie->pdev->dev;
> > @@ -798,6 +806,7 @@ static int altera_pcie_probe(struct platform_device *pdev)
> >
> >         pcie = pci_host_bridge_priv(bridge);
> >         pcie->pdev = pdev;
> > +       platform_set_drvdata(pdev, pcie);
> >
> >         match = of_match_device(altera_pcie_of_match, &pdev->dev);
> >         if (!match)
> > @@ -855,13 +864,28 @@ static int altera_pcie_probe(struct platform_device *pdev)
> >         return ret;
> >  }
> >
> > +static int altera_pcie_remove(struct platform_device *pdev)
> > +{
> > +       struct altera_pcie *pcie = platform_get_drvdata(pdev);
> > +       struct pci_host_bridge *bridge = pci_host_bridge_from_priv(pcie);
> > +
> > +       pci_stop_root_bus(bridge->bus);
> > +       pci_remove_root_bus(bridge->bus);
> > +       pci_free_resource_list(&pcie->resources);
> > +       altera_pcie_irq_teardown(pcie);
> > +
> > +       return 0;
> > +}
> > +
> >  static struct platform_driver altera_pcie_driver = {
> >         .probe          = altera_pcie_probe,
> > +       .remove         = altera_pcie_remove,
> >         .driver = {
> >                 .name   = "altera-pcie",
> >                 .of_match_table = altera_pcie_of_match,
> > -               .suppress_bind_attrs = true,
> >         },
> >  };
> >
> > -builtin_platform_driver(altera_pcie_driver);
> > +MODULE_DEVICE_TABLE(of, altera_pcie_of_match);
> > +module_platform_driver(altera_pcie_driver);
> > +MODULE_LICENSE("GPL v2");
> > --
> > 2.19.0
> >
> Hi
> 
> Any comment for this patch?

Applied to pci/altera for v5.3, thanks.

Lorenzo
