From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH 2/2] clk: qcom: gcc: Add global clock controller driver
 for QCS404
Date: Mon, 8 Oct 2018 09:21:44 +0530
Message-ID: <20181008035144.GD2372@vkoul-mobl>
References: <20180921185936.9590-1-vkoul@kernel.org>
 <20180921185936.9590-2-vkoul@kernel.org>
 <153841434099.119890.3912925112860077471@swboyd.mtv.corp.google.com>
 <20181003062103.GN19792@vkoul-mobl>
 <153896630923.119890.17169150168947487135@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <153896630923.119890.17169150168947487135@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Shefali Jain <shefjain@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Anu Ramanathan <anur@codeaurora.org>, Taniya Das <tdas@codeaurora.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 07-10-18, 19:38, Stephen Boyd wrote:
> Quoting Vinod (2018-10-02 23:21:03)
> > Hi Stephen,
> > 
> > Thanks for the comments,
> > 
> > On 01-10-18, 10:19, Stephen Boyd wrote:
> > > Quoting Vinod Koul (2018-09-21 11:59:36)
> > > > From: Shefali Jain <shefjain@codeaurora.org>
> > > > 
> > > > Add the clocks supported in global clock controller which clock the
> > > > peripherals like BLSPs, SDCC, USB, MDSS etc. Register all the clocks
> > > > to the clock framework for the clients to be able to request for them.
> > > > 
> > > > Signed-off-by: Shefali Jain <shefjain@codeaurora.org>
> > > > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> > > > Co-developed-by: Taniya Das <tdas@codeaurora.org>
> > > > Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
> > > > [rebase and tidyup for upstream]
> > > 
> > > Who did the tidying?
> > 
> > both of us :)
> 
> OK, please add the username of both people per the kernel sign off
> standards.
> 
> > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > Signed-off-by: Vinod Koul <vkoul@kernel.org>

Sorry not sure I understand, Bjorn and me did cleanup and we signed-off
per process, did I miss something?

> > > > +#include <linux/kernel.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/of.h>
> > > > +#include <linux/clk.h>
> > > 
> > > Please don't include this.
> > 
> > OK will check if this is required, any reason for not including this?
> 
> So we can easily split clk consumers and clk providers.

That was my thought, thanks for confirming :)

> > > > +static struct clk_branch gcc_pwm1_xo512_clk = {
> > > > +       .halt_reg = 0x49004,
> > > > +       .halt_check = BRANCH_HALT,
> > > > +       .clkr = {
> > > > +               .enable_reg = 0x49004,
> > > > +               .enable_mask = BIT(0),
> > > > +               .hw.init = &(struct clk_init_data){
> > > > +                       .name = "gcc_pwm1_xo512_clk",
> > > > +                       .ops = &clk_branch2_ops,
> > > 
> > > Do these pwm clks have a parent clk of the XO?
> > 
> > Yes they do
> 
> Cool, we should add them or add a comment explaining why they don't have
> parents listed here.

ok

> > > > +       [GCC_USB_HS_PHY_CFG_AHB_CLK] = &gcc_usb_hs_phy_cfg_ahb_clk.clkr,
> > > > +       [GCC_USB_HS_SYSTEM_CLK] = &gcc_usb_hs_system_clk.clkr,
> > > > +       [GFX3D_CLK_SRC] = &gfx3d_clk_src.clkr,
> > > > +       [GP1_CLK_SRC] = &gp1_clk_src.clkr,
> > > 
> > > Why are some of these missing GCC_ prefix?
> > 
> > will add..
> 
> Thanks!

Btw Taniya also commented on this, do you want this as GCC_ or as per hw
documentation?

> > > > +       clk_prepare_enable(apss_ahb_clk_src.clkr.hw.clk);
> > > > +       clk_prepare_enable(gpll0_ao_out_main.clkr.hw.clk);
> > > 
> > > And these should be marked as critical clocks.
> > 
> > Okay and how do we go about doing that?
> 
> You mark the clk flags with CLK_IS_CRITICAL.

Thanks will do.


-- 
~Vinod
