From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v4 0/4] enetc: Add mdio bus driver for the
 PCIe MDIO endpoint
Date: Tue, 30 Jul 2019 09:44:36 -0700 (PDT)
Message-ID: <20190730.094436.855806617449032791.davem@davemloft.net>
References: <1564479919-18835-1-git-send-email-claudiu.manoil@nxp.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564479919-18835-1-git-send-email-claudiu.manoil@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: claudiu.manoil@nxp.com
Cc: andrew@lunn.ch, robh+dt@kernel.org, leoyang.li@nxp.com, alexandru.marginean@nxp.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Claudiu Manoil <claudiu.manoil@nxp.com>
Date: Tue, 30 Jul 2019 12:45:15 +0300

> First patch fixes a sparse issue and cleans up accessors to avoid
> casting to __iomem.
> Second patch just registers the PCIe endpoint device containing
> the MDIO registers as a standalone MDIO bus driver, to allow
> an alternative way to control the MDIO bus.  The same code used
> by the ENETC ports (eth controllers) to manage MDIO via local
> registers applies and is reused.
> 
> Bindings are provided for the new MDIO node, similarly to ENETC
> port nodes bindings.
> 
> Last patch enables the ENETC port 1 and its RGMII PHY on the
> LS1028A QDS board, where the MDIO muxing configuration relies
> on the MDIO support provided in the first patch.
 ...

Series applied, thank you.
