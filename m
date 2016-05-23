From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/4] documentation: Add secure monitor binding
 documentation
Date: Mon, 23 May 2016 18:59:31 +0200
Message-ID: <20160523165931.GA31299@mephisto>
References: <1464021024-29380-1-git-send-email-carlo@caione.org>
 <1464021024-29380-5-git-send-email-carlo@caione.org>
 <20160523163815.GE4976@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160523163815.GE4976@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 23/05/16 17:38, Mark Rutland wrote:
> Hi,
> 
> Minor nit, but please put the binding earlier in the series than the
> code implementing it, as per
> Documentation/devicetree/bindings/submitting-patches.txt
> 
> This makes it possible to review a series in a linear fashion.

I'll do. Thanks for the pointer.

[...]
> > +
> > +Required properties for the secure monitor node:
> > +- compatible: Should be "amlogic,meson-sm"
> > +- amlogic,sm-cmd-input-base: SMC32 function identifier to read the physical
> > +                             address of the input buffer
> > +- amlogic,sm-cmd-output-base: SMC32 function identifier to read the physical
> > +                              address of the output buffer
> 
> Do the IDs for these actually differ per board?

I expect these to differ per SoC (GXBB in this case), not per board. The
driver is generic enough to be (hopefully) used for several SoCs just
changing the related header file that defines the SCM commands.

> Are some functions simply not implemented on some boards?

I don't think this is possible.

[...]
> > +
> > +Example of the node using the secure monitor:
> > +
> > +	#include <dt-bindings/firmware/meson-gxbb-sm.h>
> > +
> > +	...
> > +
> > +	efuse: efuse {
> > +		compatible = "amlogic,meson-gxbb-efuse";
> > +		secure-monitor = <&sm>;
> > +		amlogic,sm-cmd-read-efuse = <SM_EFUSE_READ>;
> > +		amlogic,sm-cmd-max-efuse = <SM_EFUSE_USER_MAX>;
> 
> Likewise for these?

AFAIK the secure monitor code and related commands are SoC specific.

Thanks,

-- 
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
