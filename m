From: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Subject: Re: [PATCH] of_net: add mtd-mac-address support to
 of_get_mac_address()
Date: Wed, 17 Apr 2019 14:10:44 +0200
Message-ID: <20190417121044.GC79403@meh.true.cz>
References: <1555445100-30936-1-git-send-email-ynezz@true.cz>
 <20190417080614.edt25ynuvae5fn64@flea>
 <20190417094921.GB79403@meh.true.cz>
 <20190417101557.6jicrn56dqaccxar@flea>
Reply-To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190417101557.6jicrn56dqaccxar@flea>
Sender: netdev-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Frank Rowand <frowand.list@gmail.com>, John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
List-Id: devicetree@vger.kernel.org

Maxime Ripard <maxime.ripard@bootlin.com> [2019-04-17 12:15:57]:

> https://elixir.bootlin.com/linux/latest/source/net/ethernet/eth.c#L564

Thanks, so if I parse those 2 use cases of nvmem_get_mac_address correctly:

 drivers/net/ethernet/cadence/macb_main.c:  err = nvmem_get_mac_address(&pdev->dev, bp->dev->dev_addr);
 drivers/net/ethernet/ti/davinci_emac.c:    rc = nvmem_get_mac_address(&pdev->dev, priv->mac_addr);

We would need to spill `nvmem_get_mac_address` into every single driver on
earth (as it's done now in those two drivers I've mentioned above) which would
like to use MAC address stored in NVME or wire `nvmem_get_mac_address` into
`of_get_mac_address`, right?

-- ynezz
