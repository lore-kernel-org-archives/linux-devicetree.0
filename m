From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 2/4] clk: qcom: clk-rpmh: Convert to parent data scheme
Date: Thu, 22 Aug 2019 19:29:17 +0530
Message-ID: <20190822135917.GP12733@vkoul-mobl.Dlink>
References: <20190819073947.17258-1-vkoul@kernel.org>
 <20190819073947.17258-3-vkoul@kernel.org>
 <20190820050829.GJ26807@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190820050829.GJ26807@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 19-08-19, 22:08, Bjorn Andersson wrote:
> On Mon 19 Aug 00:39 PDT 2019, Vinod Koul wrote:
> 
> > Convert the rpmh clock driver to use the new parent data scheme by
> > specifying the parent data for board clock.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/clk/qcom/clk-rpmh.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> > index c3fd632af119..16d689e5bb3c 100644
> > --- a/drivers/clk/qcom/clk-rpmh.c
> > +++ b/drivers/clk/qcom/clk-rpmh.c
> > @@ -95,7 +95,10 @@ static DEFINE_MUTEX(rpmh_clk_lock);
> >  		.hw.init = &(struct clk_init_data){			\
> >  			.ops = &clk_rpmh_ops,				\
> >  			.name = #_name,					\
> > -			.parent_names = (const char *[]){ "xo_board" },	\
> > +			.parent_data =  &(const struct clk_parent_data){ \
> > +					.fw_name = "xo",		\
> > +					.name = "xo",		\
> 
> Shouldn't .name be "xo_board" to retain backwards compatibility?

Yes I have updated that

Thanks
-- 
~Vinod
