From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [RFC PATCH 2/6] phy: armada38x: add common phy support
Date: Thu, 15 Nov 2018 11:02:29 +0100
Message-ID: <20181115110229.45bcf903@bootlin.com>
References: <20181112122933.GD30658@n2100.armlinux.org.uk>
        <E1gMBMi-00089Q-7S@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <E1gMBMi-00089Q-7S@rmk-PC.armlinux.org.uk>
Sender: netdev-owner@vger.kernel.org
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Hi Russell,

On Mon, 12 Nov 2018 12:30:52 +0000
Russell King <rmk+kernel@armlinux.org.uk> wrote:

>Add support for the Armada 38x common phy to allow us to change the
>speed of the Ethernet serdes lane.  This driver only supports
>manipulation of the speed, it does not support configuration of the
>common phy.

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

>Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

-- 
Maxime Chevallier, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
