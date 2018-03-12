Return-Path: <SRS0=cvpp=GC=gmail.com=f.fainelli@kernel.org>
Subject: Re: [PATCH v3 net-next 1/4] net: macb: Reorganize macb_mii bringup
References: <20180310161718.GC29174@lunn.ch>
 <20180312171001.129209-1-brad.mouring@ni.com>
 <20180312171001.129209-2-brad.mouring@ni.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <be695493-c325-6d9a-8023-4f5ef5912b14@gmail.com>
Date: Mon, 12 Mar 2018 10:17:04 -0700
MIME-Version: 1.0
In-Reply-To: <20180312171001.129209-2-brad.mouring@ni.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Brad Mouring <brad.mouring@ni.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>, Michael Grzeschik <m.grzeschik@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, Julia Cartwright <julia@ni.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 03/12/2018 10:09 AM, Brad Mouring wrote:
> The macb mii setup (mii_probe() and mii_init()) previously was
> somewhat interspersed, likely a result of organic growth and hacking.
> 
> This change moves mii bus registration into mii_init and probing the
> bus for devices into mii_probe.
> 
> Signed-off-by: Brad Mouring <brad.mouring@ni.com>
> Suggested-by: Andrew Lunn <andrew@lunn.ch>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

> ---
>  drivers/net/ethernet/cadence/macb_main.c | 79 +++++++++++++++++---------------
>  1 file changed, 41 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index e84afcf1ecb5..9b6195fbbf8e 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -472,8 +472,42 @@ static int macb_mii_probe(struct net_device *dev)
>  	struct macb *bp = netdev_priv(dev);
>  	struct macb_platform_data *pdata;
>  	struct phy_device *phydev;
> -	int phy_irq;
> -	int ret;
> +	struct device_node *np;
> +	int phy_irq, ret, i;
> +
> +	pdata = dev_get_platdata(&bp->pdev->dev);
> +	np = bp->pdev->dev.of_node;
> +	ret = 0;
> +
> +	if (np) {

Nit: a future cleanup (not this patch series) should consider doing an
early check on np to reduce the indentation.
-- 
Florian
