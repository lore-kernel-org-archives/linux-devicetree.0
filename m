Return-Path: <SRS0=TXlT=PT=bootlin.com=miquel.raynal@kernel.org>
Date: Fri, 11 Jan 2019 14:44:40 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/4] clk: mvebu: armada-37xx-periph: change
 suspend/resume time
Message-ID: <20190111144440.6fd456b5@xps13>
In-Reply-To: <20181130115821.255394d4@xps13>
References: <20181123094444.27956-1-miquel.raynal@bootlin.com>
	<20181123094444.27956-3-miquel.raynal@bootlin.com>
	<154353827849.88331.12767996548874447262@swboyd.mtv.corp.google.com>
	<20181130115821.255394d4@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>
List-ID: <devicetree@vger.kernel.org>

Hi Bjorn and Stephen

Gentle ping about the below debate, I hope you will have enough
context to answer, please ask if something is unclear.

The question here about "shall we upgrade the clocks S2RAM callbacks to
the NOIRQ phase" to be handled before/after the PCIe callbacks (which
also are in the NOIRQ phase) also applies to the pinctrl driver so I am
really interested to know why this would not be a valid solution.

Miquel Raynal <miquel.raynal@bootlin.com> wrote on Fri, 30
Nov 2018 11:58:21 +0100:

> Hi Stephen,
>=20
> + Bjorn to help us on PCI suspend/resume questions.
>=20
> Stephen Boyd <sboyd@kernel.org> wrote on Thu, 29 Nov 2018 16:37:58
> -0800:
>=20
> > Quoting Miquel Raynal (2018-11-23 01:44:41) =20
> > > Armada 3700 PCIe IP relies on the PCIe clock managed by this
> > > driver. For reasons related to the PCI core's organization when
> > > suspending/resuming, PCI host controller drivers must reconfigure
> > > their register at suspend_noirq()/resume_noirq() which happens after
> > > suspend()/suspend_late() and before resume_early()/resume().
> > >=20
> > > Device link support in the clock framework enforce that the clock
> > > driver's resume() callback will be called before the PCIe
> > > driver's. But, any resume_noirq() callback will be called before all
> > > the registered resume() callbacks.   =20
> >=20
> > I thought any device driver that provides something to another device
> > driver will implicitly be probed before the driver that consumes said
> > resources. And we actually reorder the dpm list on probe defer so that
> > the order of devices is correct. Is it more that we want to parallelize
> > suspend/resume of the PCIe chip so we need to have device links so that
> > we know the dependency of the PCIe driver on the clock driver? =20
>=20
> I had the same idea of device links before testing. I hope I did
> not make any mistake leading me to wrong observations, but indeed
> this is what I think is happening:
> * PM core call all suspend() callbacks
> * then all suspend_late()
> * then all suspend_noirq()
> For me, the PM core does not care if a suspend_noirq() depends on the
> suspend() of another driver.
>=20
> I hope I did not miss anything.
>=20
> >  =20
> > >=20
> > > The solution to support PCIe resume operation is to change the
> > > "priority" of this clock driver PM callbacks to "_noirq()".   =20
> >=20
> > This seems sad that the PM core can't "priority boost" any
> > suspend/resume callbacks of a device that doesn't have noirq callbacks
> > when a device that depends on it from the device link perspective does
> > have noirq callbacks. =20
>=20
> I do agree on this but I'm not sure it would work. I suppose the
> "noirq" state is a global state and thus code in regular suspend()
> callbacks could probably fail to run in a "noirq" context?
>=20
> > And why does the PCIe device need to use noirq callbacks in general? =20
>=20
> I would like Bjorn to confirm this, but there is this commit that could
> explain the situation:
>=20
> commit ab14d45ea58eae67c739e4ba01871cae7b6c4586
> Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Date:   Tue Mar 17 15:55:45 2015 +0100
>=20
>     PCI: mvebu: Add suspend/resume support
>    =20
>     Add suspend/resume support for the mvebu PCIe host driver.  Without t=
his
>     commit, the system will panic at resume time when PCIe devices are
>     connected.
>    =20
>     Note that we have to use the ->suspend_noirq() and ->resume_noirq() h=
ooks,
>     because at resume time, the PCI fixups are done at ->resume_noirq() t=
ime,
>     so the PCIe controller has to be ready at this point.
>    =20
>     Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>     Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
>     Acked-by: Jason Cooper <jason@lakedaemon.net>
>=20
> >=20
> > I'm just saying this seems like a more fundamental problem with ordering
> > of provider and consumer suspend/resume functions that isn't being
> > solved in this patch. In fact, it's quite the opposite, this is working
> > around the problem.
> >  =20
>=20
> I do agree with your point, but I would not be confident tweaking the PM
> core's scheduling "alone" :)
>=20

Thanks,
Miqu=C3=A8l
