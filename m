From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/9] ARM: dts: imx6qdl: remove the use of pingrp macros
Date: Tue, 28 Jan 2014 18:30:01 +0800
Message-ID: <20140128102959.GB20583@S2101-09.ap.freescale.net>
References: <1390668191-20289-1-git-send-email-shawn.guo@linaro.org>
 <1390668191-20289-2-git-send-email-shawn.guo@linaro.org>
 <20140127143745.GM15937@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140127143745.GM15937-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 27, 2014 at 02:37:45PM +0000, Russell King - ARM Linux wrote:
> On Sun, Jan 26, 2014 at 12:43:03AM +0800, Shawn Guo wrote:
> >  arch/arm/boot/dts/imx6dl-hummingboard.dts  |    5 +-
> >  arch/arm/boot/dts/imx6qdl-microsom.dtsi    |    5 +-
> 
> I've merged your changes here into my local copy of these just to reduce
> the conflicts - unfortunately, it's taken soo long to deal with the above
> that the cubox-i has now been released, which has prompted some
> reorganisation between the above two files.
> 
> I would much rather you dropped these two entirely, and let me push them
> upstream, rather than having some nasty conflicts which result from this.

Dropped hummingboard from my tree.

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
