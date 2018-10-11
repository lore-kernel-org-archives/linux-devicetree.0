From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: qcom: gcc: Add global clock controller driver for QCS404
Date: Thu, 11 Oct 2018 00:19:28 -0700
Message-ID: <153924236897.5275.4858274509208170603@swboyd.mtv.corp.google.com>
References: <20180921185936.9590-1-vkoul@kernel.org>
 <20180921185936.9590-2-vkoul@kernel.org>
 <153841434099.119890.3912925112860077471@swboyd.mtv.corp.google.com>
 <20181003062103.GN19792@vkoul-mobl>
 <153896630923.119890.17169150168947487135@swboyd.mtv.corp.google.com>
 <20181008035144.GD2372@vkoul-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008035144.GD2372@vkoul-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod <vkoul@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Shefali Jain <shefjain@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Anu Ramanathan <anur@codeaurora.org>, Taniya Das <tdas@codeaurora.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Vinod (2018-10-07 20:51:44)
> On 07-10-18, 19:38, Stephen Boyd wrote:
> > Quoting Vinod (2018-10-02 23:21:03)
> > > Hi Stephen,
> > > =

> > > Thanks for the comments,
> > > =

> > > On 01-10-18, 10:19, Stephen Boyd wrote:
> > > > Quoting Vinod Koul (2018-09-21 11:59:36)
> > > > > From: Shefali Jain <shefjain@codeaurora.org>
> > > > > =

> > > > > Add the clocks supported in global clock controller which clock t=
he
> > > > > peripherals like BLSPs, SDCC, USB, MDSS etc. Register all the clo=
cks
> > > > > to the clock framework for the clients to be able to request for =
them.
> > > > > =

> > > > > Signed-off-by: Shefali Jain <shefjain@codeaurora.org>
> > > > > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> > > > > Co-developed-by: Taniya Das <tdas@codeaurora.org>
> > > > > Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
> > > > > [rebase and tidyup for upstream]
> > > > =

> > > > Who did the tidying?
> > > =

> > > both of us :)
> > =

> > OK, please add the username of both people per the kernel sign off
> > standards.
> > =

> > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> =

> Sorry not sure I understand, Bjorn and me did cleanup and we signed-off
> per process, did I miss something?

I mean doing something like:

[bjorn.andersson@linaro.org: Clean and tidy]
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
[vkoul@kernel.org: Clean and tidy even more]
Signed-off-by: Vinod Koul <vkoul@kernel.org>

Would be the kernel standard for maintainer tags.

> =

> > > > > +       [GCC_USB_HS_PHY_CFG_AHB_CLK] =3D &gcc_usb_hs_phy_cfg_ahb_=
clk.clkr,
> > > > > +       [GCC_USB_HS_SYSTEM_CLK] =3D &gcc_usb_hs_system_clk.clkr,
> > > > > +       [GFX3D_CLK_SRC] =3D &gfx3d_clk_src.clkr,
> > > > > +       [GP1_CLK_SRC] =3D &gp1_clk_src.clkr,
> > > > =

> > > > Why are some of these missing GCC_ prefix?
> > > =

> > > will add..
> > =

> > Thanks!
> =

> Btw Taniya also commented on this, do you want this as GCC_ or as per hw
> documentation?
> =


I don't care. Either way is fine with me.
