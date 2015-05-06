From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v8 0/4] edac: Add APM X-Gene SoC memory controller EDAC
 driver
Date: Wed, 6 May 2015 20:29:00 +0200
Message-ID: <20150506182900.GI22949@pd.tnic>
References: <1430884947-16787-1-git-send-email-lho@apm.com>
 <2150970.xGYLhDU9BR@wuerfel>
 <CAPw-ZTkuZWNM9D_wJRfQq009KeL1coyYKXhqhWV+FWW6C=xRiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPw-ZTkuZWNM9D_wJRfQq009KeL1coyYKXhqhWV+FWW6C=xRiA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 06, 2015 at 11:12:20AM -0700, Loc Ho wrote:
> 1. Whether to have an single driver for APM EDAC or multiple instance
> of 4 different drivers. With single driver, it does not scale in the
> future when we add/remove memory controllers and CPU domains. This is

Why doesn't it scale? Please explain this to me more verbosely.

> also agreed by Rob Herring from review of the DTS nodes. For L3 and
> SoC EDAC, they are less of an issue as I don't see a situation that we
> would have multiple instances.
> 
> 2. With regard to the top level PCP interrupt, they are just for
> status and once configured, it will not be touch. Therefore, I keep
> the current implementation. With an single driver, there is no need to
> worry about read/modify/write as it will be guarded with an lock. For
> multiple instance, I am thinking that the xgene_edac_mc module will
> provide exported lock functions for the other drivers.

Doing this would be a very bad design and it would be a homegrown case
only for this driver. Then other ARM drivers will appear which will do
their own locking too. No no no. No ad-hoc hackery.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
