From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/6] Documentation: add sbsa-gwdt.txt documentation
Date: Fri, 15 May 2015 22:14:36 +0800
Message-ID: <CADyBb7u08p4PS9wfRPN7b8WpH+FtHNtG=ZwiMAGBZM20__OGUA@mail.gmail.com>
References: <=fu.wei@linaro.org>
	<1431688090-2145-1-git-send-email-fu.wei@linaro.org>
	<1431688090-2145-2-git-send-email-fu.wei@linaro.org>
	<8715806.mTJfA5WAcP@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8715806.mTJfA5WAcP@wuerfel>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

Great thanks, np, will do so

On 15 May 2015 at 22:06, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 15 May 2015 19:08:05 fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
>> From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> The sbsa-gwdt.txt documentation in devicetree/bindings/watchdog is for
>> introducing SBSA(Server Base System Architecture) Generic Watchdog
>> device node info into FDT
>>
>> Signed-off-by: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Looks good, just one minor comment:
>
>> +Optional properties
>> +- timeout-sec : Watchdog pre-timeout and timeout values (in seconds).
>> +     The first is timeout values, then pre-timeout.
>
> Please update Documentation/watchdog/watchdog-kernel-api.txt as well, to
> mention the second number in the timeout-sec property.
>
>         Arnd
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



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
