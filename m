From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 2/7] net: phy: mscc: add support for VSC8584 PHY
Date: Fri, 14 Sep 2018 15:18:46 +0200
Message-ID: <20180914131846.GG14865@lunn.ch>
References: <cover.b921b010b6d6bde1c11e69551ae38f3b2818645b.1536916714.git-series.quentin.schulz@bootlin.com>
 <a61d9affd3f1ec9deb60c882cce1daf37fbe2427.1536916714.git-series.quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a61d9affd3f1ec9deb60c882cce1daf37fbe2427.1536916714.git-series.quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, f.fainelli@gmail.com, allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com, antoine.tenart@bootlin.com
List-Id: devicetree@vger.kernel.org

> Most of the init sequence of a PHY of the package is common to all PHYs
> in the package, thus we use the SMI broadcast feature which enables us
> to propagate a write in one register of one PHY to all PHYs in the
> package.

Hi Quinten

Could you say a bit more about the broadcast. Does the SMI broadcast
go to all PHY everywhere on an MDIO bus, or only all PHYs within one
package? I'm just thinking about the case you need two of these
packages to cover 8 switch ports.

Thanks
	Andrew
