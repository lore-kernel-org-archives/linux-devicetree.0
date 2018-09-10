From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 net-next 6/6] net: dsa: Add Lantiq / Intel DSA driver
 for vrx200
Date: Mon, 10 Sep 2018 15:27:45 +0200
Message-ID: <20180910132745.GE30395@lunn.ch>
References: <20180909201647.32727-1-hauke@hauke-m.d>
 <20180909202039.471-1-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180909202039.471-1-hauke@hauke-m.de>
Sender: netdev-owner@vger.kernel.org
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: davem@davemloft.net, netdev@vger.kernel.org, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Sep 09, 2018 at 10:20:39PM +0200, Hauke Mehrtens wrote:
> +static void gswip_phylink_validate(struct dsa_switch *ds, int port,
> +				   unsigned long *supported,
> +				   struct phylink_link_state *state)
> +{
> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
> +
> +	switch (port) {
> +	case 0:
> +	case 1:
> +		if (!phy_interface_mode_is_rgmii(state->interface) &&
> +		    state->interface != PHY_INTERFACE_MODE_MII &&
> +		    state->interface != PHY_INTERFACE_MODE_REVMII &&
> +		    state->interface != PHY_INTERFACE_MODE_RMII) {
> +			bitmap_zero(supported, __ETHTOOL_LINK_MODE_MASK_NBITS);
> +			dev_err(ds->dev,
> +			"Unsupported interface: %d\n", state->interface);
> +			return;
> +		}
> +		break;
> +	case 2:
> +	case 3:
> +	case 4:
> +		if (state->interface != PHY_INTERFACE_MODE_INTERNAL) {
> +			bitmap_zero(supported, __ETHTOOL_LINK_MODE_MASK_NBITS);
> +			dev_err(ds->dev,
> +			"Unsupported interface: %d\n", state->interface);
> +			return;
> +		}
> +		break;
> +	case 5:
> +		if (!phy_interface_mode_is_rgmii(state->interface) &&
> +		    state->interface != PHY_INTERFACE_MODE_INTERNAL) {
> +			bitmap_zero(supported, __ETHTOOL_LINK_MODE_MASK_NBITS);
> +			dev_err(ds->dev,
> +			"Unsupported interface: %d\n", state->interface);
> +			return;

Hi Hauke

Minor nit. You have the same thing repeated three times. Maybe change
it to a goto out; and have the error block only once at the out:
label.

> +static int gswip_gphy_fw_list(struct gswip_priv *priv,
> +			      struct device_node *gphy_fw_list_np, u32 version)
> +{
> +	struct device *dev = priv->dev;
> +	struct device_node *gphy_fw_np;
> +	const struct of_device_id *match;
> +	int err;
> +	int i = 0;
> +
> +	/* The The VRX200 rev 1.1 uses the GSWIP 2.0 and needs the older

Double The.

> +
> +	/* bring up the mdio bus */
> +	mdio_np = of_find_compatible_node(pdev->dev.of_node, NULL,
> +					  "lantiq,xrx200-mdio");
> +	if (mdio_np) {
> +		err = gswip_mdio(priv, mdio_np);
> +		if (err) {
> +			dev_err(dev, "mdio probe failed\n");
> +			goto gphy_fw;
> +		}
> +	}
> +
> +	err = dsa_register_switch(priv->ds);
> +	if (err) {
> +		dev_err(dev, "dsa switch register failed: %i\n", err);
> +		goto mdio_bus;
> +	}

> +	if (priv->ds->dst->cpu_dp->index != priv->hw_info->cpu_port) {

I think that can be simplified to

        if (!dsa_is_cpu_port(ds, priv->hw_info->cpu_port))

which is probably more readable.

Florian was also considering that we should move this test into the
DSA core. But for the moment, doing it here is O.K.

This is otherwise looking good.

Thanks

    Andrew
