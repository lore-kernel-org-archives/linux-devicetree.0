From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 01/13] ARM: shmobile: r8a7792: add clock index macros
Date: Wed, 1 Jun 2016 17:09:56 +0300
Message-ID: <0348e084-b84c-79de-08b9-034026ec6b59@cogentembedded.com>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
 <2280165.siMXMbFrFe@wasted.cogentembedded.com>
 <CAMuHMdVZ_8z3coEXswM0VSNPx0=yxdBmAmJjwHyZ9PyB5RZRfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVZ_8z3coEXswM0VSNPx0=yxdBmAmJjwHyZ9PyB5RZRfQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 06/01/2016 10:22 AM, Geert Uytterhoeven wrote:

>> Add macros usable by the device tree sources to reference the R8A7792
>> clocks  by index.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>>  include/dt-bindings/clock/r8a7792-clock.h |  104 ++++++++++++++++++++++++++++++
>>  1 file changed, 104 insertions(+)
>>
>> Index: renesas/include/dt-bindings/clock/r8a7792-clock.h
>> ===================================================================
>> --- /dev/null
>> +++ renesas/include/dt-bindings/clock/r8a7792-clock.h
>> @@ -0,0 +1,104 @@
>> +/*
>> + * Copyright (C) 2016 Cogent Embedded, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + */
>> +
>> +#ifndef __DT_BINDINGS_CLOCK_R8A7792_H__
>> +#define __DT_BINDINGS_CLOCK_R8A7792_H__
>> +
>> +/* CPG */
>> +#define R8A7792_CLK_MAIN               0
>> +#define R8A7792_CLK_PLL0               1
>> +#define R8A7792_CLK_PLL1               2
>> +#define R8A7792_CLK_PLL3               3
>> +#define R8A7792_CLK_LB                 4
>> +#define R8A7792_CLK_QSPI               5
>> +#define R8A7792_CLK_SDH                        6
>> +#define R8A7792_CLK_SD0                        7
>> +#define R8A7792_CLK_SD1                        8
>
> As Simon already pointed out, there are no ...SD* clocks on V2H.

    Right, looks like I shouldn't have trusted the original patch... :-/

>> +#define R8A7792_CLK_Z                  9
>
>> +/* MSTP1 */
>> +#define R8A7792_CLK_TMU1               11
>> +#define R8A7792_CLK_TMU3               21
>> +#define R8A7792_CLK_TMU2               22
>> +#define R8A7792_CLK_CMT0               24
>> +#define R8A7792_CLK_TMU0               25
>> +#define R8A7792_CLK_VSP1DU1            27
>> +#define R8A7792_CLK_VSP1DU0            28
>> +#define R8A7792_CLK_VSP1_SY            31
>
> These are called ...VSP1_DU1, ...VSP1_DU0, and ...VSP1_S on all other
> R-Car Gen2 SoCs.

    My naming comes from the 1.02 manual.

>> +/* MSTP2 */
>> +#define R8A7792_CLK_MSIOF1             8
>> +#define R8A7792_CLK_SYS_DMAC0          18
>
> This is ...SYS_DMAC1
>
>> +#define R8A7792_CLK_SYS_DMAC1          19
>
> ... and this is ...SYS_DMAC0

    Thanks for catching!

>> +/* MSTP9 */
>> +#define R8A7792_CLK_GPIO7              4
>> +#define R8A7792_CLK_GPIO6              5
>> +#define R8A7792_CLK_GPIO5              7
>> +#define R8A7792_CLK_GPIO4              8
>> +#define R8A7792_CLK_GPIO3              9
>> +#define R8A7792_CLK_GPIO2              10
>> +#define R8A7792_CLK_GPIO1              11
>> +#define R8A7792_CLK_GPIO0              12
>> +#define R8A7792_CLK_GPIO11             13
>> +#define R8A7792_CLK_GPIO10             14
>> +#define R8A7792_CLK_CAN1               15
>> +#define R8A7792_CLK_CAN0               16
>
> These are called ...RCAN1 and ...RCAR0 on all other R-Car Gen2 SoCs.

    Not in the 1.02 manual (they were called RCAN<n> in some of the earlier 
manual revs). Dunno if it makes sense to rename them in the other .dts now...

> Gr{oetje,eeting}s,
>
>                         Geert

WBR, Sergei
