From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v2 2/4] clk: renesas: Add r8a7796 CPG Core Clock
 Definitions
Date: Mon, 6 Jun 2016 14:03:47 +0200
Message-ID: <6b57d59f-d17b-a6c3-41d5-e975db544adc@de.bosch.com>
References: <1464625737-6646-1-git-send-email-geert+renesas@glider.be>
 <1464625737-6646-3-git-send-email-geert+renesas@glider.be>
 <574C6C16.3020703@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <574C6C16.3020703@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <damm+renesas@opensource.se>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Geert,

On 30.05.2016 18:36, Dirk Behme wrote:
> Hi Geert,
>
> On 30.05.2016 18:28, Geert Uytterhoeven wrote:
>> Add all R-Car M3-W Clock Pulse Generator Core Clock Outputs, as listed
>> in Table 8.2b ("List of Clocks [R-Car M3-W]") of the R-Car Gen3
>> datasheet (rev. 0.51 + Errata for Rev051 Mar 31 2016).
>>
>> Note that internal CPG clocks (S0, S1, S2, S3, SDSRC, and SSPSRC) are
>> not included, as they are used as internal clock sources only, and never
>> referenced from DT.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Tested-by: Simon Horman <horms+renesas@verge.net.au>
>> ---
>> v2:
>>    - Add Tested-by.
>> ---
>>   include/dt-bindings/clock/r8a7796-cpg-mssr.h | 69
>> ++++++++++++++++++++++++++++
>>   1 file changed, 69 insertions(+)
>>   create mode 100644 include/dt-bindings/clock/r8a7796-cpg-mssr.h
>>
>> diff --git a/include/dt-bindings/clock/r8a7796-cpg-mssr.h
>> b/include/dt-bindings/clock/r8a7796-cpg-mssr.h
>> new file mode 100644
>> index 0000000000000000..1e5942695f0dd057
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/r8a7796-cpg-mssr.h
>> @@ -0,0 +1,69 @@
>> +/*
>> + * Copyright (C) 2016 Renesas Electronics Corp.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + */
>> +#ifndef __DT_BINDINGS_CLOCK_R8A7796_CPG_MSSR_H__
>> +#define __DT_BINDINGS_CLOCK_R8A7796_CPG_MSSR_H__
>> +
>> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
>> +
>> +/* r8a7796 CPG Core Clocks */
>> +#define R8A7796_CLK_Z            0
>> +#define R8A7796_CLK_Z2            1
>> +#define R8A7796_CLK_ZR            2
>> +#define R8A7796_CLK_ZG            3
>> +#define R8A7796_CLK_ZTR            4
>> +#define R8A7796_CLK_ZTRD2        5
>> +#define R8A7796_CLK_ZT            6
>> +#define R8A7796_CLK_ZX            7
>> +#define R8A7796_CLK_S0D1        8
>> +#define R8A7796_CLK_S0D2        9
>> +#define R8A7796_CLK_S0D3        10
>> +#define R8A7796_CLK_S0D4        11
>> +#define R8A7796_CLK_S0D6        12
>> +#define R8A7796_CLK_S0D8        13
>> +#define R8A7796_CLK_S0D12        14
>> +#define R8A7796_CLK_S1D1        15
>> +#define R8A7796_CLK_S1D2        16
>> +#define R8A7796_CLK_S1D4        17
>> +#define R8A7796_CLK_S2D1        18
>> +#define R8A7796_CLK_S2D2        19
>> +#define R8A7796_CLK_S2D4        20
>> +#define R8A7796_CLK_S3D1        21
>> +#define R8A7796_CLK_S3D2        22
>> +#define R8A7796_CLK_S3D4        23
>> +#define R8A7796_CLK_LB            24
>> +#define R8A7796_CLK_CL            25
>> +#define R8A7796_CLK_ZB3            26
>> +#define R8A7796_CLK_ZB3D2        27
>> +#define R8A7796_CLK_ZB3D4        28
>> +#define R8A7796_CLK_CR            29
>> +#define R8A7796_CLK_CRD2        30
>> +#define R8A7796_CLK_SD0H        31
>> +#define R8A7796_CLK_SD0            32
>> +#define R8A7796_CLK_SD1H        33
>> +#define R8A7796_CLK_SD1            34
>> +#define R8A7796_CLK_SD2H        35
>> +#define R8A7796_CLK_SD2            36
>> +#define R8A7796_CLK_SD3H        37
>> +#define R8A7796_CLK_SD3            38
>> +#define R8A7796_CLK_SSP2        39
>> +#define R8A7796_CLK_SSP1        40
>> +#define R8A7796_CLK_SSPRS        41
>> +#define R8A7796_CLK_RPC            42
>> +#define R8A7796_CLK_RPCD2        43
>> +#define R8A7796_CLK_MSO            44
>> +#define R8A7796_CLK_CANFD        45
>> +#define R8A7796_CLK_HDMI        46
>> +#define R8A7796_CLK_CSI0        47
>> +#define R8A7796_CLK_CSIREF        48
>> +#define R8A7796_CLK_CP            49
>> +#define R8A7796_CLK_CPEX        50
>> +#define R8A7796_CLK_R            51
>> +#define R8A7796_CLK_OSC            52
>
>
> I think we recently started a discussion to find a more clever way to
> avoid re-defining (copy & paste) all this R-Car3 clocks  (compare [1])
> where they are the same over the R-Car3 family while still being able to
> deal with the differences.
>
> Best regards
>
> Dirk
>
> [1]
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/include/dt-bindings/clock/r8a7795-cpg-mssr.h


What's the status of the discussion I mentioned above?


Best regards

Dirk
