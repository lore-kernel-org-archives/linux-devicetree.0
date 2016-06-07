From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v3 2/2] phy: rockchip-inno-usb2: add a new driver for Rockchip usb2phy
Date: Tue, 07 Jun 2016 11:54:38 +0200
Message-ID: <3404512.IukckmNc6l@diego>
References: <1465204804-31161-1-git-send-email-frank.wang@rock-chips.com> <1465204804-31161-3-git-send-email-frank.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465204804-31161-3-git-send-email-frank.wang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wang <frank.wang@rock-chips.com>
Cc: dianders@chromium.org, linux@roeck-us.net, groeck@chromium.org, jwerner@chromium.org, kishon@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, xzy.xu@rock-chips.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, william.wu@rock-chips.com
List-Id: devicetree@vger.kernel.org

Hi Frank,

Am Montag, 6. Juni 2016, 17:20:04 schrieb Frank Wang:
> The newer SoCs (rk3366, rk3399) take a different usb-phy IP block
> than rk3288 and before, and most of phy-related registers are also
> different from the past, so a new phy driver is required necessarily.
> 
> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
> ---

[...]

> +static int rockchip_usb2phy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *child_np;
> +	struct phy_provider *provider;
> +	struct rockchip_usb2phy *rphy;
> +	const struct of_device_id *match;
> +	int index, ret;
> +
> +	rphy = devm_kzalloc(dev, sizeof(*rphy), GFP_KERNEL);
> +	if (!rphy)
> +		return -ENOMEM;
> +
> +	match = of_match_device(dev->driver->of_match_table, dev);
> +	if (!match || !match->data) {
> +		dev_err(dev, "phy configs are not assigned!\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!dev->parent || !dev->parent->of_node)
> +		return -EINVAL;
> +
> +	rphy->grf = syscon_node_to_regmap(dev->parent->of_node);
> +	if (IS_ERR(rphy->grf))
> +		return PTR_ERR(rphy->grf);
> +
> +	rphy->dev = dev;
> +	rphy->phy_cfg = match->data;
> +	platform_set_drvdata(pdev, rphy);
> +
> +	ret = rockchip_usb2phy_clk480m_register(rphy);
> +	if (ret) {
> +		dev_err(dev, "failed to register 480m output clock\n");
> +		return ret;
> +	}
> +
> +	rphy->vbus_host = devm_regulator_get_optional(dev, "vbus_host");
> +	if (IS_ERR(rphy->vbus_host)) {
> +		ret = PTR_ERR(rphy->vbus_host);
> +		if (ret == -EPROBE_DEFER)
> +			return ret;
> +
> +		dev_info(dev, "vbus_host regulator is not assigned!\n");
> +		rphy->vbus_host = NULL;
> +	} else {
> +		ret = regulator_enable(rphy->vbus_host);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	index = 0;
> +	for_each_available_child_of_node(np, child_np) {
> +		struct rockchip_usb2phy_port *rport = &rphy->ports[index];
> +		struct phy *phy;
> +
> +		phy = devm_phy_create(dev, child_np, &rockchip_usb2phy_ops);
> +		if (IS_ERR(phy)) {
> +			dev_err(dev, "failed to create phy\n");
> +			ret = PTR_ERR(phy);
> +			goto put_child;
> +		}
> +
> +		rport->phy = phy;
> +
> +		/* initialize otg/host port separately */
> +		if (!of_node_cmp(child_np->name, "host-port")) {
> +			ret = rockchip_usb2phy_host_port_init(rphy, rport,
> +							      child_np);
> +			if (ret)
> +				goto put_child;
> +		}
> +
> +		phy_set_drvdata(rport->phy, rport);
> +
> +		/* to prevent out of boundary */
> +		if (++index >= rphy->phy_cfg->num_ports)
> +			break;
> +	}
> +
> +	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	return PTR_ERR_OR_ZERO(provider);
> +
> +put_child:
> +	of_node_put(child_np);
> +	return ret;
> +}
> +
> +static const struct rockchip_usb2phy_cfg rk3366_phy_cfgs = {
> +	.num_ports	= 2,
> +	.clkout_ctl	= { 0x0724, 15, 15, 1, 0 },
> +	.port_cfgs	= {
> +		[USB2PHY_PORT_HOST] = {
> +			.phy_sus	= { 0x0728, 15, 0, 0, 0x1d1 },
> +			.ls_det_en	= { 0x0680, 4, 4, 0, 1 },
> +			.ls_det_st	= { 0x0690, 4, 4, 0, 1 },
> +			.ls_det_clr	= { 0x06a0, 4, 4, 0, 1 },
> +			.utmi_ls	= { 0x049c, 14, 13, 0, 1 },
> +			.utmi_hstdet	= { 0x049c, 12, 12, 0, 1 }
> +		}
> +	},
> +};

I also realized that the rk3399 has two of those phy-blocks, so I think we'll 
need to adapt your data storage mechanism a tiny bit. Maybe something like
the following:

In the dts:

grf: syscon@ff770000 {
       compatible = "rockchip,rk3366-grf", "syscon", "simple-mfd";
	...
       u2phy: usb2-phy@700 {
               compatible = "rockchip,rk3366-usb2phy";
		reg = <0x700 0x2c>;
		...
       };
};

In the driver

static const struct rockchip_usb2phy_cfg rk3366_phy_cfgs[] = {
	{
		.reg = 0x700,
		.num_ports	= 2,
		.clkout_ctl	= { 0x0724, 15, 15, 1, 0 },
		.port_cfgs	= {
			[USB2PHY_PORT_HOST] = {
				.phy_sus	= { 0x0728, 15, 0, 0, 0x1d1 },
				...
			}
		},
	},
};

and in _probe then simply use the correct array entry matching the dts reg 
property.

On the rk3399 this would then probably be

       u2phy0: phy@e450 {
               compatible = "rockchip,rk3366-usb2phy";
		reg = <0xe450 0x10>;
		...
	};

       u2phy1: phy@e460 {
               compatible = "rockchip,rk3366-usb2phy";
		reg = <0xe460 0x10>;
		...
	};


This is slightly similar to what we do with the emmc-phy. But also as the 
usbphys differ in a lot of way, this is really only used to match to the data 
block.

This only affects the match-data selection and the rest of the driver does not 
need to be changed for this.


Heiko


> +static const struct of_device_id rockchip_usb2phy_dt_match[] = {
> +	{ .compatible = "rockchip,rk3366-usb2phy", .data = &rk3366_phy_cfgs },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, rockchip_usb2phy_dt_match);
> +
> +static struct platform_driver rockchip_usb2phy_driver = {
> +	.probe		= rockchip_usb2phy_probe,
> +	.driver		= {
> +		.name	= "rockchip-usb2phy",
> +		.of_match_table = rockchip_usb2phy_dt_match,
> +	},
> +};
> +module_platform_driver(rockchip_usb2phy_driver);
> +
> +MODULE_AUTHOR("Frank Wang <frank.wang@rock-chips.com>");
> +MODULE_DESCRIPTION("Rockchip USB2.0 PHY driver");
> +MODULE_LICENSE("GPL v2");
