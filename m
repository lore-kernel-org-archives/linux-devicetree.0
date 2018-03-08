From: Brad Mouring <brad.mouring@ni.com>
Subject: Re: [1/2] net: macb: Add phy-handle DT support
Date: Thu, 8 Mar 2018 16:00:45 -0600
Message-ID: <20180308220045.GA57508@artie.amer.corp.natinst.com>
References: <20180307224257.1959-1-brad.mouring@ni.com>
 <20180308173247.GA22340@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180308173247.GA22340@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>, Michael Grzeschik <m.grzeschik@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, Julia Cartwright <julia@ni.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 08, 2018 at 06:32:47PM +0100, Andrew Lunn wrote:
> On Wed, Mar 07, 2018 at 04:42:56PM -0600, Brad Mouring wrote:
> > This optional binding (as described in the ethernet DT bindings doc)
> > directs the netdev to the phydev to use. This is useful for a phy
> > chip that has >1 phy in it, and two netdevs are using the same phy
> > chip (i.e. the second mac's phy lives on the first mac's MDIO bus)
> > ...
> Hi Brad
> 
> I think it is more logical to do this in macb_mii_probe().
> 
> I would probably also move the fixed_link code from macb_mii_init() to
> macb_mii_probe(). I would probably also move the fallback to standard
> phy registration. Make macb_mii_init() about registering the MDIO bus,
> and macb_mii_probe() about probing the MDIO bus to find the PHY to
> use. At the moment, it is all rather mixed up.
> 
>      Andrew

Hi Andrew

That makes sense, I'll rework and resend. Thanks for the suggestion.

Brad
