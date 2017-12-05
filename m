From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v3 2/4] phylib: add reset after clk enable
 support
Date: Tue, 5 Dec 2017 18:34:07 +0100
Message-ID: <20171205173407.GN12805@lunn.ch>
References: <20171205132600.13796-1-dev@g0hl1n.net>
 <20171205132600.13796-3-dev@g0hl1n.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171205132600.13796-3-dev@g0hl1n.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Leitner <dev@g0hl1n.net>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, fugang.duan@nxp.com, f.fainelli@gmail.com, frowand.list@gmail.com, davem@davemloft.net, geert+renesas@glider.be, sergei.shtylyov@cogentembedded.com, baruch@tkos.co.il, david.wu@rock-chips.com, lukma@denx.de, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, richard.leitner@skidata.com
List-Id: devicetree@vger.kernel.org

On Tue, Dec 05, 2017 at 02:25:58PM +0100, Richard Leitner wrote:
> From: Richard Leitner <richard.leitner@skidata.com>
> 
> Some PHYs need the refclk to be a continuous clock. Therefore they don't
> allow turning it off and on again during operation. Nonetheless such a
> clock switching is performed by some ETH drivers (namely FEC [1]) for
> power saving reasons. An example for an affected PHY is the
> SMSC/Microchip LAN8720 in "REF_CLK In Mode".
> 
> In order to provide a uniform method to overcome this problem this patch
> adds a new phy_driver flag (PHY_RST_AFTER_CLK_EN) and corresponding
> function phy_reset_after_clk_enable() to the phylib. These should be
> used to trigger reset of the PHY after the refclk is switched on again.
> 
> This patch depends on the "phylib: Add device reset GPIO support" patch
> submitted by Geert Uytterhoeven/Sergei Shtylyov [2].
> 
> [1] commit e8fcfcd5684a ("net: fec: optimize the clock management to save power")
> [2] https://patchwork.kernel.org/patch/10090149/
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>

Hi Richard

Same comment about moving text below the ---

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
