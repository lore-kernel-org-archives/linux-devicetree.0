From: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Subject: Re: [PATCH] clk: add generic driver for fixed rate clock
Date: Thu, 19 Nov 2015 22:25:37 +0200
Message-ID: <20151119202536.GA9332@chokladfabriken.org>
References: <1378010420-20031-1-git-send-email-stefan.kristiansson@saunalahti.fi>
 <CAMuHMdXhxuawY-V+35YoeZWZ3jZ-Vj_MzuRDGBfDD9i9iy=oGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXhxuawY-V+35YoeZWZ3jZ-Vj_MzuRDGBfDD9i9iy=oGA@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, linux-clk <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 17, 2015 at 04:46:29PM +0100, Geert Uytterhoeven wrote:
> Thanks, this is still very useful!
> 
> I stumbled across this old patch while trying to instantiate a fixed rate
> clock from a DT overlay.
> Without this, the clock is never instantiated, as drivers/clk/clk-fixed-rate.c
> uses CLK_OF_DECLARE() :-( With your driver, it works as expected
> (after fixing the modpost complaint, cfr. below).
>

Ah, I'm glad that this old thing was of use to someone else than me ;)

> However, I think that instead of creating a new driver, you should just add
> the meat of clk-generic-fixed.c to clk-fixed-rate.c.

Sure, that sounds reasonable, I'll take a second bat at this patch and do that.

Stefan
