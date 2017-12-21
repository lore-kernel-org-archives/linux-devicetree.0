From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: vf610-zii-dev-rev-b: add PHYs for switch2
Date: Thu, 21 Dec 2017 10:01:47 +0100
Message-ID: <20171221090147.GB6683@lunn.ch>
References: <20171220231108.GJ10595@n2100.armlinux.org.uk>
 <E1eRnWl-0006VL-TL@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1eRnWl-0006VL-TL-eh5Bv4kxaXIk46pC+1QYvQNdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 20, 2017 at 11:11:55PM +0000, Russell King wrote:
> Switch 2 has an 88e1545 PHY behind it, which is a quad PHY.  Only the
> first three PHYs are used, the remaining PHY is unused.  When we wire
> up the SFF sockets in a later commit, the omission of this causes the
> fourth PHY to be used for port 3.  Specifying the PHYs in DT avoids
> the auto-probing of the bus, and discovery of this PHY.
> 
> Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>

Reviewed-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

    Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
