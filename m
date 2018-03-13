Return-Path: <SRS0=NcRe=GD=ni.com=prvs=261051e907=brad.mouring@kernel.org>
Date: Tue, 13 Mar 2018 08:49:18 -0500
From: Brad Mouring <brad.mouring@ni.com>
Subject: Re: [PATCH v4 net-next 3/4] net: macb: Add phy-handle DT support
Message-ID: <20180313134918.GA118871@artie.amer.corp.natinst.com>
References: <20180312175956.GS27783@lunn.ch>
 <20180312213435.115174-1-brad.mouring@ni.com>
 <20180312213435.115174-4-brad.mouring@ni.com> <20180312215738.GA3674@lunn.ch>
 <88aa8148-bf57-86a0-8f0d-fae7191865a6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <88aa8148-bf57-86a0-8f0d-fae7191865a6@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>, Michael Grzeschik <m.grzeschik@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, Julia Cartwright <julia@ni.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Mar 12, 2018 at 03:30:53PM -0700, Florian Fainelli wrote:
> On 03/12/2018 02:57 PM, Andrew Lunn wrote:
> >> +			/* attempt to find a phy-handle */
> >> +			if (!(bp->phy_node = of_parse_phandle(np, "phy-handle", 0))) {
> >> +
> >> +				/* fallback to standard phy registration if no phy were
> >> +				 * found during dt phy registration
> >> +				 */
> >> +				if (!phy_find_first(bp->mii_bus)) {
> >> +					for (i = 0; i < PHY_MAX_ADDR; i++) {
> >> +						struct phy_device *phydev;
> >> +	
> >> +						phydev = mdiobus_scan(bp->mii_bus, i);
> >> +						if (IS_ERR(phydev) &&
> >> +						    PTR_ERR(phydev) != -ENODEV) {
> >> +							ret = PTR_ERR(phydev);
> >> +							break;
> >> +						}
> > 
> > Hi Brad
> 
> I would be a bit relaxed on these warnings because the existing function
> indentation really makes it easy to be over 80 columns. Unless you have
> a preliminary patch which, as I was suggesting earlier, re-arranges the
> branches such that if (!np) is the first thing you test, I don't see how
> this can look any better...

I'll try to work this a bit more, thanks for the feedback and the
patience.

-- 
Brad
