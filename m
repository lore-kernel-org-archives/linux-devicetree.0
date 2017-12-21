From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv3 2/3] net: socionext: Add Synquacer NetSec driver
Date: Thu, 21 Dec 2017 15:00:46 +0100
Message-ID: <20171221140046.GE15416@lunn.ch>
References: <1513858196-14137-1-git-send-email-jassisinghbrar@gmail.com>
 <1513858275-14246-1-git-send-email-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1513858275-14246-1-git-send-email-jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> +static int netsec_register_mdio(struct netsec_priv *priv, u32 phy_addr)
> +{
> +	struct mii_bus *bus;
> +	int ret;
> +
> +	bus = devm_mdiobus_alloc(priv->dev);
> +	if (!bus)
> +		return -ENOMEM;
> +
> +	snprintf(bus->id, MII_BUS_ID_SIZE, "%s", dev_name(priv->dev));
> +	bus->priv = priv;
> +	bus->name = "SNI NETSEC MDIO";
> +	bus->read = netsec_phy_read;
> +	bus->write = netsec_phy_write;
> +	bus->parent = priv->dev;
> +	priv->mii_bus = bus;
> +
> +	if (dev_of_node(priv->dev)) {
> +		struct device_node *parent = dev_of_node(priv->dev);
> +		struct device_node *child_node, *mdio_node = NULL;
> +
> +		for_each_child_of_node(parent, child_node) {
> +			if (of_device_is_compatible(child_node,
> +						    "socionext,snq-mdio")) {

Just use of_get_child_by_name(parent, "mdio");

     Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
