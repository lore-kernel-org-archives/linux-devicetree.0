From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v2 net-next 08/10] net: eth: altera: add support for ptp
 and timestamping
Date: Tue, 18 Dec 2018 20:27:57 -0800
Message-ID: <20181219042757.vhetz2zsrpsz6p3u@localhost>
References: <20181213175252.21143-1-dalon.westergreen@linux.intel.com>
 <20181213175252.21143-9-dalon.westergreen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181213175252.21143-9-dalon.westergreen@linux.intel.com>
Sender: netdev-owner@vger.kernel.org
To: dwesterg@gmail.com
Cc: netdev@vger.kernel.org, dinguyen@kernel.org, thor.thayer@linux.intel.com, davem@davemloft.net, vbridger@opensource.altera.com, robh+dt@kernel.org, devicetree@vger.kernel.org, hean.loong.ong@intel.com, Dalon Westergreen <dalon.westergreen@intel.com>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 13, 2018 at 09:52:50AM -0800, dwesterg@gmail.com wrote:
> Changes from V1:
>  -> Remove debugfs for tod manipulation
>  -> Reorder variable declarations in functions to order
>     by length of declaration, largest to smallest
>  -> Rename altera_ptp to intel_fpga_tod
>  -> Rename functions in intel_fpga_tod so that they are not
>     generic
>  -> Use imply instead of select in Kconfig
>  -> Re-write adjust time function to remove while loop with
>     64 bit divide.

Overall this is looking better.  A few more comments follow...

> +static int tse_get_ts_info(struct net_device *dev,
> +			   struct ethtool_ts_info *info)
> +{
> +	struct altera_tse_private *priv = netdev_priv(dev);
> +
> +	if (priv->ptp_enable) {
> +		if (priv->ptp_priv.ptp_clock)
> +			info->phc_index =
> +				ptp_clock_index(priv->ptp_priv.ptp_clock);

else
info->phc_index = -1;

> +		info->so_timestamping = SOF_TIMESTAMPING_TX_HARDWARE |
> +					SOF_TIMESTAMPING_RX_HARDWARE |
> +					SOF_TIMESTAMPING_RAW_HARDWARE;
> +
> +		info->tx_types = (1 << HWTSTAMP_TX_OFF) |
> +						 (1 << HWTSTAMP_TX_ON);

This fits on one line ^^^

> +		info->rx_filters = (1 << HWTSTAMP_FILTER_NONE) |
> +						   (1 << HWTSTAMP_FILTER_ALL);

Funky indentation here.  One extra level is enough:

		info->rx_filters = (1 << HWTSTAMP_FILTER_NONE) |
			(1 << HWTSTAMP_FILTER_ALL);

> +		return 0;
> +	} else {
> +		return ethtool_op_get_ts_info(dev, info);
> +	}
> +}
> +

...

> @@ -609,7 +613,14 @@ static netdev_tx_t tse_start_xmit(struct sk_buff *skb, struct net_device *dev)
>  	if (ret)
>  		goto out;
>  
> -	skb_tx_timestamp(skb);
> +	/* Provide a hardware time stamp if requested.
> +	 */
> +	if (unlikely((skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) &&
> +		     priv->hwts_tx_en))
> +		/* declare that device is doing timestamping */

Please drop those two comments.  They are redundant because they only
restate what the code does.

> +		skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
> +	else
> +		skb_tx_timestamp(skb);
>  
>  	priv->tx_prod++;
>  	dev->stats.tx_bytes += skb->len;

Thanks,
Richard
