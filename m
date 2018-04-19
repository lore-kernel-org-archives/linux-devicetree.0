MIME-Version: 1.0
In-Reply-To: <76a6d46d-2c62-1273-8605-59efd4f7baf5@ti.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
	<1523956215-28154-6-git-send-email-t-kristo@ti.com>
	<CAMuHMdUjXJwPajeRhgpETHOVSC7KA3NUnqPNBhKYuUGEMoyyow@mail.gmail.com>
	<CAL_Jsq+u8RFF=TU5pKQZz7Obbeq655vnhWqGiRuHJ64AAfeW=w@mail.gmail.com>
	<76a6d46d-2c62-1273-8605-59efd4f7baf5@ti.com>
Date: Thu, 19 Apr 2018 10:26:45 -0500
Message-ID: <CAL_JsqLgCZXMwaMx_XfpqerFL-JfoqAtQ+nommcHEp8pYGHJ2Q@mail.gmail.com>
Subject: Re: [RFC 05/13] ARM: dts: ti: add support for building .dtb files
 containing symbols
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Tero Kristo <t-kristo@ti.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "Mills, William" <wmills@ti.com>, ext Tony Lindgren <tony@atomide.com>, Tom Rini <trini@konsulko.com>, Russell King <rmk@armlinux.org.uk>
List-ID: <devicetree@vger.kernel.org>

On Thu, Apr 19, 2018 at 1:36 AM, Tero Kristo <t-kristo@ti.com> wrote:
> On 19/04/18 01:43, Rob Herring wrote:
>>
>> On Wed, Apr 18, 2018 at 9:20 AM, Geert Uytterhoeven
>> <geert@linux-m68k.org> wrote:
>>>
>>> Hi Tero,
>>>
>>> On Tue, Apr 17, 2018 at 11:10 AM, Tero Kristo <t-kristo@ti.com> wrote:
>>>>
>>>> Symbols in the DTB files are needed so that overlays can be applied
>>>> properly. Add support for building TI SoC specific .dtb files, the
>>>> source is fetched from parent directory.
>>>>
>>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>>
>>>
>>> Thanks for your patch!
>>>
>>>> ---
>>>>   arch/arm/boot/dts/ti/Makefile | 5 +++++
>>>>   1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/ti/Makefile
>>>> b/arch/arm/boot/dts/ti/Makefile
>>>> index b26328b..7d2d411 100644
>>>> --- a/arch/arm/boot/dts/ti/Makefile
>>>> +++ b/arch/arm/boot/dts/ti/Makefile
>>>> @@ -1 +1,6 @@
>>>> +DTC_FLAGS += -@ -Wno-reg_format -Wno-avoid_default_addr_size
>>>
>>>
>>> Why the -W options?
>>>
>>>> +
>>>> +$(obj)/%.dtb: $(src)/../%.dts FORCE
>>>
>>>
>>> I guess you want a dependency on $(DTC), too?
>>
>>
>> I think that is handled globally already. I did a fix not to long ago.
>
>
> Globally it is handled, but as you see this is a special rule under the TI
> SoC specific makefile. This is building the .dts files under
> arch/arm/boot/dts/* into arch/arm/boot/dts/ti/ containing the symbol info
> (-@ flag for DTC.)

Ah, I see. That means we end up with 2 builds of the base dtbs, right?
We need to not do that. Either we need to be able to set per dtb flags
or set per directory flags and move the TI base dts files to /ti
directory.

Rob
