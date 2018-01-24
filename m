From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [PATCHv5 0/5] GEHC Bx50 Switch Support
Date: Tue, 23 Jan 2018 19:23:00 -0500 (EST)
Message-ID: <20180123.192300.998104741632421215.davem@davemloft.net>
References: <20180123150350.11031-1-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180123150350.11031-1-sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org
Cc: andrew-g2DYL2Zd6BY@public.gmane.org, vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, ian.ray-JJi787mZWgc@public.gmane.org, nandor.han-JJi787mZWgc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-81qHHgoATdEGFh7si24rbyp2UmYkHbXO@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Date: Tue, 23 Jan 2018 16:03:45 +0100

> This adds support for the internal switch found in GE Healthcare
> B450v3, B650v3 and B850v3. All devices use a GPIO bitbanged MDIO
> bus to communicate with the switch and a PCIe based network card
> for exchanging network data. The cpu network data link requires,
> that the switch's internal phy interface is enabled, so support
> for that is added by the first patch in this series.
> 
> The patch series is based on v4.15-rc8.

Series applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
