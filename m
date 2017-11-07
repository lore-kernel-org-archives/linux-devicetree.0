From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: add phy-reset property for rk3066a-rayeager
 emac
Date: Tue, 7 Nov 2017 16:59:47 +0100
Message-ID: <20171107155947.GC18410@lunn.ch>
References: <1510022959-19440-1-git-send-email-zyw@rock-chips.com>
 <e6f2393e-cb3b-9006-d0f5-6b30fd2a5192@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e6f2393e-cb3b-9006-d0f5-6b30fd2a5192-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> As a side question, which is mainly addressed to Sergei and Roger,
> I don't quite understand why PHY properties were initially added to
> MAC/MDIO bus device tree nodes, in my opinion they must be moved under
> PHY device tree nodes.

If you look at the implementation, they are not actually PHY
properties. They are MDIO properties. It is the MDIO driver using them
to perform an 'MDIO bus reset'. The property names are wrong.

The device tree structure could be better. It mixes the MAC and the
MDIO properties in the same node. It would of been better to have
separate nodes. 

The MDIO core now has equivalent functionality. So yes, it would be
better to use the generic MDIO properties, not these driver
properties.

	 Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
