From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 2/4] clk: at91: sckc: add support to specify registers
 bit offsets
Date: Fri, 17 May 2019 23:13:36 +0200
Message-ID: <20190517211336.GB7685@piout.net>
References: <1557487388-32098-1-git-send-email-claudiu.beznea@microchip.com>
 <1557487388-32098-3-git-send-email-claudiu.beznea@microchip.com>
 <20190510213242.GE7622@piout.net>
 <b99b1782-30be-b6b9-0df2-f14125be22ac@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b99b1782-30be-b6b9-0df2-f14125be22ac@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu.Beznea@microchip.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 16/05/2019 08:10:34+0000, Claudiu.Beznea@microchip.com wrote:
> >> @@ -69,10 +80,11 @@ static int clk_slow_osc_prepare(struct clk_hw *hw)
> >>  	void __iomem *sckcr = osc->sckcr;
> >>  	u32 tmp = readl(sckcr);
> >>  
> >> -	if (tmp & (AT91_SCKC_OSC32BYP | AT91_SCKC_OSC32EN))
> >> +	if (tmp & (AT91_SCKC_OSC32BYP(osc->bits) |
> >> +		   AT91_SCKC_OSC32EN(osc->bits)))
> > 
> > I still find that:
> > 
> > 	if (tmp & (osc->bits->cr_osc32byp | osc->bits->cr_osc32en))
> > 
> > would be shorter and easier to read and still fits on one line.
> 
> Agree, but I thought to use the same interface everywhere. Anyway, tell me
> if you want to resend with these changes.
> 
My comment applies to all the AT91_SCKC_.*() macros. I don't feel that
the macros make the code clearer, accessing bits->cr_.* is self
documenting enough (and makes the code shorter).

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
