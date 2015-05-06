From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v8 0/4] edac: Add APM X-Gene SoC memory controller EDAC
 driver
Date: Wed, 6 May 2015 10:41:43 +0200
Message-ID: <20150506084143.GA22949@pd.tnic>
References: <1430884947-16787-1-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430884947-16787-1-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 05, 2015 at 10:02:22PM -0600, Loc Ho wrote:
> This patch adds support for the APM X-Gene SoC memory controller EDAC driver
> for DT.
> 
> v8:
> * Change ASM_EDAC_H to __ASM_EDAC_H in file edac.h
> * Add WARN_ONCE in stub function atomic_scrub
> * Update DTS binding documentation (with only memory controller node)
> * Temporary remove L1/L2, L3, and SoC driver code and update memory driver
>   code accordingly

What does that mean exactly? They'll get added later?

It is called now xgene_edac_mc.c. Am I to expect more
xgene_edac_<functional_unit>.c submissions? What happened to building
everything around the shared IRQ handler?

Also, I see this SOB chain in some of the patches:

Signed-off-by: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>

and it is not clear who did what, from looking at the chain.

If you both authored the patches, you can write

Originally-by: Feng
[ Loc: did this and that]
Signed-off-by: Loc

for example.

See Documentation/SubmittingPatches for more info.

Thanks.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
