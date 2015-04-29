From: Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 1/5] arm64: Enable EDAC on ARM64
Date: Wed, 29 Apr 2015 10:46:51 -0400
Message-ID: <5540EEDB.9010002@redhat.com>
References: <1430259045-19012-1-git-send-email-lho@apm.com> <1430259045-19012-2-git-send-email-lho@apm.com> <20150429144031.GB18867@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150429144031.GB18867-M2fw3Uu6cmfZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/29/2015 10:40 AM, Catalin Marinas wrote:
> On Tue, Apr 28, 2015 at 04:10:41PM -0600, Loc Ho wrote:

>> +/*
>> + * ECC atomic, DMA, SMP and interrupt safe scrub function.
>> + * Implements the per arch atomic_scrub() that EDAC use for software
>> + * ECC scrubbing.  It reads memory and then writes back the original
>> + * value, allowing the hardware to detect and correct memory errors.
>> + */
> 
> The comment here is misleading since the function doesn't do anything.

Well, on the other hand, it is "safe" (joke) ;)

Suggest a documented few line summary of the status from earlier this
year/last year be there instead. Essentially atomic scrubbing is only
safe when you're dealing with a fully coherent system. We captured
various examples of things that could go wrong in the thread link.

> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-March/326986.html

Thanks Loc and team.

Jon.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
