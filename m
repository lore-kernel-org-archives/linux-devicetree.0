From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 2/4] clk: renesas: Add r8a7796 CPG Core Clock Definitions
Date: Tue, 7 Jun 2016 10:17:17 +0200
Message-ID: <CAMuHMdW6kTMQoVO15Eve2Er5pfSiEc4LkwvQ72WU1LmdSK+CxQ@mail.gmail.com>
References: <1464625737-6646-1-git-send-email-geert+renesas@glider.be>
 <1464625737-6646-3-git-send-email-geert+renesas@glider.be>
 <574C6C16.3020703@gmail.com> <6b57d59f-d17b-a6c3-41d5-e975db544adc@de.bosch.com>
 <CAMuHMdWByGTDcG62qTg5N69FACx4FiuVuRrF_woyFAoNOpbjSw@mail.gmail.com> <77a45dc7-59f0-23fc-f30d-b3daab34d689@de.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <77a45dc7-59f0-23fc-f30d-b3daab34d689@de.bosch.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <damm+renesas@opensource.se>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk <linux-clk@vger.kernel.org>, linux-renesas-soc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Dirk,

On Tue, Jun 7, 2016 at 9:53 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> I think I just want to discuss if we have a clever idea to further improve
> one detail. That is, if we have a clever idea to avoid the copy & paste
> between the family members using anything like a hierarchical way of
> defining the clocks in r8a779x-cpg-mssr.h.
>
>> Given the small amount of work needed to bootstrap r8a7796, I
>> think they still hold on their promises.
>
> Well, regarding the r8a779x-cpg-mssr.h the small amount of work needed isn't
> a really good argument if you are good with cp & sed for the copy & paste
> done ;)

They're not really created by cp & sed, as they must match the table in the
datasheet (the latter may have been created by copy & paste though :-)

> What I fear we end up the way we are doing the copy & paste
> r8a779x-cpg-mssr.h is having 5 or 6 or even more of these files, all > 90%
> identical. And once you have to change anything, you either have to change
> all these files. Or you miss anything, ending up with subtle bugs when one
> SoC does behave differently than an other one.

The point is these files are stable ABI: no single value can be changed.
No value can be reused. Only new values can be appended at the bottom
(if a newer revision of the datasheet documents more clocks than the old
 version, which happens from time to time).

IMHO a hierarchical way of defining the clocks has more opportunity of
accidentally referring to a clock that doesn't exist on a particular SoC.

Furthermore, r8a779x-cpg-mssr.h is not a good name to be part of a DT binding,
due to the wildcard.
A future SoC may will match r8a779x and even be called (R-Car <something>3?),
while using a completely different CPG block.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
