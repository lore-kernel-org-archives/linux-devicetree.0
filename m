From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 1/3] net: ethernet: mediatek: Add basic
 PHYLINK support
Date: Fri, 26 Jul 2019 14:02:45 -0700 (PDT)
Message-ID: <20190726.140245.129199617321965171.davem@davemloft.net>
References: <20190724192340.18978-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190724192340.18978-1-opensource@vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: opensource@vdorst.com
Cc: netdev@vger.kernel.org, frank-w@public-files.de, sean.wang@mediatek.com, f.fainelli@gmail.com, linux@armlinux.org.uk, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com, john@phrozen.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: René van Dorst <opensource@vdorst.com>
Date: Wed, 24 Jul 2019 21:23:40 +0200

> @@ -186,165 +187,219 @@ static void mtk_gmac0_rgmii_adjust(struct mtk_eth *eth, int speed)
>  	mtk_w32(eth, val, TRGMII_TCK_CTRL);
>  }
>  
> -static void mtk_phy_link_adjust(struct net_device *dev)
> +static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
> +			   const struct phylink_link_state *state)
>  {
> -	struct mtk_mac *mac = netdev_priv(dev);
> -	u16 lcl_adv = 0, rmt_adv = 0;
> -	u8 flowctrl;
> -	u32 mcr = MAC_MCR_MAX_RX_1536 | MAC_MCR_IPG_CFG |
> -		  MAC_MCR_FORCE_MODE | MAC_MCR_TX_EN |
> -		  MAC_MCR_RX_EN | MAC_MCR_BACKOFF_EN |
> -		  MAC_MCR_BACKPR_EN;
> +	struct mtk_mac *mac = container_of(config, struct mtk_mac,
> +					   phylink_config);
> +	struct mtk_eth *eth = mac->hw;
>  
> -	if (unlikely(test_bit(MTK_RESETTING, &mac->hw->state)))
> -		return;
> +	u32 ge_mode = 0, val, mcr_cur, mcr_new;

Please elminiate the empty line in the middle of the local variabel
declarations and adhere to reverse christmas tree ordering.
> @@ -1798,6 +1853,13 @@ static int mtk_open(struct net_device *dev)
>  {
>  	struct mtk_mac *mac = netdev_priv(dev);
>  	struct mtk_eth *eth = mac->hw;
> +	int err = phylink_of_phy_connect(mac->phylink, mac->of_node, 0);

Reverse christmas tree please.

> @@ -2375,9 +2407,10 @@ static const struct net_device_ops mtk_netdev_ops = {
>  
>  static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
>  {
> +	struct phylink *phylink;
>  	struct mtk_mac *mac;
>  	const __be32 *_id = of_get_property(np, "reg", NULL);
> -	int id, err;
> +	int phy_mode, id, err;

While you are here please fix up the reverse christmas tree ordering, and
definitely don't make it worse :)
