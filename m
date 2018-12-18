From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH v3 3/3] PCI: imx6: Add support for i.MX8MQ
Date: Tue, 18 Dec 2018 10:14:26 -0800
Message-ID: <CAHQ1cqEw47XSfNnohg=VJdQJ+fF-F-nucNm=Qqu5Tt-tZt2-PA@mail.gmail.com>
References: <20181218040702.29231-1-andrew.smirnov@gmail.com>
 <20181218040702.29231-4-andrew.smirnov@gmail.com> <8149d09e665c4a4efb85a9d60f266d478bee02d8.camel@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8149d09e665c4a4efb85a9d60f266d478bee02d8.camel@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Richard Zhu <hongxing.zhu@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "cphealy@gmail.com" <cphealy@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, Fabio Estevam <fabio.estevam@nxp.com>, "robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 18, 2018 at 1:34 AM Leonard Crestez <leonard.crestez@nxp.com> wrote:
>
> On Mon, 2018-12-17 at 20:07 -0800, Andrey Smirnov wrote:
> > Add code needed to support i.MX8MQ variant.
>
> >  static void imx6_pcie_init_phy(struct imx6_pcie *imx6_pcie)
> >  {
> > +
> > +
> Remove empty lines?
>

Sure, will do.

> > +     unsigned int mask, val, offset;
> > +
> > +     mask = IMX6Q_GPR12_DEVICE_TYPE;
> > +     val  = FIELD_PREP(IMX6Q_GPR12_DEVICE_TYPE, PCI_EXP_TYPE_ROOT_PORT);
>
> ... snip ...
>
> > -     regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR12,
> > -                     IMX6Q_GPR12_DEVICE_TYPE, PCI_EXP_TYPE_ROOT_PORT << 12);
> > +     regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR12, mask, val);
>
> Maybe setting port type should be a separate function from init_phy?

Sure, will change in v4.

Thanks,
Andrey Smirnov
