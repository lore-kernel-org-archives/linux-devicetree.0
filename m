From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/6] phy: add A3700 COMPHY support
Date: Thu, 29 Nov 2018 17:12:45 +0100
Message-ID: <20181129171245.4f683045@xps13>
References: <20181122210420.14861-1-miquel.raynal@bootlin.com>
        <20181122210420.14861-3-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181122210420.14861-3-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Evan Wang <xswang@marvell.com>, "Nadav Haklai (Marvell)" <nadavh@marvell.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Marcin Wojtas <mw@semihalf.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hello,

Miquel Raynal <miquel.raynal@bootlin.com> wrote on Thu, 22 Nov 2018
22:04:16 +0100:

> Add a driver to support COMPHY, a hardware block providing shared
> serdes PHYs on Marvell Armada 3700. This driver uses SMC calls and
> rely on having an up-to-date firmware.
> 
> SATA, PCie and USB3 host mode have been tested successfully with an
> ESPRESSObin. SGMII mode cannot be tested with this platform.
> 
> Co-Developed-by: Evan Wang <xswang@marvell.com>
> Signed-off-by: Evan Wang <xswang@marvell.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

[...]

> +static struct phy *mvebu_a3700_comphy_xlate(struct device *dev,
> +					    struct of_phandle_args *args)
> +{
> +	struct mvebu_a3700_comphy_lane *lane;
> +	struct phy *phy;
> +
> +	if (WARN_ON(args->args[0] >= MVEBU_A3700_COMPHY_PORTS))
> +		return ERR_PTR(-EINVAL);
> +
> +	phy = of_phy_simple_xlate(dev, args);
> +	if (IS_ERR(phy))
> +		return phy;
> +
> +	lane = phy_get_drvdata(phy);
> +	if (lane->port >= 0)
> +		return ERR_PTR(-EBUSY);

This is not valid. It works only the first time the consumer gets
a PHY for this lane. If the consumer put the PHY (module is unloaded)
and then gets the PHY again (module is re-loaded a second time), the
port is already set to != -1 and this will exit with an error and
prevent the module to probe.

> +
> +	lane->port = args->args[0];

I will remove the above check and transform it into a valid "port"
value right here.

Note: the same applies to the cp110 comphy driver on which the driver
structure is based.

> +
> +	return phy;
> +}
> +
> +static int mvebu_a3700_comphy_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *provider;
> +	struct device_node *child;
> +
> +	for_each_available_child_of_node(pdev->dev.of_node, child) {
> +		struct mvebu_a3700_comphy_lane *lane;
> +		struct phy *phy;
> +		int ret;
> +		u32 lane_id;
> +
> +		ret = of_property_read_u32(child, "reg", &lane_id);
> +		if (ret < 0) {
> +			dev_err(&pdev->dev, "missing 'reg' property (%d)\n",
> +				ret);
> +			continue;
> +		}
> +
> +		if (lane_id >= MVEBU_A3700_COMPHY_LANES) {
> +			dev_err(&pdev->dev, "invalid 'reg' property\n");
> +			continue;
> +		}
> +
> +		lane = devm_kzalloc(&pdev->dev, sizeof(*lane), GFP_KERNEL);
> +		if (!lane)
> +			return -ENOMEM;
> +
> +		phy = devm_phy_create(&pdev->dev, child,
> +				      &mvebu_a3700_comphy_ops);
> +		if (IS_ERR(phy))
> +			return PTR_ERR(phy);
> +
> +		lane->dev = &pdev->dev;
> +		lane->mode = PHY_MODE_INVALID;
> +		lane->id = lane_id;
> +		lane->port = -1;
> +		phy_set_drvdata(phy, lane);
> +	}
> +
> +	provider = devm_of_phy_provider_register(&pdev->dev,
> +						 mvebu_a3700_comphy_xlate);
> +	return PTR_ERR_OR_ZERO(provider);
> +}
> +
> +static const struct of_device_id mvebu_a3700_comphy_of_match_table[] = {
> +	{ .compatible = "marvell,comphy-a3700" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, mvebu_a3700_comphy_of_match_table);
> +
> +static struct platform_driver mvebu_a3700_comphy_driver = {
> +	.probe	= mvebu_a3700_comphy_probe,
> +	.driver	= {
> +		.name = "mvebu-a3700-comphy",
> +		.of_match_table = mvebu_a3700_comphy_of_match_table,
> +	},
> +};
> +module_platform_driver(mvebu_a3700_comphy_driver);
> +
> +MODULE_AUTHOR("Miquèl Raynal <miquel.raynal@bootlin.com>");
> +MODULE_DESCRIPTION("Common PHY driver for A3700");
> +MODULE_LICENSE("GPL v2");


Thanks,
Miquèl
