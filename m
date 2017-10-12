From: "M.h. Lian" <minghuan.lian-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 0/5] arm64: add ls1012a and ls1046a pcie support
Date: Thu, 12 Oct 2017 03:12:47 +0000
Message-ID: <VI1PR04MB16157ABDE174A8DD1567173CE84B0@VI1PR04MB1615.eurprd04.prod.outlook.com>
References: <20170919092658.22482-1-Zhiqiang.Hou@nxp.com>
 <20171011185719.GL25517@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171011185719.GL25517-1RhO1Y9PlrlHTL0Zs8A6p5iNqAH0jzoTYJqu5kTmcBRl57MIdRCFDg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Z.q. Hou" <zhiqiang.hou-3arQi8VN3Tc@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "marc.zyngier-5wv7dgnIgG8@public.gmane.org" <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mingkai Hu <mingkai.hu-3arQi8VN3Tc@public.gmane.org>, Roy Zang <roy.zang-3arQi8VN3Tc@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

I greatly appreciate for your review and picking up them.

Acked-by: Minghuan Lian <minghuan.Lian-3arQi8VN3Tc@public.gmane.org>


> -----Original Message-----
> From: Bjorn Helgaas [mailto:helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Thursday, October 12, 2017 2:57 AM
> To: Z.q. Hou <zhiqiang.hou-3arQi8VN3Tc@public.gmane.org>
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
> pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linuxppc-
> dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; marc.zyngier-5wv7dgnIgG8@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> mark.rutland-5wv7dgnIgG8@public.gmane.org; bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org; shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> Mingkai Hu <mingkai.hu-3arQi8VN3Tc@public.gmane.org>; M.h. Lian <minghuan.lian-3arQi8VN3Tc@public.gmane.org>; Roy
> Zang <roy.zang-3arQi8VN3Tc@public.gmane.org>; Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>; Jason
> Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> Subject: Re: [PATCH 0/5] arm64: add ls1012a and ls1046a pcie support
>=20
> On Tue, Sep 19, 2017 at 05:26:53PM +0800, Zhiqiang Hou wrote:
> > From: Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
> >
> > This patch set adds ls1012a MSI and PCIe support, including driver and
> > device tree nodes. The ls1046a's MSI support patch and PCIe driver
> > patch has been applied, so only adds the PCIe device tree nodes.
> >
> > Hou Zhiqiang (5):
> >   irqchip/ls-scfg-msi: add LS1012a MSI support
> >   arm64: dts: ls1012a: Add MSI controller DT node
> >   PCI: layerscape: Add support for ls1012a
> >   arm64: dts: ls1012a: Add PCIe controller DT node
> >   arm64: dts: ls1046a: add PCIe controller DT nodes
> >
> >  .../interrupt-controller/fsl,ls-scfg-msi.txt       |  1 +
> >  .../devicetree/bindings/pci/layerscape-pci.txt     |  1 +
> >  arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     | 31 +++++++++
> >  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     | 75
> ++++++++++++++++++++++
> >  drivers/irqchip/irq-ls-scfg-msi.c                  |  1 +
> >  drivers/pci/dwc/pci-layerscape.c                   |  1 +
> >  6 files changed, 110 insertions(+)
>=20
> I'm not 100% sure who should take these.  They trivially touch PCI and I =
haven't
> seen anybody else respond, so I put them on pci/host-layerscape with Rob'=
s acks.
>=20
> If somebody else wants to take them, just let me know and I'll drop them.
>=20
> They really should be acked by Minghuan or Mingkai, who are listed as the
> maintainers of drivers/pci/dwc/pci-layerscape.c and are presumably respon=
sible
> for the related dtsi files, too.
>=20
> Thomas, Jason, and Marc are listed as maintainers of drivers/irqchip/irq-=
ls-scfg-
> msi.c.  It's a trivial change, but I added them to the cc list.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
