From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 8/8] arm: orion5x: Configure WNR854T ethernet PHY LEDs
Date: Fri, 26 Aug 2016 17:05:09 +0200
Message-ID: <20160826150509.GM25046@lunn.ch>
References: <1468679348-10522-1-git-send-email-jm@lentin.co.uk>
 <1472203264-21089-1-git-send-email-jm@lentin.co.uk>
 <1472203264-21089-9-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472203264-21089-9-git-send-email-jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 26, 2016 at 10:21:04AM +0100, Jamie Lentin wrote:
> The default PHY configuration disables most of the LEDs. The following
> configures the ethernet activity LEDs as Netgear intended.
> 
> Signed-off-by: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
> ---
> Andrew, note that the slave mdio bus is called "mdio", however there is
> an example in bindings/net/dsa/dsa.txt using "mdio-bus". Is this a
> mismatch to fix?

Hi Jamie

Yes, the documentation should match reality.

Unfortunately, there is a bit of a mess here. Different drivers have
different names for this node in device tree. And since device tree is
supposed to be stable, we cannot change them all to be the same.

I did intend to write some documentation defining what best practices
are for mdio busses, but never got around to it.

    Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
