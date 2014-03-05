From: Stephen Hemminger <stephen@networkplumber.org>
Subject: Re: [PATCH v2] sky2: allow mac to come from dt
Date: Wed, 5 Mar 2014 15:45:32 -0800
Message-ID: <20140305154532.331faba8@nehalam.linuxnetplumber.net>
References: <1394059512-1691-1-git-send-email-tharvey@gateworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1394059512-1691-1-git-send-email-tharvey@gateworks.com>
Sender: netdev-owner@vger.kernel.org
To: Tim Harvey <tharvey@gateworks.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed,  5 Mar 2014 14:45:12 -0800
Tim Harvey <tharvey@gateworks.com> wrote:

> +	unsigned char *iap, tmpaddr[ETH_ALEN];
>  
>  	if (!dev)
>  		return NULL;
> @@ -4805,8 +4808,17 @@ static struct net_device *sky2_init_netdev(struct sky2_hw *hw, unsigned port,
>  
>  	dev->features |= dev->hw_features;
>  
> -	/* read the mac address */
> -	memcpy_fromio(dev->dev_addr, hw->regs + B2_MAC_1 + port * 8, ETH_ALEN);
> +	/* try to get mac address in the following order:
> +	 * 1) from device tree data
> +	 * 2) from internal registers set by bootloader
> +	 */
> +	iap = of_get_mac_address(hw->pdev->dev.of_node);
> +	if (!iap) {
> +		memcpy_fromio(&tmpaddr, hw->regs + B2_MAC_1 + port * 8,
> +			      ETH_ALEN);
> +		iap = tmpaddr;
> +	}
> +	ether_addr_copy(dev->dev_addr, iap);

Can be done without stack tmpaddr.
