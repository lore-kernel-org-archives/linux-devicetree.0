From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 6/7] Watchdog: introduce ARM SBSA watchdog driver
Date: Sun, 24 May 2015 07:15:39 -0700
Message-ID: <5561DD0B.1040008@roeck-us.net>
References: <=fu.wei@linaro.org>	<1432197156-16947-1-git-send-email-fu.wei@linaro.org>	<1432197156-16947-7-git-send-email-fu.wei@linaro.org>	<555DFCD4.3040701@codeaurora.org>	<CADyBb7vpC6ihvkrRG-htCS8-_xRkjtny=9ZGQsCsmK7-ng5AxA@mail.gmail.com>	<5560D7AC.50009@codeaurora.org>	<5560DCB6.3090008@roeck-us.net> <CADyBb7t7+aT=pF0we5umAGXJAJ0njU0zULFAZ-OHVpE0m=ueyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADyBb7t7+aT=pF0we5umAGXJAJ0njU0zULFAZ-OHVpE0m=ueyg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/24/2015 03:15 AM, Fu Wei wrote:
> Hi Guenter,
>
> On 24 May 2015 at 04:01, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
>> On 05/23/2015 12:40 PM, Timur Tabi wrote:
>> [ ... ]
>>>
>>>
>>> I use emergency_restart(), because the watchdog-api.txt documentation says
>>> this:
>>>
>>> "If userspace fails (RAM error, kernel bug, whatever), the
>>> notifications cease to occur, and the hardware watchdog will reset the
>>> system (causing a reboot) after the timeout occurs."
>>>
>>> Maybe I'm reading this too literally, but to me this means that when the
>>> timeout expires, the system has to reset immediately.
>>>
>>> However, maybe panic() is better, since it can do the same thing and more.
>>>
>>
>> I have a specific requirement at work to have watchdog expiration
>> (not this watchdog, this is different HW) result in a panic, specifically
>> to enable crashdump support and thus post-mortem analysis.
>>
>> I had not thought about this use case myself, and I had always wondered
>> why watchdog driver implementers would choose to call panic() after an
>> interrupt or NMI. But we live and learn, so now I finally understand.
>>
>> In the pretimeout/timeout world, the pretimeout would (typically)
>> result in a panic, and the timeout would result in a reset. So one
>> would set the timer register to 10s for 10s pretimeout and 20s timeout.
>>
>> However, the pretimeout concept assumes that there are two timers
>> which can be set independently. As you had pointed out earlier,
>> and as the specification seems to confirm, that is not the case here.
>
> Sorry, in Documentation/watchdog/watchdog-api.txt, I can not get the
> info about " the pretimeout concept assumes that there are two timers
> which can be set independently."
> Could you kindly point out where is the assumption.
>
> I thinks in kernel documentation,  that meams "one watchdog has two
> timeout stages", maybe I miss something. Could you help me out?
>
My apologies. Terminology problem; see below.

Note that the pretimeout, as documented, is a difference to the real
timeout, not an absolute time (which I had not realized before).

"Note that the pretimeout is the number of seconds before the time
  when the timeout will go off.  It is not the number of seconds until
  the pretimeout.  So, for instance, if you set the timeout to 60 seconds
  and the pretimeout to 10 seconds, the pretimeout will go off in 50
  seconds.  Setting a pretimeout to zero disables it."

>> As such, I don't really understand why and how the pretimeout / timeout
>> concept would add any value here and not just make things more
>> complicated than necessary. Maybe I am just missing something.
>
> If pretimeout concept assumes that there are two timers, I
> misunderstand the "pretimeout", then I will delete the pretimeout
> immediately.
>
I think I used the wrong term. I should have said something like
"two distinct timeout values".

Guenter

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
