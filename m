From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv4 1/5] net: dsa: Support internal phy on 'cpu' port
Date: Mon, 22 Jan 2018 21:54:59 +0100
Message-ID: <20180122205459.GF2467@lunn.ch>
References: <20180116101958.19711-1-sebastian.reichel@collabora.co.uk>
 <20180116101958.19711-2-sebastian.reichel@collabora.co.uk>
 <09a9c406-85c1-0f84-4032-db243f825ca2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <09a9c406-85c1-0f84-4032-db243f825ca2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Ian Ray <ian.ray-JJi787mZWgc@public.gmane.org>, Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Note: there is still technically a misreprentation of how the PHY is
> "attached" to the network device. In your DTSes, you have to have the
> CPU port have a "phy-handle" to the internal PHY, while technically it
> should be the i210 which has a "phy-handle" property to that PHY, and
> even better, if the e1000e/idb drivers were PHYLIB capable, they could
> manage it directly.

Hi Florian

Err, i don't think i agree. But maybe i'm missunderstanding.

We have two back-to-back PHYs. I would expect the i210 MAC to have a
phy-handle pointing it its PHY. The CPU port would then point to the
internal switch PHY.

Or are you suggesting the i210 has two phy-handles, its own and the
switches?

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
