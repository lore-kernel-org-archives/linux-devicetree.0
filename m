From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v4 2/4] enetc: Add mdio bus driver for the PCIe
 MDIO endpoint
Date: Tue, 30 Jul 2019 15:22:57 +0200
Message-ID: <20190730132257.GB28552@lunn.ch>
References: <1564479919-18835-1-git-send-email-claudiu.manoil@nxp.com>
 <1564479919-18835-3-git-send-email-claudiu.manoil@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1564479919-18835-3-git-send-email-claudiu.manoil@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Li Yang <leoyang.li@nxp.com>, alexandru.marginean@nxp.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 30, 2019 at 12:45:17PM +0300, Claudiu Manoil wrote:
> ENETC ports can manage the MDIO bus via local register
> interface.  However there's also a centralized way
> to manage the MDIO bus, via the MDIO PCIe endpoint
> device integrated by the same root complex that also
> integrates the ENETC ports (eth controllers).
> 
> Depending on board design and use case, centralized
> access to MDIO may be better than using local ENETC
> port registers.  For instance, on the LS1028A QDS board
> where MDIO muxing is required.  Also, the LS1028A on-chip
> switch doesn't have a local MDIO register interface.
> 
> The current patch registers the above PCIe endpoint as a
> separate MDIO bus and provides a driver for it by re-using
> the code used for local MDIO access.  It also allows the
> ENETC port PHYs to be managed by this driver if the local
> "mdio" node is missing from the ENETC port node.
> 
> Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
