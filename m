From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/3] edac: Add L3/SoC support to the APM X-Gene SoC EDAC
 driver
Date: Mon, 1 Jun 2015 20:31:14 +0200
Message-ID: <20150601183114.GE10169@pd.tnic>
References: <1432937075-16558-1-git-send-email-lho@apm.com>
 <1432937075-16558-2-git-send-email-lho@apm.com>
 <1432937075-16558-3-git-send-email-lho@apm.com>
 <1979546.jtvJnZomID@wuerfel>
 <CAPw-ZTm+1hfh4b-opq=HQDek-wc4A4nT=B6DcuyUBWsm8a-ZbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPw-ZTm+1hfh4b-opq=HQDek-wc4A4nT=B6DcuyUBWsm8a-ZbQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 01, 2015 at 10:46:55AM -0700, Loc Ho wrote:
> You are right... Let me just prints the error code instead. Anyone who
> care will have to do post processing.

Don't forget about the usability of the driver. If a user has to go
open manuals when an error happens, you could just as well report naked
register values and have a tool decode them.

And this strategy (mcelog) turned out to be a real PITA, IMO.

> Future or existent next generation may re-define them.

You could easily have a strings array of per-family or per-soc error
descriptions. For an example, take a look at drivers/edac/mce_amd.c
which decodes MCEs on all relevant AMD machines. This is much more
user-friendly than dumping register values which most people have no
idea of where to start looking (and they don't really need to).

HTH.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
