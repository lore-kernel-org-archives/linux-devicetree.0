From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: sunxi:
 document new generic binding
Date: Fri, 1 Dec 2017 10:56:45 +0100
Message-ID: <CACRpkdZ70a7Vk1QPFhkms6ucWmSH6rOUD9_J0h=NjhK+vfXNAA@mail.gmail.com>
References: <20171113012523.2328-1-andre.przywara@arm.com> <20171113012523.2328-2-andre.przywara@arm.com>
 <CACRpkdbpfkM4odz425+4qyUCF5vqPWBQ=F5Yk7AtJL5SqXghpg@mail.gmail.com>
 <20171124105240.GB3792@ulmo> <20efcf8f-85a5-3cad-a84b-434ee5cad68e@arm.com>
 <20171124133123.GA15999@ulmo> <0c8051e6-5d8c-32d6-97e4-11c2283da5b4@arm.com>
Reply-To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDE6RCFOWIARBX6OQTIQKGQE2LI43UA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <0c8051e6-5d8c-32d6-97e4-11c2283da5b4-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 24, 2017 at 6:19 PM, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> wrote:

> Conceptually I consider the DT being
> part of the firmware,

As it is a subset of open firmware it is obviously firmware.

> so one trust level above the kernel.

We are several kernel developers who don't trust firmware one
bit. Several disasters in ACPI has made me ever more convinced
that firmware should be trusted less than kernel code.

But this is all very academic.

>> Also, device tree bindings are not documentation for how to write a
>> driver. They are not a replacement for hardware documentation. Nobody
>> should be expected to be able to write an OS driver solely based on a
>> device tree binding. Device tree bindings are more of a configuration
>> interface specification for OS drivers.
>
> Yes, but together with the hardware docs you should be able to write a
> driver. And here you can't, because you are missing the strings. So a
> BSD developer has to look at Linux code.

This is a fair point. It appears in several drivers.

BSD or even Windows (would they use DT) would have to sit in the
back seat just like Linux has been doing for years when it comes
to the hopeless Windowsisms in the x86 BIOSes. I suspect some
Windows on ARM is already experiencing this, but in the ACPI world,
where, incidentally, the servers were being deployed for Linux first
and Windows had to follow their example. I bet they have been
swearing a lot in Redmond about that.

In general it's one of these areas where we can not be utopian about the
hardware descriptions, just fail gracefully in different ways.

I usually try to keep the IETF motto "rough consensus and running
code" in mind. I don't know if it helps in this discussion though.

>> So that's about 40% of the kernel image. Code really is no good without
>> data to process.
>
> But how much of this is SoC specific configuration data? How much is it
> in x86? Yes, historically we had and have a lot of configuration data in
> ARM kernels. But that doesn't mean that we have to continue with this or
> even increase the share.

What people have been doing is trying to have better Kconfig setups
and compile it out by doing kernel modules. It is a bit hopeless with
pin controllers: almost all of them have to be built in. And if they come
with a lot of data, yeah there you have a real good point.

It would be sad if the ARMv7 multiboot or Aarch64 kernel just grows
so that we can't use it but have to go back to shipping board-specific
kernels with a huge bunch of stuff compiled out.

I was hoping Moore's law would save us here :/

An option that has been discussed is better used of  __initdata
and similar tags, especially with built-in drivers. Sadly, this is
hurt by another snag: the compiler or linker file or whatever it is,
is preventing us from discarding any strings from the kernel.
And pin controllers tend to stack up a lot of these.

This is really sucky and something we should solve in general.
I'm not smart enough to tackle any of these problems myself, just
to see them and "Oh that's bad. Very bad."

>> The majority of the improvements over the years have been achieved by
>> moving drivers out of arch/arm and moving board files to DT. The goal
>> was never to get rid of all data.
>
> Sure, not all data. But if we have the relatively easy opportunity to
> avoid further addition of data, we should do it, I believe.
> This significantly reduces the amount of kernel code we need to add to
> support new SoCs.

This is the core of your argument as I perceive it: get rid of data
from the kernel, because it is growing wild. It is a valid cause. Just
has to be weighed with other stuff, like maintainability, debuggability,
maintainers viewpoint. ...

Yours,
Linus Walleij
