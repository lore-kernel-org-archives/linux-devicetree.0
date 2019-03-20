From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v3 3/3] net: dsa: qca8k: extend slave-bus
 implementations
Date: Wed, 20 Mar 2019 10:55:49 -0700 (PDT)
Message-ID: <20190320.105549.1123356102719989957.davem@davemloft.net>
References: <20190319195419.12746-1-chunkeey@gmail.com>
        <20190319195419.12746-3-chunkeey@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190319195419.12746-3-chunkeey@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: chunkeey@gmail.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, vivien.didelot@gmail.com, andrew@lunn.ch, robh+dt@kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

From: Christian Lamparter <chunkeey@gmail.com>
Date: Tue, 19 Mar 2019 20:54:19 +0100

> This patch implements accessors for the QCA8337 MDIO access
> through the MDIO_MASTER register, which makes it possible to
> access the PHYs on slave-bus through the switch. In cases
> where the switch ports are already mapped via external
> "phy-phandles", the internal mdio-bus is disabled in order to
> prevent a duplicated discovery and enumeration of the same
> PHYs. Don't use mixed external and internal mdio-bus
> configurations, as this is not supported by the hardware.
> 
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> ---
> Changes from v2:
>  - Make it compatible with existing configurations
>  - make it clear that's sadly a either external or
>    internal mdio bus access.
> 
> Changes from v1:
>  - drop DT port <-> phy mapping
>  - added register definitions for the MDIO control register
>  - implemented new slave-mdio bus accessors
>  - DT-binding: fix switch's PSEUDO_PHY address. It's 0x10 not 0.
> 
> Old patch (+ discussion) for reference:
> <https://patchwork.ozlabs.org/patch/1036309/>

Would be great to get some review on this.

But I have a coding style change request:

> +static int
> +qca8k_setup_mdio_bus(struct qca8k_priv *priv)
> +{
> +	struct device_node *ports, *port;
> +	struct mii_bus *bus;
> +	u32 internal_mdio_mask = 0;
> +	u32 external_mdio_mask = 0;
> +	u32 reg;
> +	int err;

Reverse christmas tree ordering here please.
