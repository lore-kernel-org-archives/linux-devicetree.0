From: Sylvain Lemieux <slemieux.tyco@gmail.com>
Subject: Re: [PATCH 1/2] clk: lpc32xx: add clock frequency output
 configuration
Date: Wed, 10 Feb 2016 12:33:49 -0500
Message-ID: <1455125629.14667.10.camel@localhost>
References: <1455043670-19025-1-git-send-email-slemieux.tyco@gmail.com>
	 <20160209185723.GC31947@codeaurora.org>
	 <1455048430.19294.3.camel@localhost>  <56BA7D89.7060505@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <56BA7D89.7060505@mleia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, robh+dt@kernel.org, mturquette@baylibre.com, stigge@antcom.de, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Vladimir

On Wed, 2016-02-10 at 02:00 +0200, Vladimir Zapolskiy wrote:
> Hi Sylvain,
> 
> On 09.02.2016 22:07, Sylvain Lemieux wrote:
> > On Tue, 2016-02-09 at 10:57 -0800, Stephen Boyd wrote:
> >> On 02/09, slemieux.tyco@gmail.com wrote:
> >>> From: Sylvain Lemieux <slemieux@tycoint.com>
> >>>
> >>> This patch add the support to setup the clock frequency output
> >>> using an optional parameter from the device tree.
> >>>
> >>> The previous kernel version did not change the clock frequency
> >>> output setup by the kickstart and/or bootloader;
> >>> this version always setup the clock frequency output to 208MHz.
> 
> ok, it makes perfect sense, and here I see two options, one is to recover
> the previous behaviour by removing clk_set_rate() of LPC32XX_CLK_HCLK_PLL
> completely, another one (and more preferable) is to add this clock
> to a list in include/dt-bindings/clock/lpc32xx-clock.h and set its
> rate in a board specific DTB file.

I will submit a version 2 of this patch later today using the
second option.

> 
> >>> Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
> >>> ---
> >>
> >> We have assigned-clock-rates, can you use that instead?
> >>
> > OK, I will submit a new version of the patch tomorrow.
> > 
> 
> By the way if you have a cover letter or 2/2 patch in the series,
> please send it to linux-clk as well.

The was no cover letter for this series (trivial change).

The patch 2/2 was submitted to the "linux-clk" mailling list
(http://thread.gmane.org/gmane.linux.kernel.clk/3911).

> 
> --
> With best wishes,
> Vladimir

Sylvain Lemieux


