From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dove: drop pinctrl PMU reg property
Date: Thu, 6 Mar 2014 15:15:10 -0500
Message-ID: <20140306201510.GJ1872@titan.lakedaemon.net>
References: <1393977790-29110-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1393977790-29110-2-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393977790-29110-2-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 05, 2014 at 01:03:08AM +0100, Sebastian Hesselbarth wrote:
> Marvell Dove's pinctrl does require some PMU regs for muxing PMU
> functions to MPP pins. Recently, a discussion started about consolidating
> Power Management Unit (PMU) into a single DT node. As we don't want
> anymore DT ABI in the way, drop the corresponding reg property from
> pinctrl node now. The driver will derive the registers from existing
> reg properties.
> 
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> 
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org> 
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> 
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org> 
> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> 
> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> 
> Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> 
> Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org 
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org 
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  arch/arm/boot/dts/dove.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to mvebu/dt

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
