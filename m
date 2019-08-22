From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 4/4] clk: qcom: clk-rpmh: Add support for SM8150
Date: Thu, 22 Aug 2019 19:31:34 +0530
Message-ID: <20190822140134.GQ12733@vkoul-mobl.Dlink>
References: <20190819073947.17258-1-vkoul@kernel.org>
 <20190819073947.17258-5-vkoul@kernel.org>
 <20190820050944.GL26807@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190820050944.GL26807@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 19-08-19, 22:09, Bjorn Andersson wrote:
> On Mon 19 Aug 00:39 PDT 2019, Vinod Koul wrote:
> > +static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
> > +	.clks = sm8150_rpmh_clocks,
> > +	.num_clks = ARRAY_SIZE(sm8150_rpmh_clocks),
> > +};
> 
> Maybe an empty line here?

Sounds better

> 
> >  static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
> >  					 void *data)
> >  {
> > @@ -453,6 +479,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
> >  
> >  static const struct of_device_id clk_rpmh_match_table[] = {
> >  	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
> > +	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, clk_rpmh_match_table);
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks for the review, will send an update.

-- 
~Vinod
