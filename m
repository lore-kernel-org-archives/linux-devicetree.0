MIME-Version: 1.0
In-Reply-To: <20160827074012.GA28370@pek-khao-d1>
References: <1471918019-19472-1-git-send-email-haokexin@gmail.com>
	<1471918019-19472-4-git-send-email-haokexin@gmail.com>
	<CAL_JsqK42T1M3MO26p46K0zTuvGUAdMWAf4FHGVpAJgDa+SudQ@mail.gmail.com>
	<20160827074012.GA28370@pek-khao-d1>
Date: Mon, 29 Aug 2016 16:08:14 -0500
Message-ID: <CAL_JsqLtXTSCvHLXUPHKqmk+2fWUhbik2EMNuLuazDyD9WEyhg@mail.gmail.com>
Subject: Re: [PATCH 3/5] of/platform: introduce a generic way to declare a
 platform bus
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Kevin Hao <haokexin@gmail.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>
List-ID: <devicetree@vger.kernel.org>

On Sat, Aug 27, 2016 at 2:40 AM, Kevin Hao <haokexin@gmail.com> wrote:
> On Thu, Aug 25, 2016 at 08:44:56AM -0500, Rob Herring wrote:
>> On Mon, Aug 22, 2016 at 9:06 PM, Kevin Hao <haokexin@gmail.com> wrote:
>> > The specific buses which need to be probed at boot time are different
>> > between platforms. Instead of put all the buses into the default
>> > of_default_bus_match_table[] match tables, this patch introduces a
>> > general way to declare a platform bus.
>>
>> I'd prefer to not do this with linker sections if possible. Doesn't
>> PPC have machine descriptors that you could add the match table to? If
>> that table exists then arch_want_default_of_probe could return a
>> pointer to it.
>
> Hmm, I thought about adding a match table in ppc_md. But it is very arch
> specific. I thought maybe other archs also need to probe some arch or even
> board specific bus, so I introduces these arch independent macros and wish
> it may be useful for other archs. :-)

The match table ptr coming from ppc_md would be ppc specific, but that would be part of the ppc arch_want_default_of_probe function. Other arches can do it differently.

Now that I've looked more closely, of_platform_populate has more problems being re-entrant 

>
>>
>> Are there any platforms that work with the default match table?
>
> Yes, some boards can work with the default match table. But most won't.
>
>> I'd be
>> fine with adding some strings to the default if that helps.
>>
>> { .type = "soc", },
>>
>> device_type is deprecated for FDT, so this shouldn't be needed except
>> for really old stuff.
>>
>> { .compatible = "soc", },
>>
>> Doesn't appear in kernel dts files. Could be out of tree or old ones?
>>
>> { .compatible = "simple-bus" },
>>
>> Already handled.
>>
>> { .compatible = "gianfar" },
>>
>> Seems like the children of this should be probed by the gianfar driver.
>>
>> { .compatible = "gpio-leds", },
>>
>> I don't think this is needed.
>>
>> { .type = "qe", },
>>
>> Again, deprecated.
>>
>> { .compatible = "fsl,qe", },
>>
>> No issue to add this. Though, you could also probe it from mpc85xx_qe_init().
>
> Do you mean we put all the probe of the specific bus into the corresponding
> drivers? Yes, if we do so, we probably can shrink the default match table to
> be something like this:
>         { .compatible = "soc", },
>         { .compatible = "simple-bus" },
>
> OK, now we have three options to fix this issue:
> a) Create a separate link section to contain all the buses needed to be probed.
>    Just as what this patch does.
>
> b) Put the match table into the machine descriptor.
>
> c) Sprinkle the probe of all the specific bus into the corresponding driver
>    (such as gian, pcie controller) and the default probe function only handle
>    the very common buses.
>
> So what option do you guys think is best?
>
> Thanks,
> Kevin
