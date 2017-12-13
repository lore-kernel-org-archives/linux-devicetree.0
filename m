From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] of_mdio / mdiobus: ensure mdio devices have fwnode
 correctly populated
Date: Wed, 13 Dec 2017 18:15:46 +0100
Message-ID: <20171213171546.GI28466@lunn.ch>
References: <E1eOi7f-0002Rs-K7@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E1eOi7f-0002Rs-K7@rmk-PC.armlinux.org.uk>
Sender: netdev-owner@vger.kernel.org
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 12, 2017 at 10:49:15AM +0000, Russell King wrote:
> Ensure that all mdio devices populate the struct device fwnode pointer
> as well as the of_node pointer to allow drivers that wish to use
> fwnode APIs to work.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
