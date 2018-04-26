From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 2/7] net: mscc: Add MDIO driver
Date: Thu, 26 Apr 2018 22:46:03 +0200
Message-ID: <20180426204603.GC23481@lunn.ch>
References: <20180426195931.5393-1-alexandre.belloni@bootlin.com>
 <20180426195931.5393-3-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180426195931.5393-3-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "David S . Miller" <davem@davemloft.net>, Allan Nielsen <Allan.Nielsen@microsemi.com>, razvan.stefanescu@nxp.com, po.liu@nxp.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 26, 2018 at 09:59:26PM +0200, Alexandre Belloni wrote:
> Add a driver for the Microsemi MII Management controller (MIIM) found on
> Microsemi SoCs.
> On Ocelot, there are two controllers, one is connected to the internal
> PHYs, the other one can communicate with external PHYs.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
