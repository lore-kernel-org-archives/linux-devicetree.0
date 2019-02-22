From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v3 3/4] enetc: Add ENETC PF level external MDIO
 support
Date: Fri, 22 Feb 2019 18:44:35 +0100
Message-ID: <20190222174435.GL5894@lunn.ch>
References: <1550847859-17346-1-git-send-email-claudiu.manoil@nxp.com>
 <1550847859-17346-4-git-send-email-claudiu.manoil@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550847859-17346-4-git-send-email-claudiu.manoil@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, alexandru.marginean@nxp.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 22, 2019 at 05:04:18PM +0200, Claudiu Manoil wrote:
> Each ENETC PF has its own MDIO interface, the corresponding
> MDIO registers are mapped in the ENETC's Port register block.
> The current patch adds a driver for these PF level MDIO buses,
> so that each PF can manage directly its own external link.
> 
> Signed-off-by: Alex Marginean <alexandru.marginean@nxp.com>
> Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
