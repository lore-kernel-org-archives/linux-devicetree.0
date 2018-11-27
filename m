From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v5 3/8] clk: lochnagar: Add initial binding documentation
Date: Tue, 27 Nov 2018 09:34:24 +0000
Message-ID: <20181127093424.GR16508@imbe.wolfsonmicro.main>
References: <20181120141631.18949-1-ckeepax@opensource.cirrus.com>
 <20181120141631.18949-3-ckeepax@opensource.cirrus.com>
 <20181126201645.GA2094@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181126201645.GA2094@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: lee.jones@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, broonie@kernel.org, linus.walleij@linaro.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 26, 2018 at 02:16:45PM -0600, Rob Herring wrote:
> On Tue, Nov 20, 2018 at 02:16:26PM +0000, Charles Keepax wrote:
> > Lochnagar is an evaluation and development board for Cirrus
> > Logic Smart CODEC and Amp devices. It allows the connection of
> > most Cirrus Logic devices on mini-cards, as well as allowing
> > connection of various application processor systems to provide a
> > full evaluation platform. This driver supports the board
> > controller chip on the Lochnagar board.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> > +  - compatible : One of the following strings:
> > +                 "cirrus,lochnagar1-clk"
> > +                 "cirrus,lochnagar2-clk"
> 
> What's the 1 vs. 2?
> 

There are two versions of the device, we need to be able to
differenciate between them in the driver.

> > +     - ln-pmic-32k : On board fixed regulator.
> 
> regulator?

Well that is a spectacular copy and paste oversight sorry about
that will get it fixed up.

> 
> > +     - ln-clk-12m : On board fixed regulator.
> > +     - ln-clk-11m : On board fixed regulator.
> > +     - ln-clk-24m : On board fixed regulator.
> > +     - ln-clk-22m : On board fixed regulator.
> > +     - ln-usb-clk-24m : On board fixed regulator.
> > +     - ln-usb-clk-12m : On board fixed regulator.

> > +lochnagar-clk {
> > +	compatible = "cirrus,lochnagar2-clk";
> > +
> > +	#clock-cells = <1>;
> > +
> > +	clocks = <&clk-audio>, <&clk_pmic>;
> > +	clock-names = "ln-gf-mclk2", "ln-pmic-32k";
> > +
> > +	assigned-clocks = <&lochnagar-clk LOCHNAGAR_CDC_MCLK1>,
> > +			  <&lochnagar-clk LOCHNAGAR_CDC_MCLK2>;
> > +	assigned-clock-parents = <&clk-audio>,
> > +				 <&clk-pmic>;
> > +
> > +	clk-pmic: clk-pmic {
> 
> This isn't really any relationship to the parent and I think shouldn't 
> be a sub-node.
> 

Yeah sorry that is a good point will move it out.

Thanks,
Charles
