From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 5/7] Watchdog: introduce ARM SBSA watchdog driver
Date: Wed, 10 Jun 2015 22:41:04 +0800
Message-ID: <CADyBb7tQMXt5_-15GKj91=ztT+Qbi2rV+gaG-=phVxbrF8Jgmw@mail.gmail.com>
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
	<CADyBb7sVd5nLwb3eHRPiNt-WTynfaJonOyuE_bD694dayyvevA@mail.gmail.com>
	<CADyBb7s7NpQJFiFFGbbjCTQ0+bNCZoVMC4KwaZbWwGs_Wa=mLg@mail.gmail.com>
	<5578482E.70307@codeaurora.org>
	<CADyBb7sT=NbtNVfR4wPYi2gbWq73CDY-fu+XAURS_yTY6sL_mQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADyBb7sT=NbtNVfR4wPYi2gbWq73CDY-fu+XAURS_yTY6sL_mQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10 June 2015 at 22:36, Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 10 June 2015 at 22:22, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> Fu Wei wrote:
>>>
>>> Another weakness of only using WOR is the timeout limited by this
>>> 32bit register.
>>> 10s @400MHz generic Timer
>>>
>>> I don't think this limit is good for a server, once the server is i=
n a
>>> heavy load
>>
>>
>> Perhaps, but if that's the limitation of the hardware, then so be it=
=2E
>
> it is not the real limitation, if we use WCV, SBSA spec has mentioned=
 that.
>
> ------ SBSA 2.3-------Page 23 ----------
> Note: the watchdog offset register is 32 bits wide. This gives a
> maximum watch period of around 10s at a system
> counter frequency of 400MHz. If a larger watch period is required the=
n
> the compare value can be programmed
> directly into the compare value register
> ------ SBSA 2.3-------Page 23 ----------

------ SBSA 2.3-------Page 24 ----------
0x010 =E2=80=93 0x013 WCV[31:0]
0x014 =E2=80=93 0x017 WCV[63:32]
Watchdog compare value.
*Read/Write* registers
containing the current value in the watchdog compare
register.
------ SBSA 2.3-------Page 24 ----------

>
> if some hardware doesn't support writing WCV,
> that means this hardware is non-standard SBSA watchdog.
>
>>
>> --
>> Sent by an employee of the Qualcomm Innovation Center, Inc.
>> The Qualcomm Innovation Center, Inc. is a member of the
>> Code Aurora Forum, hosted by The Linux Foundation.
>
>
>
> --
> Best regards,
>
> Fu Wei
> Software Engineer
> Red Hat Software (Beijing) Co.,Ltd.Shanghai Branch
> Ph: +86 21 61221326(direct)
> Ph: +86 186 2020 4684 (mobile)
> Room 1512, Regus One Corporate Avenue,Level 15,
> One Corporate Avenue,222 Hubin Road,Huangpu District,
> Shanghai,China 200021



--=20
Best regards,

=46u Wei
Software Engineer
Red Hat Software (Beijing) Co.,Ltd.Shanghai Branch
Ph: +86 21 61221326(direct)
Ph: +86 186 2020 4684 (mobile)
Room 1512, Regus One Corporate Avenue,Level 15,
One Corporate Avenue,222 Hubin Road,Huangpu District,
Shanghai,China 200021
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdo=
g" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
