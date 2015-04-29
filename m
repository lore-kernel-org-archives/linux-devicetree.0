From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH v7 1/5] arm64: Enable EDAC on ARM64
Date: Wed, 29 Apr 2015 14:39:27 -0700
Message-ID: <CAPw-ZTn0m1h=RW5E+CECYn6Ujp-O1E4ckynCyGSGG238rqYiAQ@mail.gmail.com>
References: <1430259045-19012-1-git-send-email-lho@apm.com>
	<1430259045-19012-2-git-send-email-lho@apm.com>
	<20150429144031.GB18867@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150429144031.GB18867-M2fw3Uu6cmfZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

>> +/*
>> + * ECC atomic, DMA, SMP and interrupt safe scrub function.
>> + * Implements the per arch atomic_scrub() that EDAC use for software
>> + * ECC scrubbing.  It reads memory and then writes back the original
>> + * value, allowing the hardware to detect and correct memory errors.
>> + */
>
> The comment here is misleading since the function doesn't do anything.

Okay.. I will leave only this line:

ECC atomic, DMA, SMP and interrupt safe scrub function.

>> +static inline void atomic_scrub(void *va, u32 size)
>> +{
>> +     /* Stub function for now until an ARM64 HW has a way to test it. */
>> +}
>
> Can we have a WARN_ONCE() here?
>
> We had some discussions last year, restarted this year and the
> conclusion was to leave this function as a no-op since it is not safe in
> the presence of KVM or non-coherent DMA:
>
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-March/326986.html

I will leave WARN_ONCE.

-Loc
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
