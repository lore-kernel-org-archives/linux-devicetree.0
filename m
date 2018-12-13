From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 05/12] PCI: aardvark: add suspend to RAM support
Date: Thu, 13 Dec 2018 01:00:26 -0800
Message-ID: <154469162632.19322.13092710881803732022@swboyd.mtv.corp.google.com>
References: <20181123141831.8214-1-miquel.raynal@bootlin.com> <1999610.6DN9RK2Tt3@aspire.rjw.lan> <20181204094558.GA24588@e107981-ln.cambridge.arm.com> <1966692.fVZYlVgWHv@aspire.rjw.lan> <20181211141627.GA526@e107981-ln.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211141627.GA526@e107981-ln.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, sudeep.holla@arm.com, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>
List-Id: devicetree@vger.kernel.org

Quoting Lorenzo Pieralisi (2018-12-11 06:16:27)
> On Tue, Dec 04, 2018 at 10:42:19PM +0100, Rafael J. Wysocki wrote:
> > On Tuesday, December 4, 2018 10:45:58 AM CET Lorenzo Pieralisi wrote:
> > > On Mon, Dec 03, 2018 at 11:00:20PM +0100, Rafael J. Wysocki wrote:
> > > > On Monday, December 3, 2018 4:38:46 PM CET Miquel Raynal wrote:
> > >=20
> > > I did not ask my question (that may be silly) properly apologies. I k=
now
> > > that the S2R context allows sleeping the question is, in case
> > > clk_disable_unprepare() (and resume counterparts) sleeps,
> >=20
> > If it just sleeps, then this is not a problem, but if it actually *wait=
s*
> > for something meaningful to happen (which I guess is what you really me=
an),
> > then things may go awry.
> >=20
> > > what is going to wake it up, given that we are in the S2R NOIRQ phase=
 and as
> > > you said the action handlers (that are possibly required to wake up t=
he eg
> > > clk_disable_unprepare() caller) are disabled (unless, AFAIK,
> > > IRQF_NO_SUSPEND is passed at IRQ request time in the respective drive=
r).
> >=20
> > So if it waits for an action handler to do something and wake it up, it=
 may
> > very well deadlock.  I have no idea if that really happens, though.
> >=20
> > > The clk API implementations back-ends are beyond my depth, I just wan=
ted
> > > to make sure I understand how the S2R flow is expected to work in this
> > > specific case.
> >=20
> > Action handlers won't run unless the IRQs are marked as IRQF_NO_SUSPEND
> > (well, there are a few more complications I don't recall exactly, but
> > that's the basic rule).  If anything depends on them to run, it will bl=
ock.
>=20
> Stephen, any comments on this ?

Sorry I seemed to miss this email. BTW, what is an "action handler"
here? The IRQ action handler?

> I would like to understand if it is safe
> to call a clk_*unprepare/prepare_* function (that may have a blocking
> back-end waiting on a wake-up event triggered by an IRQ action) in the
> suspend/resume NOIRQ phase.

Does this ever occur in practice? I imagine "blocking back-end waiting
on a wake-up event" would be some sort of i2c or SPI based "slow" clk
that is prepared/unprepared in the NOIRQ phase of suspend/resume? So
that function call into the clk API fails because the i2c or SPI
controller used to toggle the clk on/off state relies on the
controller's IRQ to manage the transaction over the bus but that IRQ is
disabled. I suppose this is possible but I've never heard of it
happening in practice. Do you have such a scenario?

>=20
> It is not clear how the unprepare/prepare() callers can possibly know
> whether it is safe to block at that stage given that IRQ actions are
> suspended and the wake-up may never trigger.
>=20

Is this solved in other situations somehow? I don't think clk consumers
have any idea that things are safe or not safe to use in the NOIRQ phase
of suspend, but I also don't see how clks are special here. Any provider
consumer pattern would fall into the same trap, but maybe clks are the
first ones to get here.

It seems like a larger problem with NOIRQ suspend in general and how it
is too coarse of a solution for suspend ordering of devices. It's not
like we need *all* device interrupts to be disabled to do something in
suspend with one particular device. Most likely, we just need the device
and all it's children to be suspended and this device to have it's IRQ
disabled for the NOIRQ suspend callback to work. (Maybe any devices it's
supplying with device links too?)

If that's really the case, then I can see how one device and it's
children are suspended and the irq for it is disabled but the providing
devices (clk, regulator, bus controller, etc.) are still fully active
and not suspended but in fact completely usable and able to service
interrupts. If that all makes sense, then I would answer the question
with a definitive "yes it's all fine" because the clk consumer could be
in the NOIRQ phase of its suspend but the clk provider wouldn't have
even started suspending yet when clk_disable_unprepare() is called.
