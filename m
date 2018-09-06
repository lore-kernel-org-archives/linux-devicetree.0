From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: [PATCH v2 7/9] net: stmmac: dwmac-sun8i: fix OF child-node lookup
Date: Thu, 6 Sep 2018 22:03:37 +0200
Message-ID: <20180906200337.GA15390@Red>
References: <20180827082153.22537-1-johan@kernel.org>
 <20180827082153.22537-8-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180827082153.22537-8-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 27, 2018 at 10:21:51AM +0200, Johan Hovold wrote:
> Use the new of_get_compatible_child() helper to lookup the mdio-internal
> child node instead of using of_find_compatible_node(), which searches
> the entire tree from a given start node and thus can return an unrelated
> (i.e. non-child) node.
> 
> This also addresses a potential use-after-free (e.g. after probe
> deferral) as the tree-wide helper drops a reference to its first
> argument (i.e. the mdio-mux node). Fortunately, this was inadvertently
> balanced by a failure to drop the mdio-mux reference after lookup.
> 
> While at it, also fix the related mdio-internal- and phy-node reference
> leaks.
> 
> Fixes: 634db83b8265 ("net: stmmac: dwmac-sun8i: Handle integrated/external MDIOs")
> Cc: Corentin Labbe <clabbe.montjoie@gmail.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Jose Abreu <joabreu@synopsys.com>
> Cc: David S. Miller <davem@davemloft.net>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index f9a61f90cfbc..0f660af01a4b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -714,8 +714,9 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
>  		return -ENODEV;
>  	}
>  
> -	mdio_internal = of_find_compatible_node(mdio_mux, NULL,
> +	mdio_internal = of_get_compatible_child(mdio_mux,
>  						"allwinner,sun8i-h3-mdio-internal");
> +	of_node_put(mdio_mux);
>  	if (!mdio_internal) {
>  		dev_err(priv->device, "Cannot get internal_mdio node\n");
>  		return -ENODEV;
> @@ -729,13 +730,20 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
>  		gmac->rst_ephy = of_reset_control_get_exclusive(iphynode, NULL);
>  		if (IS_ERR(gmac->rst_ephy)) {
>  			ret = PTR_ERR(gmac->rst_ephy);
> -			if (ret == -EPROBE_DEFER)
> +			if (ret == -EPROBE_DEFER) {
> +				of_node_put(iphynode);
> +				of_node_put(mdio_internal);
>  				return ret;
> +			}
>  			continue;
>  		}
>  		dev_info(priv->device, "Found internal PHY node\n");
> +		of_node_put(iphynode);
> +		of_node_put(mdio_internal);
>  		return 0;
>  	}
> +
> +	of_node_put(mdio_internal);
>  	return -ENODEV;
>  }
>  
> -- 
> 2.18.0
> 

Sorry for the delay
Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>
