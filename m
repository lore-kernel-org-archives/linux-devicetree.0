From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 2/5 v2] clk: qcom: Elaborate on "active" clocks in the
 RPM clock bindings
Date: Thu, 1 Jun 2017 00:39:44 -0700
Message-ID: <20170601073944.GV20170@codeaurora.org>
References: <20170419091326.11226-1-linus.walleij@linaro.org>
 <20170419091326.11226-2-linus.walleij@linaro.org>
 <20170428133553.pcyireh6atw7rlrw@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170428133553.pcyireh6atw7rlrw@rob-hp-laptop>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/28, Rob Herring wrote:
> On Wed, Apr 19, 2017 at 11:13:23AM +0200, Linus Walleij wrote:
> > The concept of "active" clocks is just explained in a bried comment in the
> > device driver, let's explain it a bit more in the device tree bindings
> > so everyone understands this.
> > 
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > ChangeLog v1->v2:
> > - Reword slighty in accordance with Stephens feedback.
> > ---
> >  Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> 
> Despite my objections, you're just documenting what is already there.
> 
> Acked-by: Rob Herring <robh@kernel.org>

Perhaps this can be put into the clk driver instead? Is that the
concern?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
