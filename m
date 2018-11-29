From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH 2/6] phy: add A3700 COMPHY support
Date: Thu, 29 Nov 2018 16:16:43 +0000
Message-ID: <20181129161643.GZ30658@n2100.armlinux.org.uk>
References: <20181122210420.14861-1-miquel.raynal@bootlin.com>
 <20181122210420.14861-3-miquel.raynal@bootlin.com>
 <20181129171245.4f683045@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181129171245.4f683045@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Grzegorz Jaszczyk <jaz@semihalf.com>, linux-kernel@vger.kernel.org, Evan Wang <xswang@marvell.com>, "Nadav Haklai (Marvell)" <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Marcin Wojtas <mw@semihalf.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 29, 2018 at 05:12:45PM +0100, Miquel Raynal wrote:
> Hello,
> 
> Miquel Raynal <miquel.raynal@bootlin.com> wrote on Thu, 22 Nov 2018
> 22:04:16 +0100:
> > +static struct phy *mvebu_a3700_comphy_xlate(struct device *dev,
> > +					    struct of_phandle_args *args)
> > +{
> > +	struct mvebu_a3700_comphy_lane *lane;
> > +	struct phy *phy;
> > +
> > +	if (WARN_ON(args->args[0] >= MVEBU_A3700_COMPHY_PORTS))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	phy = of_phy_simple_xlate(dev, args);
> > +	if (IS_ERR(phy))
> > +		return phy;
> > +
> > +	lane = phy_get_drvdata(phy);
> > +	if (lane->port >= 0)
> > +		return ERR_PTR(-EBUSY);
> 
> This is not valid. It works only the first time the consumer gets
> a PHY for this lane. If the consumer put the PHY (module is unloaded)
> and then gets the PHY again (module is re-loaded a second time), the
> port is already set to != -1 and this will exit with an error and
> prevent the module to probe.
> 
> > +
> > +	lane->port = args->args[0];
> 
> I will remove the above check and transform it into a valid "port"
> value right here.

Please note that mvebu_comphy_xlate() in
drivers/phy/marvell/phy-mvebu-cp110-comphy.c does exactly the same.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
