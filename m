From: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
Subject: Re: [PATCHv4 11/28] PCI: mobiveil: only fix up the Class Code field
Date: Wed, 13 Mar 2019 16:29:18 +0530
Message-ID: <CAFZiPx1+SDPLZ3CAAhSxbTUWdKrnx3UkF99nTxwqoNx3mdXDcA@mail.gmail.com>
References: <20190311093130.7209-1-Zhiqiang.Hou@nxp.com> <20190311093130.7209-12-Zhiqiang.Hou@nxp.com>
 <20190311141401.GG214730@google.com> <AM6PR04MB5781498315C6B69EB2586B9D84490@AM6PR04MB5781.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM6PR04MB5781498315C6B69EB2586B9D84490@AM6PR04MB5781.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

Bjorn/ZQ,


On Tue, Mar 12, 2019 at 2:48 PM Z.q. Hou <zhiqiang.hou@nxp.com> wrote:
>
> Hi Bjorn,
>
> Thanks a lot for your comments!
>
> > -----Original Message-----
> > From: Bjorn Helgaas [mailto:helgaas@kernel.org]
> > Sent: 2019=E5=B9=B43=E6=9C=8811=E6=97=A5 22:14
> > To: Z.q. Hou <zhiqiang.hou@nxp.com>
> > Cc: linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > robh+dt@kernel.org; mark.rutland@arm.com; l.subrahmanya@mobiveil.co.in;
> > shawnguo@kernel.org; Leo Li <leoyang.li@nxp.com>;
> > lorenzo.pieralisi@arm.com; catalin.marinas@arm.com;
> > will.deacon@arm.com; Mingkai Hu <mingkai.hu@nxp.com>; M.h. Lian
> > <minghuan.lian@nxp.com>; Xiaowei Bao <xiaowei.bao@nxp.com>
> > Subject: Re: [PATCHv4 11/28] PCI: mobiveil: only fix up the Class Code =
field
> >
> > On Mon, Mar 11, 2019 at 09:31:23AM +0000, Z.q. Hou wrote:
> > > From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> > >
> > > Fix up the Class Code to PCI bridge, do not change the Revision ID.
> > > And move the fixup to mobiveil_host_init function.
> >
> > Add parens after function name.
> >
> > Please explain why this change is needed.  Does it fix a bug?
> >
> > Does this fix the problem that the PCI core didn't correctly identify t=
he device
> > as a bridge because it identified bridges by class code instead of head=
er type?
> >
> > That problem *should* be fixed by b2fb5cc57469 ("PCI: Rely on config sp=
ace
> > header type, not class code"), which is now upstream.
> >
> > You might still want this class code change so that lspci shows the cor=
rect
> > thing.  That's fine, but the changelog should say why we're doing it.
> >
>
> Subrahmanya's original patch is to fixup 'Class Code' field, but it also =
fixed the 'Revision ID' field. This patch is patch is to remove the fixup o=
f 'Revision ID' field.

it was introduced during the test with 4.9 and 4.15 linux version,
without this fix driver was not getting loaded.

I belive it should be sufficient to mention in code comment:  "Fixing
the class code as hardware is not reflecting the correct class code",
And the changelog for this patch mentioning "avoid changing the
revision ID  during the class code fix". Is that OK?

Thanks,

>
> > > Fixes: 9af6bcb11e12 ("PCI: mobiveil: Add Mobiveil PCIe Host Bridge IP
> > > driver")
> >
> > Make this "Fixes:" line a single line again.
> >
> > > Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> > > Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
> > > Reviewed-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
> > > ---
> > > V4:
> > >  - no change
> > >
> > >  drivers/pci/controller/pcie-mobiveil.c | 9 ++++++---
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/pcie-mobiveil.c
> > > b/drivers/pci/controller/pcie-mobiveil.c
> > > index 78e575e71f4d..8eee1ab7ee24 100644
> > > --- a/drivers/pci/controller/pcie-mobiveil.c
> > > +++ b/drivers/pci/controller/pcie-mobiveil.c
> > > @@ -653,6 +653,12 @@ static int mobiveil_host_init(struct mobiveil_pc=
ie
> > *pcie)
> > >                                type, resource_size(win->res));
> > >     }
> > >
> > > +   /* fixup for PCIe class register */
> > > +   value =3D csr_readl(pcie, PAB_INTP_AXI_PIO_CLASS);
> > > +   value &=3D 0xff;
> > > +   value |=3D (PCI_CLASS_BRIDGE_PCI << 16);
> > > +   csr_writel(pcie, value, PAB_INTP_AXI_PIO_CLASS);
> > > +
> > >     /* setup MSI hardware registers */
> > >     mobiveil_pcie_enable_msi(pcie);
> > >
> > > @@ -896,9 +902,6 @@ static int mobiveil_pcie_probe(struct
> > platform_device *pdev)
> > >             goto error;
> > >     }
> > >
> > > -   /* fixup for PCIe class register */
> > > -   csr_writel(pcie, 0x060402ab, PAB_INTP_AXI_PIO_CLASS);
> > > -
> > >     /* initialize the IRQ domains */
> > >     ret =3D mobiveil_pcie_init_irq_domain(pcie);
> > >     if (ret) {
> > > --
> > > 2.17.1
> > >
>
> Thanks,
> Zhiqiang
