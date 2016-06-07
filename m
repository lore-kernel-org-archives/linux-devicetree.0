From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v2 2/4] clk: renesas: Add r8a7796 CPG Core Clock
 Definitions
Date: Tue, 7 Jun 2016 09:53:17 +0200
Message-ID: <77a45dc7-59f0-23fc-f30d-b3daab34d689@de.bosch.com>
References: <1464625737-6646-1-git-send-email-geert+renesas@glider.be>
 <1464625737-6646-3-git-send-email-geert+renesas@glider.be>
 <574C6C16.3020703@gmail.com>
 <6b57d59f-d17b-a6c3-41d5-e975db544adc@de.bosch.com>
 <CAMuHMdWByGTDcG62qTg5N69FACx4FiuVuRrF_woyFAoNOpbjSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWByGTDcG62qTg5N69FACx4FiuVuRrF_woyFAoNOpbjSw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <damm+renesas@opensource.se>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk <linux-clk@vger.kernel.org>, linux-renesas-soc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On 06.06.2016 14:59, Geert Uytterhoeven wrote:
> Hi Dirk,
>
> On Mon, Jun 6, 2016 at 2:03 PM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>> On 30.05.2016 18:36, Dirk Behme wrote:
>>> On 30.05.2016 18:28, Geert Uytterhoeven wrote:
>>>> Add all R-Car M3-W Clock Pulse Generator Core Clock Outputs, as listed
>>>> in Table 8.2b ("List of Clocks [R-Car M3-W]") of the R-Car Gen3
>>>> datasheet (rev. 0.51 + Errata for Rev051 Mar 31 2016).
>>>>
>>>> Note that internal CPG clocks (S0, S1, S2, S3, SDSRC, and SSPSRC) are
>>>> not included, as they are used as internal clock sources only, and never
>>>> referenced from DT.
>>>>
>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> Tested-by: Simon Horman <horms+renesas@verge.net.au>
>>>> ---
>>>> v2:
>>>>    - Add Tested-by.
>>>> ---
>>>>   include/dt-bindings/clock/r8a7796-cpg-mssr.h | 69
>>>> ++++++++++++++++++++++++++++
>>>>   1 file changed, 69 insertions(+)
>>>>   create mode 100644 include/dt-bindings/clock/r8a7796-cpg-mssr.h
>>>>
>>>> diff --git a/include/dt-bindings/clock/r8a7796-cpg-mssr.h
>>>> b/include/dt-bindings/clock/r8a7796-cpg-mssr.h
>>>> new file mode 100644
>>>> index 0000000000000000..1e5942695f0dd057
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/clock/r8a7796-cpg-mssr.h
>>>> @@ -0,0 +1,69 @@
>>>> +/*
>>>> + * Copyright (C) 2016 Renesas Electronics Corp.
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or modify
>>>> + * it under the terms of the GNU General Public License as published by
>>>> + * the Free Software Foundation; either version 2 of the License, or
>>>> + * (at your option) any later version.
>>>> + */
>>>> +#ifndef __DT_BINDINGS_CLOCK_R8A7796_CPG_MSSR_H__
>>>> +#define __DT_BINDINGS_CLOCK_R8A7796_CPG_MSSR_H__
>>>> +
>>>> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
>>>> +
>>>> +/* r8a7796 CPG Core Clocks */
>>>> +#define R8A7796_CLK_Z            0
>
> [...]
>
>>> I think we recently started a discussion to find a more clever way to
>>> avoid re-defining (copy & paste) all this R-Car3 clocks  (compare [1])
>>> where they are the same over the R-Car3 family while still being able to
>>> deal with the differences.
>>>
>>> Best regards
>>>
>>> Dirk
>>>
>>> [1]
>>>
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/include/dt-bindings/clock/r8a7795-cpg-mssr.h
>>
>> What's the status of the discussion I mentioned above?
>
> As mentioned in that thread,the CPGs in r8a7795 and r8a7796 provide
> slightly different sets of clocks. Future members of the R-Car Gen3
> family may provide the same or different sets of clocks, we don't know.
>
> As Magnus already mentions, we try to stay as close as possible to the
> datasheet (which is unfortunately a moving target, too).
>
> For CPG Core Clocks, the datasheet only provides us with a list of named
> clocks.  There are no fixed numbers. So either we refer to clocks by
> name, or by coming up with our own numbering scheme (which has to be a
> stable set of numbers, i.e. append only).
>
> For MSSR (Module) Clocks, the datasheet does provide us with numbers
> (MSTP register index + bit index inside the register).
>
> The way the CPG/MSSR drivers handles these clocks was heavily influenced
> by the experience we gained with the Common Clock Framework and DT on
> R-Car Gen2.
>
> R-Car Gen2 described all clocks and their registers in DT. The goal
> (utopia?) here was to handle all SoCs from the family with a single
> driver, provided it was fed with the right description in DT.
>
> For CPG Core Clocks, this lead to a mix of:
>   - Nodes for fixed factor clocks,
>   - Nodes for variable factor clocks, specifying a register to operate
>     on,
>   - Special CPG clocks that couldn't be handled by the above, using a
>     common (family-specific) list of definitions for clocks, that had to
>     be extended constantly.
>
> For MSSR Clocks (called "MSTP" for historical reasons), each set of 32
> clocks had its own node, with multiple registers, and three separate
> arrays for parent clocks, clock indices, and clock names, that had to be
> kept in sync. The clock indices were defines, using numbers from the
> datasheet, but they were still easy to abuse (which register does the
> define apply to?).
>
> As the CCF was quite new and best practices were still under
> development, all of this was difficult to define up-front.
> Due to the complexity, it was also hard to review and maintain, leading
> to many errors.
> The arbitrary (grown organically) offsets for the various MSSR-related
> registers also made it hard to ever add module reset support.
>
> Hence the call for a new framework, designed in close collaboration with the
> clock maintainer, and implemented in the CPG/MSSR driver.
> The goals were:
>   - Make the DT part user friendly, reviewer friendly, and maintainer
>     friendly, as it provides a stable ABI, and thus must be obviously
>     correct from the beginning,
>   - Hide complexity and internals in the driver, as this can be reworked
>     and extended at any time, without breaking the DT ABI,
>   - Hence, describe CPG/MSSR as a single simple block in DT,
>   - Support both new and existing SoCs (PoC was done for r8a7791),
>   - Allow for adding module reset support (the "SR" part) later.
>
> Hence for the CPG Core Clocks, we wanted a simple append-only list of
> defines for all clocks (and only those, as trying to use another clock
> is a bug) that exist on a specific SoC. This allows to list all existing
> clocks in the bindings include up-front.
> A mapping from SoC-specific numbers to family-specific clocks is handled
> by the tables in the driver, to promote code reuse while keeping
> specialization.
>
> For MSSR Clocks, we solved the disconnection of register and bit indices
> by going with a single number. We also removed the defines, as it's
> actually easier to review .dtsi updates if the MSSR clocks are directly
> referred to by number, than by an intermediate define.
>
> I hope this explanation helps in understanding the design choices we
> made.


Many thanks for taking the time for this long background information!

Please note that I don't doubt any of the design choices done.

I think I just want to discuss if we have a clever idea to further 
improve one detail. That is, if we have a clever idea to avoid the copy 
& paste between the family members using anything like a hierarchical 
way of defining the clocks in r8a779x-cpg-mssr.h.


> Given the small amount of work needed to bootstrap r8a7796, I
> think they still hold on their promises.


Well, regarding the r8a779x-cpg-mssr.h the small amount of work needed 
isn't a really good argument if you are good with cp & sed for the copy 
& paste done ;)


What I fear we end up the way we are doing the copy & paste 
r8a779x-cpg-mssr.h is having 5 or 6 or even more of these files, all > 
90% identical. And once you have to change anything, you either have to 
change all these files. Or you miss anything, ending up with subtle bugs 
when one SoC does behave differently than an other one.


Best regards

Dirk
