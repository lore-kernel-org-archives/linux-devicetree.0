From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 03/11] dt-bindings: clock: add NXP LPC32xx clock list for consumers
Date: Fri, 20 Nov 2015 22:07:16 +0100
Message-ID: <5570695.dzvsXZ7sfz@wuerfel>
References: <1447981511-29653-1-git-send-email-vz@mleia.com> <4268221.QhjAE5RLYk@wuerfel> <564F5F2E.70607@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <564F5F2E.70607@mleia.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Vladimir Zapolskiy <vz@mleia.com>, Roland Stigge <stigge@antcom.de>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 20 November 2015 19:58:06 Vladimir Zapolskiy wrote:
> On 20.11.2015 15:56, Arnd Bergmann wrote:
> > On Friday 20 November 2015 03:05:03 Vladimir Zapolskiy wrote:
> >> +
> >> +/* LPC32XX System Control Block clocks */
> >> +#define LPC32XX_CLK_RTC                0
> >> +#define LPC32XX_CLK_DMA                1
> >> +#define LPC32XX_CLK_MLC                2
> >> +#define LPC32XX_CLK_SLC                3
> >> +#define LPC32XX_CLK_LCD                4
> >> +#define LPC32XX_CLK_MAC                5
> >> +#define LPC32XX_CLK_SD         6
> >> +#define LPC32XX_CLK_DDRAM      7
> >> +#define LPC32XX_CLK_SSP0       8
> >> +#define LPC32XX_CLK_SSP1       9
> >> +#define LPC32XX_CLK_UART3      10
> >> +#define LPC32XX_CLK_UART4      11
> >> +#define LPC32XX_CLK_UART5      12
> >> +#define LPC32XX_CLK_UART6      13
> >> +#define LPC32XX_CLK_IRDA       14
> >> +#define LPC32XX_CLK_I2C1       15
> >>
> > 
> > Any chance we can avoid the include file? This is going to make it really
> > hard to merge everything in one merge window with the dependencies between
> > the driver, the bindings and the platform code.
> 
> I see only one option to avoid this commit, namely squash it with the
> CCF driver and merge it before making changes in DTS.
> 
> However I suppose ARM trees won't be synced on clk tree, so probably it
> won't simplify maintainer's work.

I think the best way for this would then be to have one git branch that
contains the binding header, and base the other patches on top of that
branch, for both the changes going into the clk git and arm-soc.

That way, both have the commit we need, but we don't get duplicate
commits when they are both merged into mainline.

> > If there is a way to describe the clocks based on numbers from the
> > data sheet instead of making up your own, that makes life much
> > easier for us.
> 
> There are no any clock numbers in the datasheet, unfortunately.

I was thinking that maybe there would be a logical numbering based
on the register layout, e.g. a tuple of register index and bit position,
but it seems that the mmio area is too irregular to make that easy.

	Arnd
