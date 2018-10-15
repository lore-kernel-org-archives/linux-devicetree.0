From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 3/5] clk: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Date: Mon, 15 Oct 2018 11:49:05 +0100
Message-ID: <20181015104905.GF1653@imbe.wolfsonmicro.main>
References: <20181008132542.19775-1-ckeepax@opensource.cirrus.com>
 <20181008132542.19775-3-ckeepax@opensource.cirrus.com>
 <153924124658.207691.10370075148426001371@swboyd.mtv.corp.google.com>
 <20181011132602.GD1653@imbe.wolfsonmicro.main>
 <153935999691.5275.1587207165396958375@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <153935999691.5275.1587207165396958375@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: broonie@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 12, 2018 at 08:59:56AM -0700, Stephen Boyd wrote:
> Quoting Charles Keepax (2018-10-11 06:26:02)
> > On Thu, Oct 11, 2018 at 12:00:46AM -0700, Stephen Boyd wrote:
> > > Quoting Charles Keepax (2018-10-08 06:25:40)
> > > > +struct lochnagar_clk_priv {
> > > > +       struct device *dev;
> > > > +       struct lochnagar *lochnagar;
> > > 
> > > Is this used for anything besides getting the regmap? Can you get the
> > > pointer to the parent in probe and use that to get the regmap pointer
> > > from dev_get_remap() and also use the of_node of the parent to register
> > > a clk provider? It would be nice to avoid including the mfd header file
> > > unless it's providing something useful.
> > > 
> > 
> > It is also used to find out which type of Lochnagar we have
> > connected, which determines which clocks we should register. I
> 
> Can that be done through some device ID? So the driver can be untangled
> from the MFD part.
> 
> > could perhaps pass that using another mechanism but we would
> > still want to include the MFD stuff to get the register
> > definitions. So this approach seems simplest.
> 
> Can the register definitions be moved to this clk driver?
> 
> Maybe you now get the hint, but I'd really like to be able to merge and
> compile the clk driver all by itself without relying on the parent MFD
> device to provide anything at compile time.
> 

If you feel strongly but since the MFD needs to hold the regmap
(which needs to define the read/volatile regs and defaults)
these will need to be duplicate defines and personally i would
rather only have one copy as it makes updating things much less
error prone.

> > > > +       if (lclk->regmap.dir_mask) {
> > > > +               ret = regmap_update_bits(regmap, lclk->regmap.cfg_reg,
> > > > +                                        lclk->regmap.dir_mask,
> > > > +                                        lclk->regmap.dir_mask);
> > > > +               if (ret < 0) {
> > > > +                       dev_err(priv->dev, "Failed to set %s direction: %d\n",
> > > 
> > > What does direction mean?
> > > 
> > 
> > Some of the clocks can both generate and receive a clock. For
> > example the PSIA (external audio interface) MCLKs, the attached
> > device could be expecting or providing a master audio clock. If
> > the user assigns a parent to the clock we assume the attached
> > device is providing a clock to us, otherwise we assume we are
> > providing the clock.
> 
> And this directionality is determined by dir_mask? It would be great if
> this sort of information was in the commit text or in a comment in the
> driver so we know what's going on here.
> 

No problem will make this more clear.

Thanks,
Charles
