From: Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [Linaro-acpi] [PATCH v8 5/5] Watchdog: introduce ARM SBSA
 watchdog driver
Date: Thu, 19 Nov 2015 17:11:55 -0700
Message-ID: <564E654B.2060000@linaro.org>
References: <1445961999-9506-1-git-send-email-fu.wei@linaro.org>
 <1445961999-9506-6-git-send-email-fu.wei@linaro.org>
 <CAOZdJXV8x8EMQEZhdFS+34iO+6P9S==k9bQjt=67iXt6K2oSCw@mail.gmail.com>
 <563AE588.1080009@roeck-us.net> <563B5DF9.6080102@codeaurora.org>
 <CADyBb7sD2Y2kGj-suOs1UeUwXPjH39mvX_Sobn0Y7WfsJ9hF=Q@mail.gmail.com>
 <563B62F7.3050307@codeaurora.org>
 <CADyBb7vDf+KRi8gUGEt+iu-GpqVQgVq7nKTVt7O=3x78KCi+RQ@mail.gmail.com>
 <563B6A4B.7090400@codeaurora.org>
 <CADyBb7t6ovfrz1b3ZZykKq22HkZi1W0PWg7-wXihEjM9ciTgGg@mail.gmail.com>
 <563B869F.2010004@roeck-us.net> <56452970.4070209@linaro.org>
 <56452E10.5060705@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56452E10.5060705-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Dave Young <dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Vipul Gandhi <vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/12/2015 05:25 PM, Guenter Roeck wrote:
> On 11/12/2015 04:06 PM, Al Stone wrote:
>> On 11/05/2015 09:41 AM, Guenter Roeck wrote:
>>> On 11/05/2015 07:00 AM, Fu Wei wrote:
>>>> Hi Timur,
>>>>
>>>> On 5 November 2015 at 22:40, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>>>>> Fu Wei wrote:
>>>>>>
>>>>>> Did you really read the "Note" above???????? OK, let me paste it again
>>>>>> and again:
>>>>>>
>>>>>> SBSA 2.3 Page 23 :
>>>>>> If a larger watch period is required then the compare value can be
>>>>>> programmed directly into the compare value register.
>>>>>
>>>>>
>>>>> Well, okay.  Sorry, I should have read what you pasted more closely. But I
>>>>
>>>> Thanks for reading it again.
>>>>
>>>>> think that means during initialization, not during the WS0 timeout.
>>>>
>>>> I really don't see SBSA say "during initialization, not during the WS0
>>>> timeout",
>>>> please point it out the page number and the line number in SBSA spec.
>>>> maybe I miss it?
>>>> Thanks for your help in advance.
>>>>
>>>>>
>>>>> Anyway, I still don't like the fact that you're programming WCV in the
>>>>
>>>> "you don't like" doesn't mean "it is wrong" or "we can't do this", so
>>>> I will keep this way unless we have better idea to extend second stage
>>>> timeout.
>>>>
>>>>> interrupt handler, but I'm not going to make a big deal about it any more.
>>>>
>>>> Deal, Thanks a lot.
>>>>
>>>
>>> The problem with your driver, as I see it, is that dealing with WS0/WS1
>>> and pretimeout makes the driver so complex that, at least for my part,
>>> I am very wary about it. The driver could long since have been accepted
>>> if it were not for that. Besides that, I really believe that any system designer
>>> using the highest permitted frequency should be willing to live with the
>>> consequences, and not force the implementation of a a complex driver.
>>>
>>> Ultimately, you'll have to decide if you want a simple driver accepted, or
>>> a complex driver hanging in the review queue forever.
>>>
>>> Thanks,
>>> Guenter
>>
>> Sorry to poke my head in late like this, but I do have a vested interest in the
>> outcome so I'm very curious.  For my work, I need to have an ACPI-supported,
>> SBSA-compliant watchdog timer for arm64, and this series is one of the key
>> pieces to getting there.  The plan for me has been: (1) get an FDT based SBSA
>> watchdog timer, (2) add in kernel code to handle the ACPI GTDT table describing
>> timers, then (3) munge the SBSA watchdog timer for use by ACPI.
>>
>> So, is this an actual NAK of the patch series as is?  I think it is, but I want
>> it to be clear, and it has not been explicit yet.
>>
> I am not the maintainer, so I don't make the call. All I am saying is that I don't
> feel comfortable with the code as is. Part of it is due to the the specification's
> complexity, which leaves space for (mis)interpretations and bad implementations.
> 
> Either case, this is just my personal opinion. All you'll have to do is to convince
> Wim to accept your patch.

Ah, okay.  I was a little confused then about who was maintainer.  Sorry about
that.

>> If it is a NAK, that's fine, but I also want to be sure I understand what the
>> objections are.  Based on my understanding of the discussion so far over the
>> multiple versions, I think the primary objection is that the use of pretimeout
>> makes this driver too complex, and indeed complex enough that there is some
>> concern that it could destabilize a running system.  Do I have that right?
>>
>> The other possible item I could conclude out of the discussion is that we do
>> not want to have the pretimeout code as part of the watchdog framework; is that
>> also the case or did I misunderstand?
>>
> Nothing really to do with pretimeout, but with the complexity of implementing it
> for this driver.
> 
> As for pretimeout, it does have its issues. Some people say that hitting
> a pretimeout should result in a panic, others just as strongly say that it
> should just dump a message to the console. Which does make me a bit wary, since
> it means that it may be implemented differently in different drivers, which
> I consider highly undesirable.

Right.  Based on Timur's input, I think I understand this much better now.  I'm
not 100% convinced I know how to fix it, but I'll try some things on hardware to
test out some ideas.

>> And finally, a simpler, single stage timeout watchdog driver would be a
>> reasonable thing to accept, yes?  I can see where that would make sense.
>>
> I am quite sure that such a driver would long since have been accepted.
> 
>> The issue for me in that case is that the SBSA requires a two stage timeout,
> 
> Hmm - really ? This makes me want to step back a bit and re-read the specification
> to understand where it says that, and what the reasoning might be for such a
> requirement.

As far as I can tell, that's what the SBSA is requiring.  My understanding is
that the hardware is to first assert a WS0 signal when the timer expires.  If
the timer expires and WS0 has already been asserted, the WS1 signal is to be
asserted.  When WS1 is asserted, the system is to do a hard reset (Section 5.2,
"Server Base System Architecture", ARM-DEN-0029 Version 2.3).  I'm interpreting
the occurrence of WS0 as the first stage and WS1 as the second.

To me, at least, this makes sense in a server environment.  The WS0 occurs,
which gives me some time to save key info or try to recover before WS1 occurs
(or kexec, or any other cleverness).

>> so a single stage driver has no real value for me.  Now, if I can later add in
>> changes to make the driver into a two stage driver so it is SBSA-compliant,
>> that would also work, but it will make the driver more complex again.  At that
>> point, I think I've now gone in a logical circle and the changes would not be
>> accepted so I could never get to my goal of an SBSA-compliant driver.  I don't
>> think that's what was meant, so what did I miss?
>>
>> Thanks in advance for any clarifications that can be provided.....I really do
>> appreciate it.  Email is not always the clearest mechanism for communication
>> so sometimes I have to ask odd questions like these so I can understand what
>> is happening.
>>
> 
> I don't really follow the logic here. Why ask if a single stage driver would
> have been accepted just to point out that it would have no value for you ?

Sorry, I was not being very clear.  I was just trying to figure out if there
was a risk of inadvertently painting myself into a corner with an incremental
approach to developing the functionality needed, versus doing it as a single
increment.

> Really, just convince Wim to accept the driver.

Nod.  Thanks.

> Thanks,
> Guenter
> 


-- 
ciao,
al
-----------------------------------
Al Stone
Software Engineer
Linaro Enterprise Group
al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
-----------------------------------
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
