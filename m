From: Ley Foon Tan <lftan.linux@gmail.com>
Subject: Re: [PATCH] PCI: altera-msi: Allow building as module
Date: Thu, 16 May 2019 10:12:52 +0800
Message-ID: <CAFiDJ5-1YncDFFES+vj2bnaRwq74RT=s0KB9FBpYFt-r9T+a2g@mail.gmail.com>
References: <1556081835-12921-1-git-send-email-ley.foon.tan@intel.com>
 <1556081835-12921-2-git-send-email-ley.foon.tan@intel.com>
 <CAFiDJ59Pi6fxyE=0ifNJRoGc4QBX3XKJ=L7FXjJ_a6Vyh8otMg@mail.gmail.com> <20190515135933.GB30985@e121166-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190515135933.GB30985@e121166-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Ley Foon Tan <ley.foon.tan@intel.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org, linux-pci <linux-pci@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, May 15, 2019 at 9:59 PM Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:
>
> On Tue, May 14, 2019 at 01:35:20PM +0800, Ley Foon Tan wrote:
> > On Wed, Apr 24, 2019 at 12:57 PM Ley Foon Tan <ley.foon.tan@intel.com> wrote:
> > >
> > > Altera MSI IP is a soft IP and is only available after
> > > FPGA image is programmed.
> > >
> > > Make driver modulable to support use case FPGA image is programmed
> > > after kernel is booted. User proram FPGA image in kernel then only load
> > > MSI driver module.
> > >
> > > Signed-off-by: Ley Foon Tan <ley.foon.tan@intel.com>
> > > ---
> > >  drivers/pci/controller/Kconfig           |  2 +-
> > >  drivers/pci/controller/pcie-altera-msi.c | 10 ++++++++++
> > >  2 files changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> > > index 4b550f9cdd56..920546cb84e2 100644
> > > --- a/drivers/pci/controller/Kconfig
> > > +++ b/drivers/pci/controller/Kconfig
> > > @@ -181,7 +181,7 @@ config PCIE_ALTERA
> > >           FPGA.
> > >
> > >  config PCIE_ALTERA_MSI
> > > -       bool "Altera PCIe MSI feature"
> > > +       tristate "Altera PCIe MSI feature"
> > >         depends on PCIE_ALTERA
> > >         depends on PCI_MSI_IRQ_DOMAIN
> > >         help
> > > diff --git a/drivers/pci/controller/pcie-altera-msi.c b/drivers/pci/controller/pcie-altera-msi.c
> > > index 025ef7d9a046..16d938920ca5 100644
> > > --- a/drivers/pci/controller/pcie-altera-msi.c
> > > +++ b/drivers/pci/controller/pcie-altera-msi.c
> > > @@ -10,6 +10,7 @@
> > >  #include <linux/interrupt.h>
> > >  #include <linux/irqchip/chained_irq.h>
> > >  #include <linux/init.h>
> > > +#include <linux/module.h>
> > >  #include <linux/msi.h>
> > >  #include <linux/of_address.h>
> > >  #include <linux/of_irq.h>
> > > @@ -288,4 +289,13 @@ static int __init altera_msi_init(void)
> > >  {
> > >         return platform_driver_register(&altera_msi_driver);
> > >  }
> > > +
> > > +static void __exit altera_msi_exit(void)
> > > +{
> > > +       platform_driver_unregister(&altera_msi_driver);
> > > +}
> > > +
> > >  subsys_initcall(altera_msi_init);
> > > +MODULE_DEVICE_TABLE(of, altera_msi_of_match);
> > > +module_exit(altera_msi_exit);
> > > +MODULE_LICENSE("GPL v2");
> > > --
> > > 2.19.0
> > >
> > Hi
> >
> > Any comment for this patch?
>
> I will get to these patches for the next merge window, thanks.

Thanks.

Regards
Ley Foon
