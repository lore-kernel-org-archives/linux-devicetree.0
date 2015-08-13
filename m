From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH v3 1/4] edac: Add an function to retrieve the EDAC debugfs node
Date: Wed, 12 Aug 2015 21:30:58 -0700
Message-ID: <CAPw-ZTkfAxqG6HQHU3WomrqRwXa+jyTWCg=ns1HKC323ds1yug@mail.gmail.com>
References: <1439326077-25507-1-git-send-email-lho@apm.com>
	<1439326077-25507-2-git-send-email-lho@apm.com>
	<20150812101219.GC14011@nazgul.tnic>
	<20150812104954.GD14011@nazgul.tnic>
	<CAPw-ZT=AFtyLt4CNGBzLZcdPr-ekJpQxKA4Y_AiDzqKfhF1-=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPw-ZT=AFtyLt4CNGBzLZcdPr-ekJpQxKA4Y_AiDzqKfhF1-=w@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

>
>>> EXPORT_SYMBOL_GPL() if it is going to be used by modules.
>>
>> Better yet, move it to the header.
>
> I can't move it completely to the header and make it static. It will
> generate a lot of compiler warning as it isn't used by other modules.
> I will add EXPORT_SYMBOL_GPL() in the next version.

Okay... The 'inline' helps with the compiler warning. If I move all to
header file with 'static inline' and wrapper around CONFIG_EDAC_DEBUG,
don't I need to export and declare the variable 'edac_debugfs'? Are
you okay with export this variable? Or, it is static inline if not
defined CONFIG_EDAC_DEBUG. Otherwise, just  an extern header function
and export it as well?

-Loc
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
