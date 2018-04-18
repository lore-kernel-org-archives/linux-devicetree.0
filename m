MIME-Version: 1.0
In-Reply-To: <CAMuHMdWmsnRDBTvv+dy0uGx_6XSVErLHJgR_rQNvepOhAyDg4g@mail.gmail.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
	<1523956215-28154-7-git-send-email-t-kristo@ti.com>
	<CAMuHMdWmsnRDBTvv+dy0uGx_6XSVErLHJgR_rQNvepOhAyDg4g@mail.gmail.com>
Date: Wed, 18 Apr 2018 17:40:07 -0500
Message-ID: <CAL_JsqLs8f1=0tiBsRVMzaiXjcXfMk6621Qqi8P4CphM+_fJuQ@mail.gmail.com>
Subject: Re: [RFC 06/13] ARM: dts: am57xx-evm: add AM57xx-evm DT overlay
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tero Kristo <t-kristo@ti.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "Mills, William" <wmills@ti.com>, ext Tony Lindgren <tony@atomide.com>, Tom Rini <trini@konsulko.com>, Russell King <rmk@armlinux.org.uk>
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 18, 2018 at 9:36 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, Apr 17, 2018 at 11:10 AM, Tero Kristo <t-kristo@ti.com> wrote:
>> The AM57xx-evm is an overlay on top of beagle-x15 board. This contains
>> a display extension macro, and a few extra peripherals. Two versions
>> of the evm are supported, the base evm and the latest rev A3 evm. A
>> common overlay file is used for both boards.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>  arch/arm/boot/dts/ti/am57xx-evm-common.dtso | 175 ++++++++++++++++++++++++++++
>>  arch/arm/boot/dts/ti/am57xx-evm-reva3.dtso  |  11 ++
>>  arch/arm/boot/dts/ti/am57xx-evm.dtso        |  11 ++
>>  3 files changed, 197 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/ti/am57xx-evm-common.dtso
>>  create mode 100644 arch/arm/boot/dts/ti/am57xx-evm-reva3.dtso
>>  create mode 100644 arch/arm/boot/dts/ti/am57xx-evm.dtso
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

I'm planning to do a dtc update for 4.18 too. New warnings coming too. :)

Rob
