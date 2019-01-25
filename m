From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 00/15] Bring suspend to RAM support to PCIe Aardvark
 driver
Date: Fri, 25 Jan 2019 11:05:30 +0100
Message-ID: <20190125110530.0ff11a54@xps13>
References: <20190108162441.5278-1-miquel.raynal@bootlin.com>
        <20190123170509.GB1157@e107981-ln.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123170509.GB1157@e107981-ln.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>
List-Id: devicetree@vger.kernel.org

Hi Lorenzo,

Lorenzo Pieralisi <lorenzo.pieralisi@arm.com> wrote on Wed, 23 Jan 2019
17:05:09 +0000:

> On Tue, Jan 08, 2019 at 05:24:25PM +0100, Miquel Raynal wrote:
> > Hello,
> > 
> > As part of an effort to bring suspend to RAM support to Armada 3700
> > SoCs (main target: ESPRESSObin), this series handles the work around
> > the PCIe IP.
> > 
> > First, more configuration is done in the 'setup' helper as inspired
> > from the U-Boot driver. This is needed to entirely initialize the IP
> > during future resume operation (patch 1).
> > 
> > Then, reset GPIO, PHY and clock support are introduced (patch 2-4). As
> > current device trees do not provide the corresponding properties, not
> > finding one of these properties is not an error and just produces a
> > warning. However, if the property is present, an error during PHY
> > initialization will fail the probe of the driver.
> > 
> > Note: To be sure the clock will be resumed before this driver, a first
> > series adding links between clocks and consumers has been submitted,
> > see [1]. Anyway, having the clock series applied first is not needed.  
> 
> I do not understand what this means, in particular in relation
> to the blocking clock calls in the suspend/resume NOIRQ hooks.

I am not sure to understand your question.

As there are multiple points in this sentence I will detail each of
them so please comment on the one which is bothering you:
* I am working in parallel on a series adding device links to the clock
  framework. This way when a driver consumes a clock, the clock
  provider driver will be resumed first.
* If the clock series I am talking about is applied after this one,
  there is no build issue. Of course suspending the platform may
  not work but this is a new feature so nothing will be broken.
* Device links do not enforce any priority if the suspend/resume phase
  between two drivers is not the same. The PCIe driver suspends in the
  NOIRQ phase. If we want the clock driver to suspend *after* PCIe, its
  suspend/resume callbacks must be promoted to the NOIRQ phase as well
  (and this is part of another series). As of today there is
  no alternative.


Thanks,
Miquèl
