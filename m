From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv2 2/3] net: socionext: Add Synquacer NetSec driver
Date: Tue, 12 Dec 2017 21:48:11 +0100
Message-ID: <20171212204811.GD1523@lunn.ch>
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

> > +static int netsec_mac_update_to_phy_state(struct netsec_priv *priv)
> > +{
> > +       struct phy_device *phydev = priv->ndev->phydev;
> > +       u32 value = 0;
> > +
> > +       value = phydev->duplex ? NETSEC_GMAC_MCR_REG_FULL_DUPLEX_COMMON :
> > +                                NETSEC_GMAC_MCR_REG_HALF_DUPLEX_COMMON;
> > +
> > +       if (phydev->speed != SPEED_1000)
> > +               value |= NETSEC_MCR_PS;
> > +
> > +       if (priv->phy_interface != PHY_INTERFACE_MODE_GMII &&
> > +           phydev->speed == SPEED_100)
> > +               value |= NETSEC_GMAC_MCR_REG_FES;
> > +
> > +       value |= NETSEC_GMAC_MCR_REG_CST | NETSEC_GMAC_MCR_REG_JE;
> > +
> > +       if (priv->phy_interface == PHY_INTERFACE_MODE_RGMII)
> > +               value |= NETSEC_GMAC_MCR_REG_IBN;

phy_interface_mode_is_rgmii() ??

      Andrew

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
