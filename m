From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v5 2/2] net: ethernet: nixge: Add support for National
 Instruments XGE netdev
Date: Mon, 26 Mar 2018 11:38:30 -0400 (EDT)
Message-ID: <20180326.113830.932262386304702367.davem@davemloft.net>
References: <20180323204128.29783-1-mdf@kernel.org>
        <20180323204128.29783-2-mdf@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180323204128.29783-2-mdf@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mdf@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, robh+dt@kernel.org, andrew@lunn.ch, f.fainelli@gmail.com
List-Id: devicetree@vger.kernel.org

From: Moritz Fischer <mdf@kernel.org>
Date: Fri, 23 Mar 2018 13:41:28 -0700

> +static void nixge_hw_dma_bd_release(struct net_device *ndev)
> +{
> +	int i;
> +	struct nixge_priv *priv = netdev_priv(ndev);

Please order local variables from longest to shortest line (ie. reverse
christmas tree layout).

> +static int nixge_hw_dma_bd_init(struct net_device *ndev)
> +{
> +	u32 cr;
> +	int i;
> +	struct sk_buff *skb;
> +	struct nixge_priv *priv = netdev_priv(ndev);

Likewise.

> +static void __nixge_device_reset(struct nixge_priv *priv, off_t offset)
> +{
> +	u32 status;
> +	int err;
> +	/* Reset Axi DMA. This would reset NIXGE Ethernet core as well.
> +	 * The reset process of Axi DMA takes a while to complete as all
> +	 * pending commands/transfers will be flushed or completed during
> +	 * this reset process.
> +	 */

Please put an empty line between the local variable declarations
and this comment.
