From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH 05/12] PCI: aardvark: add suspend to RAM support
Date: Thu, 13 Dec 2018 22:50:51 +0100
Message-ID: <61805564.abKDZ2rVK7@aspire.rjw.lan>
References: <20181123141831.8214-1-miquel.raynal@bootlin.com> <20181213105302.GA5330@e107981-ln.cambridge.arm.com> <20181213153000.245d7d5f@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181213153000.245d7d5f@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Stephen Boyd <sboyd@kernel.org>, sudeep.holla@arm.com, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>
List-Id: devicetree@vger.kernel.org

On Thursday, December 13, 2018 3:30:00 PM CET Miquel Raynal wrote:
> Hi Lorenzo,
> 
> > > If that's really the case, then I can see how one device and it's
> > > children are suspended and the irq for it is disabled but the providing
> > > devices (clk, regulator, bus controller, etc.) are still fully active
> > > and not suspended but in fact completely usable and able to service
> > > interrupts. If that all makes sense, then I would answer the question
> > > with a definitive "yes it's all fine" because the clk consumer could be
> > > in the NOIRQ phase of its suspend but the clk provider wouldn't have
> > > even started suspending yet when clk_disable_unprepare() is called.  
> > 
> > That's a very good summary and address my concern, I still question this
> > patch correctness (and many others that carry out clk operations in S2R
> > NOIRQ phase), they may work but do not tell me they are rock solid given
> > your accurate summary above.
> 
> I understand your concern but I don't see any alternative right now
> and a deep rework of the PM core to respect such dependency is not
> something that can be done in a reasonable amount of time.

Maybe you don't need to rework anything. :-)

Have you considered using device links?

Thanks,
Rafael
