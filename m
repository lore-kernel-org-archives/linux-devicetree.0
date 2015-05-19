From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v10 1/5] arm64: Enable EDAC on ARM64
Date: Tue, 19 May 2015 22:33:36 +0200
Message-ID: <20150519203336.GP4641@pd.tnic>
References: <1431991481-25684-1-git-send-email-lho@apm.com>
 <1431991481-25684-2-git-send-email-lho@apm.com>
 <20150519170308.GL4641@pd.tnic>
 <CAPw-ZT=mTpt_vz+e=rM5ywK8feNKkJQrpEWg=noRCziJ0840TQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPw-ZT=mTpt_vz+e=rM5ywK8feNKkJQrpEWg=noRCziJ0840TQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 19, 2015 at 12:57:32PM -0700, Loc Ho wrote:
> This was discussed here
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-March/326986.html.
> Without this, it will have compiler error as this function is called
> by.function edac_mc_scrub_block in file drivers/edac/edac_mc.c.

Argh, that's just silly. We should have a __weak atomic_scrub() in the
edac core which arches can override but not have to supply a dummy just
because...

I'll try to hack up something later.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
