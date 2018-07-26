From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 5/7] net: phy: Add support to configure clock in Broadcom
 iProc mdio mux
Date: Thu, 26 Jul 2018 21:26:51 +0200
Message-ID: <20180726192651.GK10686@lunn.ch>
References: <1532630184-29450-1-git-send-email-arun.parameswaran@broadcom.com>
 <1532630184-29450-6-git-send-email-arun.parameswaran@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1532630184-29450-6-git-send-email-arun.parameswaran@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arun Parameswaran <arun.parameswaran@broadcom.com>
Cc: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

> +static void mdio_mux_iproc_config_clk(struct iproc_mdiomux_desc *md)
> +{
> +	u32 val;
> +	u32 divisor;
> +
> +	if (md->core_clk) {
> +		divisor = clk_get_rate(md->core_clk) / MDIO_OPERATING_FREQUENCY;

/**
 * clk_get_rate - obtain the current clock rate (in Hz) for a clock source.
 * 		  This is only valid once the clock source has been enabled.
 * @clk: clock source
 */
unsigned long clk_get_rate(struct clk *clk);

It is generally good practice to call clk_prepare_enable() sometime
before clk_get_rate() to ensure the clock is ticking, and to show this
driver is making use of the clock, so it does not get turned off.

> +		divisor = divisor / (MDIO_RATE_ADJ_DIVIDENT + 1);
> +		val = divisor;
> +		val |= MDIO_RATE_ADJ_DIVIDENT << MDIO_RATE_ADJ_DIVIDENT_SHIFT;
> +		writel(val, md->base + MDIO_RATE_ADJ_EXT_OFFSET);
> +		writel(val, md->base + MDIO_RATE_ADJ_INT_OFFSET);
> +	}
> +}
