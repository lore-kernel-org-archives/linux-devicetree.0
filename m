From: Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [PATCH v3 2/2] net: macb: Try to retrieve MAC addess from nvmem
 provider
Date: Wed, 28 Mar 2018 10:00:46 +0200
Message-ID: <d7187b2b-a6df-dfba-64ac-f1770c540159@microchip.com>
References: <1522144346-32367-1-git-send-email-mike.looijmans@topic.nl>
 <1522144346-32367-3-git-send-email-mike.looijmans@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522144346-32367-3-git-send-email-mike.looijmans@topic.nl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Looijmans <mike.looijmans@topic.nl>, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, andrew@lunn.ch, f.fainelli@gmail.com, robh+dt@kernel.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

On 27/03/2018 at 11:52, Mike Looijmans wrote:
> Call of_get_nvmem_mac_address() to fetch the MAC address from an nvmem
> cell, if one is provided in the device tree. This allows the address to
> be stored in an I2C EEPROM device for example.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>

For this part:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>   drivers/net/ethernet/cadence/macb_main.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index e84afcf..eabe14f 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -3950,10 +3950,16 @@ static int macb_probe(struct platform_device *pdev)
>   		dev->max_mtu = ETH_DATA_LEN;
>   
>   	mac = of_get_mac_address(np);
> -	if (mac)
> +	if (mac) {
>   		ether_addr_copy(bp->dev->dev_addr, mac);
> -	else
> -		macb_get_hwaddr(bp);
> +	} else {
> +		err = of_get_nvmem_mac_address(np, bp->dev->dev_addr);
> +		if (err) {
> +			if (err == -EPROBE_DEFER)
> +				goto err_out_free_netdev;
> +			macb_get_hwaddr(bp);
> +		}
> +	}
>   
>   	err = of_get_phy_mode(np);
>   	if (err < 0) {
> 


-- 
Nicolas Ferre
