From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: armada388-clearfog: number LAN ports properly
Date: Fri, 8 Jul 2016 17:26:16 +0200
Message-ID: <20160708152616.GF8426@lunn.ch>
References: <E1bLWIh-0001ZK-Ai@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1bLWIh-0001ZK-Ai-eh5Bv4kxaXIk46pC+1QYvQNdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 08, 2016 at 02:58:39PM +0100, Russell King wrote:
> Currently, the ports as seen from the rear number as:
> 
> 	eth0 sfp lan5 lan4 lan3 lan2 lan1 lan6
> 
> which is illogical - this came about because the rev 2.0 boards have the
> LEDs on the front for the DSA switch (lan5-1) reversed.  Rev 2.1 boards
> fixed the LED issue, and the Clearfog case numbers the lan ports
> increasing from left to right.
> 
> Maintaining this illogical numbering causes confusion, with reports that
> "my link isn't coming up" and "my connection negotiates 10base-Half"
> both of which are due to people thinking that the port next to the SFP
> is lan1.
> 
> Fix this by renumbering the ports to match people's expectations.
> 
> Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>

Reviewed-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

    Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
