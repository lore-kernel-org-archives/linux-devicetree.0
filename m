From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 05/12] PCI: aardvark: add suspend to RAM support
Date: Mon, 17 Dec 2018 15:54:26 +0100
Message-ID: <20181217155426.71058a03@xps13>
References: <20181123141831.8214-1-miquel.raynal@bootlin.com>
        <20181213105302.GA5330@e107981-ln.cambridge.arm.com>
        <20181213153000.245d7d5f@xps13>
        <61805564.abKDZ2rVK7@aspire.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <61805564.abKDZ2rVK7@aspire.rjw.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Stephen Boyd <sboyd@kernel.org>, sudeep.holla@arm.com, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>
List-Id: devicetree@vger.kernel.org

Hi Rafael,

"Rafael J. Wysocki" <rjw@rjwysocki.net> wrote on Thu, 13 Dec 2018
22:50:51 +0100:

> On Thursday, December 13, 2018 3:30:00 PM CET Miquel Raynal wrote:
> > Hi Lorenzo,
> >   
> > > > If that's really the case, then I can see how one device and it's
> > > > children are suspended and the irq for it is disabled but the providing
> > > > devices (clk, regulator, bus controller, etc.) are still fully active
> > > > and not suspended but in fact completely usable and able to service
> > > > interrupts. If that all makes sense, then I would answer the question
> > > > with a definitive "yes it's all fine" because the clk consumer could be
> > > > in the NOIRQ phase of its suspend but the clk provider wouldn't have
> > > > even started suspending yet when clk_disable_unprepare() is called.    
> > > 
> > > That's a very good summary and address my concern, I still question this
> > > patch correctness (and many others that carry out clk operations in S2R
> > > NOIRQ phase), they may work but do not tell me they are rock solid given
> > > your accurate summary above.  
> > 
> > I understand your concern but I don't see any alternative right now
> > and a deep rework of the PM core to respect such dependency is not
> > something that can be done in a reasonable amount of time.  
> 
> Maybe you don't need to rework anything. :-)
> 
> Have you considered using device links?

Absolutely, yes :) I am actively working on it in parallel, you can
check the third version there [1]. Stephen Boyd has a slightly
different idea of how it should be done, I will propose a v4 this week,
I can add you in copy if you are interested!

Anyway, there is one thing that is still missing:
* Let's have device A that requests clock B
* With the device link series, A is linked (as a child) to B.
* A suspend/resume hooks handle things in the NOIRQ phase.
* B suspend/resume hooks handle things in the default phase.

What I expected during a suspend:
1/ ->suspend_noirq(device A)
2/ ->suspend(clock B)

Unfortunately, device links do not seem to enforce any priority between
phases (default/late/noirq) and what happens is:
1/ ->suspend(B)
2/ ->suspend_noirq(A)
Which has no sense in my case. Hence, I had to request the clock
suspend/resume callbacks to be upgraded to the NOIRQ phase as well (I
don't have a better solution for now). This is still under discussion
in a thread you have been recently added to by Bjorn, see [2].

So when I told you I was not confident in "reworking the PM core to
respect such dependency", this is what I was referring to. I am
definitely ready to help, but I don't feel I can do it alone.

[1] https://www.spinics.net/lists/linux-clk/msg32824.html
[2] https://marc.info/?l=linux-pm&m=154465198510735&w=2


Thanks,
Miquèl
