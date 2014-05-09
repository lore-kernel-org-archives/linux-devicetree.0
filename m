From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH 1/4] edac: Fix MC scrub mode comparsion bug for
 correctable error
Date: Fri, 9 May 2014 09:17:28 -0700
Message-ID: <CAPw-ZT=Eeu9iY9wQa5ndKj8_6FA_XS_9N4t39kPizbaZkQTAtw@mail.gmail.com>
References: <1399590199-12256-1-git-send-email-lho@apm.com>
	<1399590199-12256-2-git-send-email-lho@apm.com>
	<20140509073803.GD8844@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140509073803.GD8844-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

>> This patch fixes the MC scrub mode comparsion bug by replacing
>> '&' with '=='. The MC structure field scrub_mode is integer
>> type - not bit field.
>>
>> Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
>
> Applied, thanks.

If I should need to submit future version of the X-Gene EDAC driver, I
will not include this patch.

-Loc
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
