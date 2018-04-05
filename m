From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 1/7] clk: msm8996-gcc: change halt check for USB/PCIE pipe_clk
Date: Thu, 05 Apr 2018 13:07:19 -0700
Message-ID: <152295883900.91052.4792431636170417291@swboyd.mtv.corp.google.com>
References: <1522321466-21755-1-git-send-email-mgautam@codeaurora.org>
 <1522321466-21755-2-git-send-email-mgautam@codeaurora.org>
 <CAD=FV=UXvf+_rvbFGrHAQ1N0kbrMR_c2=LBVD=AMuL6DAjWO+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=UXvf+_rvbFGrHAQ1N0kbrMR_c2=LBVD=AMuL6DAjWO+Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, Manu Gautam <mgautam@codeaurora.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Evan Green <evgreen@chromium.org>, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Doug Anderson (2018-03-29 13:55:55)
> Hi,
> 
> On Thu, Mar 29, 2018 at 4:04 AM, Manu Gautam <mgautam@codeaurora.org> wrote:
> > The USB and PCIE pipe clocks are sourced from external clocks
> > inside the QMP USB/PCIE PHYs. Enabling or disabling of PIPE RCG
> > clocks is dependent on PHY initialization sequence hence
> > update halt_check to BRANCH_HALT_DELAY for these clocks so
> > that clock status bit is not polled when enabling or disabling
> > the clocks. It allows to simplify PHY client driver code which
> > is both user and source of the pipe_clk and avoid error logging
> > related status check on clk_disable/enable.
> >
> > Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> > ---
> >  drivers/clk/qcom/gcc-msm8996.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> 
> As per my feedback on <https://patchwork.kernel.org/patch/10314937/>,
> I'm not a fan of this.  Hopefully we can adjust the PHY driver so it's
> not needed.
> 

Agreed. We should be able to enable the clks at the right time and halt
bits should work. From what I can recall we had that working before on
db820c, so has something changed?
