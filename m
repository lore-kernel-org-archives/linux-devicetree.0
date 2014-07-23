From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/2] Added dts defintion for Lenovo ix4-300d nas
Date: Wed, 23 Jul 2014 18:49:58 +0200
Message-ID: <20140723164958.GH2856@lunn.ch>
References: <1406117232-5962-1-git-send-email-yahoo@perenite.com>
 <20140723134534.GF23220@titan.lakedaemon.net>
 <20140723141443.GC2856@lunn.ch>
 <47823826-CDE8-47D2-B1B6-B688118CF985@perenite.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47823826-CDE8-47D2-B1B6-B688118CF985@perenite.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Masson <benoitm@perenite.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, benoitm974 <yahoo@perenite.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@googlemail.com>
List-Id: devicetree@vger.kernel.org

> Well actually the PHY need to be initialized (at least 1 mII reg
> written), which from marvel LSP driver always occurs, while it
> doesn't with mainline PHY driver (drivers/net/phy/marvell.c), so the
> only simple way I found to have at least one PHY reg on both
> interface written is to have both eth up at OS config level.

Thanks for the information. This sounds like a wake on LAN feature.
I've seen other Marvell hardware connect a PHY LED output pin to the
circuit controlling the main power supply. When the PHY detects the
magic wake-up packet, it 'blinks' the LED so turning the power back
on.

My guess is, the register write to the PHY is configuring the LED. Do
you have the datasheet for the PHY? Can you check this?

> Probably the best option would be to have a reg-init = <reg offset
> value> on both phy dts definition but the current armada mii doesn't
> support this dts config...

Once we understand what is going on here, we can consider adding
support for this.

	Andrew
