From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 3/3] enetc: Add ENETC PF level external MDIO
 support
Date: Fri, 15 Feb 2019 15:56:21 +0100
Message-ID: <20190215145621.GO708@lunn.ch>
References: <1550225414-12125-1-git-send-email-claudiu.manoil@nxp.com>
 <1550225414-12125-4-git-send-email-claudiu.manoil@nxp.com>
 <20190215133459.GH5699@lunn.ch>
 <VI1PR04MB488080895C871B6B3ABA571D96600@VI1PR04MB4880.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <VI1PR04MB488080895C871B6B3ABA571D96600@VI1PR04MB4880.eurprd04.prod.outlook.com>
Sender: netdev-owner@vger.kernel.org
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "David S . Miller" <davem@davemloft.net>, Alexandru Marginean <alexandru.marginean@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> Hi,
> I don't really see what bindings would need to be documented, as the node
> names and properties used so far are common.  Like, the "mdio" node name
> is common, the enetc ports are "pci" nodes, nothing special for these.
> What's missing?

Hi Claudiu

It is not well defined where to put phy nodes. Some drivers do allow
them directly in the MAC node, some drivers optionally allow an mdio
sub-node, others enforce an mdio sub-node. The name of the sub-node is
also not well defined.

So just documenting that the mdio sub-node is mandatory will help
people writing device trees for their boards.

       Andrew
