From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] clk: add generic driver for fixed rate clock
Date: Wed, 18 Nov 2015 22:43:31 +0100
Message-ID: <CAMuHMdX3ZYx2UTspQxHdcmVPEvz-hPQm4NhnwLC-y6qA4ciFyw@mail.gmail.com>
References: <1378010420-20031-1-git-send-email-stefan.kristiansson@saunalahti.fi>
	<CAMuHMdXhxuawY-V+35YoeZWZ3jZ-Vj_MzuRDGBfDD9i9iy=oGA@mail.gmail.com>
	<20151118203433.GE32672@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20151118203433.GE32672@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, linux-clk <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Wed, Nov 18, 2015 at 9:34 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 11/17, Geert Uytterhoeven wrote:
>> (quoting the full driver, as it predates linux-clk)
>>
>> On Sun, Sep 1, 2013 at 6:40 AM, Stefan Kristiansson
>> <stefan.kristiansson@saunalahti.fi> wrote:
>> > This adds a simple driver with the only purpose to initialise
>> > the fixed rate clock.
>> > This is useful for systems that do not wish to use seperate init
>> > code for the fixed rate clock init, but rather only rely on a
>> > device tree description of it.
>> >
>> > Signed-off-by: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
>>
>> Thanks, this is still very useful!
>>
>> I stumbled across this old patch while trying to instantiate a fixed rate
>> clock from a DT overlay.
>> Without this, the clock is never instantiated, as drivers/clk/clk-fixed-rate.c
>> uses CLK_OF_DECLARE() :-( With your driver, it works as expected
>> (after fixing the modpost complaint, cfr. below).
>>
>> However, I think that instead of creating a new driver, you should just add
>> the meat of clk-generic-fixed.c to clk-fixed-rate.c.
>
> Hm... what happens when of_clk_init() runs and instantiates the
> clock, and then of_platform_populate() runs and creates the clock
> again? The platform device probe fails because the framework
> checks to make sure two clocks don't have the same name? I guess
> that's going to work, but it doesn't make me feel good.

My DTS does have other clocks that are compatible with "fixed-clock"
and I didn't notice any ill behavior. Perhaps the driver core knows the
node has already been bound to something, and thus no longer tries
to bind it to a platform driver?

I'll double-check that later...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
