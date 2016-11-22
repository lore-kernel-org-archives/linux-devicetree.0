From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 1/3] dt-bindings: add documentation for rk1108 cru
Date: Tue, 22 Nov 2016 01:56:46 +0100
Message-ID: <11861172.3ECEeJWkir@phil>
References: <1479286163-34789-1-git-send-email-shawn.lin@rock-chips.com> <20161118140313.5uz56im37nt6qv7x@rob-hp-laptop> <1822814.B0zqNU8kdJ@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1822814.B0zqNU8kdJ@phil>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

Am Freitag, 18. November 2016, 15:10:02 CET schrieb Heiko Stuebner:
> Am Freitag, 18. November 2016, 08:03:13 CET schrieb Rob Herring:
> > On Wed, Nov 16, 2016 at 04:49:21PM +0800, Shawn Lin wrote:
> > > This adds the dt-binding documentation for the clock and reset unit
> > > found on Rockchip rk1108 SoCs.
> > > 
> > > Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> > > 
> > > ---
> > > 
> > > Changes in v3:
> > > - fix mismatch of external clk input name
> > > - add hdmiphy and usbphy clk input
> > > 
> > > Changes in v2: None
> > > 
> > >  .../bindings/clock/rockchip,rk1108-cru.txt         | 59
> > >  ++++++++++++++++++++++ 1 file changed, 59 insertions(+)
> > >  create mode 100644
> > >  Documentation/devicetree/bindings/clock/rockchip,rk1108-cru.txt>
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/clock/rockchip,rk1108-cru.txt
> > > b/Documentation/devicetree/bindings/clock/rockchip,rk1108-cru.txt new
> > > file mode 100644
> > > index 0000000..4da1261
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/rockchip,rk1108-cru.txt
> > > @@ -0,0 +1,59 @@
> > > +* Rockchip RK1108 Clock and Reset Unit
> > > +
> > > +The RK1108 clock controller generates and supplies clock to various
> > > +controllers within the SoC and also implements a reset controller for
> > > SoC
> > > +peripherals.
> > > +
> > > +Required Properties:
> > > +
> > > +- compatible: should be "rockchip,rk1108-cru"
> > > +- reg: physical base address of the controller and length of memory
> > > mapped
> > > +  region.
> > > +- #clock-cells: should be 1.
> > > +- #reset-cells: should be 1.
> > > +
> > > +Optional Properties:
> > > +
> > > +- rockchip,grf: phandle to the syscon managing the "general register
> > > files" +  If missing pll rates are not changeable, due to the missing
> > > pll
> > > lock status. +
> > > +Each clock is assigned an identifier and client nodes can use this
> > > identifier +to specify the clock which they consume. All available
> > > clocks
> > > are defined as +preprocessor macros in the
> > > dt-bindings/clock/rk1108-cru.h
> > > headers and can be +used in device tree sources. Similar macros exist
> > > for
> > > the reset sources in +these files.
> > > +
> > > +External clocks:
> > > +
> > > +There are several clocks that are generated outside the SoC. It is
> > > expected +that they are defined using standard clock bindings with
> > > following
> > 
> > > +clock-output-names:
> > This stilll doesn't seem right. These are inputs to the CRU or
> > completely separate? If inputs, then you need a 'clocks' property. If
> > completely separate, then they should be listed in their respective IP
> > block binding (e.g. the USB phy).
> 
> The problem is still the same as always. These clocks may or may not be
> present, a lot of them come from IP blocks that probe later than the clock
> controller and create a circular dependency.
> 
> I.e. the usbphy IP block gets supplied with a clock from the CRU that it
> needs to function at all, but also contains a PLL on that clock that gets
> fed back into the CRU to supply other clocks. Same for the other external
> clocks.
> 
> So we cannot "get" (and verify) these clocks when the core clock init runs
> Therefore we're relying on the ability of the clock-framework to complete
> the clock-tree once these clocks become available (or drop them again, if
> they disappear again)

did the above alleviate your concerns a bit or is there more to talk about?

As described above we need the clock tree early on and these supplying 
external clocks are also very deeply embedded in it as they're most of the 
time supplies for clock muxes and might get selected or simply ignored if the 
supplying clock is not present at the time of a clock operation.

I also don't think that this is linux-specific, as other OSes would have the 
same issue to solve with Rockchip clock trees and I don't think rewriting 
clock-trees at runtime is an option on any system when one of the possible 
circular supplies appears some 20 seconds after the core clock tree or so.

And that softer link allows the clock system of any OS to figure this out once 
those later clocks appear or stay away.


Heiko
