From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ARM: dts: r7s72100: add clock bit definitions
Date: Thu, 1 Jun 2017 10:22:56 +0200
Message-ID: <CAMuHMdVnNod2F37AbHkc8qwWWxOD99vkdXaT9X-v26E6j60udQ@mail.gmail.com>
References: <20170525160548.103182-1-chris.brandt@renesas.com>
 <CAMuHMdW21gwJZxCMsepX9c3hqpfw_+zc1x_f-6D0oKFVvqY2Kg@mail.gmail.com> <SG2PR06MB11652CB46B57C6C592F7A2FB8AF00@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB11652CB46B57C6C592F7A2FB8AF00@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Tue, May 30, 2017 at 6:23 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
>> > +#define R7S72100_CLK_SPIMBC0   3
>> > +#define R7S72100_CLK_SPIMBC1   2
>>
>> R7S72100_CLK_SPB[0-1]?
>
> Here's the one that I'm struggling with what to call.
>
> Internally, the IP block is referred to as the "SPIBSC". As in, SPI Bus
> State Controller (because basically anything that has a parallel
> interface to the internal bus the design guys call it a BSC: LBSC, DBSC,
> etc...).
>
> However, for every device this IP is used in it is called the "SPI
> Multi I/O Bus Controller" in the Hardware Manual (SH7769, RZ/A1, R-Car Gen3,
> etc...).
>
> So, that might be confusing to users.
>
> Originally, it was called "SPI BSC" because they were only connecting a
> "SPI" bus interface as a "Bus State Controller". However, now they've
> added onto the IP and it does more than just SPI.
>
>
>> All related registers and clocks are called SPB<something>.
> Only the pins are labeled SPB<something>, not the registers. The
> registers doesn't really have a common prefix.
>
>
> So in general, what's your opinion on what to call this thing (since
> I'd like to name the driver in a similar manner)?
>
> (1) "SPIBSC": Because that's what all the non-Linux sample code and app
>      note refer to it.
>
> (2) "SPIMBC": Taken from "SPI Multi I/O Bus Controller" (using all 1st
>     letters except the "I/O" part)
>
> (3) "SPB": Because that is how they named the pins for RZ/1 (NOTE that
>     is just for RZ/A1 and SH7269, for RZ/A2++ and R-Car they are labeled
>     QSPI_xxx...so you will probably never see SPB again in future hardware
>     manuals)
>
> (4) "SBC": For Serial Bus Controller
>
>
> I am leaning to just staying with "SPIBSC" which is what I use now for
> our current Linux BSP and non-Linux sample code, or "SBC" just to
> shorten it.
>
> Any opinions???

I'm fine with SPIBSC.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
