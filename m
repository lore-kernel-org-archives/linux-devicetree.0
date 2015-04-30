From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v7 3/5] Documentation: Add documentation for the APM X-Gene SoC EDAC DTS binding
Date: Thu, 30 Apr 2015 12:42:48 +0200
Message-ID: <10227049.9i19zDi2y3@wuerfel>
References: <1430259045-19012-1-git-send-email-lho@apm.com> <7128860.xHITr0VFap@wuerfel> <20150430094134.GD3488@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150430094134.GD3488-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 30 April 2015 11:41:34 Borislav Petkov wrote:
> But if those three vendors went and created an EDAC module each for
> their system, it would be a lot of repeated copy'pasting and bloat.
> 
> Now, the other dimension doesn't look better either:
> 
> xgene_edac_mc
> xgene_edac_mc-v2
> xgene_edac_l3
> xgene_edac-l2
> ...
> 
> Also, in both cases, if any of those drivers need to talk to each other
> or know of one another in any way, the situation becomes really funny as
> they need to create something ad-hoc each time.
> 

I've looked at the driver in a little more detail now, and found that
it is a weird conglomerate at the moment. Basically you have four
drivers in one file here, appended to one another, but not sharing
any common functions except the module_init() that registers the four
drivers. This is what Rob was referring to when he suggested splitting
it up into four files, and these would in total be smaller than the
common file (by being able to use module_platform_driver()).

However, there is another dimension to this, which supports your point
about making it one driver for the platform: The split into four drivers
is completely artificial, because all four use the same IRQs and
implement four separate interrupt handlers for it (using IRQF_SHARED),
each handling only the events they are interested in. Similarly, they
all access the same register set ("pcperror"), aside from having their
own separate registers, and they use the "syscon" framework to get to
the registers.  This seems to be an inferior design, as the pcperror
stuff apparently is the real EDAC block on the system and that should
have a device driver for itself, with proper interfaces. syscon in
contrast is designed for the case where you have a badly designed
IP block that has lots of registers for functions all over the place
for which no clear abstraction is possible.

There is also the "efuse" that is listed as "syscon" here, but should
really use a separate framework that has been under discussion for a
while.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
