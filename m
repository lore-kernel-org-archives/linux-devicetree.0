From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv2 2/3] net: socionext: Add Synquacer NetSec driver
Date: Tue, 12 Dec 2017 21:44:40 +0100
Message-ID: <20171212204440.GC1523@lunn.ch>
References: <1513098873-20977-1-git-send-email-jassisinghbrar@gmail.com>
 <1513098954-21093-1-git-send-email-jassisinghbrar@gmail.com>
 <CAKv+Gu-6gb10VromMaTJkzpu1DovDO7B5-GWEQPs04qAG=2ksw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKv+Gu-6gb10VromMaTJkzpu1DovDO7B5-GWEQPs04qAG=2ksw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "<netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>" <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Arnd Bergmann <arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > +static int netsec_register_mdio(struct netsec_priv *priv, u32 phy_addr)
> > +{
> > +       struct mii_bus *bus;
> > +       int ret;
> > +
> > +       bus = devm_mdiobus_alloc(priv->dev);
> > +       if (!bus)
> > +               return -ENOMEM;
> > +
> > +       snprintf(bus->id, MII_BUS_ID_SIZE, "%s", dev_name(priv->dev));
> > +       bus->priv = priv;
> > +       bus->name = "SNI NETSEC MDIO";
> > +       bus->read = netsec_phy_read;
> > +       bus->write = netsec_phy_write;
> > +       bus->parent = priv->dev;
> > +       priv->mii_bus = bus;
> > +
> > +       if (dev_of_node(priv->dev)) {
> > +               ret = of_mdiobus_register(bus, dev_of_node(priv->dev));
> > +               if (ret) {
> > +                       dev_err(priv->dev, "mdiobus register err(%d)\n", ret);
> > +                       return ret;
> > +               }
> > +       } else {
> > +               /* Mask out all PHYs from auto probing. */
> > +               bus->phy_mask = ~0;
> > +               ret = mdiobus_register(bus);
> > +               if (ret) {
> > +                       dev_err(priv->dev, "mdiobus register err(%d)\n", ret);
> > +                       return ret;
> > +               }
> > +
> > +               priv->phydev = get_phy_device(priv->mii_bus, phy_addr, false);
> > +               if (IS_ERR(priv->phydev)) {
> > +                       ret = PTR_ERR(priv->phydev);
> > +                       dev_err(priv->dev, "get_phy_device err(%d)\n", ret);
> > +                       priv->phydev = NULL;
> > +                       return -ENODEV;
> > +               }
> > +
> > +               ret = phy_device_register(priv->phydev);
> > +               if (ret)
> > +                       dev_err(priv->dev,
> > +                               "phy_device_register err(%d)\n", ret);

You should unregister the mdio bus here.

> > +       }
> > +
> > +       return ret;
> > +}

  Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
