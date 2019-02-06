From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next 5/6] net: marvell: neta: add comphy support
Date: Wed, 6 Feb 2019 17:23:17 +0000
Message-ID: <20190206172316.olapzjsv7e3jr3nv@shell.armlinux.org.uk>
References: <20190206113409.ko7lwuv5kb7l7rjo@shell.armlinux.org.uk>
 <E1grLTv-00061v-Tw@rmk-PC.armlinux.org.uk>
 <20190206160928.56fb4808@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190206160928.56fb4808@bootlin.com>
Sender: netdev-owner@vger.kernel.org
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Kishon Vijay Abraham I <kishon@ti.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 06, 2019 at 04:09:28PM +0100, Maxime Chevallier wrote:
> Hello Russell,
> 
> On Wed, 06 Feb 2019 11:35:07 +0000
> Russell King <rmk+kernel@armlinux.org.uk> wrote:
> 
> 
> >+	if (pp->comphy) {
> >+		enum phy_mode mode = PHY_MODE_INVALID;
> >+
> >+		switch (state->interface) {
> >+		case PHY_INTERFACE_MODE_SGMII:
> >+		case PHY_INTERFACE_MODE_1000BASEX:
> >+			mode = PHY_MODE_SGMII;
> 
> PHY_MODE_SGMII no longer exists, the new PHY_MODE_ETHERNET must be used
> with the correct submode now, so this doesn't build unfortunately.
> 
> >+			break;
> >+		case PHY_INTERFACE_MODE_2500BASEX:
> >+			mode = PHY_MODE_2500SGMII;
> 
> Same here.

Of course, I knew there was some reason I hadn't sent them yet... thanks
for spotting.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
