From: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/7] ARM: dts: imx6ull: add additional pinfunc defines
 for i.MX 6ULL
Date: Tue, 9 Jan 2018 17:30:15 +0800
Message-ID: <20180109093015.GC26312@b29396-OptiPlex-7040>
References: <20180102164223.15230-1-stefan@agner.ch>
 <20180102164223.15230-3-stefan@agner.ch>
 <20180105164930.qomk75eo7vzyglvn@rob-hp-laptop>
 <b183c2a38596cd3f3726777c79e027f9@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b183c2a38596cd3f3726777c79e027f9-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>, linux-imx-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jan 07, 2018 at 10:52:39AM +0100, Stefan Agner wrote:
> On 2018-01-05 17:49, Rob Herring wrote:
> > On Tue, Jan 02, 2018 at 05:42:19PM +0100, Stefan Agner wrote:
> >> From: Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>
> >>
> >> On i.MX 6ULL, the pin MUX and CTRL register of BOOT_MODEx and TAMPERx
> >> pins are available through IOMUXC_SNVS. Add additional pinfunc defines.
> >>
> >> Signed-off-by: Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>
> >> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> >> ---
> >>  arch/arm/boot/dts/imx6ull-pinfunc-snvs.h | 29 +++++++++++++++++++++++++++++
> >>  arch/arm/boot/dts/imx6ull.dtsi           |  1 +
> >>  2 files changed, 30 insertions(+)
> >>  create mode 100644 arch/arm/boot/dts/imx6ull-pinfunc-snvs.h
> >>
> >> diff --git a/arch/arm/boot/dts/imx6ull-pinfunc-snvs.h b/arch/arm/boot/dts/imx6ull-pinfunc-snvs.h
> >> new file mode 100644
> >> index 000000000000..da3f412e4269
> >> --- /dev/null
> >> +++ b/arch/arm/boot/dts/imx6ull-pinfunc-snvs.h
> >> @@ -0,0 +1,29 @@
> >> +/*
> >> + * Copyright (C) 2016 Freescale Semiconductor, Inc.
> > 
> > It's 2018 now.
> > 
> 
> I don't think you are supposed to chance copyright year unless you
> change it significantly.
> 
> At least that article suggests so:
> https://www.copyrightlaws.com/copyright-notice-year/
> 
> I took that patch from the downstream NXP kernel, so I guess 2016 was
> the year of first publication...
> 

Can you help add below copyright if you keep NXP sign-off as Author?
Then you don't need delete the old one.

Copyright 2017 NXP.

And SPDX mentioned by Rob.

Otherwise,
Acked-by: Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>

Regards
Dong Aisheng

> >> + *
> >> + * This program is free software; you can redistribute it and/or modify
> >> + * it under the terms of the GNU General Public License version 2 as
> >> + * published by the Free Software Foundation.
> > 
> > Use SPDX. With that,
> 
> Agreed.
> 
> > 
> > Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> --
> Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
