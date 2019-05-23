From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/2] net: macb: Add support for SiFive FU540-C000
Date: Thu, 23 May 2019 16:54:17 +0200
Message-ID: <20190523145417.GD19369@lunn.ch>
References: <1558611952-13295-1-git-send-email-yash.shah@sifive.com>
 <1558611952-13295-3-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558611952-13295-3-git-send-email-yash.shah@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yash Shah <yash.shah@sifive.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, nicolas.ferre@microchip.com, palmer@sifive.com, aou@eecs.berkeley.edu, ynezz@true.cz, paul.walmsley@sifive.com, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org

> +static int fu540_macb_tx_set_rate(struct clk_hw *hw, unsigned long rate,
> +				  unsigned long parent_rate)
> +{
> +	rate = fu540_macb_tx_round_rate(hw, rate, &parent_rate);
> +	iowrite32(rate != 125000000, mgmt->reg);

That looks odd. Writing the result of a comparison to a register?

     Andrew
