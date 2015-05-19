From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/6] Watchdog: introdouce "pretimeout" into framework
Date: Tue, 19 May 2015 09:12:31 +0800
Message-ID: <CADyBb7u1YnVvhNsvGAY7pQjK_SwMthN175XSw_DSY4SmF8XbVg@mail.gmail.com>
References: <=fu.wei@linaro.org>
	<CADyBb7u=HjZO5CBzZLxw1aWDx0tKdVKBuTrrhrRF9bAQr7pADQ@mail.gmail.com>
	<20150518172329.GA17202@roeck-us.net>
	<2729872.Fp4939suL0@wuerfel>
	<20150518201445.GA21230@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150518201445.GA21230-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd, Guenter,

yes, that is brilliant idea!!
I will try to do so , that solve the compatibility problem , so I
guess we can try this time :-)

On 19 May 2015 at 04:14, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> On Mon, May 18, 2015 at 10:03:52PM +0200, Arnd Bergmann wrote:
>> On Monday 18 May 2015 10:23:30 Guenter Roeck wrote:
>> > >
>> > > integrate watchdog_init_pretimeout and watchdog_init_timeout will be a
>> > > little hard,
>> > > we may need to change this API to :
>> > >
>> > > watchdog_init_timeouts(struct watchdog_device *wdd, unsigned int timeout_parm,
>> > >                              unsigned int pretimeout_parm, struct device *dev)
>> > >
>> > > then we need to update all the watchdog drivers which use this API,
>> > > maybe we can do this in a individual patchset, after this pretimeout
>> > > patch is merged.
>> > >
>> > > Is that OK  ?   any thought?
>> > >
>> > That is what I would recommend.
>> >
>>
>> The API change is fine, but I don't think you need to change all drivers.
>>
>> Just add a small wrapper function in the header file doing the conversion:
>>
>> static inline int watchdog_init_timeout(struct watchdog_device *wdd,
>>                                 unsigned int timeout_parm, struct device *dev)
>> {
>>       return watchdog_init_timeouts(wdd, timeout_parm, ~0ul, dev);
>> }
>>
>> Then you can update the drivers that actually use the pretimeout to
>> use the new function at some point, and leave all other drivers calling
>> the wrapper function.
>>
> Excellent idea.
>
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
