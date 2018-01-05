From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH net] of_mdio: avoid MDIO bus removal when a PHY is missing
Date: Fri, 5 Jan 2018 16:12:35 +0100
Message-ID: <20180105151235.GD4038@lunn.ch>
References: <1515144974-31377-1-git-send-email-madalin.bucur@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1515144974-31377-1-git-send-email-madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Cc: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 05, 2018 at 11:36:14AM +0200, Madalin Bucur wrote:
> If one of the child devices is missing the of_mdiobus_register_phy()
> call will return -ENODEV. When a missing device is encountered the
> registration of the remaining PHYs is stopped and the MDIO bus will
> fail to register. Propagate all errors except ENODEV to avoid it.

Hi Madalin

This is is not clear cut. If the PHY is in device tree, the PHY should
exist. So returning ENODEV is justified. The device tree blob is
broken. But i can also see the value for continuing. There is a chance
some of your other interfaces come up, allowing you to get the correct
device tree blob for the hardware.

Please add

dev_err(&mdio->dev, "MDIO device at address %d is missing.\n");

	Andrew

> 
> Signed-off-by: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
> ---
>  drivers/of/of_mdio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
> index 3481e69..93d41275 100644
> --- a/drivers/of/of_mdio.c
> +++ b/drivers/of/of_mdio.c
> @@ -231,7 +231,7 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
>  			rc = of_mdiobus_register_phy(mdio, child, addr);
>  		else
>  			rc = of_mdiobus_register_device(mdio, child, addr);
> -		if (rc)
> +		if (rc && rc != -ENODEV)
>  			goto unregister;
>  	}
>  
> @@ -255,7 +255,7 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
>  
>  			if (of_mdiobus_child_is_phy(child)) {
>  				rc = of_mdiobus_register_phy(mdio, child, addr);
> -				if (rc)
> +				if (rc && rc != -ENODEV)
>  					goto unregister;
>  			}
>  		}
> -- 
> 2.1.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
