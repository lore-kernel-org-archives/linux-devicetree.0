From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v5 1/4] phylib: Add device reset delay support
Date: Mon, 11 Dec 2017 14:40:35 +0100
Message-ID: <20171211134035.GA28672@lunn.ch>
References: <20171211121700.10200-1-dev@g0hl1n.net>
 <20171211121700.10200-2-dev@g0hl1n.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171211121700.10200-2-dev@g0hl1n.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Leitner <dev@g0hl1n.net>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, fugang.duan@nxp.com, f.fainelli@gmail.com, frowand.list@gmail.com, davem@davemloft.net, geert+renesas@glider.be, sergei.shtylyov@cogentembedded.com, baruch@tkos.co.il, david.wu@rock-chips.com, lukma@denx.de, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, richard.leitner@skidata.com
List-Id: devicetree@vger.kernel.org

On Mon, Dec 11, 2017 at 01:16:57PM +0100, Richard Leitner wrote:
> From: Richard Leitner <richard.leitner@skidata.com>
> 
> Some PHYs need a minimum time after the reset gpio was asserted and/or
> deasserted. To ensure we meet these timing requirements add two new
> optional devicetree parameters for the phy: reset-delay-us and
> reset-post-delay-us.
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
