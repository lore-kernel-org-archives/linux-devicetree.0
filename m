From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v13 2/8] clk: qcom: Make clk_alpha_pll_configure available to
 modules
Date: Wed, 17 Oct 2018 08:39:26 -0700
Message-ID: <153979076609.5275.11289929616133786271@swboyd.mtv.corp.google.com>
References: <20180614215358.11264-1-ilia.lin@gmail.com>
 <20180614215358.11264-3-ilia.lin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180614215358.11264-3-ilia.lin@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ilia.lin@gmail.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Ilia Lin <ilialin@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting ilia.lin@gmail.com (2018-06-14 14:53:49)
> From: Rajendra Nayak <rnayak@codeaurora.org>
> =

> Allow clk_alpha_pll_configure to be called from loadable
> kernel modules.
> =

> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> Tested-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---

Oh I think this one came via another patch series. Either way, keep
resending this along with everything else to make kbuild happy.

>  drivers/clk/qcom/clk-alpha-pll.c | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alph=
a-pll.c
> index 3c49a60072f1..a43f80ac94a4 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -228,6 +228,7 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pl=
l, struct regmap *regmap,
>         if (pll->flags & SUPPORTS_FSM_MODE)
>                 qcom_pll_set_fsm_mode(regmap, PLL_MODE(pll), 6, 0);
>  }
> +EXPORT_SYMBOL_GPL(clk_alpha_pll_configure);
>  =

>  static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
>  {
> -- =

> 2.11.0
> =

> =

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
