From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH v3 3/4] edac: Add APM X-Gene SoC EDAC driver
Date: Wed, 18 Jun 2014 15:18:26 -0700
Message-ID: <CAPw-ZTm9SVpAmuwc1UaKdfphPUEU31-JpmMMOKD3axxX4s2N+g@mail.gmail.com>
References: <1401761660-11515-1-git-send-email-lho@apm.com>
	<1401761660-11515-2-git-send-email-lho@apm.com>
	<1401761660-11515-3-git-send-email-lho@apm.com>
	<1401761660-11515-4-git-send-email-lho@apm.com>
	<20140618221046.GL24024@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140618221046.GL24024-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

>> This patch adds support for the APM X-Gene SoC EDAC driver and
>> requires ARM64 EDAC support patch [1] to compile.
>>
>> [1] http://www.spinics.net/lists/arm-kernel/msg324093.html
>>
>> Signed-off-by: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
>> Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
>
> This is starting to look ok, I'd guess it needs to go after the atomic
> scrub patch goes in, right?

Yes... The scrub code needs to be in for compiling only.

>
> Also, I'd need the device tree pieces acked by device tree maintainers
> before I pick them up together with this driver.

Should I ping a device tree maintainer? If so, who would that be?

-Loc
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
