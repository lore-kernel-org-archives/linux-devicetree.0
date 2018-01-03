From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv1 1/6] net: dsa: Support internal phy on 'cpu' port
Date: Wed, 3 Jan 2018 14:21:28 +0100
Message-ID: <20180103132128.GI15036@lunn.ch>
References: <20180103122609.5482-1-sebastian.reichel@collabora.co.uk>
 <20180103122609.5482-2-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180103122609.5482-2-sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Ian Ray <ian.ray-JJi787mZWgc@public.gmane.org>, Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 03, 2018 at 01:26:04PM +0100, Sebastian Reichel wrote:
> This adds support for enabling the internal phy for a 'cpu' port.
> It has been tested on GE B850v3 and B650v3, which have a built-in
> MV88E6240 switch connected to a PCIe based network card. Without
> this patch the link does not come up and no traffic can be routed
> through the switch.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> ---
>  net/dsa/port.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/net/dsa/port.c b/net/dsa/port.c
> index bb4be2679904..f99c1d34416c 100644
> --- a/net/dsa/port.c
> +++ b/net/dsa/port.c
> @@ -282,6 +282,10 @@ int dsa_port_fixed_link_register_of(struct dsa_port *dp)
>  	int mode;
>  	int err;
>  
> +	mode = of_get_phy_mode(dn);
> +	if (mode < 0)
> +		mode = PHY_INTERFACE_MODE_NA;
> +
>  	if (of_phy_is_fixed_link(dn)) {
>  		err = of_phy_register_fixed_link(dn);
>  		if (err) {
> @@ -292,10 +296,6 @@ int dsa_port_fixed_link_register_of(struct dsa_port *dp)
>  		}
>  
>  		phydev = of_phy_find_device(dn);
> -
> -		mode = of_get_phy_mode(dn);
> -		if (mode < 0)
> -			mode = PHY_INTERFACE_MODE_NA;
>  		phydev->interface = mode;
>  
>  		genphy_config_init(phydev);
> @@ -305,6 +305,24 @@ int dsa_port_fixed_link_register_of(struct dsa_port *dp)
>  			ds->ops->adjust_link(ds, port, phydev);
>  
>  		put_device(&phydev->mdio.dev);
> +	} else if (mode == PHY_INTERFACE_MODE_INTERNAL ||
> +		   mode == PHY_INTERFACE_MODE_NA) {

Hi Sebastian

I understand what you are trying to do, i've got boards which also
have back-to-back PHYs for the CPU port. These boards however have the
strapping correct, so nothing needs doing in software.

But the way you are doing it is wrong. PHY_INTERFACE_MODE_NA means
something else has already setup the interface mode, leave it alone.
PHY_INTERFACE_MODE_INTERNAL means there is some other sort of bus
between the MAC and the PHY than the normal MII.

What you want to say is that there is a PHY on this port, and that you
want to configure it to a given fixed configuration, probably 1000
Full, with auto-neg turned off. This is something completely different
to a fixed phy, which is used when there is no PHY at all.

What state is the PHY in, if you don't have this patch? Is it powered
down?

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
