From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3 3/3] net: dsa: qca8k: extend slave-bus implementations
Date: Wed, 20 Mar 2019 11:27:09 -0700
Message-ID: <5cd4b993-d1fa-80a2-a03b-a494a63ae56c@gmail.com>
References: <20190319195419.12746-1-chunkeey@gmail.com>
 <20190319195419.12746-3-chunkeey@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190319195419.12746-3-chunkeey@gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: Vivien Didelot <vivien.didelot@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On 3/19/19 12:54 PM, Christian Lamparter wrote:
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

LGTM, just a few comments/nits below.

> 
> Tested on a Compex WPQ864 (IPQ8064 + QCA8337N)
> internal bus:
> qca8k 37000000.mdio-mii:10 lan1 (uninitialized): PHY [!mdio@37000000!switch@10:01] driver [Generic PHY]
> qca8k 37000000.mdio-mii:10 lan2 (uninitialized): PHY [!mdio@37000000!switch@10:02] driver [Generic PHY]
> qca8k 37000000.mdio-mii:10 lan3 (uninitialized): PHY [!mdio@37000000!switch@10:03] driver [Generic PHY]
> qca8k 37000000.mdio-mii:10 lan4 (uninitialized): PHY [!mdio@37000000!switch@10:04] driver [Generic PHY]
> qca8k 37000000.mdio-mii:10 wan (uninitialized): PHY [!mdio@37000000!switch@10:05] driver [Generic PHY]
> 
> external bus:
> qca8k 37000000.mdio-mii:10 lan1 (uninitialized): PHY [37000000.mdio-mii:00] driver [Generic PHY]
> qca8k 37000000.mdio-mii:10 lan2 (uninitialized): PHY [37000000.mdio-mii:01] driver [Generic PHY]
> qca8k 37000000.mdio-mii:10 lan3 (uninitialized): PHY [37000000.mdio-mii:02] driver [Generic PHY]
> qca8k 37000000.mdio-mii:10 lan4 (uninitialized): PHY [37000000.mdio-mii:03] driver [Generic PHY]
> qca8k 37000000.mdio-mii:10 wan (uninitialized): PHY [37000000.mdio-mii:04] driver [Generic PHY]
> ---

[snip]

> +static int
> +qca8k_mdio_write(struct qca8k_priv *priv, int port, int regnum, u16 data)
> +{
> +	u32 val;
> +	int phy;
> +
> +	phy = qca8k_port_to_phy(port);
> +	if (phy < 0 || (regnum < 0 || regnum >= QCA8K_MDIO_MASTER_MAX_REG))
> +		return -EINVAL;

Is not the first condition always true? We should fix the signature of
phy_{read,write} in dsa.h to match what mdiobus_{read,write} takes,
which is an u32 regnum.

> +
> +	val = QCA8K_MDIO_MASTER_BUSY | QCA8K_MDIO_MASTER_EN |
> +	      QCA8K_MDIO_MASTER_WRITE | QCA8K_MDIO_MASTER_PHY_ADDR(phy) |
> +	      QCA8K_MDIO_MASTER_REG_ADDR(regnum) |
> +	      QCA8K_MDIO_MASTER_DATA(data);
> +
> +	qca8k_write(priv, QCA8K_MDIO_MASTER_CTRL, val);
> +
> +	return qca8k_busy_wait(priv, QCA8K_MDIO_MASTER_CTRL,
> +		QCA8K_MDIO_MASTER_BUSY);
> +}
> +
> +static int
> +qca8k_mdio_read(struct qca8k_priv *priv, int port, int regnum)
> +{
> +	u32 val;
> +	int phy;
> +
> +	phy = qca8k_port_to_phy(port);
> +	if (phy < 0 || (regnum < 0 || regnum >= QCA8K_MDIO_MASTER_MAX_REG))
> +		return -EINVAL;

Likewise.

[snip]

> +static int
> +qca8k_phy_read(struct dsa_switch *ds, int port, int regnum)
> +{
> +	struct qca8k_priv *priv = ds->priv;
> +	int ret = -EIO;
> +
> +	if (ds->slave_mii_bus->phy_mask & BIT(port))
> +		ret = qca8k_mdio_read(priv, port, regnum);

I suppose in theory you could also look at the external_mdio_mask and do
something like this:

	if (ds->slave_mii_bus->phy_mask & BIT(port))
		ret = qca8k_mdio_read(priv, port, regnum);
	else
		ret = mdiobus_read_nested(priv->bus, port, regnum);

Not strictly necessary for now.

> +
> +	return ret;
> +}
> +
> +static int
> +qca8k_setup_mdio_bus(struct qca8k_priv *priv)
> +{
> +	struct device_node *ports, *port;
> +	struct mii_bus *bus;
> +	u32 internal_mdio_mask = 0;
> +	u32 external_mdio_mask = 0;
> +	u32 reg;
> +	int err;
> +
> +	ports = of_get_child_by_name(priv->dev->of_node, "ports");
> +	if (!ports)
> +		return -EINVAL;
> +
> +	for_each_available_child_of_node(ports, port) {
> +		err = of_property_read_u32(port, "reg", &reg);
> +		if (err)
> +			return err;
> +
> +		if (dsa_is_user_port(priv->ds, reg)) {

You could reduce indentation a bit with:

	if (!dsa_is_user_port(priv->ds, reg))
		continue;

> +			if (of_property_read_bool(port, "phy-handle"))
> +				external_mdio_mask |= BIT(reg);
> +			else
> +				internal_mdio_mask |= BIT(reg);
> +		}
> +	}
> +
> +	if (!external_mdio_mask && !internal_mdio_mask) {
> +		dev_err(priv->dev, "no PHYs are defined.\n");
> +		return -EINVAL;
> +	}
> +
> +	/* The QCA8K_MDIO_MASTER_EN Bit, which grants access to PHYs through
> +	 * the MDIO_MASTER register also _disconnects_ the external MDC
> +	 * passthrough to the internal PHYs. It's not possible to use both
> +	 * configurations at the same time!
> +	 */

Right, but presumably you can do this on a per-port basis and support
both types of configuration? bcm_sf2 is pretty much the same thing.

> +	if (external_mdio_mask && internal_mdio_mask) {
> +		dev_err(priv->dev, "either internal or external mdio bus configuration is supported.\n");
> +		return -EINVAL;
> +	}

Don't both conditions amount to:

	if (external_mdio_mask == internal_mdio_mask)
		error()?

> +
> +	if (external_mdio_mask) {
> +		/* Make sure to disable the internal mdio bus in cases
> +		 * a dt-overlay and driver reload changed the configuration
> +		 */
> +
> +		qca8k_reg_clear(priv, QCA8K_MDIO_MASTER_CTRL,
> +				QCA8K_MDIO_MASTER_EN);
> +		return 0;
> +	}
> +
> +	bus = devm_mdiobus_alloc_size(priv->dev, sizeof(priv));
> +	if (!bus)
> +		return -ENOMEM;
> +	bus->priv = (void *)priv;

Cast is not necessary.
-- 
Florian
