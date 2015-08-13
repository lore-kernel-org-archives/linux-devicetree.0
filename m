From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH v3 3/4] edac: Add L3/SoC EDAC support to the APM X-Gene
 SoC EDAC driver
Date: Wed, 12 Aug 2015 21:13:56 -0700
Message-ID: <CAPw-ZTnaQGTKTPy_cqCEYvXo1o23DXQTE4xaXu4d66YB9gV8mg@mail.gmail.com>
References: <1439326077-25507-1-git-send-email-lho@apm.com>
	<1439326077-25507-2-git-send-email-lho@apm.com>
	<1439326077-25507-3-git-send-email-lho@apm.com>
	<1439326077-25507-4-git-send-email-lho@apm.com>
	<20150812105121.GE14011@nazgul.tnic>
	<CAPw-ZTkRytHUsUsDmTkfzzTYbcZnmTVRMkzNzg_9ZpdQH76rZw@mail.gmail.com>
	<20150813033640.GB14432@nazgul.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150813033640.GB14432-K5JNixvcfoxupOikMc4+xw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

>> I intentional left this code as is so that the driver will still works
>> with older version of the EDAC code.
>
> Huh, what? I don't think this is how upstream development works.

I will fix this in next version.

>
>> I had already reversed the logic for the L3 and SoC. Are you asking
>> for the MC/PMD (earlier posting)? The MC/PMD routine isn't that big.
>> Functions in general fit in an screen of 80 column?
>
> Only for the ones where it becomes clumsy and flipping it would make the
> code more readable. I'm not a hard 80 cols follower anyway.

I will look at the code one more time and see if the code would be
better with logic flipped for L2/L1 and MC.

>
>> So, is there something that I am missing?
>
> I hope you're not. But seeing the custom debugfs stuff left in the new
> submission without any comment as to *why* you've left it, made me think
> you didn't incorporate all feedback.

-Loc
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
