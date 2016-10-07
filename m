From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/3] ARM: shmobile: r8a7743: add CPG clock index macros
Date: Fri, 7 Oct 2016 21:35:24 +0200
Message-ID: <CAMuHMdU9Mw_sDWv=zQApixpLcxnVMzpwUyyDqfbBNrTiTbaaBg@mail.gmail.com>
References: <19700058.YBgRO3SXUI@wasted.cogentembedded.com>
 <4289081.UEHqeRI6YW@wasted.cogentembedded.com> <8677b11a-64d7-23af-48ef-bc58c9d4b3f3@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <8677b11a-64d7-23af-48ef-bc58c9d4b3f3@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Fri, Oct 7, 2016 at 9:06 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 10/05/2016 11:54 PM, Sergei Shtylyov wrote:
>> Add macros usable by the device tree sources to reference the R8A7743 CPG
>> clocks  by index.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
>    Probably makes sense to merge this patch to both the clk and renesas
> trees in order to satisfy the dependencies both ways... what do you think,
> Simon?

Yes, this is another case where both the clock maintainers and Simon
should merge my clk-renesas-for-v4.10 tree, when It has received (a future
version of) this series.

But that's to be handled after v4.9-rc1...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
