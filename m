From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCHv5 04/20] PCI: mobiveil: Remove the flag
 MSI_FLAG_MULTI_PCI_MSI
Date: Fri, 28 Jun 2019 12:35:55 +0100
Message-ID: <20190628113555.GA21829@e121166-lin.cambridge.arm.com>
References: <20190412083635.33626-1-Zhiqiang.Hou@nxp.com>
 <20190412083635.33626-5-Zhiqiang.Hou@nxp.com>
 <20190611165935.GA22836@redmoon>
 <AM0PR04MB67383023B81AEB33DAF9C35584EC0@AM0PR04MB6738.eurprd04.prod.outlook.com>
 <20190612130813.GA15747@redmoon>
 <AM0PR04MB6738B93C7F1B5BE433753CF584E90@AM0PR04MB6738.eurprd04.prod.outlook.com>
 <20190617093337.GD18020@e121166-lin.cambridge.arm.com>
 <AM6PR04MB67425792524FBA1C773F137984EB0@AM6PR04MB6742.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM6PR04MB67425792524FBA1C773F137984EB0@AM6PR04MB6742.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 17, 2019 at 10:34:35AM +0000, Z.q. Hou wrote:

[...]

> > There is nothing obvious. Write what you are fixing in the commit log and I will
> > apply the patch, I won't write the commit log for you. Anyone should be able
> > to understand why a patch was needed by reading the commit log, it is as
> > important as writing the code itself.
> 
> With the flag MSI_FLAG_MULTI_PCI_MSI, when the Endpoint allocates
> multiple MSI, it will trigger the "WARN_ON(nr_irqs != 1);" in
> mobiveil_irq_msi_domain_alloc(), this is the issue this patch want to
> fix. 

And that's wrong. Marc explained why this controller does not support
Multi MSI and that's what should go in the commit log, triggering
a WARN_ON is the least of the problems (and the WARN_ON can even
be removed after this patch is applied), if it was used as a bandaid
to prevent allocating Multi MSI it is even more broken.

Lorenzo

> Thanks,
> Zhiqiang
> 
> > 
> > Thanks,
> > Lorenzo
> > 
> > > Thanks,
> > > Zhiqiang
> > >
> > > >
> > > > Lorenzo
> > > >
> > > > > Subbu, did you test with Endpoint supporting multi MSI?
> > > > >
> > > > > Thanks,
> > > > > Zhiqiang
> > > > >
> > > > > >
> > > > > > Thanks,
> > > > > > Lorenzo
> > > > > >
> > > > > > > Fixes: 1e913e58335f ("PCI: mobiveil: Add MSI support")
> > > > > > > Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> > > > > > > Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
> > > > > > > ---
> > > > > > > V5:
> > > > > > >  - Corrected the subject.
> > > > > > >
> > > > > > >  drivers/pci/controller/pcie-mobiveil.c | 2 +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/pci/controller/pcie-mobiveil.c
> > > > > > > b/drivers/pci/controller/pcie-mobiveil.c
> > > > > > > index 563210e731d3..a0dd337c6214 100644
> > > > > > > --- a/drivers/pci/controller/pcie-mobiveil.c
> > > > > > > +++ b/drivers/pci/controller/pcie-mobiveil.c
> > > > > > > @@ -703,7 +703,7 @@ static struct irq_chip
> > > > > > > mobiveil_msi_irq_chip = {
> > > > > > >
> > > > > > >  static struct msi_domain_info mobiveil_msi_domain_info = {
> > > > > > >  	.flags	= (MSI_FLAG_USE_DEF_DOM_OPS |
> > > > > > MSI_FLAG_USE_DEF_CHIP_OPS |
> > > > > > > -		   MSI_FLAG_MULTI_PCI_MSI | MSI_FLAG_PCI_MSIX),
> > > > > > > +		   MSI_FLAG_PCI_MSIX),
> > > > > > >  	.chip	= &mobiveil_msi_irq_chip,
> > > > > > >  };
> > > > > > >
> > > > > > > --
> > > > > > > 2.17.1
> > > > > > >
