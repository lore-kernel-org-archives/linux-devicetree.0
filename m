From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 05/12] PCI: aardvark: add suspend to RAM support
Date: Mon, 3 Dec 2018 16:38:46 +0100
Message-ID: <20181203163846.494904f9@xps13>
References: <20181123141831.8214-1-miquel.raynal@bootlin.com>
        <20181123141831.8214-6-miquel.raynal@bootlin.com>
        <20181203102708.GA6090@e107981-ln.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203102708.GA6090@e107981-ln.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, sudeep.holla@arm.com, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>
List-Id: devicetree@vger.kernel.org

Hi Lorenzo,

Lorenzo Pieralisi <lorenzo.pieralisi@arm.com> wrote on Mon, 3 Dec 2018
10:27:08 +0000:

> [+Rafael, Sudeep]
> 
> On Fri, Nov 23, 2018 at 03:18:24PM +0100, Miquel Raynal wrote:
> > Add suspend and resume callbacks. The priority of these are
> > "_noirq()", to workaround early access to the registers done by the
> > PCI core through the ->read()/->write() callbacks at resume time.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  drivers/pci/controller/pci-aardvark.c | 52 +++++++++++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
> > index 108b3f15c410..7ecf1ac4036b 100644
> > --- a/drivers/pci/controller/pci-aardvark.c
> > +++ b/drivers/pci/controller/pci-aardvark.c
> > @@ -1108,6 +1108,55 @@ static int advk_pcie_setup_clk(struct advk_pcie *pcie)
> >  	return ret;
> >  }
> >  
> > +static int __maybe_unused advk_pcie_suspend(struct device *dev)
> > +{
> > +	struct advk_pcie *pcie = dev_get_drvdata(dev);
> > +
> > +	advk_pcie_disable_phy(pcie);
> > +
> > +	clk_disable_unprepare(pcie->clk);  
> 
> I have noticed it is common practice, still, I would like to check whether
> it is allowed to call functions that may sleep in a NOIRQ suspend/resume
> callback ?

You are right this is weird. I double checked and for instance,
pcie-mediatek.c, pci-tegra.c and pci-imx6.c do the exact same thing. There are
probably other cases where drivers call functions that may sleep from a NOIRQ
context. I am interested to know if this is valid and if not, what is the
alternative?


Thanks,
Miquèl
