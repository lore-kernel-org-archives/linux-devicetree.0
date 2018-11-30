From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 00/12] Bring suspend to RAM support to PCIe Aardvark
 driver
Date: Fri, 30 Nov 2018 14:12:10 +0100
Message-ID: <20181130141210.2eba2eed@xps13>
References: <20181123141831.8214-1-miquel.raynal@bootlin.com>
        <CAErSpo6WLc-OHGgGJdxVTrKwnPud+Kqpuswiz1zo7Yd8ruihEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAErSpo6WLc-OHGgGJdxVTrKwnPud+Kqpuswiz1zo7Yd8ruihEg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: gregory.clement@bootlin.com, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, thomas.petazzoni@bootlin.com, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>, antoine.tenart@bootlin.com, maxime.chevallier@bootlin.com, Nadav Haklai <nadavh@marvell.com>
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

As you probably noticed already, I added you to the thread modifying
the A3700 periph clock driver, we have concerns about the PCIe
specificities.

Bjorn Helgaas <bhelgaas@google.com> wrote on Mon, 26 Nov 2018 08:50:51
-0600:

> On Fri, Nov 23, 2018 at 8:18 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >
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
> > see [1].
> >
> > Patch 5 adds suspend/resume hooks, re-using all the above.
> >
> > Finally, bindings and device trees are updated to reflect the hardware
> > (patch 6-12). While the clock depends on the SoC, the reset GPIO and
> > the PHY depends on the board so the clock is added in the
> > armada-37xx.dtsi file while the two other properties are added in
> > armada-3720-espressobin.dts.
> >
> > [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2018-November/614527.html
> >
> > Thanks,
> > Miquèl
> >
> >
> > Miquel Raynal (12):
> >   PCI: aardvark: configure more registers in the configuration helper
> >   PCI: aardvark: add reset GPIO support
> >   PCI: aardvark: add PHY support
> >   PCI: aardvark: add clock support
> >   PCI: aardvark: add suspend to RAM support
> >   dt-bindings: PCI: aardvark: describe the reset-gpios property
> >   dt-bindings: PCI: aardvark: describe the clocks property
> >   dt-bindings: PCI: aardvark: describe the PHY property
> >   ARM64: dts: marvell: armada-37xx: declare PCIe reset pin
> >   ARM64: dts: marvell: armada-3720-espressobin: declare PCIe reset GPIO
> >   ARM64: dts: marvell: armada-37xx: declare PCIe clock
> >   ARM64: dts: marvell: armada-3720-espressobin: declare PCIe PHY  
> 
> Hi Miquèl,
> 
> Thanks for your work!  If/when you post a v2, please run "git log
> --oneline" and adjust your subject lines to match the capitalization
> conventions, i.e., for PCI, start the description with a capital
> letter: "PCI: aardvark: Add suspend to RAM support".
> 

Hum sorry, I noticed the upper case "PCI:" but I missed the other
capitalization. I had no review yet but I'll certainly send a v2 with
this fixed.

> BTW, I notice you closed your email with "Miquèl", but the patches
> contain "Miquel".  you *should* be able to use the correctly accented
> version of your name in the Signed-off-by lines.  I have tripped over
> some tool issues, but if we pay attention, we should be able to get it
> to work.

Indeed, I'm surprised that you noticed it! Even in France where éèàï
are quite common I very often get my first name screwed so I gave
up two years ago and decided to switch to ascii-only characters in my
'digital' life. Now it's harder to switch again, for example git log
--author would not recognize "Miquèl" and "Miquel" to be the same
person...

> 
> >  .../devicetree/bindings/pci/aardvark-pci.txt  |   9 +
> >  .../dts/marvell/armada-3720-espressobin.dts   |   4 +
> >  arch/arm64/boot/dts/marvell/armada-37xx.dtsi  |   5 +
> >  drivers/pci/controller/pci-aardvark.c         | 214 ++++++++++++++++++
> >  4 files changed, 232 insertions(+)
> >
> > --
> > 2.19.1
> >  


Thanks,
Miquèl
