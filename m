From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH v11 0/4] edac: Add APM X-Gene SoC EDAC driver
Date: Fri, 29 May 2015 13:18:47 -0700
Message-ID: <CAPw-ZTniFrC6o6eDCLjj7Gk_-C1=u+sPPdzucMX7D2DkwmEuAQ@mail.gmail.com>
References: <1432337580-3750-1-git-send-email-lho@apm.com>
	<20150529094654.GD31435@pd.tnic>
	<CAPw-ZTnLqx0KsQkmv++zQRQ7hroaKML1rWgVafisENam0J17Mg@mail.gmail.com>
	<20150529185926.GP31435@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150529185926.GP31435-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, May 29, 2015 at 11:59 AM, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org> wrote:
> On Fri, May 29, 2015 at 11:06:35AM -0700, Loc Ho wrote:
>> I pull this and got this error:
>>
>> /projects/svdc/P4sbSW/lho/xgene2/processor/git.lho/edac-next/drivers/edac/edac_stub.c:19:22:
>> fatal error: asm/edac.h: No such file or directory
>>  #include <asm/edac.h>
>>                       ^
>> compilation terminated.
>
> Aah, that arch-specific header is only for the atomic_scrub thing and
> arm64 doesn't have it.
>
> But that header is actually not really needed in that file.
>
> Does it build when you remove it?

It should because all I did to fix it was an touch on
"arch/arm64/include/asm/edac.h".

-Loc
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
