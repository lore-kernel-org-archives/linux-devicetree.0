From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next 5/6] net: marvell: neta: add comphy support
Date: Wed, 6 Feb 2019 16:09:28 +0100
Message-ID: <20190206160928.56fb4808@bootlin.com>
References: <20190206113409.ko7lwuv5kb7l7rjo@shell.armlinux.org.uk>
        <E1grLTv-00061v-Tw@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <E1grLTv-00061v-Tw@rmk-PC.armlinux.org.uk>
Sender: netdev-owner@vger.kernel.org
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Kishon Vijay Abraham I <kishon@ti.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

Hello Russell,

On Wed, 06 Feb 2019 11:35:07 +0000
Russell King <rmk+kernel@armlinux.org.uk> wrote:


>+	if (pp->comphy) {
>+		enum phy_mode mode = PHY_MODE_INVALID;
>+
>+		switch (state->interface) {
>+		case PHY_INTERFACE_MODE_SGMII:
>+		case PHY_INTERFACE_MODE_1000BASEX:
>+			mode = PHY_MODE_SGMII;

PHY_MODE_SGMII no longer exists, the new PHY_MODE_ETHERNET must be used
with the correct submode now, so this doesn't build unfortunately.

>+			break;
>+		case PHY_INTERFACE_MODE_2500BASEX:
>+			mode = PHY_MODE_2500SGMII;

Same here.

Thanks,

Maxime
