From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCHv3 1/5] net: dsa: Support internal phy on 'cpu' port
Date: Mon, 15 Jan 2018 12:25:10 -0800
Message-ID: <1068f636-feff-0b24-a9b0-90a407093058@gmail.com>
References: <20180115193722.10241-1-sebastian.reichel@collabora.co.uk>
 <20180115193722.10241-2-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180115193722.10241-2-sebastian.reichel@collabora.co.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Ian Ray <ian.ray@ge.com>, Nandor Han <nandor.han@ge.com>, Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/15/2018 11:37 AM, Sebastian Reichel wrote:
> This adds support for enabling the internal PHY for a 'cpu' port.
> It has been tested on GE B850v3,  B650v3 and B450v3, which have a
> built-in MV88E6240 switch connected to a PCIe based network card.
> Without this patch the link does not come up and no traffic can be
> routed through the switch.
> 
> The PHY interface, that is being used on the above test systems is
> part of the MV88E6240 and since mv88e6xxx driver resets the chip
> during probe, it is definitely disabled without this patch.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> ---
>  net/dsa/port.c | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/net/dsa/port.c b/net/dsa/port.c
> index bb4be2679904..011ecd9b1be7 100644
> --- a/net/dsa/port.c
> +++ b/net/dsa/port.c
> @@ -273,6 +273,55 @@ int dsa_port_vlan_del(struct dsa_port *dp,
>  	return 0;
>  }
>  
> +static int dsa_port_setup_phy_of(struct dsa_port *dp, bool enable)
> +{
> +	struct device_node *port_dn = dp->dn;
> +	struct device_node *phy_dn;
> +	struct dsa_switch *ds = dp->ds;
> +	struct phy_device *phydev;
> +	int port = dp->index;
> +	int err = 0;

I don't have a better solution to offer yet, but this is really making
the number of special cases within DSA much worse, thus impending the
on-going conversion to PHYLINK...

Having PHYs with no network devices is clearly a hack so maybe we should
re-think this whole design paradigm in DSA for which we don't have
net_device being created for CPU and DSA links, and maybe come up with
an actual net_device and just not expose it to the default namespace.

Anyway...

> +
> +	phy_dn = of_parse_phandle(port_dn, "phy-handle", 0);
> +	if (!phy_dn)
> +		return 0;
> +
> +	phydev = of_phy_find_device(phy_dn);
> +	if (!phydev) {
> +		err = -EPROBE_DEFER;
> +		goto err_put_of;
> +	}
> +
> +	if (enable) {
> +		err = genphy_config_init(phydev);
> +		if (err < 0)
> +			goto err_put_dev;
> +
> +		err = genphy_resume(phydev);
> +		if (err < 0)
> +			goto err_put_dev;
> +
> +		err = genphy_read_status(phydev);
> +		if (err < 0)
> +			goto err_put_dev;
> +	} else {
> +		err = genphy_suspend(phydev);
> +		if (err < 0)
> +			goto err_put_dev;
> +	}
> +
> +	if (ds->ops->adjust_link)
> +		ds->ops->adjust_link(ds, port, phydev);
> +
> +	dev_dbg(ds->dev, "enabled port's phy: %s", phydev_name(phydev));
> +
> +err_put_dev:
> +	put_device(&phydev->mdio.dev);
> +err_put_of:
> +	of_node_put(phy_dn);
> +	return err;
> +}
> +
>  int dsa_port_fixed_link_register_of(struct dsa_port *dp)
>  {
>  	struct device_node *dn = dp->dn;
> @@ -305,6 +354,10 @@ int dsa_port_fixed_link_register_of(struct dsa_port *dp)
>  			ds->ops->adjust_link(ds, port, phydev);
>  
>  		put_device(&phydev->mdio.dev);
> +	} else {
> +		err = dsa_port_setup_phy_of(dp, true);
> +		if (err)
> +			return err;
>  	}
>  
>  	return 0;
> @@ -316,4 +369,6 @@ void dsa_port_fixed_link_unregister_of(struct dsa_port *dp)
>  
>  	if (of_phy_is_fixed_link(dn))
>  		of_phy_deregister_fixed_link(dn);
> +	else
> +		dsa_port_setup_phy_of(dp, false);
>  }
> 


-- 
Florian
