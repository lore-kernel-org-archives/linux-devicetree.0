From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH v4 4/4] PCI: imx6: Add support for i.MX8MQ
Date: Sat, 12 Jan 2019 13:28:47 -0800
Message-ID: <CAHQ1cqHO=aw0AoLCrO+r7uCG5tE=Ai9or+UAOM3MJ1Cu-fCZ-w@mail.gmail.com>
References: <20190104165335.13205-1-andrew.smirnov@gmail.com>
 <20190104165335.13205-5-andrew.smirnov@gmail.com> <20190111195302.GA18985@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111195302.GA18985@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Fabio Estevam <fabio.estevam@nxp.com>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 11, 2019 at 11:53 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Jan 04, 2019 at 08:53:35AM -0800, Andrey Smirnov wrote:
> > Add code needed to support i.MX8MQ variant.
> >
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: Fabio Estevam <fabio.estevam@nxp.com>
> > Cc: Chris Healy <cphealy@gmail.com>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Leonard Crestez <leonard.crestez@nxp.com>
> > Cc: "A.s. Dong" <aisheng.dong@nxp.com>
> > Cc: Richard Zhu <hongxing.zhu@nxp.com>
> > Cc: Rob Herring <robh@kernel.org>,
> > Cc: devicetree@vger.kernel.org,
> > Cc: linux-imx@nxp.com
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-pci@vger.kernel.org
> > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> > ---
> >  .../bindings/pci/fsl,imx6q-pcie.txt           |  3 +-
> >  drivers/pci/controller/dwc/Kconfig            |  4 +-
> >  drivers/pci/controller/dwc/pci-imx6.c         | 77 ++++++++++++++++++-
> >  3 files changed, 79 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> > index d514c1f2365f..920ca93870a8 100644
> > --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> > +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> > @@ -9,6 +9,7 @@ Required properties:
> >       - "fsl,imx6sx-pcie",
> >       - "fsl,imx6qp-pcie"
> >       - "fsl,imx7d-pcie"
> > +     - "fsl,imx8mq-pcie"
> >  - reg: base address and length of the PCIe controller
> >  - interrupts: A list of interrupt outputs of the controller. Must contain an
> >    entry for each entry in the interrupt-names property.
> > @@ -45,7 +46,7 @@ Additional required properties for imx6sx-pcie:
> >    PCIE_PHY power domains
> >  - power-domain-names: Must be "pcie", "pcie_phy"
> >
> > -Additional required properties for imx7d-pcie:
> > +Additional required properties for imx7d-pcie and imx8mq-pcie:
> >  - power-domains: Must be set to a phandle pointing to PCIE_PHY power domain
> >  - resets: Must contain phandles to PCIe-related reset lines exposed by SRC
> >    IP block
> > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > index 6aafec3fad00..83ea318ad989 100644
> > --- a/drivers/pci/controller/dwc/Kconfig
> > +++ b/drivers/pci/controller/dwc/Kconfig
> > @@ -89,8 +89,8 @@ config PCI_EXYNOS
> >       select PCIE_DW_HOST
> >
> >  config PCI_IMX6
> > -     bool "Freescale i.MX6/7 PCIe controller"
> > -     depends on SOC_IMX6Q || SOC_IMX7D || (ARM && COMPILE_TEST)
> > +     bool "Freescale i.MX6/7/8 PCIe controller"
> > +     depends on SOC_IMX6Q || SOC_IMX7D || (ARM64 && ARCH_MXC) || ((ARM || ARM64) && COMPILE_TEST)
>
> Since you added the ifdef around the abort handler, I think you can drop
> "(ARM || ARM64)" and enable building other arches.
>

OK, makes sense. I'll give it a go in v5.

Thanks,
Andrey Smirnov
