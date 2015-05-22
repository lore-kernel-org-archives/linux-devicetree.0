From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/7] Watchdog: introduce "pretimeout" into framework
Date: Fri, 22 May 2015 22:38:32 +0800
Message-ID: <CADyBb7swfV9eQKC2FxiaK=RFq9JR8fmq1BcTeWOp57i_TrXaBA@mail.gmail.com>
References: <=fu.wei@linaro.org>
	<1432197156-16947-1-git-send-email-fu.wei@linaro.org>
	<1432197156-16947-6-git-send-email-fu.wei@linaro.org>
	<555ECD04.6000404@offcode.fi>
	<CADyBb7sZWgNnEoTfaYm6=YcbWgEYRMcaNAdX9Y7B6W9pg+gOmg@mail.gmail.com>
	<555EEFDB.2030907@offcode.fi>
	<CADyBb7uh-6=ihfrKHBVXDzAKAE-_GqLXTPJa5_7Gw2R71pyeUg@mail.gmail.com>
	<555F2DED.2010200@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <555F2DED.2010200-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Timo Kokkonen <timo.kokkonen-20XrK1Fq8EXHOG6cAo2yLw@public.gmane.org>, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Guenter.

Sorry for my poor English .
let me explain this :

On 22 May 2015 at 21:23, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> On 05/22/2015 03:46 AM, Fu Wei wrote:
>>
>> Hi Timo,
>>
> [ ... ]
>
>> So I am still trying to improve pretimeout support :-)
>
>
> Is there anything still missing from it ?
>
>> If I can make pretimeout merged, may be you can try pretimeout to
>> implement early_timeout_sec function?
>
>
> Not sure how one would or even could do that.
>
> Do you mean "implement early_pretimeout_sec", by any chance ?

I mean: using pretimeout to implement the function you want, instead
of early_pretimeout_sec

Hope I say the right word this time :-)

>
>> It is up to the maintainers, I will try my best.
>>
>
> Please don't make the pretimeout concept more complicated than necessary.
>
> The smaller the patch, the more likely it is to get accepted.
> The more you change, the more difficult it is for the maintainer to,
> for example, back-port later bug fixes into earlier kernel releases
> when needed. This is why it is, for example, better to keep the
> existing watchdog_init_timeout() function instead of just replacing
> it with watchdog_init_timeouts().
>
> Try to put yourself into the maintainer's perspective: If you were
> the maintainer, would you rather accept a patch or patch set which
> maintains the existing API and doesn't require any changes to existing
> drivers, or would you accept one that changes, say, some function
> or variable names and will require manual back-ports later on if
> there is a bug fix ? Would you rather accept a patch that adds 50 lines
> of code, or one that changes another 100+ lines and rearranges everything
> along the line ?
>
> Thanks,
> Guenter
>



-- 
Best regards,

Fu Wei
Software Engineer
Red Hat Software (Beijing) Co.,Ltd.Shanghai Branch
Ph: +86 21 61221326(direct)
Ph: +86 186 2020 4684 (mobile)
Room 1512, Regus One Corporate Avenue,Level 15,
One Corporate Avenue,222 Hubin Road,Huangpu District,
Shanghai,China 200021
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
