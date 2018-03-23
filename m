From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 6/8] MIPS: mscc: Add switch to ocelot
Date: Fri, 23 Mar 2018 23:06:57 +0100
Message-ID: <20180323220657.GY24361@lunn.ch>
References: <20180323201117.8416-1-alexandre.belloni@bootlin.com>
 <20180323201117.8416-7-alexandre.belloni@bootlin.com>
 <e488fd29-0094-d005-a078-873f6f5add13@gmail.com>
 <20180323212230.GA12808@piout.net>
 <20180323213344.GV24361@lunn.ch>
 <dcac43b7-2eb7-d409-a77c-4f671a8cfc3d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dcac43b7-2eb7-d409-a77c-4f671a8cfc3d@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, "David S . Miller" <davem@davemloft.net>, Allan Nielsen <Allan.Nielsen@microsemi.com>, razvan.stefanescu@nxp.com, po.liu@nxp.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, James Hogan <jhogan@kernel.org>
List-Id: devicetree@vger.kernel.org

> > That is the trade off of having a standalone MDIO bus driver.  Maybe
> > add a phandle to the internal MDIO bus? The switch driver could then
> > follow the phandle, and direct connect the internal PHYs?
> 
> This is more or less what patch 7 does, right?

Patch 7 does it in DT. I'm suggesting it could be done in C. It is
hard wired, so there is no need to describe it in DT. Use the phandle
to get the mdio bus, mdiobus_get_phy(, port) to get the phydev and
then use phy_connect().

     Andrew
