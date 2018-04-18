Return-Path: <SRS0=0hnt=HH=ti.com=t-kristo@kernel.org>
Subject: Re: [RFC 05/13] ARM: dts: ti: add support for building .dtb files
 containing symbols
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
 <1523956215-28154-6-git-send-email-t-kristo@ti.com>
 <CAMuHMdUjXJwPajeRhgpETHOVSC7KA3NUnqPNBhKYuUGEMoyyow@mail.gmail.com>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <d97334c0-8993-94c9-0e60-63a6f8e134b3@ti.com>
Date: Wed, 18 Apr 2018 22:07:31 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUjXJwPajeRhgpETHOVSC7KA3NUnqPNBhKYuUGEMoyyow@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, wmills@ti.com, ext Tony Lindgren <tony@atomide.com>, Tom Rini <trini@konsulko.com>, Russell King <rmk@armlinux.org.uk>
List-ID: <devicetree@vger.kernel.org>

On 18/04/18 17:20, Geert Uytterhoeven wrote:
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
>>   arch/arm/boot/dts/ti/Makefile | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/ti/Makefile b/arch/arm/boot/dts/ti/Makefile
>> index b26328b..7d2d411 100644
>> --- a/arch/arm/boot/dts/ti/Makefile
>> +++ b/arch/arm/boot/dts/ti/Makefile
>> @@ -1 +1,6 @@
>> +DTC_FLAGS += -@ -Wno-reg_format -Wno-avoid_default_addr_size
> 
> Why the -W options?

The overlay files typically contain declarations that miss these bits, 
and will lead to build time warnings. Mostly, because we are working 
with fragments / references only, and don't have the base declaration 
available at all.

> 
>> +
>> +$(obj)/%.dtb: $(src)/../%.dts FORCE
> 
> I guess you want a dependency on $(DTC), too?

Yeah, that should be added actually.

> 
>> +       $(call if_changed_dep,dtc)
>> +
>>   clean-files    += *.dtbo
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
