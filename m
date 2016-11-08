From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [REGRESSION] "console: don't prefer first registered if DT
 specifies stdout-path" breaks console on video outputs of various ARM boards
Date: Tue, 8 Nov 2016 10:12:05 +0100
Message-ID: <d344247f-2aa4-d5cc-1012-4fe06f831d79@redhat.com>
References: <20161104121135.4780-1-hdegoede@redhat.com>
 <1573891.u0IFOelkNI@np-p-burton>
 <cf275db8-6d2b-c891-9280-f141c6f10733@redhat.com>
 <3421375.fR4RSn7eD9@np-p-burton>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3421375.fR4RSn7eD9@np-p-burton>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@imgtec.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Thorsten Leemhuis <regressions@leemhuis.info>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 07-11-16 18:16, Paul Burton wrote:
> Hi Hans,
>
> On Sunday, 6 November 2016 11:54:35 GMT Hans de Goede wrote:
>>> What I see in my systems, and what 05fd007e4629 ("console: don't prefer
>>> first registered if DT specifies stdout-path") addressed, is that if
>>> there are for example 2 UARTs uart0 & uart1 that are probed in that order
>>> and stdout-path indicates that we should use uart1 we wind up essentially
>>> ignoring it because>
>>> the ordering of the relevant calls goes:
>>>   - of_console_check() for uart0
>>>   - add_preferred_console() for uart0
>>>   - register_console() for uart0
>>>   - of_console_check() for uart1
>>>   - add_preferred_console() for uart1
>>>   - register_console() for uart1
>>>
>>> Since of_check_console() doesn't get called for uart1 until after uart0
>>> has
>>> been probed, we don't add an entry for it to the console_cmdline array
>>> until after register_console() has already decided to enable uart0
>>> because preferred_console == -1.
>>>
>>> I'm not the only one seeing this oddity either, for example see the
>>> discussion on this patch:
>>>
>>> https://patchwork.kernel.org/patch/9263753/
>>>
>>> By simply reverting my patch you restore us to a position where so far as
>>> I
>>> can see we simply do not honor stdout-path for the real kernel console.
>>
>> As said before, we do still honor it, but in your probe example we also get
>> a (second) serial console on uart0, where as you only want one on uart1.
>
> ...but don't we only support one console per type of device? That's what
> Documentation/serial-console.txt says anyway, which means having a console on
> both uart0 & uart1 does not work. I could live with having console output on
> an extra UART, but that's not what I was seeing when I wrote this patch.

Ah yes, you're probably right about that.

>> So I see a few possible solutions here:
>>
>> 1) Do a new version of your patch which changes the  "&&
>> !of_specified_console" check to "&& (newcon == tty0 ||
>> !of_specified_console)", then we would still always register tty0 (as long
>> as it gets registered first, just like now) and we would not register uart0
>> in your above example, note the "newcon == tty0" check in my example is
>> pseudo-code. I would be happy to try out such a patch
>>
>> 2) Add a new dt property to enable the new behavior you seek
>>
>> I'm myself tending towards 1 as a better solution: treat tty0 special,
>> because some existing setups rely on it always being registered as a
>> console even if stdout-path is specified and otherwise always honor
>> stdout-path.
>>
>> Regards,
>>
>> Hans
>
> That does feel a little hack-ish to me though... I don't like the reliance on
> probe ordering, nor special casing tty0 in general.

Given that we've just got a "me too" reply from the ppc side of things,
it seems that in reality people have been relying on probe ordering here
for a long time now. IMHO tty0 is special, so it does make sense that it
always gets probed first (*) and it does make sense to handle it special.

*) Even though that seems to be more how things work (an implicit thing)
rather then explicit.

> In any case I don't think I have the time to unpick all this at the moment, so
> I suggest we go ahead with your revert for now & I'll revisit the system I was
> working on when I find the time.

Ok.

Regards,

Hans
