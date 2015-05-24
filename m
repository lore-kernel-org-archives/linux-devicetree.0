From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 6/7] Watchdog: introduce ARM SBSA watchdog driver
Date: Sun, 24 May 2015 07:06:43 -0700
Message-ID: <5561DAF3.8020805@roeck-us.net>
References: <=fu.wei@linaro.org>	<1432197156-16947-7-git-send-email-fu.wei@linaro.org>	<555F4236.7040206@linaro.org>	<4095167.UOriXdSu53@wuerfel>	<556097D5.9050103@codeaurora.org>	<CADyBb7svbV6QdhzCsa9DiBLfyNpAJHkgm73VSKCieJioPwWHsw@mail.gmail.com>	<5560C85B.8040100@roeck-us.net>	<5560C8D3.40708@codeaurora.org>	<5560DA3F.3070707@roeck-us.net> <CADyBb7sW8GTJmRR2ysUAYtZ=mkSCFZBzXuor=puLck0Q983NMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADyBb7sW8GTJmRR2ysUAYtZ=mkSCFZBzXuor=puLck0Q983NMw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, G Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/24/2015 02:58 AM, Fu Wei wrote:
> Hi Guenter,
>
> Great thanks for your suggestion and review,
> I have some questions below , would you please help me out?
>
> On 24 May 2015 at 03:51, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
>> On 05/23/2015 11:37 AM, Timur Tabi wrote:
>>>
>>> Guenter Roeck wrote:
>>>>
>>>> I think it is quite unfortunate that the specification is not public.
>>>> We have heard many statements about what is in the spec or not.
>>>
>>>
>>> All you need to do is go to
>>> http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.den0029b/index.html,
>>> get a free ARM account, and download the spec.
>>>
>> That helps - thanks a lot!
>>
>> Folks, please correct me if my understanding of the specification
>> is wrong.
>>
>> 1) Pretimeout
>>
>> The document suggests that
>>          WS1 = WS0 * 2
>
> Are you saying: the first timeout == the second timeout
>
> |-------------WS0
>                    |-------------WS1
>
> Sorry, could you let me know where is that suggestion??
> I have checked the SBSA again, but I can not find it.
> Maybe I really miss this part.
>

The document states:

"If both watchdog signals are deasserted and a timeout refresh occurs then WS0 is asserted.
  If WS0 is asserted and a timeout refresh occurs then WS1 is asserted."

There is no mention that programming both WOR and WCV would or even
could result in different timeouts for the two watchdog signals.

>> is in fact correct. In essence, there is just one counter,
>> not two. This means that a separate pretimeout does not really
>> make sense, since in practice the timeout would always be
>> twice the pretimeout,
>
> Yes, you are right, if we only use "WOR", then the first timeout ==
> the second timeout
>
>> and changing just one without affecting
>> the other is not really possible.
>
> although there is only one counter, and it is 32 bits wide.
> In SBSA,  we can see this:
> -------
> Note: the watchdog offset register is 32 bits wide. This gives a
> maximum watch period of around 10s at a system counter frequency of
> 400MHz.
> If a larger watch period is required then the compare value can be
> programmed directly into the compare value register.
> -------
> So for the first timeout, we can set the compare value register(WCV).
> Then the two timeouts are different. and the first timeout has not
> 10s(@400MHz) limit.
> just the the second timeout must use "WOR".
>

That is not how I read the specification. It only talks about
"timeout refresh". There is no indication that using both registers
would have the impact you describe.

Since there is no mention of different WS0 and WS1 timeout periods
in the specification, I am concerned that even _if_ a specific
implementation supports such different timeouts, it would be
implementation specific.

Maybe you and/or Timur can test this on the real systems you
have access to. It should be quite straightforward to test -
have the interrupt handler only print a message, program some
values into the watchdog, and see when WS0 and WS1 occur.

Thanks,
Guenter

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
