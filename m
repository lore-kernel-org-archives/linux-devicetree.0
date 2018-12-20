From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH v3 3/3] PCI: imx6: Add support for i.MX8MQ
Date: Wed, 19 Dec 2018 16:47:25 -0800
Message-ID: <CAHQ1cqEMxxo9JGN5be4XQWAtPz7nC2JyLCr3qasnD5QK7_hOYQ@mail.gmail.com>
References: <20181218040702.29231-1-andrew.smirnov@gmail.com>
 <20181218040702.29231-4-andrew.smirnov@gmail.com> <20181218151533.GA2922@bogus>
 <VI1PR04MB5533533242C036C5CF6352BAEEBD0@VI1PR04MB5533.eurprd04.prod.outlook.com>
 <CAL_JsqJb24ZpM7qQfy_F7RUVEGyceBAXOndbZcTMh3a__k38UQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJb24ZpM7qQfy_F7RUVEGyceBAXOndbZcTMh3a__k38UQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Leonard Crestez <leonard.crestez@nxp.com>, Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Fabio Estevam <fabio.estevam@nxp.com>, Chris Healy <cphealy@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 18, 2018 at 1:10 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Dec 18, 2018 at 12:09 PM Leonard Crestez
> <leonard.crestez@nxp.com> wrote:
> >
> > On 12/18/2018 5:15 PM, Rob Herring wrote:
> > > On Mon, Dec 17, 2018 at 08:07:02PM -0800, Andrey Smirnov wrote:
> > >> Add code needed to support i.MX8MQ variant.
> > >>
> > >> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> > >> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> >
> > >> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> > >> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> > >>
> > >> +Additional required properties for imx8mq-pcie:
> > >> +- fsl,controller-id: Logical ID of a given PCIE controller. PCIE1 is 0, PCIE2 is 1;
> > >> +
> > >
> > > Remove this.
> > >
> > > If GPR register offset is what you need, then put that into DT.
> > > Typically, we'd have a property with iomuxc phandle and offset.
> >
> > This series initially added explicit offsets but I suggested a single
> > "controller-id" because:
> >   * There are multiple bit and byte offsets
> >   * Other imx8 SOCs also have 2x pcie with other bit/byte offsets
> >
> > Hiding this behind a compatible string and single "controller-id" seem
> > preferable to elaborating register maps in dt bindings. It also makes
> > upgrades simpler: if features are added which use other bits there is no
> > need to describe them in DT and deal with compatibility headaches.
>
> You already have an id for the controllers: the address. Use that if
> you don't want to put the register offsets in DT.
>

Lucas, are you on board with this?

Thanks,
Andrey Smirnov
