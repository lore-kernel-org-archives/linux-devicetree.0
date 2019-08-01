From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 3/4] net: ftgmac100: Add support for DT
 phy-handle property
Date: Thu, 1 Aug 2019 05:55:49 +0200
Message-ID: <20190801035549.GH2713@lunn.ch>
References: <20190731053959.16293-1-andrew@aj.id.au>
 <20190731053959.16293-4-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190731053959.16293-4-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: netdev@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, f.fainelli@gmail.com, hkallweit1@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 31, 2019 at 03:09:58PM +0930, Andrew Jeffery wrote:
> phy-handle is necessary for the AST2600 which separates the MDIO
> controllers from the MAC.
> 
> I've tried to minimise the intrusion of supporting the AST2600 to the
> FTGMAC100 by leaving in place the existing MDIO support for the embedded
> MDIO interface. The AST2400 and AST2500 continue to be supported this
> way, as it avoids breaking/reworking existing devicetrees.
> 
> The AST2600 support by contrast requires the presence of the phy-handle
> property in the MAC devicetree node to specify the appropriate PHY to
> associate with the MAC. In the event that someone wants to specify the
> MDIO bus topology under the MAC node on an AST2400 or AST2500, the
> current auto-probe approach is done conditional on the absence of an
> "mdio" child node of the MAC.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
