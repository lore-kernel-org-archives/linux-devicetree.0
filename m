From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv5 1/5] net: dsa: Support internal phy on 'cpu' port
Date: Tue, 23 Jan 2018 07:29:00 -0800
Message-ID: <64d5fcf0-6bee-b28a-c5b4-ad1868d74d9f@gmail.com>
References: <20180123150350.11031-1-sebastian.reichel@collabora.co.uk>
 <20180123150350.11031-2-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180123150350.11031-2-sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: Ian Ray <ian.ray-JJi787mZWgc@public.gmane.org>, Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-81qHHgoATdEGFh7si24rbyp2UmYkHbXO@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 01/23/2018 07:03 AM, Sebastian Reichel wrote:
> This adds support for enabling the internal PHY for a 'cpu' port.
> It has been tested on GE B850v3,  B650v3 and B450v3, which have a
> built-in MV88E6240 switch hardwired to a PCIe based network card.
> On these machines the internal PHY of the i210 network card and
> the Marvell switch are connected to each other and must be enabled
> for properly using the switch. While the i210 PHY will be enabled
> when the network interface is enabled, the switch's port is not
> exposed as network interface. Additionally the mv88e6xxx driver
> resets the chip during probe, so the PHY is disabled without this
> patch.

This looks good now, thanks for your patience Sebastian!

> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>

Reviewed-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
