Return-Path: <SRS0=CgVK=UQ=bootlin.com=miquel.raynal@kernel.org>
Date: Mon, 17 Jun 2019 14:50:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 2/4] clk: mvebu: armada-37xx-periph: change
 suspend/resume time
Message-ID: <20190617145004.7b11988f@xps13>
In-Reply-To: <CAErSpo7fimH5QhHTLsF2ASyPqstkw7Zibe3CYB=KXTYBOh-4GQ@mail.gmail.com>
References: <20190521130357.20803-1-miquel.raynal@bootlin.com>
	<20190521130357.20803-3-miquel.raynal@bootlin.com>
	<CAErSpo5i3y4CxZXV7E4tUR66uXaUa3B_-YT2+zfzZUGMmge7Ow@mail.gmail.com>
	<20190527154610.6d4d5eff@xps13>
	<CAErSpo7fimH5QhHTLsF2ASyPqstkw7Zibe3CYB=KXTYBOh-4GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rafael
List-ID: <devicetree@vger.kernel.org>

Hi Bjorn,

Bjorn Helgaas <bhelgaas@google.com> wrote on Tue, 4 Jun 2019 15:52:31
-0500:

> On Mon, May 27, 2019 at 8:46 AM Miquel Raynal <miquel.raynal@bootlin.com>=
 wrote:
> >
> > Hi Bjorn,
> >
> > Thanks for the feedback.
> >
> > Bjorn Helgaas <bhelgaas@google.com> wrote on Tue, 21 May 2019 17:43:05
> > -0500:
> > =20
> > > From: Miquel Raynal <miquel.raynal@bootlin.com>
> > > Date: Tue, May 21, 2019 at 8:04 AM
> > > To: Michael Turquette, Stephen Boyd, Rob Herring, Mark Rutland
> > > Cc: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>, Thomas
> > > Petazzoni, Antoine Tenart, Gregory Clement, Maxime Chevallier, Nadav
> > > Haklai, Bjorn Helgaas, Rafael J . Wysocki, <linux-pm@vger.kernel.org>,
> > > Miquel Raynal
> > > =20
> > > > Armada 3700 PCIe IP relies on the PCIe clock managed by this
> > > > driver. For reasons related to the PCI core's organization when
> > > > suspending/resuming, PCI host controller drivers must reconfigure
> > > > their register at suspend_noirq()/resume_noirq() which happens after
> > > > suspend()/suspend_late() and before resume_early()/resume(). =20
> > >
> > > "For reasons related to the PCI core's organization" manages to
> > > suggest that this change wouldn't be needed if only the PCI core did
> > > something differently, without actually being specific about what it
> > > would need to do differently.
> > >
> > > Is there something the PCI core could do better to make this easier?
> > > Or is it just something like "the PCI core needs to access registers
> > > after suspend_late()"?  You mention the host controller, but of course
> > > that's not itself a PCI device, so the PCI core doesn't have much to
> > > do with it directly. =20
> >
> > Actually, if I understand correctly the below commit [1] and the core
> > [2] & [3], PCI device fixups can happen at any time, including at the
> > _noirq phase where, obviously, the PCI controller must be already
> > setup.
> >
> > I don't think changing this behavior is a viable solution and I would
> > not see it as a "PCI core could do better" alternative.
> >
> > ---8<---
> >
> > [1]
> > commit ab14d45ea58eae67c739e4ba01871cae7b6c4586
> > Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Date:   Tue Mar 17 15:55:45 2015 +0100
> >
> >     PCI: mvebu: Add suspend/resume support
> >
> >     Add suspend/resume support for the mvebu PCIe host driver.  Without
> >     this commit, the system will panic at resume time when PCIe devices
> >     are connected.
> >
> >     Note that we have to use the ->suspend_noirq() and ->resume_noirq()
> >     hooks, because at resume time, the PCI fixups are done at =20
> >     ->resume_noirq() time, so the PCIe controller has to be ready at =20
> >     this point.
> >
> >     Signed-off-by: Thomas Petazzoni
> >     <thomas.petazzoni@free-electrons.com> Signed-off-by: Bjorn Helgaas
> >     <bhelgaas@google.com> Acked-by: Jason Cooper <jason@lakedaemon.net>
> >
> > [2] https://elixir.bootlin.com/linux/v5.2-rc1/source/drivers/pci/pci-dr=
iver.c#L1181
> > [3] https://elixir.bootlin.com/linux/v5.2-rc1/source/drivers/pci/pci-dr=
iver.c#L522
> > =20
> > --->8--- =20
> > =20
> > >
> > > s/register/registers/ ? =20
> >
> > Indeed. I would like to sort out the above technical point before
> > sending a v3 with this typo corrected. =20
>=20
> I don't have anything more to contribute here; just wanted to make
> sure this wasn't working around a fixable problem in PCI.

Great! Would you mind adding a A-b/R-b tag then?


Thanks,
Miqu=C3=A8l
