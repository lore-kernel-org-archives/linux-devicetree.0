From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 2/3] edac: Add L3/SoC support to the APM X-Gene SoC
 EDAC driver
Date: Thu, 30 Jul 2015 06:31:48 +0200
Message-ID: <20150730043148.GC7209@nazgul.tnic>
References: <1437808063-17592-1-git-send-email-lho@apm.com>
 <1437808063-17592-2-git-send-email-lho@apm.com>
 <1437808063-17592-3-git-send-email-lho@apm.com>
 <20150729142941.GC17367@nazgul.tnic>
 <CAPw-ZTkZ7q8PUWydFad5TXrhcY6YBRjdVvz+SR+LV4sOLDKkEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPw-ZTkZ7q8PUWydFad5TXrhcY6YBRjdVvz+SR+LV4sOLDKkEg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 29, 2015 at 04:39:10PM -0700, Loc Ho wrote:
> Debug folder node shows up at /sys/kernel/debug/<file here> while the
> MC debug node shows up at /sys/kernel/debug/edac where <file here> is
> the driver node name. It would be better if everything shows up at
> /sys/kernel/debug/edac. For this to happen, I need EDAC core change to
> provide an parent node.

Sure, feel free to add accessors for edac_debugfs from
drivers/edac/edac_mc_sysfs.c which edac drivers can call and thus
receive the top-level debugfs node.

For that, you can put all those accessor prototypes into a
drivers/edac/edac-internal.h header which should be included only by
edac drivers.

> No... each EDAC instance has its own context as we allocated via
> function edac_device_alloc_ctl_info. Per type of instance will use the
> same type function.

So you have multiple instances running on the system? I don't think
anyone has audited the edac core and whether it can actually handle
that...

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
