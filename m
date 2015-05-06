From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v8 0/4] edac: Add APM X-Gene SoC memory controller EDAC driver
Date: Wed, 06 May 2015 10:52:26 +0200
Message-ID: <2150970.xGYLhDU9BR@wuerfel>
References: <1430884947-16787-1-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430884947-16787-1-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 05 May 2015 22:02:22 Loc Ho wrote:
> 
> v8:
> * Change ASM_EDAC_H to __ASM_EDAC_H in file edac.h
> * Add WARN_ONCE in stub function atomic_scrub
> * Update DTS binding documentation (with only memory controller node)
> * Temporary remove L1/L2, L3, and SoC driver code and update memory driver
>   code accordingly
> 
> 

I don't see how this is helping. You still use a syscon reference for the
pcp node after I told you not to, and you are completely leaving out the
other nodes, which makes it impossible to tell what your plan is for those.

Please come up with a plan that makes it possible to have proper support
for all the devices in the future. Leaving out bits because you know that
adding them later will be hard is not a good solution: if you screw up
the design now, adding them later will be even harder.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
