From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCHv3 17/27] PCI: mobiveil: fix the checking of valid device
Date: Fri, 8 Feb 2019 08:13:15 -0600
Message-ID: <20190208141315.GU7268@google.com>
References: <20190129080926.36773-1-Zhiqiang.Hou@nxp.com>
 <20190129080926.36773-18-Zhiqiang.Hou@nxp.com>
 <CAFZiPx0faPHN1mqPV28XTZfOxA2GgDPuc=RVdXEiGGNAUe=Fxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFZiPx0faPHN1mqPV28XTZfOxA2GgDPuc=RVdXEiGGNAUe=Fxw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
Cc: "Z.q. Hou" <zhiqiang.hou@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, Xiaowei Bao <xiaowei.bao@nxp.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "will.deacon@arm.com" <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

[+cc Thomas]

On Fri, Feb 08, 2019 at 06:11:15PM +0530, Subrahmanya Lingappa wrote:
> On Tue, Jan 29, 2019 at 1:40 PM Z.q. Hou <zhiqiang.hou@nxp.com> wrote:
> >
> > From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> >
> > Avoid to issue CFG transactions to link partner when the PCIe
> > link is not up. And allow CFG transactions to all functions of
> > Endpoint implemented multiple functions.
> >
> > Fixes: 9af6bcb11e12 ("PCI: mobiveil: Add Mobiveil PCIe Host
> > Bridge IP driver")
> > Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> > Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
> > ---
> > V3:
> >  - No change
> >
> >  drivers/pci/controller/mobiveil/pcie-mobiveil-host.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
> > index dc5324d94466..1ae82e790562 100644
> > --- a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
> > +++ b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
> > @@ -29,6 +29,10 @@ static bool mobiveil_pcie_valid_device(struct pci_bus *bus, unsigned int devfn)
> >  {
> >         struct mobiveil_pcie *pcie = bus->sysdata;
> >
> > +       /* If there is no link, then there is no device */
> > +       if (bus->number > pcie->rp.root_bus_nr && !mobiveil_pcie_link_up(pcie))
> > +               return false;
> > +
> >         /* Only one device down on each root port */
> >         if ((bus->number == pcie->rp.root_bus_nr) && (devfn > 0))
> >                 return false;
> > @@ -37,7 +41,7 @@ static bool mobiveil_pcie_valid_device(struct pci_bus *bus, unsigned int devfn)
> >          * Do not read more than one device on the bus directly
> >          * attached to RC
> >          */
> > -       if ((bus->primary == pcie->rp.root_bus_nr) && (devfn > 0))
> > +       if ((bus->primary == pcie->rp.root_bus_nr) && (PCI_SLOT(devfn) > 0))

> here change "primary" to "number", as it's a bug in the original driver too.

This looks like it should be split into two patches: (1) checking for
link up, and (2) checking root_bus_nr.

And if you mean "bus->primary == pcie->rp.root_bus_nr" is a bug in
pci-aardvark.c, too, it is imperative to fix that bug also (with a
separate patch).

> >                 return false;
> >
> >         return true;
> > --
> > 2.17.1
> >
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
