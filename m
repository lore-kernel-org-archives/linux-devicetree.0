From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH 1/3] enetc: add hardware timestamping support
Date: Thu, 16 May 2019 07:32:51 -0700
Message-ID: <20190516143251.akbt3ns6ue2jrhl5@localhost>
References: <20190516100028.48256-1-yangbo.lu@nxp.com>
 <20190516100028.48256-2-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190516100028.48256-2-yangbo.lu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Y.b. Lu" <yangbo.lu@nxp.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 16, 2019 at 09:59:08AM +0000, Y.b. Lu wrote:

> +config FSL_ENETC_HW_TIMESTAMPING
> +	bool "ENETC hardware timestamping support"
> +	depends on FSL_ENETC || FSL_ENETC_VF
> +	help
> +	  Enable hardware timestamping support on the Ethernet packets
> +	  using the SO_TIMESTAMPING API. Because the RX BD ring dynamic
> +	  allocation hasn't been supported and it's too expensive to use

s/it's/it is/

> +	  extended RX BDs if timestamping isn't used, the option was used
> +	  to control hardware timestamping/extended RX BDs to be enabled
> +	  or not.

..., this option enables extended RX BDs in order to support hardware
timestamping.

>  static bool enetc_clean_tx_ring(struct enetc_bdr *tx_ring, int napi_budget)
>  {
>  	struct net_device *ndev = tx_ring->ndev;
> +	struct enetc_ndev_priv *priv = netdev_priv(ndev);
>  	int tx_frm_cnt = 0, tx_byte_cnt = 0;
>  	struct enetc_tx_swbd *tx_swbd;
> +	union enetc_tx_bd *txbd;
> +	bool do_tstamp;
>  	int i, bds_to_clean;
> +	u64 tstamp = 0;

Please keep in reverse Christmas tree order as much as possible:

	union enetc_tx_bd *txbd;
	int i, bds_to_clean;
	bool do_tstamp;
	u64 tstamp = 0;
  
>  	i = tx_ring->next_to_clean;
>  	tx_swbd = &tx_ring->tx_swbd[i];
>  	bds_to_clean = enetc_bd_ready_count(tx_ring, i);
>  
> +	do_tstamp = false;
> +
>  	while (bds_to_clean && tx_frm_cnt < ENETC_DEFAULT_TX_WORK) {
>  		bool is_eof = !!tx_swbd->skb;
>  
> +		if (unlikely(tx_swbd->check_wb)) {
> +			txbd = ENETC_TXBD(*tx_ring, i);
> +
> +			if (!(txbd->flags & ENETC_TXBD_FLAGS_W))
> +				goto no_wb;
> +
> +			if (tx_swbd->do_tstamp) {
> +				enetc_get_tx_tstamp(&priv->si->hw, txbd,
> +						    &tstamp);
> +				do_tstamp = true;
> +			}
> +		}
> +no_wb:

This goto seems strange and unnecessary.  How about this instead?

			if (txbd->flags & ENETC_TXBD_FLAGS_W &&
			    tx_swbd->do_tstamp) {
				enetc_get_tx_tstamp(&priv->si->hw, txbd, &tstamp);
				do_tstamp = true;
			}

>  		enetc_unmap_tx_buff(tx_ring, tx_swbd);
>  		if (is_eof) {
> +			if (unlikely(do_tstamp)) {
> +				enetc_tstamp_tx(tx_swbd->skb, tstamp);
> +				do_tstamp = false;
> +			}
>  			napi_consume_skb(tx_swbd->skb, napi_budget);
>  			tx_swbd->skb = NULL;
>  		}
> @@ -167,6 +169,11 @@ struct enetc_cls_rule {
>  
>  #define ENETC_MAX_BDR_INT	2 /* fixed to max # of available cpus */
>  
> +enum enetc_hw_features {

This is a poor choice of name.  It sounds like it describes HW
capabilities, but you use it to track whether a feature is requested
at run time.

> +	ENETC_F_RX_TSTAMP	= BIT(0),
> +	ENETC_F_TX_TSTAMP	= BIT(1),
> +};
> +
>  struct enetc_ndev_priv {
>  	struct net_device *ndev;
>  	struct device *dev; /* dma-mapping device */
> @@ -178,6 +185,7 @@ struct enetc_ndev_priv {
>  	u16 rx_bd_count, tx_bd_count;
>  
>  	u16 msg_enable;
> +	int hw_features;

This is also poorly named.  How about "tstamp_request" instead?

>  
>  	struct enetc_bdr *tx_ring[16];
>  	struct enetc_bdr *rx_ring[16];

Thanks,
Richard
