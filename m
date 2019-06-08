Return-Path: <vkoul@kernel.org>
Date: Sat, 8 Jun 2019 14:45:37 +0530
From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/2] clk: qcom: gcc: Add global clock controller driver
 for SM8150
Message-ID: <20190608091537.GG9160@vkoul-mobl.Dlink>
References: <20190607101234.30449-1-vkoul@kernel.org>
 <20190607101234.30449-2-vkoul@kernel.org>
 <20190607174353.31EDA208C3@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190607174353.31EDA208C3@mail.kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Deepak Katragadda <dkatraga@codeaurora.org>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

On 07-06-19, 10:43, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-06-07 03:12:34)
> > diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> > new file mode 100644
> > index 000000000000..1cbc884444c9
> > --- /dev/null
> > +++ b/drivers/clk/qcom/gcc-sm8150.c
> > +static const struct parent_map gcc_parent_map_0[] = {
> > +       { P_BI_TCXO, 0 },
> > +       { P_GPLL0_OUT_MAIN, 1 },
> > +       { P_GPLL0_OUT_EVEN, 6 },
> > +       { P_CORE_BI_PLL_TEST_SE, 7 },
> > +};
> > +
> > +static const char * const gcc_parent_names_0[] = {
> 
> We have a new way of specifying clk parents now. Can you use that
> instead of using strings everywhere?

Okay I will update, any pointers on new implementation I can look up?

Thanks
-- 
~Vinod
