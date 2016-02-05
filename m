From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v10 5/5] Watchdog: ARM SBSA Generic Watchdog half timeout
 panic support
Date: Fri, 5 Feb 2016 17:51:52 +0800
Message-ID: <CADyBb7unAHEOMfruWS82RkHK6uwPAWCxUx9jqzSkiHU4LHDSeA@mail.gmail.com>
References: <1454519923-25230-1-git-send-email-fu.wei@linaro.org>
	<1454519923-25230-6-git-send-email-fu.wei@linaro.org>
	<56B23883.7000501@codeaurora.org>
	<CADyBb7sxPg-QUjTbeHFtYkctKc_g7D8O=+jqbXN+DCCoCEnFqA@mail.gmail.com>
	<56B23E99.1030604@codeaurora.org>
	<CADyBb7s4opxfPFuX=1-qEE6uhsaMXgofAJPbHUQHrng2AUwqNA@mail.gmail.com>
	<56B2423B.1020109@codeaurora.org>
	<CADyBb7uULCn97ea19zH8dB4QX1QA8=AXL94d6gXgFxXM8haBNA@mail.gmail.com>
	<56B24642.8090105@codeaurora.org>
	<CADyBb7s_QeU=pYqN9G+5WMtx-L+=QC6uZR6N6ZWPOixnkHzPjw@mail.gmail.com>
	<56B24AB5.3070001@codeaurora.org>
	<CADyBb7usPpY=YLjecXce63zY5e1tniPLmNsVY=8CJHJsCqBgQw@mail.gmail.com>
	<56B2DEE4.7060901@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B2DEE4.7060901-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, rruigrok-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, "Abdulhamid, Harb" <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Christopher Covington <cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dave Young <dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>Al
List-Id: devicetree@vger.kernel.org

Hi Guenter,

On 4 February 2016 at 13:17, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> On 02/03/2016 03:00 PM, Fu Wei wrote:
>>
>> On 4 February 2016 at 02:45, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>>>
>>> Fu Wei wrote:
>>>>
>>>>
>>>> As you know I have made the pre-timeout support patch, If people like
>>>> it, i am happy to go on upstream it separately.
>>>>
>>>> If we want to use pre-timeout here, user only can use get_pretimeout
>>>> and disable panic by setting pretimeout to 0
>>>> but user can not really set pretimeout, because "pre-timeout  ==
>>>> timeout / 2 (always)".
>>>> if user want to change pretimeout, he/she has to set_time instead.
>>>
>>>
>>>
>>> Ok, I think patches 4 and 5 should be combined, and I think the Kconfig
>>> entry should be removed and just use panic_enabled.
>
>
> Agreed.

np, will do

>>
>>
>> NP, will update this patchset like that ,  thanks :-)
>>
>
> Also, if panic is enabled, the timeout needs to be adjusted accordingly
> (to only panic after the entire timeout period has expired, not after
> half of it). We can not panic the system after timeout / 2.

OK, my thought is

if panic is enabled :
|--------WOR-------WS0--------WOR-------WS1
|------timeout------(panic)------timeout-----reset

if panic is disabled .
|--------WOR-------WS0--------WOR-------WS1
|---------------------timeout---------------------reset

 panic_enabled only can be configured when module is loaded by module parameter

But user should know that max_timeout(panic_enable) =
max_timeout(panic_disable) / 2

>
> I am not too happy with the parameter name (panic_enabled). How about
> "action", to match machzwd ?

yes, makes sense. Maybe we can do something  like this:

/*
 * action refers to action taken when watchdog gets WS0
 * 0 = SKIP
 * 1 = PANIC
 * defaults to SKIP (0)
 */
static int action;
module_param(action, int, 0);
MODULE_PARM_DESC(action, "after watchdog gets WS0 interrupt, do: "
"0 = SKIP(*)  1 = PANIC");


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
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
