From: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv4 2/3] net: socionext: Add Synquacer NetSec driver
Date: Sat, 23 Dec 2017 10:39:19 +0000
Message-ID: <CAKv+Gu8xP5U-sD=CorZf4o_JuyNDhnRAmLs-wmAVWLsOO+Hhuw@mail.gmail.com>
References: <1514007876-16617-1-git-send-email-jassisinghbrar@gmail.com> <1514007928-16726-1-git-send-email-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1514007928-16726-1-git-send-email-jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "<netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>" <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Arnd Bergmann <arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 23 December 2017 at 05:45,  <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> This driver adds support for Socionext "netsec" IP Gigabit
> Ethernet + PHY IP used in the Synquacer SC2A11 SoC.
>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/net/ethernet/Kconfig            |    1 +
>  drivers/net/ethernet/Makefile           |    1 +
>  drivers/net/ethernet/socionext/Kconfig  |   29 +
>  drivers/net/ethernet/socionext/Makefile |    1 +
>  drivers/net/ethernet/socionext/netsec.c | 1844 +++++++++++++++++++++++++++++++
>  5 files changed, 1876 insertions(+)
>  create mode 100644 drivers/net/ethernet/socionext/Kconfig
>  create mode 100644 drivers/net/ethernet/socionext/Makefile
>  create mode 100644 drivers/net/ethernet/socionext/netsec.c
>
...
> diff --git a/drivers/net/ethernet/socionext/netsec.c b/drivers/net/ethernet/socionext/netsec.c
> new file mode 100644
> index 0000000..6af047b
> --- /dev/null
> +++ b/drivers/net/ethernet/socionext/netsec.c
...
> +static int netsec_netdev_load_ucode_region(struct netsec_priv *priv, u32 reg,
> +                                          u32 addr_h, u32 addr_l, u32 size)
> +{
> +       u64 base = (u64)addr_h << 32 | addr_l;
> +       void __iomem *ucode;
> +       u32 i;
> +
> +       ucode = ioremap(base, size * sizeof(u32));
> +       if (!ucode)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < size; i++)
> +               netsec_write(priv, reg, readl(ucode + i));
> +

This is incorrect. The microcode is written one u32 word at a time,
and indexing ucode like this results in byte indexing, not u32
indexing.

I changed the ucode declaration locally to

u32 __iomem *ucode;

and now everything works fine again.


> +       iounmap(ucode);
> +       return 0;
> +}
> +
...
> +static int netsec_register_mdio(struct netsec_priv *priv, u32 phy_addr)
> +{
> +       struct mii_bus *bus;
> +       int ret;
> +
> +       bus = devm_mdiobus_alloc(priv->dev);
> +       if (!bus)
> +               return -ENOMEM;
> +
> +       snprintf(bus->id, MII_BUS_ID_SIZE, "%s", dev_name(priv->dev));
> +       bus->priv = priv;
> +       bus->name = "SNI NETSEC MDIO";
> +       bus->read = netsec_phy_read;
> +       bus->write = netsec_phy_write;
> +       bus->parent = priv->dev;
> +       priv->mii_bus = bus;
> +
> +       if (dev_of_node(priv->dev)) {
> +               struct device_node *mdio_node, *parent = dev_of_node(priv->dev);
> +
> +               mdio_node = of_get_child_by_name(parent, "mdio");
> +               if (mdio_node) {
> +                       parent = mdio_node;
> +               } else {
> +                       /* older f/w doesn't populate the mdio subnode,
> +                        * allow relaxed upgrade of f/w in due time.
> +                        */
> +                       dev_err(priv->dev, "Upgrade f/w for mdio subnode!\n");

I wouldn't mind if you dropped this fallback altogether, and would
simply stick with the new binding only. However, if you prefer to keep
it, could you change this to dev_info()? It is not really an error
condition, and dev_err/dev_warns have the annoying tendency to pierce
through 'quiet' boot splashes.

> +               }
> +
> +               ret = of_mdiobus_register(bus, parent);
> +               of_node_put(mdio_node);
> +
> +               if (ret) {
> +                       dev_err(priv->dev, "mdiobus register err(%d)\n", ret);
> +                       return ret;
> +               }
> +       } else {
> +               /* Mask out all PHYs from auto probing. */
> +               bus->phy_mask = ~0;
> +               ret = mdiobus_register(bus);
> +               if (ret) {
> +                       dev_err(priv->dev, "mdiobus register err(%d)\n", ret);
> +                       return ret;
> +               }
> +
> +               priv->phydev = get_phy_device(bus, phy_addr, false);
> +               if (IS_ERR(priv->phydev)) {
> +                       ret = PTR_ERR(priv->phydev);
> +                       dev_err(priv->dev, "get_phy_device err(%d)\n", ret);
> +                       priv->phydev = NULL;
> +                       return -ENODEV;
> +               }
> +
> +               ret = phy_device_register(priv->phydev);
> +               if (ret) {
> +                       mdiobus_unregister(bus);
> +                       dev_err(priv->dev,
> +                               "phy_device_register err(%d)\n", ret);
> +               }
> +       }
> +
> +       return ret;
> +}
> +
...

Thanks,
Ard.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
