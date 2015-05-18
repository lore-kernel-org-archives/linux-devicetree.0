From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/6] Watchdog: introdouce "pretimeout" into framework
Date: Tue, 19 May 2015 01:22:41 +0800
Message-ID: <CADyBb7vfS1KOH_hKshAReAvtjbEunF2KzB8RLP4h4HUjX0Afog@mail.gmail.com>
References: <=fu.wei@linaro.org>
	<1431689090-3125-1-git-send-email-fu.wei@linaro.org>
	<5555F5C5.8050806@roeck-us.net>
	<CADyBb7sC5a6vC6CqQsfCqOaxz1P8gKNkZi5qEHtXL7efv42-=Q@mail.gmail.com>
	<20150515180105.GB19230@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150515180105.GB19230-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Guenter,

yes, I think it is OK for me,

Once this patchset is merged, I will try to make a new patchset just
for this integration.

On 16 May 2015 at 02:01, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> On Fri, May 15, 2015 at 09:49:07PM +0800, Fu Wei wrote:
>> Hi Guenter,
>>
>> Great thanks for your review,
>> feedback inline below :-)
>>
>> On 15 May 2015 at 21:33, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
>
> [ ... ]
>
>> >> +       if (wdd->max_pretimeout && wdd->max_timeout < wdd->max_pretimeout)
>> >> {
>> >> +               pr_info("Invalid max timeout, resetting to max
>> >> pretimeout!\n");
>> >> +               wdd->max_timeout = wdd->max_pretimeout;
>> >> +       }
>> >
>> >
>> > I am a bit concerned about the context dependency introduced here. If
>> > someone calls
>> > _init_pretimeout after calling init_timeout, this may result in still
>> > invalid timeout
>> > values.
>>
>> yes, that logic is not very clean, so my thought is :
>> maybe we can integrate watchdog_init_timeout and watchdog_init_pretimeout,
>> if maintainer agree to add pretimeout into framework.
>>
> I think we should just assume that Wim will accept it, and try to find
> the best possible solution (or at least a good one).
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
