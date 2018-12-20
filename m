From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/3] PCI: imx6: Add support for i.MX8MQ
Date: Thu, 20 Dec 2018 09:00:01 -0600
Message-ID: <CAL_JsqJBxZw225qqWfCFa8UqADtGOUCjFogo6Pb2bd8bKwz3nA@mail.gmail.com>
References: <20181218040702.29231-1-andrew.smirnov@gmail.com>
 <20181218040702.29231-4-andrew.smirnov@gmail.com> <20181218151533.GA2922@bogus>
 <VI1PR04MB5533533242C036C5CF6352BAEEBD0@VI1PR04MB5533.eurprd04.prod.outlook.com>
 <CAL_JsqJb24ZpM7qQfy_F7RUVEGyceBAXOndbZcTMh3a__k38UQ@mail.gmail.com>
 <CAHQ1cqEMxxo9JGN5be4XQWAtPz7nC2JyLCr3qasnD5QK7_hOYQ@mail.gmail.com> <1545268969.22930.77.camel@impinj.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545268969.22930.77.camel@impinj.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Trent Piepho <tpiepho@impinj.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Chris Healy <cphealy@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Fabio Estevam <fabio.estevam@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, Leonard Crestez <leonard.crestez@nxp.com>, linux-pci@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 19, 2018 at 7:22 PM Trent Piepho <tpiepho@impinj.com> wrote:
>
> On Wed, 2018-12-19 at 16:47 -0800, Andrey Smirnov wrote:
> >
> > > > This series initially added explicit offsets but I suggested a single
> > > > "controller-id" because:
> > > >   * There are multiple bit and byte offsets
> > > >   * Other imx8 SOCs also have 2x pcie with other bit/byte offsets
> > > >
> > > > Hiding this behind a compatible string and single "controller-id" seem
> > > > preferable to elaborating register maps in dt bindings. It also makes
> > > > upgrades simpler: if features are added which use other bits there is no
> > > > need to describe them in DT and deal with compatibility headaches.
> > >
> > > You already have an id for the controllers: the address. Use that if
> > > you don't want to put the register offsets in DT.
> > >
> >
> > Lucas, are you on board with this?
>
> Does address here mean the address from the controller's reg property?

Yes.

> How do you map that address to the controller's index?  A giant table
> of every soc so the soc type plus controller register address pair than
> can be looked up in the driver?

You only need the 2-Nth instance addresses. A non-matching address can
be instance 0.

> I.e., on iMX8MQ the controller at 0x33800000 is controller 0 and so on
> for every possible SoC address combination?
>
> Not really a fan of that.

Well, this was not my first suggestion.

> The situation here is that some registers for these controllers are
> interleaved, right?  I.e., there's one register somewhere where bit 0
> means enable controller 0 and bit 1 means enable controller 1 and so
> on.

So? The only difference here is an additional mapping step.

> Isn't cell-index already the standard device tree property for this
> kind of setup?
>
> I know cell-index was historically also (ab)used in an attempt to
> provide a fixed kernel device enumeration order, something now handled
> better by chosen node aliases.

Don't use cell-index. Consider it a deprecated relic from OF that is
not used on FDT (though there probably are some cases it did get
used).

Rob
