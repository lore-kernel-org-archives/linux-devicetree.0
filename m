From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] edac: xgene: Fix possible sprintf overflow issue
Date: Sat, 26 Sep 2015 10:38:47 +0200
Message-ID: <20150926083847.GA19534@pd.tnic>
References: <1443116287-11752-1-git-send-email-lho@apm.com>
 <20150925134551.GE3568@pd.tnic>
 <CAPw-ZTmYEx9o39Xr_4wyQd_ZNhpQv6fmjsbmzw7J27+i2nADqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPw-ZTmYEx9o39Xr_4wyQd_ZNhpQv6fmjsbmzw7J27+i2nADqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-edac <linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 25, 2015 at 10:52:23AM -0700, Loc Ho wrote:
> Thanks you... Next I would like to get the ACPI APEI supported. But
> unlike x86 which as NMI interface, APM hardware don't support this NMI
> interface. In order to make this works, we need an method to trigger
> the OS to indicate that the APEI table is available. For this, we are
> thinking about writing an separate APEI driver that wires up the IRQ
> to trigger the OS. Before we get going with this, I would like to run
> by you to see if you have any suggestion?

Well, AFAIR, there are efforts going on already for this on ARM64:

https://lkml.kernel.org/r/1439555753-11974-1-git-send-email-fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org

Maybe test those first and possibly extend...

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
