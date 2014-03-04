From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v3 3/4] ARM: mvebu: move DT Dove to MVEBU
Date: Mon, 3 Mar 2014 23:29:42 -0500
Message-ID: <20140304042942.GK1872@titan.lakedaemon.net>
References: <1393538613-28293-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1393663178-22120-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393663178-22120-1-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Mar 01, 2014 at 09:39:38AM +0100, Sebastian Hesselbarth wrote:
> With all the DT support preparation done, we are able to move Dove
> to MVEBU easily. Legacy non-DT mach-dove is left untouched to rot
> for a while before removal.
> 
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Changelog:
> v1->v2:
> - just rename CONFIG_ARCH_DOVE to CONFIG_MACH_DOVE in dts/Makefile
>   (Suggested by Jason Cooper)
> v2->v3:
> - dropped drivers/phy/Kconfig change, which is now an individual
>   patch sent to Kishon.
> 
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  arch/arm/boot/dts/Makefile    |  2 +-
>  arch/arm/mach-dove/Kconfig    | 12 ------------
>  arch/arm/mach-dove/Makefile   |  1 -
>  arch/arm/mach-dove/board-dt.c | 43 -------------------------------------------
>  arch/arm/mach-mvebu/Kconfig   | 12 ++++++++++++
>  arch/arm/mach-mvebu/Makefile  |  1 +
>  arch/arm/mach-mvebu/dove.c    | 39 +++++++++++++++++++++++++++++++++++++++
>  7 files changed, 53 insertions(+), 57 deletions(-)
>  delete mode 100644 arch/arm/mach-dove/board-dt.c
>  create mode 100644 arch/arm/mach-mvebu/dove.c

We'll see how it goes!

Applied to mvebu/soc

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
