From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 5/7] Watchdog: introduce ARM SBSA watchdog driver
Date: Wed, 10 Jun 2015 11:41:27 +0800
Message-ID: <CADyBb7sVd5nLwb3eHRPiNt-WTynfaJonOyuE_bD694dayyvevA@mail.gmail.com>
References: <=fu.wei@linaro.org>
	<1433217907-928-1-git-send-email-fu.wei@linaro.org>
	<1433217907-928-6-git-send-email-fu.wei@linaro.org>
	<556DCC95.806@codeaurora.org>
	<CADyBb7sXiMNtrH+Eu1Qj00TPNLMMr5cCTPObzFmKnHLsbWH79Q@mail.gmail.com>
	<556DE2D5.3090906@roeck-us.net>
	<CADyBb7uT=gFJkK8s-QF1n4Z+Zov9Lurp1nvBO-C-qszTqbMYXQ@mail.gmail.com>
	<5575DE48.8010308@roeck-us.net>
	<CADyBb7sYPnvDVEJYVQm65B1JV=yvq10+ezs2x3f8F=TJCZ+OJA@mail.gmail.com>
	<55766D74.2060401@roeck-us.net>
	<CADyBb7vR-jP6ZjzMSnprrSXbNayk8umx+cXV3TsGypfhZcCwTw@mail.gmail.com>
	<55769E0E.8060801@roeck-us.net>
	<CADyBb7skpSZ=3_ByW-RHM99=nbs7Z5xXFXtsKzkxOXAGjxF=3Q@mail.gmail.com>
	<557712CF.8010802@roeck-us.net>
	<5577147B.2030900@codeaurora.org>
	<5577180E.4070804@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5577180E.4070804-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Guenter,

On 10 June 2015 at 00:45, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> On 06/09/2015 09:29 AM, Timur Tabi wrote:
>>
>> On 06/09/2015 11:22 AM, Guenter Roeck wrote:
>>>
>>>
>>>
>>> but I see your point. Essentially, the specification is broken
>>> for all practical purposes, since, as you point out, enabling
>>> the watchdog overwrites and explicitly sets WCV. Effectively
>>> this means that just using WCV to program the timeout period
>>> is not really possible.
>>>
>>> I am not really sure how to address this. We can either only use WOR,
>>> and forget about pretimeout, or we can enforce a minimum pretimeout.
>>> In the latter case, we'll have to write WCV after writing WOR.
>>
>>
>> In talking with our hardware engineers, using WCV to program the timeout
>> period is not a valid operation.  This is why I keep arguing against the
>> pre-timeout feature, and I don't agree that servers should always use
>> pre-timeout.
>>
>
> Not sure if "not valid" is correct - after all, it is mentioned in the
> specification. However, it is at the very least fragile.

I think we should focus on SBSA spec, but not a specific chip design,
because this is SBSA watchdog, not a driver for an IP core from a
specific chip vendor.
this operation is mentioned in the spec,
and I have tested my driver on Foundation model(from ARM) and a real hardware.

>
> I tend to agree that we should just forget about pretimeout and
> use your original approach, where the timeout value is used
> to program WOR. Everything else is really just asking for trouble.

I don't mind if we give up pretimeout, The reason I use pretimeout is:
this concept matches the function of two stage timeouts.

but, If we give up pretimeout, could you give me a suggestion:

How to config the two stage timeouts
(1)from enabling watchdog to WS0
(2)the time from WS1 to WS0

If we only have one timeout parameter,  How to config the two stage timeouts?
Any suggestion ?

If we make the first stage timeout is timeout/2,  this violates the
definition of timeout.
I don't think users expect interrupt, panic or reboot at timeout/2.

And WS1  definitely isn't a backup of WS0.

>
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
