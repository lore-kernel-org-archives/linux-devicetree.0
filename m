From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 6/7] Watchdog: introduce ARM SBSA watchdog driver
Date: Fri, 22 May 2015 00:12:21 +0800
Message-ID: <CADyBb7vwGcdxeOE+QEzgmF5=2dsk83F4WyfJvp2ccZ12w1qYHQ@mail.gmail.com>
References: <=fu.wei@linaro.org>
	<1432197156-16947-1-git-send-email-fu.wei@linaro.org>
	<1432197156-16947-7-git-send-email-fu.wei@linaro.org>
	<555DB4C4.5090606@roeck-us.net>
	<CADyBb7vbcHG69cpnx6sUwaT7abS7w3Er62+50D6PUrGHVnG9vQ@mail.gmail.com>
	<20150521151847.GA16668@roeck-us.net>
	<CADyBb7tPjZrty-B=Lis_zdObxM1_MRcKCinOx3K73=6juxsikw@mail.gmail.com>
	<20150521155950.GA18300@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150521155950.GA18300-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Guenter,



On 21 May 2015 at 23:59, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> On Thu, May 21, 2015 at 11:46:53PM +0800, Fu Wei wrote:
>> Hi Guenter,
>>
> [ ... ]
>
>> >> >> +
>> >> >> +       /*
>> >> >> +        * Try to determine the frequency from the arch_timer interface
>> >> >> +        */
>> >> >> +       clk = arch_timer_get_rate();
>> >> >
>> >> >
>> >> > arch_timer_get_rate() does not seem to be exported. Did you try to build
>> >> > the driver as module ?
>> >>
>> >> yes, I have built it as a ko module, that is why I made a patch to
>> >> export this interface in the first patch of this patchset
>> >>
>> >>  but I will confirm it again :-)
>> >>
>> > Guess I'll give it a try myself. I don't really understand how this
>> > can work unless arch_timer_get_rate() is exported in your tree.
>>
>> yes, I have exported it , I think it make sense to export it.
>> Because other driver maybe need to get system counter info
>>
>> Do you agree ? :-)
>>
> I don't think it is for me to agree or not. The arm maintainers
> will need to be involved. You can not just export such a function
> without maintainer Ack.

yes, I have added Mark Rutland in the CC list when I sent this
patchset . He added the "arch_timer_get_rate();" in the arch timer
driver.
See if he can provide some suggestion. :-)

maybe I should add some more arm arch timer maintainers to get more
help on this :-)

>
> Having said that, my personal preference would be for the counter
> and rate to be exported through the clock subsystem (ie with
> clk_get_rate). But that would still not provide the current counter
> value, so maybe that isn't even possible.

I will try to make a patch for this, If the arm maintainers don't like
exporting "arch_timer_get_rate();"

But your thought is good,  the clk_get_rate is the best way to do for now

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
