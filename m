Return-Path: <SRS0=0hnt=HH=ti.com=t-kristo@kernel.org>
Subject: Re: [RFC 06/13] ARM: dts: am57xx-evm: add AM57xx-evm DT overlay
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
 <1523956215-28154-7-git-send-email-t-kristo@ti.com>
 <CAMuHMdWmsnRDBTvv+dy0uGx_6XSVErLHJgR_rQNvepOhAyDg4g@mail.gmail.com>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <a4bdb4fb-ae22-67be-38a5-8b762859a697@ti.com>
Date: Wed, 18 Apr 2018 22:12:08 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWmsnRDBTvv+dy0uGx_6XSVErLHJgR_rQNvepOhAyDg4g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, wmills@ti.com, ext Tony Lindgren <tony@atomide.com>, Tom Rini <trini@konsulko.com>, Russell King <rmk@armlinux.org.uk>
List-ID: <devicetree@vger.kernel.org>

On 18/04/18 17:36, Geert Uytterhoeven wrote:
> On Tue, Apr 17, 2018 at 11:10 AM, Tero Kristo <t-kristo@ti.com> wrote:
>> The AM57xx-evm is an overlay on top of beagle-x15 board. This contains
>> a display extension macro, and a few extra peripherals. Two versions
>> of the evm are supported, the base evm and the latest rev A3 evm. A
>> common overlay file is used for both boards.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   arch/arm/boot/dts/ti/am57xx-evm-common.dtso | 175 ++++++++++++++++++++++++++++
>>   arch/arm/boot/dts/ti/am57xx-evm-reva3.dtso  |  11 ++
>>   arch/arm/boot/dts/ti/am57xx-evm.dtso        |  11 ++
>>   3 files changed, 197 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/ti/am57xx-evm-common.dtso
>>   create mode 100644 arch/arm/boot/dts/ti/am57xx-evm-reva3.dtso
>>   create mode 100644 arch/arm/boot/dts/ti/am57xx-evm.dtso
>>
>> diff --git a/arch/arm/boot/dts/ti/am57xx-evm-common.dtso b/arch/arm/boot/dts/ti/am57xx-evm-common.dtso
>> new file mode 100644
>> index 0000000..68c3937
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/ti/am57xx-evm-common.dtso
>> @@ -0,0 +1,175 @@
>> +/dts-v1/;
>> +/plugin/;
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/input/input.h>
>> +
>> +/ {
>> +  fragment@101 {
>> +       target-path = "/";
>> +
>> +       __overlay__ {
> 
> It would be good to have "scripts/dtc: Correct overlay syntactic sugar for
> generating target-path fragments" in the kernel's copy of dtc, so this
> section can be converted to sugar syntax, too.

Ah yea, that seems to be a recent patch I've missed, but yes, if that 
fixes this limitation, it would be a great addition.

-Tero

> 
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
