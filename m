From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 1/3] enetc: Add mdio bus driver for the PCIe
 MDIO endpoint
Date: Wed, 24 Jul 2019 00:24:54 +0200
Message-ID: <20190723222454.GE13517@lunn.ch>
References: <1563894955-545-1-git-send-email-claudiu.manoil@nxp.com>
 <1563894955-545-2-git-send-email-claudiu.manoil@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1563894955-545-2-git-send-email-claudiu.manoil@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, netdev@vger.kernel.org, alexandru.marginean@nxp.com, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> +	bus = mdiobus_alloc_size(sizeof(u32 *));
> +	if (!bus)
> +		return -ENOMEM;
> +

> +	bus->priv = pci_iomap_range(pdev, 0, ENETC_MDIO_REG_OFFSET, 0);

This got me confused for a while. You allocate space for a u32
pointer. bus->priv will point to this space. However, you are not
using this space, you {ab}use the pointer to directly hold the return
from pci_iomap_range(). This works, but sparse is probably unhappy,
and you are wasting the space the u32 pointer takes.

    Andrew
