From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 3/4] edac: Add APM X-Gene SoC EDAC driver
Date: Thu, 19 Jun 2014 00:31:12 +0200
Message-ID: <20140618223112.GM24024@pd.tnic>
References: <1401761660-11515-1-git-send-email-lho@apm.com>
 <1401761660-11515-2-git-send-email-lho@apm.com>
 <1401761660-11515-3-git-send-email-lho@apm.com>
 <1401761660-11515-4-git-send-email-lho@apm.com>
 <20140618221046.GL24024@pd.tnic>
 <CAPw-ZT=k=27NY5OgV2Tp4gsjf3wSTmgN3FM46qJq8HEQWHTYDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPw-ZT=k=27NY5OgV2Tp4gsjf3wSTmgN3FM46qJq8HEQWHTYDw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 18, 2014 at 03:26:12PM -0700, Loc Ho wrote:
> One more thing, if you going to pull this in, please use version 4 as
> that fixes the PMD (CPU L1/L2) error report and clearing.

Ah, I have a v4 too in my mbox. cool.

Please ping me when the atomic scrub lands in some maintainers tree so
that we can track it/point to it.

> Should I ping a device tree maintainer? If so, who would that be?

$ ./scripts/get_maintainer.pl -f Documentation/devicetree/
Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> (maintainer:OPEN FIRMWARE AND...)
Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org> (maintainer:OPEN FIRMWARE AND...)
Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> (maintainer:OPEN FIRMWARE AND...)
Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org> (maintainer:OPEN FIRMWARE AND...)
Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> (maintainer:OPEN FIRMWARE AND...)
Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> (maintainer:DOCUMENTATION)
devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:OPEN FIRMWARE AND...)
linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:DOCUMENTATION)
linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list)

Thanks.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
