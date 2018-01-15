From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv2 1/5] net: dsa: Support internal phy on 'cpu' port
Date: Mon, 15 Jan 2018 16:38:42 +0100
Message-ID: <20180115153842.GF21450@lunn.ch>
References: <20180115121508.14544-1-sebastian.reichel@collabora.co.uk>
 <20180115121508.14544-2-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180115121508.14544-2-sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Ian Ray <ian.ray-JJi787mZWgc@public.gmane.org>, Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 15, 2018 at 01:15:04PM +0100, Sebastian Reichel wrote:
> This adds support for enabling the internal PHY for a 'cpu' port.
> It has been tested on GE B850v3,  B650v3 and B450v3, which have a
> built-in MV88E6240 switch connected to a PCIe based network card.
> Without this patch the link does not come up and no traffic can be
> routed through the switch.
> 
> The PHY interface, that is being used on the above test systems is
> part of the MV88E6240 and since mv88e6xxx driver resets the chip
> during probe, it is definitely disabled without this patch.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>

Hi Sebastian

I was not very happy about the original implementation. This is a bit
better, but i still think it needs improvement. The enum
PHY_INTERFACE_MODE_INTERNAL means the PHY is connected to the MAC
using something other than traditional MII. We don't use this for any
other of the PHYs inside the Marvell switch, or for any other vendors
switch which has internal PHYs, since they are connected by MII.

You also make the assumption that the PHY for the CPU port actually is
internal. It does not need to be. It could be an external PHY.

The key thing here is to know there is a PHY for the CPU port. The
standard way to represent that is to have a phy-handle. That
phy-handle also tells you which PHY it is, without making any
assumptions.

Please can you re-write this patch to look for a phy-handle in the cpu
node.

Thanks
	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
