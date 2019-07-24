From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v1 1/4] enetc: Clean up local mdio bus allocation
Date: Wed, 24 Jul 2019 18:39:06 +0200
Message-ID: <20190724163906.GT25635@lunn.ch>
References: <1563979301-596-1-git-send-email-claudiu.manoil@nxp.com>
 <1563979301-596-2-git-send-email-claudiu.manoil@nxp.com>
 <20190724151803.GR25635@lunn.ch>
 <VI1PR04MB4880CD977A5D58DA0A7EE56696C60@VI1PR04MB4880.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <VI1PR04MB4880CD977A5D58DA0A7EE56696C60@VI1PR04MB4880.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Alexandru Marginean <alexandru.marginean@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> >All the horrible casts go away, the driver is structured like every
> >other driver, sparse is probably happy, etc.
> >
> 
> This looks more like a matter cosmetic preferences.  I mean, I didn't
> notice anything "horrible" in the code so far.

#define bus_to_enetc_regs(bus)  (struct enetc_mdio_regs __iomem *)((bus)->priv)

You should not need a cast here, bus->priv is a void *. But bus->priv
is being abused to hold a __iomem pointer.

enetc_wr_reg(&regs->mdio_cfg, mdio_cfg);

This is also rather odd, passing the address of something to an IO
operator? I also don't know the C standard well enough to know if it
is guaranteed that:

struct enetc_mdio_regs {
        u32     mdio_cfg;       /* MDIO configuration and status */
        u32     mdio_ctl;       /* MDIO control */
        u32     mdio_data;      /* MDIO data */
        u32     mdio_addr;      /* MDIO address */
};

actually works. On a 64bit system is the compiler allowed to put in
padding to keep the u32 64 bit aligned?

> I actually find it more
> ugly to define a new structure with only one element inside, like:
> struct enetc_mdio_priv {
>        struct enetc_hw *hw;
> }

One advantage of this is that struct enetc_hw correctly has all the
__iomem attributes. All the casts to __iomem go away, and sparse is
happy.

> Anyway, if others already did this in the kernel, what can I do?

Clean it up. Make the code more readable and easy to maintain.

      Andrew
