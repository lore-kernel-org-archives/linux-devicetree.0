From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 3/4] net: macb: Drop nvmem_get_mac_address usage
Date: Sat, 27 Apr 2019 18:44:08 +0200
Message-ID: <20190427164408.GD9816@lunn.ch>
References: <1556320002-26213-1-git-send-email-ynezz@true.cz>
 <1556320002-26213-4-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556320002-26213-4-git-send-email-ynezz@true.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Alban Bedel <albeu@free.fr>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 27, 2019 at 01:06:41AM +0200, Petr Štetiar wrote:
> of_get_mac_address now uses NVMEM under the hood, so it's not necessary
> to call it manually anymore.
> 
> Signed-off-by: Petr Štetiar <ynezz@true.cz>
> ---
>  drivers/net/ethernet/cadence/macb_main.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 3da2795..1b98bc8 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -4172,16 +4172,10 @@ static int macb_probe(struct platform_device *pdev)
>  		bp->rx_intr_mask |= MACB_BIT(RXUBR);
>  
>  	mac = of_get_mac_address(np);
> -	if (mac) {
> +	if (mac)
>  		ether_addr_copy(bp->dev->dev_addr, mac);
> -	} else {
> -		err = nvmem_get_mac_address(&pdev->dev, bp->dev->dev_addr);
> -		if (err) {
> -			if (err == -EPROBE_DEFER)
> -				goto err_out_free_netdev;
> -			macb_get_hwaddr(bp);
> -		}
> -	}

Here we have an ordering problem. The current code looks for NVMEM
after local-mac-address and mac-address. You change will make it look
for NVMEM first.

    Andrew
