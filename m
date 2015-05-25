From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/7] Watchdog: introduce "pretimeout" into framework
Date: Mon, 25 May 2015 11:09:00 +0800
Message-ID: <CADyBb7vp+E_29zOW9Wq9oL8LbwgBFhM9VCRMNsYwFVGGXMwOTQ@mail.gmail.com>
References: <=fu.wei@linaro.org>
	<1432197156-16947-1-git-send-email-fu.wei@linaro.org>
	<1432197156-16947-6-git-send-email-fu.wei@linaro.org>
	<20150521153225.GA17441@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150521153225.GA17441-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Guenter,

Great thanks for your suggestion,

I have put this kind of validation into watchdog_pretimeout_invalid
and watchdog_timeout_invalid.

So :

(1)
 set_timeout(10);   ------> if this setting is successful
 set_pretimeout(20); ----->  return fail (-EINVAL)


(2)
set_timeout(10);  ------> if this setting is successful
set_pretimeout(10); ----->  return fail (-EINVAL)

this kind of situation will not result in an invalid / unexpected timeout value.

you will see this change in my next patchset

On 21 May 2015 at 23:32, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> On Thu, May 21, 2015 at 04:32:34PM +0800, fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
>> From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> Also update Documentation/watchdog/watchdog-kernel-api.txt to
>> introduce:
>> (1)the new elements in the watchdog_device and watchdog_ops struct;
>> (2)the new API "watchdog_init_timeouts".
>>
>> Reasons:
>> (1)kernel already has two watchdog drivers are using "pretimeout":
>>       drivers/char/ipmi/ipmi_watchdog.c
>>       drivers/watchdog/kempld_wdt.c(but the definition is different)
>> (2)some other dirvers are going to use this: ARM SBSA Generic Watchdog
>>
>> Signed-off-by: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>
> [ ... ]
>
>>
>> +/* Use the following function to check if a pretimeout value is invalid */
>> +static inline bool watchdog_pretimeout_invalid(struct watchdog_device *wdd,
>> +                                            unsigned int t)
>> +{
>> +     return ((wdd->max_pretimeout != 0) &&
>> +             (t < wdd->min_pretimeout || t > wdd->max_pretimeout));
>> +}
>
> Should this function also enforce "t < wdd->timeout", and
> should watchdog_timeout_invalid() enforce "t > wdd->pretimeout" ?
>
> Thanks,
> Guenter



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
