From: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: Re: KConfig and DTS files
Date: Thu, 08 May 2014 07:56:07 -0700
Message-ID: <536B9B07.6060506@boundarydevices.com>
References: <536A697D.3020002@boundarydevices.com> <CAJAp7OjNdmsomhm9jJ9-jP01z1Uz9snVgRCD07zOFdMYAhQ6Lw@mail.gmail.com> <536ABC89.8060301@boundarydevices.com> <5266451.XWDQiRgflU@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5266451.XWDQiRgflU@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On 05/08/2014 03:37 AM, Arnd Bergmann wrote:
> On Wednesday 07 May 2014 16:06:49 Eric Nelson wrote:
>> On 05/07/2014 03:20 PM, Bjorn Andersson wrote:
>>> On Wed, May 7, 2014 at 12:52 PM, Eric Nelson
>>> <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org> wrote:
>>> [...]
>>>>
>>>> I still wonder about the choice of not allowing inclusion
>>>> of at least include/generated/autoconf.h.
>>>
>>> Because what you just showed is the use case where you have 1 defconfig, build 1
>>> zImage and then you can have a completely separate delivery of X number of
>>> dtbs, all defining some variant of your original board.
>>> All without recompiling, or even have the source available.
>>>
>>
>> I agree that there's some benefit in being able to generate
>> different DTBs, and it's an advantage (size, speed) to customize
>> the .config as well.
>>
>> When those clearly go together, it seems natural to define them as
>> such.
>>
>> I've heard (and appreciate) the pointers about how to get
>> past our current issue(s), but what's the rationale
>> for not allowing the inclusion of autoconf.h and
>> conditionals in the DTS?
>>
>> Is it a concern that things will become polluted and
>> hard to read?
>
> You should be able to take any recent enough
> Fedora/Debian/OpenSUSE/Ubuntu/OpenWRT kernel binary and install it on
> all ARMv7 machines to get a working system, keeping your existing .dtb
> file.
>
> There are still a few issues to be worked out for that (e.g. some drivers
> still can't be described in DT, and in some exceptional cases we break backwards
> compatibility), but if the .dtb file depends on the kernel configuration,
> it can never work, because the person building the kernel does not know
> what hardware you have.
>

I think this highlights the difference in perspective.

Your comments (and Bjorn's) reflect a goal of being able to
build a single kernel/DTB that runs on multiple platforms.

My goal(s) are quite different, and center on building
an optimized system for a single purpose. Most customers
of our boards target a single app, and essentially
all of them use a sub-set of a board's functionality.

We encourage them to optimize their kernel configurations to
only include the meaningful pieces, which reduces boot time and
memory usage, log file spew, et cetera. The same goes for userspace
components: only include what you need.

(Re)building the kernel is not seen as an onerous task, as it's
a small piece of the puzzle.

I appreciate the feedback, and I don't want to make a big
deal of this. We have ways of achieving the goal, even if
I do think that judicious use of #ifdef would be helpful.

Regards,


Eric
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
