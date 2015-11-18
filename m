From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] clk: add generic driver for fixed rate clock
Date: Wed, 18 Nov 2015 12:34:33 -0800
Message-ID: <20151118203433.GE32672@codeaurora.org>
References: <1378010420-20031-1-git-send-email-stefan.kristiansson@saunalahti.fi>
 <CAMuHMdXhxuawY-V+35YoeZWZ3jZ-Vj_MzuRDGBfDD9i9iy=oGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXhxuawY-V+35YoeZWZ3jZ-Vj_MzuRDGBfDD9i9iy=oGA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, linux-clk <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 11/17, Geert Uytterhoeven wrote:
> Hi Stefan,
> 
> (quoting the full driver, as it predates linux-clk)
> 
> On Sun, Sep 1, 2013 at 6:40 AM, Stefan Kristiansson
> <stefan.kristiansson@saunalahti.fi> wrote:
> > This adds a simple driver with the only purpose to initialise
> > the fixed rate clock.
> > This is useful for systems that do not wish to use seperate init
> > code for the fixed rate clock init, but rather only rely on a
> > device tree description of it.
> >
> > Signed-off-by: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> 
> Thanks, this is still very useful!
> 
> I stumbled across this old patch while trying to instantiate a fixed rate
> clock from a DT overlay.
> Without this, the clock is never instantiated, as drivers/clk/clk-fixed-rate.c
> uses CLK_OF_DECLARE() :-( With your driver, it works as expected
> (after fixing the modpost complaint, cfr. below).
> 
> However, I think that instead of creating a new driver, you should just add
> the meat of clk-generic-fixed.c to clk-fixed-rate.c.

Hm... what happens when of_clk_init() runs and instantiates the
clock, and then of_platform_populate() runs and creates the clock
again? The platform device probe fails because the framework
checks to make sure two clocks don't have the same name? I guess
that's going to work, but it doesn't make me feel good.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
