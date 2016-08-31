From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 6/8] arm: orion5x: Add DT-based support for Netgear
 WNR854T
Date: Wed, 31 Aug 2016 10:26:25 -0500
Message-ID: <20160831152625.GA25415@rob-hp-laptop>
References: <1468679348-10522-1-git-send-email-jm@lentin.co.uk>
 <1472203264-21089-1-git-send-email-jm@lentin.co.uk>
 <1472203264-21089-7-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472203264-21089-7-git-send-email-jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 26, 2016 at 10:21:02AM +0100, Jamie Lentin wrote:
> This is a router based on the mv88f5181 chipset.
> 
> http://www.netgear.com/support/product/WNR854T.aspx
> http://wiki.openwrt.org/toh/netgear/wnr854t
> 
> Signed-off-by: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
> ---
>  .../bindings/arm/marvell/marvell,orion5x.txt       |   1 +
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/orion5x-netgear-wnr854t.dts      | 212 +++++++++++++++++++++

For the bindings,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  arch/arm/mach-orion5x/Kconfig                      |   6 +
>  arch/arm/mach-orion5x/Makefile                     |   1 +
>  arch/arm/mach-orion5x/board-wnr854t.c              |  78 ++++++++

This is all PCI setup it appears. The PCI driver should be converted to 
a modern PCI host driver before it is supported with DT IMO.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
