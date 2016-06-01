From: Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 2/4] clk: renesas: Add r8a7796 CPG Core Clock Definitions
Date: Wed, 1 Jun 2016 12:42:00 +0900
Message-ID: <CANqRtoTkQSoqPc_EaS7AUtvW+5U3-OiSc8SxufQYMpUrWLySGw@mail.gmail.com>
References: <1464625737-6646-1-git-send-email-geert+renesas@glider.be>
	<1464625737-6646-3-git-send-email-geert+renesas@glider.be>
	<574C6C16.3020703@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <574C6C16.3020703@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <damm+renesas@opensource.se>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk <linux-clk@vger.kernel.org>, linux-renesas-soc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Dirk,

On Tue, May 31, 2016 at 1:36 AM, Dirk Behme <dirk.behme@gmail.com> wrote:
> Hi Geert,
>
>
> On 30.05.2016 18:28, Geert Uytterhoeven wrote:
>>
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
[snip]
>> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
>> +
>> +/* r8a7796 CPG Core Clocks */
>> +#define R8A7796_CLK_Z                  0
>> +#define R8A7796_CLK_Z2                 1
>
> I think we recently started a discussion to find a more clever way to avoid
> re-defining (copy & paste) all this R-Car3 clocks  (compare [1]) where they
> are the same over the R-Car3 family while still being able to deal with the
> differences.
>
> [1]
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/include/dt-bindings/clock/r8a7795-cpg-mssr.h

This topic is related to the rather fixed DT ABI for the CPG device.
Please see the interface described in the following upstream commits:

$ git log --oneline
Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt | cat
ca00c38 clk: shmobile: cpg-mssr: Update serial port clock in example
3686d3e clk: shmobile: Add new Renesas CPG/MSSR DT bindings
$

Some years ago we discussed this consolidation topic for R-Car Gen2
and we revisited when doing various iterations for the R-Car Gen3 CPGs
last year. Using a single per-family shared range of clocks was
considered both times, however when comparing the pros and cons it
became evident that best practice with DT tends to be to not speculate
and go with what we know based on existing documentation.

Like you may have experienced, the SoC documentation is slightly
changing over time. Also the number of SoCs in a certain family is
clearly being extended over time. The direction where things are going
is not known during initial design phase. Because of this we make use
of known-to-be-fixed ids such as SoC-specific part numbers instead of
speculating with family DT strings where the meaning tend to change
over time.

If we would go with consolidating the clock indices from per-SoC to
per-family then please note that this does not affect the run time
size of the DTB. In the kernel source code we have some level of
agreed duplication where DT compat strings and such are chosen to be
duplicated per-device instead of trying to make the code more compact.
I believe our build machines are snappy enough to handle a couple of
KiB of strings worst case.

Because of the unchanged DTB size this discussion is purely a matter
of how to maintain the code. So the maintainers need to decide what
level of duplication is needed. Perhaps this topic should be
revisited, and maybe meeting face-to-face would help?

Thanks,

/ magnus
