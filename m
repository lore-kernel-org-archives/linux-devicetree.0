From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [RFC PATCH 2/6] phy: armada38x: add common phy support
Date: Mon, 12 Nov 2018 18:03:31 +0100
Message-ID: <20181112170331.GB5075@lunn.ch>
References: <20181112122933.GD30658@n2100.armlinux.org.uk>
 <E1gMBMi-00089Q-7S@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E1gMBMi-00089Q-7S@rmk-PC.armlinux.org.uk>
Sender: netdev-owner@vger.kernel.org
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
List-Id: devicetree@vger.kernel.org

> +static int a38x_comphy_poll(struct a38x_comphy_lane *lane,
> +			    unsigned int offset, u32 mask, u32 value)
> +{
> +	unsigned int timeout = 10;
> +	u32 val;
> +
> +	while (1) {
> +		val = readl_relaxed(lane->base + offset);
> +		if ((val & mask) == value)
> +			return 0;
> +		if (!timeout--)
> +			break;
> +		udelay(10);
> +	}

Hi Russell

Maybe use one of the readx_poll_timeout() variants?

      Andrew
