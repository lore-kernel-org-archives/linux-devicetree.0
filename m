From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v2 2/4] clk: renesas: Add r8a7796 CPG Core Clock
 Definitions
Date: Wed, 29 Jun 2016 09:58:55 +0200
Message-ID: <3db87dd5-23a0-56c9-27b5-efac9f8d8023@de.bosch.com>
References: <1464625737-6646-1-git-send-email-geert+renesas@glider.be>
 <1464625737-6646-3-git-send-email-geert+renesas@glider.be>
 <574C6C16.3020703@gmail.com>
 <6b57d59f-d17b-a6c3-41d5-e975db544adc@de.bosch.com>
 <CAMuHMdWByGTDcG62qTg5N69FACx4FiuVuRrF_woyFAoNOpbjSw@mail.gmail.com>
 <77a45dc7-59f0-23fc-f30d-b3daab34d689@de.bosch.com>
 <CAMuHMdW6kTMQoVO15Eve2Er5pfSiEc4LkwvQ72WU1LmdSK+CxQ@mail.gmail.com>
 <94042cf8-5364-8426-a5de-b83fe291fee1@de.bosch.com>
 <CAMuHMdVBu-ecbisZWfx0uKMx=M0zjT+u=j-uF=85_gaDt2u7Jg@mail.gmail.com>
 <743e32de-037b-de4d-98c3-ea7a2738343a@de.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <743e32de-037b-de4d-98c3-ea7a2738343a@de.bosch.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <damm+renesas@opensource.se>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk <linux-clk@vger.kernel.org>, linux-renesas-soc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, TOSHIAKI KOMATSU <toshiaki.komatsu.ud@renesas.com>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On 10.06.2016 08:34, Dirk Behme wrote:
> Hi Geert,
>
> On 09.06.2016 10:54, Geert Uytterhoeven wrote:
>> Hi Dirk,
>>
>> On Thu, Jun 9, 2016 at 10:31 AM, Dirk Behme <dirk.behme@de.bosch.com>
>> wrote:
>>> On 07.06.2016 10:17, Geert Uytterhoeven wrote:
>>>> On Tue, Jun 7, 2016 at 9:53 AM, Dirk Behme <dirk.behme@de.bosch.com>
>>>> wrote:
>>>>>
>>>>> I think I just want to discuss if we have a clever idea to further
>>>>> improve
>>>>> one detail. That is, if we have a clever idea to avoid the copy &
>>>>> paste
>>>>> between the family members using anything like a hierarchical way of
>>>>> defining the clocks in r8a779x-cpg-mssr.h.
>>>>>
>>>>>> Given the small amount of work needed to bootstrap r8a7796, I
>>>>>> think they still hold on their promises.
>>>>>
>>>>> Well, regarding the r8a779x-cpg-mssr.h the small amount of work needed
>>>>> isn't
>>>>> a really good argument if you are good with cp & sed for the copy &
>>>>> paste
>>>>> done ;)
>>>>
>>>> They're not really created by cp & sed, as they must match the table in
>>>> the
>>>> datasheet (the latter may have been created by copy & paste though :-)
>>>>
>>>>> What I fear we end up the way we are doing the copy & paste
>>>>> r8a779x-cpg-mssr.h is having 5 or 6 or even more of these files, all >
>>>>> 90%
>>>>> identical. And once you have to change anything, you either have to
>>>>> change
>>>>> all these files. Or you miss anything, ending up with subtle bugs when
>>>>> one
>>>>> SoC does behave differently than an other one.
>>>>
>>>> The point is these files are stable ABI: no single value can be
>>>> changed.
>>>> No value can be reused. Only new values can be appended at the bottom
>>>> (if a newer revision of the datasheet documents more clocks than the
>>>> old
>>>>  version, which happens from time to time).
>>>>
>>>> IMHO a hierarchical way of defining the clocks has more opportunity of
>>>> accidentally referring to a clock that doesn't exist on a particular
>>>> SoC.
>>>>
>>>> Furthermore, r8a779x-cpg-mssr.h is not a good name to be part of a DT
>>>> binding,
>>>> due to the wildcard.
>>>> A future SoC may will match r8a779x and even be called (R-Car
>>>> <something>3?),
>>>> while using a completely different CPG block.
>>>
>>> Just to give an example about what we are talking, I've done [1]
>>> below. This
>>> should just be an *example*, though. I'm sure that we might need a more
>>> clever way.
>>
>> Thanks, it matches with what I had in mind what you wanted to do ;-)
>>
>>> --- a/include/dt-bindings/clock/r8a7796-cpg-mssr.h
>>> +++ b/include/dt-bindings/clock/r8a7796-cpg-mssr.h
>>
>>> +#include <dt-bindings/clock/rcar3-cpg-mssr.h>
>>
>>> +#define R8A7796_CLK_ZB3D4              47
>>> +#define R8A7796_CLK_S0D2               48
>>> +#define R8A7796_CLK_S0D3               49
>>> +#define R8A7796_CLK_S0D6               50
>>> +#define R8A7796_CLK_S0D8               51
>>> +#define R8A7796_CLK_S0D12              53
>>
>> This means on M3-W, clocks may have different prefixes:
>>   - RCAR3_CLK_* if they are defined as common R-Car Gen3 clocks,
>>   - R8A7796_CLK_* if they are defined as M3-W-specific clocks.
>>
>> Not such a big issue, it that can be worked around using
>>
>>     #define R8A7796_CLK_Z RCAR3_CLK_Z
>>     [...]
>>
>>> +++ b/include/dt-bindings/clock/rcar3-cpg-mssr.h
>>> @@ -0,0 +1,63 @@
>>> +/*
>>> + * Copyright (C) 2015 Renesas Electronics Corp.
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License as published by
>>> + * the Free Software Foundation; either version 2 of the License, or
>>> + * (at your option) any later version.
>>> + */
>>> +#ifndef __DT_BINDINGS_CLOCK_RCAR3_CPG_MSSR_H__
>>> +#define __DT_BINDINGS_CLOCK_RCAR3_CPG_MSSR_H__
>>> +
>>> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
>>> +
>>> +/* RCar3 CPG Core Clocks */
>>> +#define RCAR3_CLK_Z            0
>>> +#define RCAR3_CLK_Z2           1
>>> +#define RCAR3_CLK_ZR           2
>>> +#define RCAR3_CLK_ZG           3
>>> +#define RCAR3_CLK_ZTR          4
>>> +#define RCAR3_CLK_ZTRD2                5
>>
>> While this approach allows to add SoC-specific clocks to the
>> family-specific
>> base list, it does not allow to remove family-specific clocks that are
>> not
>> present on unknown future species of the family.
>
>
> If I answer with
>
> #undef
>
> that would be too easy? ;)


How do we continue the discussion about a hierarchical structure of the 
RCar3 CPG clock definitions?


Best regards

Dirk
