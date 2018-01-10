From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [PATCH net, v3] of_mdio: avoid MDIO bus removal when a PHY is
 missing
Date: Wed, 10 Jan 2018 15:08:07 -0500 (EST)
Message-ID: <20180110.150807.1761534563120274845.davem@davemloft.net>
References: <1515501814-11517-1-git-send-email-madalin.bucur@nxp.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515501814-11517-1-git-send-email-madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: madalin.bucur-3arQi8VN3Tc@public.gmane.org
Cc: andrew-g2DYL2Zd6BY@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Date: Tue, 9 Jan 2018 14:43:34 +0200

> If one of the child devices is missing the of_mdiobus_register_phy()
> call will return -ENODEV. When a missing device is encountered the
> registration of the remaining PHYs is stopped and the MDIO bus will
> fail to register. Propagate all errors except ENODEV to avoid it.
> 
> Signed-off-by: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>

Applied.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
