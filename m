Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181123094444.27956-3-miquel.raynal@bootlin.com>
References: <20181123094444.27956-1-miquel.raynal@bootlin.com>
 <20181123094444.27956-3-miquel.raynal@bootlin.com>
Message-ID: <154353827849.88331.12767996548874447262@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 2/4] clk: mvebu: armada-37xx-periph: change suspend/resume time
Date: Thu, 29 Nov 2018 16:37:58 -0800
To: Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>
List-ID: <devicetree@vger.kernel.org>

Quoting Miquel Raynal (2018-11-23 01:44:41)
> Armada 3700 PCIe IP relies on the PCIe clock managed by this
> driver. For reasons related to the PCI core's organization when
> suspending/resuming, PCI host controller drivers must reconfigure
> their register at suspend_noirq()/resume_noirq() which happens after
> suspend()/suspend_late() and before resume_early()/resume().
> =

> Device link support in the clock framework enforce that the clock
> driver's resume() callback will be called before the PCIe
> driver's. But, any resume_noirq() callback will be called before all
> the registered resume() callbacks.

I thought any device driver that provides something to another device
driver will implicitly be probed before the driver that consumes said
resources. And we actually reorder the dpm list on probe defer so that
the order of devices is correct. Is it more that we want to parallelize
suspend/resume of the PCIe chip so we need to have device links so that
we know the dependency of the PCIe driver on the clock driver?

> =

> The solution to support PCIe resume operation is to change the
> "priority" of this clock driver PM callbacks to "_noirq()".

This seems sad that the PM core can't "priority boost" any
suspend/resume callbacks of a device that doesn't have noirq callbacks
when a device that depends on it from the device link perspective does
have noirq callbacks. And why does the PCIe device need to use noirq
callbacks in general?

I'm just saying this seems like a more fundamental problem with ordering
of provider and consumer suspend/resume functions that isn't being
solved in this patch. In fact, it's quite the opposite, this is working
around the problem.
