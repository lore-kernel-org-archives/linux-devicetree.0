From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 2/4] dt-bindings: net: qcom: Add binding for shared
 mdio bus
Date: Tue, 18 Sep 2018 14:35:45 +0200
Message-ID: <20180918123545.GA29092@lunn.ch>
References: <1537174411-34510-1-git-send-email-dongsheng.wang@hxt-semitech.com>
 <1537174411-34510-3-git-send-email-dongsheng.wang@hxt-semitech.com>
 <20180917145028.GC5458@lunn.ch>
 <b01bb33b30164088a9cae59a825acdc9@HXTBJIDCEMVIW02.hxtcorp.net>
 <13018118-9883-4b26-9017-b324d745cc58@gmail.com>
 <71ba0057c5e547c382793be899e3268a@HXTBJIDCEMVIW02.hxtcorp.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <71ba0057c5e547c382793be899e3268a@HXTBJIDCEMVIW02.hxtcorp.net>
Sender: netdev-owner@vger.kernel.org
To: "Wang, Dongsheng" <dongsheng.wang@hxt-semitech.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, "timur@kernel.org" <timur@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "Zheng, Joey" <yu.zheng@hxt-semitech.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> > If you want to describe the MDIO controller, then you embed a mdio
> > subnode into your Ethernet MAC node:
> >
> >  emac0: ethernet@feb20000 {
> > 	mdio {
> > 		#address-cells = <1>;
> > 		#size-cells = <0>;
> >
> > 		phy0: ethernet-phy@0 {
> > 			reg = <0>;
> > 		};
> > 	};
> > };
> >
> > And then each Ethernet MAC controller refers to their appropriate PHY
> > device tree node using a phy-handle property to point to either their
> > own MDIO controller, or another MAC's MDIO controller.

> Sorry, I do not understand how phy-handle point to MDIO controller,
> because phy-handle is defined to point to a phy.

The MAC driver does not care what MDIO controller a PHY is on. All you
need to do to register the PHY is:

	phy_node = of_parse_phandle(np, "phy-handle", 0);
	phy_interface = of_get_phy_mode(np);
	phydev = of_phy_connect(dev, phy_node,
                                &handle_link_change, 0,
                                phy_interface);

	Andrew
