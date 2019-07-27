From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next 1/3] net: dsa: mt7530: Convert to PHYLINK API
Date: Sat, 27 Jul 2019 19:48:28 +0100
Message-ID: <20190727184828.GT1330@shell.armlinux.org.uk>
References: <20190724192549.24615-1-opensource@vdorst.com>
 <20190724192549.24615-2-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190724192549.24615-2-opensource@vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Cc: netdev@vger.kernel.org, frank-w@public-files.de, sean.wang@mediatek.com, f.fainelli@gmail.com, davem@davemloft.net, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com, john@phrozen.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

Just a couple of minor points.

On Wed, Jul 24, 2019 at 09:25:47PM +0200, René van Dorst wrote:
> +static void mt7530_phylink_mac_config(struct dsa_switch *ds, int port,
> +				      unsigned int mode,
> +				      const struct phylink_link_state *state)
> +{
> +	struct mt7530_priv *priv = ds->priv;
> +	u32 mcr_cur, mcr_new;
> +
> +	switch (port) {
> +	case 0: /* Internal phy */
> +	case 1:
> +	case 2:
> +	case 3:
> +	case 4:
> +		if (state->interface != PHY_INTERFACE_MODE_GMII)
> +			return;
> +		break;
> +	/* case 5: Port 5 is not supported! */
> +	case 6: /* 1st cpu port */
> +		if (state->interface != PHY_INTERFACE_MODE_RGMII &&
> +		    state->interface != PHY_INTERFACE_MODE_TRGMII)
> +			return;
> +
> +		if (priv->p6_interface == state->interface)
> +			break;
> +		/* Setup TX circuit incluing relevant PAD and driving */
> +		mt7530_pad_clk_setup(ds, state->interface);
> +
> +		if (priv->id == ID_MT7530) {
> +			/* Setup RX circuit, relevant PAD and driving on the
> +			 * host which must be placed after the setup on the
> +			 * device side is all finished.
> +			 */
> +			mt7623_pad_clk_setup(ds);
> +		}
> +		priv->p6_interface = state->interface;
> +		break;
> +	default:
> +		dev_err(ds->dev, "%s: unsupported port: %i\n", __func__, port);
> +		return;
> +	}

	if (phylink_autoneg_inband(mode)) {
		dev_err(ds->dev, "%s: in-band negotiation unsupported\n",
			__func__);
		return;
	}

or similar, since you don't support inband AN in this code path.

> +
> +	mcr_cur = mt7530_read(priv, MT7530_PMCR_P(port));
> +	mcr_new = mcr_cur;
> +	mcr_new &= ~(PMCR_FORCE_SPEED_1000 | PMCR_FORCE_SPEED_100 |
> +		     PMCR_FORCE_FDX | PMCR_TX_FC_EN | PMCR_RX_FC_EN);
> +	mcr_new |= PMCR_IFG_XMIT(1) | PMCR_MAC_MODE | PMCR_BACKOFF_EN |
> +		   PMCR_BACKPR_EN | PMCR_FORCE_MODE | PMCR_FORCE_LNK;
> +
> +	switch (state->speed) {
> +	case SPEED_1000:
> +		mcr_new |= PMCR_FORCE_SPEED_1000;
> +		break;
> +	case SPEED_100:
> +		mcr_new |= PMCR_FORCE_SPEED_100;
> +		break;
> +	}
> +	if (state->duplex == DUPLEX_FULL) {
> +		mcr_new |= PMCR_FORCE_FDX;
> +		if (state->pause & MLO_PAUSE_TX)
> +			mcr_new |= PMCR_TX_FC_EN;
> +		if (state->pause & MLO_PAUSE_RX)
> +			mcr_new |= PMCR_RX_FC_EN;
> +	}
> +
> +	if (mcr_new != mcr_cur)
> +		mt7530_write(priv, MT7530_PMCR_P(port), mcr_new);
> +}
> +
> +static void mt7530_phylink_mac_link_down(struct dsa_switch *ds, int port,
> +					 unsigned int mode,
> +					 phy_interface_t interface)
> +{
> +	struct mt7530_priv *priv = ds->priv;
> +
> +	mt7530_port_set_status(priv, port, 0);
> +}
> +
> +static void mt7530_phylink_mac_link_up(struct dsa_switch *ds, int port,
> +				       unsigned int mode,
> +				       phy_interface_t interface,
> +				       struct phy_device *phydev)
> +{
> +	struct mt7530_priv *priv = ds->priv;
> +
> +	mt7530_port_set_status(priv, port, 1);
> +}
> +
> +static void mt7530_phylink_validate(struct dsa_switch *ds, int port,
> +				    unsigned long *supported,
> +				    struct phylink_link_state *state)
> +{
> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
> +
> +	switch (port) {
> +	case 0: /* Internal phy */
> +	case 1:
> +	case 2:
> +	case 3:
> +	case 4:
> +		if (state->interface != PHY_INTERFACE_MODE_NA &&
> +		    state->interface != PHY_INTERFACE_MODE_GMII)
> +			goto unsupported;
> +		break;
> +	/* case 5: Port 5 not supported! */
> +	case 6: /* 1st cpu port */
> +		if (state->interface != PHY_INTERFACE_MODE_NA &&
> +		    state->interface != PHY_INTERFACE_MODE_RGMII &&
> +		    state->interface != PHY_INTERFACE_MODE_TRGMII)
> +			goto unsupported;
> +		break;
> +	default:
> +		linkmode_zero(supported);
> +		dev_err(ds->dev, "%s: unsupported port: %i\n", __func__, port);

You could reorder this as:

	default:
		dev_err(ds->dev, "%s: unsupported port: %i\n", __func__, port);
	unsupported:
		linkmode_zero(supported);

and save having the "unsupported" at the end of the function.  Not sure
what DaveM would think of it though.


-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
