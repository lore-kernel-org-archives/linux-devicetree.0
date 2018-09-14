From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 5/7] MIPS: mscc: ocelot: add GPIO4 pinmuxing DT node
Date: Fri, 14 Sep 2018 20:02:22 +0200
Message-ID: <20180914180222.GT14988@piout.net>
References: <cover.b921b010b6d6bde1c11e69551ae38f3b2818645b.1536916714.git-series.quentin.schulz@bootlin.com>
 <92e37a04e77003f01a67ac5e49e66ae83f87c591.1536916714.git-series.quentin.schulz@bootlin.com>
 <20180914145446.GQ14988@piout.net>
 <20180914162638.fgzzjin2bzgx74de@qschulz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180914162638.fgzzjin2bzgx74de@qschulz>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, andrew@lunn.ch, f.fainelli@gmail.com, allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com, antoine.tenart@bootlin.com
List-Id: devicetree@vger.kernel.org

On 14/09/2018 18:26:38+0200, Quentin Schulz wrote:
> Hi Alexandre,
> 
> On Fri, Sep 14, 2018 at 04:54:46PM +0200, Alexandre Belloni wrote:
> > Hi,
> > 
> > On 14/09/2018 11:44:26+0200, Quentin Schulz wrote:
> > > In order to use GPIO4 as a GPIO, we need to mux it in this mode so let's
> > > declare a new pinctrl DT node for it.
> > > 
> > > Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> > > ---
> > >  arch/mips/boot/dts/mscc/ocelot.dtsi | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/arch/mips/boot/dts/mscc/ocelot.dtsi b/arch/mips/boot/dts/mscc/ocelot.dtsi
> > > index 8ce317c..b5c4c74 100644
> > > --- a/arch/mips/boot/dts/mscc/ocelot.dtsi
> > > +++ b/arch/mips/boot/dts/mscc/ocelot.dtsi
> > > @@ -182,6 +182,11 @@
> > >  			interrupts = <13>;
> > >  			#interrupt-cells = <2>;
> > >  
> > > +			gpio4: gpio4 {
> > > +				pins = "GPIO_4";
> > > +				function = "gpio";
> > > +			};
> > > +
> > 
> > For a GPIO, I would do that in the board dts because it is not used
> > directly in the dtsi.
> > 
> 
> And the day we've two boards using this pinctrl we move it to a dtsi. Is
> that the plan?
> 

Not really, at least not for gpios. I've included the pinctrl for the
uart, i2c and spi because they are the only option if you are to use
those peripherals. Else, I've would have left the pinctrl to the board
file. From my point of view, the gpios are too board specific to be in a
soc dtsi.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
