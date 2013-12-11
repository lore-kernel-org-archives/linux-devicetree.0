From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH 2/7] net: of_mdio: use PHY_MAX_ADDR constant
Date: Wed, 11 Dec 2013 13:52:31 +0000
Message-ID: <20131211135231.10456C4061A@trevor.secretlab.ca>
References: <1386283936-26104-1-git-send-email-florian@openwrt.org> < 1386283936-26104-3-git-send-email-florian@openwrt.org>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1386283936-26104-3-git-send-email-florian@openwrt.org>
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <florian@openwrt.org>, netdev@vger.kernel.org
Cc: davem@davemloft.net, devicetree@vger.kernel.org, abrodkin@synopsys.com, rob.herring@calxeda.com, mark.rutland@arm.com, sebastian.hesselbarth@gmail.com, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, 5 Dec 2013 14:52:11 -0800, Florian Fainelli <florian@openwrt.org> wrote:
> From: Florian Fainelli <f.fainelli@gmail.com>
> 
> Use the PHY_MAX_ADDR constant for checking if a MDIO bus address is
> valid instead of using a plain "32".
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Grant Likely <grant.likely@linaro.org>

> ---
>  drivers/of/of_mdio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
> index 82485d2..f93ebca 100644
> --- a/drivers/of/of_mdio.c
> +++ b/drivers/of/of_mdio.c
> @@ -107,7 +107,7 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
>  		}
>  
>  		addr = be32_to_cpup(paddr);
> -		if (addr >= 32) {
> +		if (addr >= PHY_MAX_ADDR) {
>  			dev_err(&mdio->dev, "%s PHY address %i is too large\n",
>  				child->full_name, addr);
>  			continue;
> -- 
> 1.8.3.2
> 
