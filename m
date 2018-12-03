From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v2 2/8] phy: mvebu-cp110-comphy: fix port check in
 ->xlate()
Date: Mon, 3 Dec 2018 00:36:23 +0000
Message-ID: <20181203003623.GJ30658@n2100.armlinux.org.uk>
References: <20181130144743.675-1-miquel.raynal@bootlin.com>
 <20181130144743.675-3-miquel.raynal@bootlin.com>
 <20181130190031.GH30658@n2100.armlinux.org.uk>
 <20181202203509.21b067c4@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181202203509.21b067c4@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, linux-kernel@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Marcin Wojtas <mw@semihalf.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Dec 02, 2018 at 08:35:09PM +0100, Miquel Raynal wrote:
> Hi Russell,
> 
> Russell King - ARM Linux <linux@armlinux.org.uk> wrote on Fri, 30 Nov
> 2018 19:00:31 +0000:
> 
> > On Fri, Nov 30, 2018 at 03:47:37PM +0100, Miquel Raynal wrote:
> > > So far the PHY ->xlate() callback was checking if the port was
> > > "invalid" before continuing, meaning that the port has not been used
> > > yet. This check is not correct as there is no opposite call to  
> > > ->xlate() once the PHY is released by the user and the port will  
> > > remain "valid" after the first phy_get()/phy_put() calls. Hence, if
> > > this driver is built as a module, inserted, removed and inserted
> > > again, the PHY will appear busy and the second probe will fail.
> > > 
> > > To fix this, just drop the faulty check and instead verify that the
> > > port number is valid (ie. in the possible range).
> > > 
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  drivers/phy/marvell/phy-mvebu-cp110-comphy.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
> > > index 31b9a1c18345..a40b876ff214 100644
> > > --- a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
> > > +++ b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
> > > @@ -567,9 +567,9 @@ static struct phy *mvebu_comphy_xlate(struct device *dev,
> > >  		return phy;
> > >  
> > >  	lane = phy_get_drvdata(phy);
> > > -	if (lane->port >= 0)
> > > -		return ERR_PTR(-EBUSY);
> > >  	lane->port = args->args[0];
> > > +	if (lane->port >= MVEBU_COMPHY_PORTS)
> > > +		return ERR_PTR(-EINVAL);  
> > 
> > Shouldn't we validate args->args[0] before doing anything?
> > 
> 
> I don't understand your point, there is a check on args->args[0] as
> we check its value (through lane->port) right after. What do you
> have in mind?

Right, there is already a check on args->args[0] for it being greater
than MVEBU_COMPHY_PORTS and returning an error (and in fact warning
if that is the case).  So in that case, what is the use of the above
additional test you are proposing to add?  The resulting code ends up
looking like this:

	if (WARN_ON(args->args[0] >= MVEBU_COMPHY_PORTS))
		return ERR_PTR(-EINVAL);
...
	lane->port = args->args[0];
+	if (lane->port >= MVEBU_COMPHY_PORTS)
+		return ERR_PTR(-EINVAL);  

which is just silly - the second test can never be evaluated as true,
and therefore is redundant.

In any case, my point was that in your patch, where you assign
lane->port and then validate the lane->port value, this is in
principle the wrong order - the order should always be: validate
first, then make use.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
