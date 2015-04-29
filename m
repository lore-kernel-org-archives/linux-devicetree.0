From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 3/5] Documentation: Add documentation for the APM
 X-Gene SoC EDAC DTS binding
Date: Wed, 29 Apr 2015 18:02:14 -0500
Message-ID: <CAL_JsqL8UnDco14Z8H7ZcxS=fLNiYgSb6ivv=zzpVctiD0FptA@mail.gmail.com>
References: <1430259045-19012-1-git-send-email-lho@apm.com>
 <1430259045-19012-2-git-send-email-lho@apm.com> <1430259045-19012-3-git-send-email-lho@apm.com>
 <1430259045-19012-4-git-send-email-lho@apm.com> <CAL_Jsq+nhPUxHxrStB9cdy1YzE7tVPFVR1MrWq3Bz-JUa=3Rvg@mail.gmail.com>
 <CAPw-ZTnLR10Zr_p8L3-1nBZ+jKE1HCwERDmO=S5as2GLqime3A@mail.gmail.com>
 <20150429214924.GH5498@pd.tnic> <CAPw-ZTmoash48S3F8kBxsovD0mEPYBO8=XDaJ2peDu60yaGrZQ@mail.gmail.com>
 <20150429220830.GI5498@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150429220830.GI5498-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 29, 2015 at 5:08 PM, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org> wrote:
> On Wed, Apr 29, 2015 at 02:56:25PM -0700, Loc Ho wrote:
>> Hi,
>>
>> >> > Similar comments for the rest. I would define memory controller
>> >> > bindings and EDAC driver, then worry about the rest.
>> >>
>> >> Okay.. As comment in following emails, I will break up the driver into
>> >> multiple drivers and focus only on the memory controller driver first.
>> >
>> > Please no multiple EDAC drivers. Or do you mean something else here?
>>
>> We will have the following:
>>
>> xgene-edac-mc.c
>> xgene-edac-pmd.c
>> xgene-edac-l3.c
>> xgene-edac-soc.c
>>
>> Or what would you suggest.
>
> xgene-edac.c
>
> This granularity is insane. On x86 we have single EDAC drivers for
> multiple CPU families and platforms.

It may make sense on x86 as there are only 2 vendors, some level of
architecture definition at least within a vendor, some commonality
among generations, and some amount of abstraction by ACPI. For the
most part none of that applies to ARM based systems (although that is
changing).

> You can start carving out stuff when this is absolutely needed, i.e.
> when an IP block is in multiple hw incarnations. And even then I'd be
> sceptical and would really want to know whether it is even worth it to
> have an EDAC module for it.

One platform device corresponds to 1 DT node which corresponds to 1
h/w block. This is a well defined pattern throughout the kernel. There
are cases of grouping, but those are places where we need coordination
between h/w blocks such as audio and display and that is still
multiple platform devices with a single parent device. If you want
this all in 1 file or 1 module that is fine. I think that it is silly
to group otherwise independent things together and generally not what
we do anywhere else in the kernel. They all likely have different
capabilities and control mechanisms.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
