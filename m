MIME-Version: 1.0
In-Reply-To: <CAMuHMdUjXJwPajeRhgpETHOVSC7KA3NUnqPNBhKYuUGEMoyyow@mail.gmail.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
	<1523956215-28154-6-git-send-email-t-kristo@ti.com>
	<CAMuHMdUjXJwPajeRhgpETHOVSC7KA3NUnqPNBhKYuUGEMoyyow@mail.gmail.com>
Date: Wed, 18 Apr 2018 17:43:32 -0500
Message-ID: <CAL_Jsq+u8RFF=TU5pKQZz7Obbeq655vnhWqGiRuHJ64AAfeW=w@mail.gmail.com>
Subject: Re: [RFC 05/13] ARM: dts: ti: add support for building .dtb files
 containing symbols
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tero Kristo <t-kristo@ti.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "Mills, William" <wmills@ti.com>, ext Tony Lindgren <tony@atomide.com>, Tom Rini <trini@konsulko.com>, Russell King <rmk@armlinux.org.uk>
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 18, 2018 at 9:20 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Tero,
>
> On Tue, Apr 17, 2018 at 11:10 AM, Tero Kristo <t-kristo@ti.com> wrote:
>> Symbols in the DTB files are needed so that overlays can be applied
>> properly. Add support for building TI SoC specific .dtb files, the
>> source is fetched from parent directory.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>
> Thanks for your patch!
>
>> ---
>>  arch/arm/boot/dts/ti/Makefile | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/ti/Makefile b/arch/arm/boot/dts/ti/Makefile
>> index b26328b..7d2d411 100644
>> --- a/arch/arm/boot/dts/ti/Makefile
>> +++ b/arch/arm/boot/dts/ti/Makefile
>> @@ -1 +1,6 @@
>> +DTC_FLAGS += -@ -Wno-reg_format -Wno-avoid_default_addr_size
>
> Why the -W options?
>
>> +
>> +$(obj)/%.dtb: $(src)/../%.dts FORCE
>
> I guess you want a dependency on $(DTC), too?

I think that is handled globally already. I did a fix not to long ago.

Rob
