From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] net: dsa: add support for ksz9897 ethernet switch
Date: Wed, 15 Aug 2018 17:24:53 -0700
Message-ID: <12369b8d-0ae5-7b72-e21a-ee888ead070c@gmail.com>
References: <1534348283-12790-1-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1534348283-12790-1-git-send-email-prabhakar.csengg@gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Lad Prabhakar <prabhakar.csengg@gmail.com>, Woojung Huh <Woojung.Huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/15/2018 08:51 AM, Lad Prabhakar wrote:
> From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
> 
> ksz9477 is superset of ksz9xx series, driver just works
> out of the box for ksz9897 chip with this patch.

net-next is currently closed, but other than that:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

> 
> Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/dsa/ksz.txt | 4 +++-
>  drivers/net/dsa/microchip/ksz_common.c            | 9 +++++++++
>  drivers/net/dsa/microchip/ksz_spi.c               | 1 +
>  3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/ksz.txt b/Documentation/devicetree/bindings/net/dsa/ksz.txt
> index a700943..ac145b8 100644
> --- a/Documentation/devicetree/bindings/net/dsa/ksz.txt
> +++ b/Documentation/devicetree/bindings/net/dsa/ksz.txt
> @@ -4,7 +4,9 @@ Microchip KSZ Series Ethernet switches
>  Required properties:
>  
>  - compatible: For external switch chips, compatible string must be exactly one
> -  of: "microchip,ksz9477"
> +  of the following:
> +  - "microchip,ksz9477"
> +  - "microchip,ksz9897"
>  
>  See Documentation/devicetree/bindings/net/dsa/dsa.txt for a list of additional
>  required and optional properties.
> diff --git a/drivers/net/dsa/microchip/ksz_common.c b/drivers/net/dsa/microchip/ksz_common.c
> index 7210c49..54e0ca6 100644
> --- a/drivers/net/dsa/microchip/ksz_common.c
> +++ b/drivers/net/dsa/microchip/ksz_common.c
> @@ -1102,6 +1102,15 @@ static const struct ksz_chip_data ksz_switch_chips[] = {
>  		.cpu_ports = 0x7F,	/* can be configured as cpu port */
>  		.port_cnt = 7,		/* total physical port count */
>  	},
> +	{
> +		.chip_id = 0x00989700,
> +		.dev_name = "KSZ9897",
> +		.num_vlans = 4096,
> +		.num_alus = 4096,
> +		.num_statics = 16,
> +		.cpu_ports = 0x7F,	/* can be configured as cpu port */
> +		.port_cnt = 7,		/* total physical port count */
> +	},
>  };
>  
>  static int ksz_switch_init(struct ksz_device *dev)
> diff --git a/drivers/net/dsa/microchip/ksz_spi.c b/drivers/net/dsa/microchip/ksz_spi.c
> index c519469..8c1778b 100644
> --- a/drivers/net/dsa/microchip/ksz_spi.c
> +++ b/drivers/net/dsa/microchip/ksz_spi.c
> @@ -195,6 +195,7 @@ static int ksz_spi_remove(struct spi_device *spi)
>  
>  static const struct of_device_id ksz_dt_ids[] = {
>  	{ .compatible = "microchip,ksz9477" },
> +	{ .compatible = "microchip,ksz9897" },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, ksz_dt_ids);
> 


-- 
Florian
