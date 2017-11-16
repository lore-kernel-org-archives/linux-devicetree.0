MIME-Version: 1.0
In-Reply-To: <1510796793.16864.25.camel@chimera>
References: <1510420788-25184-1-git-send-email-daniel@gimpelevich.san-francisco.ca.us>
	<20171113112312.GZ15260@jhogan-linux>
	<CAL_JsqJRVB928DVOAVQGrtT_EOuQBHkBhcd9+XFzqemutG65GA@mail.gmail.com>
	<1510628754.14209.27.camel@chimera>
	<CAL_JsqJoEEkoA1sGocGFXE7WWhCmkb5k2OxVRZ3OnigptoL8_Q@mail.gmail.com>
	<1510796793.16864.25.camel@chimera>
Date: Wed, 15 Nov 2017 23:26:30 -0600
Message-ID: <CAL_Jsq+MtHo5Da2mDD6c4JCb=kZrWEyOBz9pL+=9_f0VBQNAgA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: implement a "bootargs-append" DT property
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>
Cc: James Hogan <james.hogan@mips.com>, Linux-MIPS <linux-mips@linux-mips.org>, Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Nov 15, 2017 at 7:46 PM, Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us> wrote:
> On Tue, 2017-11-14 at 11:18 -0600, Rob Herring wrote:
>> I understand you can't apply random strings in any order you like. I'm
>> questioning the need to do that and what are the concrete example(s)
>> where you need that ability.
>
> Concrete:
> Pre-DT bootloader provides "console=/dev/someunusualdevice" and
> "root=/dev/mtdblock1" in argv. The dtb arranges flash differently and
> supplies "root=/dev/mtd2" in bootargs. Kernel uses /dev/mtdblock1 and
> panics, or alternatively uses /dev/mtd2 with no console.
>
>> I'd generally expect that only board specific options are in the dtb,
>> and a distro will add it's own options common for all and the specific
>> arch into the bootloader config files. And generally, the last thing
>> loaded gets the last say in what is set.
>
> Bootloaders and their configs are not distro-dependent.

For the ones that install grub, they are.

>> What h/w specific options would be needed for recovery kernel? That's
>> getting into putting not just Linux specifics into the dtb, but distro
>> specifics there. While yes, the dts files often already have bootargs
>> filled with Linux options, the intention is really that the bootloader
>> fills in bootargs. And if you have multiple kernels or OSs, then the
>> bootloader provides the mechanism to choose and boot with the right
>> options.
>
> Kernels _are_ distro-specific. A recovery kernel might also have options
> that are not hardware specific in addition to options that are.
>
>> I think the kernel (being last) should fully decide what to do:
>> append, prepend, and/or override. There was some work a while back to
>> support more flexible command line handling and be arch neutral, but
>> it never got merged.
>
> The kernel would not always have all the information needed for this
> decision now like it would before DT. The dtb should decide what
> precedence its bootargs have, and the kernel should decide what
> precedence compiled-in bootargs have. Such logic is provided by this
> patch, but not completely, because there is still no "bootargs-prepend"
> property. The only use case I can think of for "bootargs-prepend" would
> be to provide a default command line that is specific to a board that
> would sometimes have one bootloader, and sometimes another. Currently,
> such a situation can be worked around using a board-specific kernel, but
> this mechanism is a relic from pre-DT days.
>
