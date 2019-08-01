From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 4/4] net: ftgmac100: Select ASPEED MDIO
 driver for the AST2600
Date: Thu, 1 Aug 2019 05:56:27 +0200
Message-ID: <20190801035627.GI2713@lunn.ch>
References: <20190731053959.16293-1-andrew@aj.id.au>
 <20190731053959.16293-5-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190731053959.16293-5-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: netdev@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, f.fainelli@gmail.com, hkallweit1@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 31, 2019 at 03:09:59PM +0930, Andrew Jeffery wrote:
> Ensures we can talk to a PHY via MDIO on the AST2600, as the MDIO
> controller is now separate from the MAC.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
