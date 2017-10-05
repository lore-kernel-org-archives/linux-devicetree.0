From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: RISC-V Linux Port v9
Date: Thu, 5 Oct 2017 09:34:49 +0200
Message-ID: <CAK8P3a0zjb1QhmffswWs0TAg2-qRtSEORTuufMSf0_0NamzXRQ@mail.gmail.com>
References: <CAK8P3a1ROLHHY9HE0LtPywhTMqBaHjp8kd4ZVBr3iWTyveBh9A@mail.gmail.com>
 <mhng-fa7412d4-47d2-47e5-b36b-a237dfb04c9d@palmer-si-x1c4>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <mhng-fa7412d4-47d2-47e5-b36b-a237dfb04c9d@palmer-si-x1c4>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patches-q3qR2WxjNRFS9aJRtSZj7A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, albert-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Michal Marek <mmarek-IBi9RG/b67k@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Boqun Feng <boqun.feng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 5, 2017 at 2:21 AM, Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org> wrote:
> On Tue, 26 Sep 2017 23:08:02 PDT (-0700), Arnd Bergmann wrote:
>> On Tue, Sep 26, 2017 at 6:56 PM, Palmer Dabbelt <palmer-96lFi9zoCfxBDgjK7y7TUQ@public.gmane.org> wrote:
>>> As per suggestions on our v8 patch set, I've split the core architecture code
>>> out from our drivers and would like to submit this patch set to be included
>>> into linux-next, with the goal being to be merged in during the next merge
>>> window.  This patch set is based on 4.14-rc2, but if it's better to have it
>>> based on something else then I can change it around.
>>
>> -rc2 is good, just don't rebase it any more. I'd suggest that at the point this
>> becomes part of linux-next, you stop modifying the patches further and
>> move to adding any additional changes as patches on top.
>
> Sounds good.  I've gotten a kernel.org account now, so I've gone ahead and
> signed a "for-linux-next" tag that contains this patch set.  I'm going to treat
> what's here as an official pull request into linux-next and therefor I won't be
> rewriting history any more.  If I understand everything correctly, once I'm in
> linux-next I'm meant to update that tag with commits that are ready to go?
>
> Is there anything further I should do in order to get that tag merged into
> linux-next?

Please be aware that Stephen has announced that there won't be any
linux-next trees until the end of the month, which will be the kernel
summit in Prague.

https://lkml.org/lkml/2017/9/29/13

It may be worth sending him a request to include your tree when
he returns, I assume there will be a long email backlog and he might
miss it otherwise.

>>>  * I cleaned up the defconfigs -- there's actually now just one, and it's
>>>    empty.  For now I think we're OK with what the kernel sets as defaults, but
>>>    I anticipate we'll begin to expand this as people start to use the port
>>>    more.
>>
>> The kernel defaults are not really as sensible as one would hope. Maybe
>> go through your previous defconfig once more and pick up the items that
>> made sense.
>
> I was a bit surprised at the defaults: for example, I'd expect things like
> CONFIG_PCI and CONFIG_NET to be enabled by default.  I guess I just assumed
> that since technically we have a working kernel without those that it was fine
> to just stick with the defaults.

Some of the defaults are really pretty random and are only like this for
historic reasons.

> Looking at our old defconfig, I'd pick
>
>   CONFIG_PCI=y
>   CONFIG_NAMESPACES=y
>   CONFIG_NET=y
>   CONFIG_UNIX=y
>   CONFIG_INET=y
>   CONFIG_DEVTMPFS=y
>   CONFIG_EXT2_FS=y
>   CONFIG_TMPFS=y
>
> does that seem reasonable?

Mostly yes, but please disable ext2 and use ext4 instead.

       Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
