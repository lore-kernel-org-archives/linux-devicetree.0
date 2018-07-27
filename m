From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 00/16] clk: at91: Rework DT bindings
Date: Fri, 27 Jul 2018 22:02:17 +0200
Message-ID: <20180727200217.GF7701@piout.net>
References: <20180717222757.10253-1-alexandre.belloni@bootlin.com>
 <153271100280.48062.2538655794734424353@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <153271100280.48062.2538655794734424353@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 27/07/2018 10:03:22-0700, Stephen Boyd wrote:
> Quoting Alexandre Belloni (2018-07-17 15:27:41)
> > This is the promised rework of the at91 PMC clocks driver. It is mainly
> > necessary to remove the DTC warnings but it also complies with the CCF
> > rule that there should be one node per controller instead of one node
> > per clock.
> > 
> > This only handles the PMC, I'm planning to also rework the SCKC bindings
> > later (without breaking the DT ABI).
> > 
> > The series is based on top of clk-next plus at91-dt so I don't think it
> > is convenient to have it this cycle. However, I would really like to
> > ensure we agree on the new bindings this cycle before converting all the
> > other platforms as this is a bit tedious.
> > 
> > The first two patches are actually fixes and may be considered for this
> > cycle.
> > 
> > One nice note:
> > at91-sama5d2_xplained.dtb goes from 29351 bytes to 22082 bytes
> 
> Patches look mostly good. Rob is happy with the bindings and so am I.
> 
> One general question is why the drivers can't be moved to real platform
> drivers instead of using OF_CLK_DECLARE?
> 

I actually didn't try. I'll do it early next week. I'm not sure how this
will work with the PM handling on sama5d2 but I'll probably figure
something out.

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
