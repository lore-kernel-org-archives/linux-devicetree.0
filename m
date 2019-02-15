From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 3/3] enetc: Add ENETC PF level external MDIO
 support
Date: Fri, 15 Feb 2019 14:34:59 +0100
Message-ID: <20190215133459.GH5699@lunn.ch>
References: <1550225414-12125-1-git-send-email-claudiu.manoil@nxp.com>
 <1550225414-12125-4-git-send-email-claudiu.manoil@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1550225414-12125-4-git-send-email-claudiu.manoil@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, alexandru.marginean@nxp.com, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 15, 2019 at 12:10:14PM +0200, Claudiu Manoil wrote:
> Each ENETC PF has its own MDIO interface, the corresponding
> MDIO registers are mapped in the ENETC's Port register block.
> The current patch adds a driver for these PF level MDIO buses,
> so that each PF can manage directly its own external link.
> 
> Signed-off-by: Alex Marginean <alexandru.marginean@nxp.com>
> Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
> ---
> v2 - used readx_poll_timeout()
>    - added mdio node child to the port node

Hi Claudiu

Please document this in the device tree binding.

> +	/* return all Fs if nothing was there */
> +	if (enetc_rd_reg(&regs->mdio_cfg) & MDIO_CFG_RD_ER) {
> +		dev_err(&bus->dev,
> +			"Error while reading PHY%d reg at %d.%hhu\n",
> +			phy_id, dev_addr, regnum);
> +		return 0xffff;

I'm not sure you want a dev_err() here. The device tree binding allows
you to have a phy node without a reg value. When that happens, the
core code will scan all 32 addresses to find the PHY. This is going to
spam the log. dev_dbg() might be better.

     Andrew
