From: Dann Frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH v3 3/4] edac: Add APM X-Gene SoC EDAC driver
Date: Wed, 18 Jun 2014 16:19:45 -0600
Message-ID: <CALdTtnte5M=G5qyChM2iegkivdgsRM=23ezcHNGVuPYN24LXhg@mail.gmail.com>
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
Cc: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 18, 2014 at 4:10 PM, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org> wrote:
> On Mon, Jun 02, 2014 at 08:14:19PM -0600, Loc Ho wrote:
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

Yeah, he mentions that dependency in patch #3. fwiw, I tested this set
together and it is working fine for me.

Tested-by: dann frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

 -dann

> Also, I'd need the device tree pieces acked by device tree maintainers
> before I pick them up together with this driver.
>
> Thanks.
>
> --
> Regards/Gruss,
>     Boris.
>
> Sent from a fat crate under my desk. Formatting is fine.
> --
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
