Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190607101234.30449-2-vkoul@kernel.org>
References: <20190607101234.30449-1-vkoul@kernel.org> <20190607101234.30449-2-vkoul@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: qcom: gcc: Add global clock controller driver for SM8150
Date: Fri, 07 Jun 2019 10:43:52 -0700
Message-Id: <20190607174353.31EDA208C3@mail.kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Deepak Katragadda <dkatraga@codeaurora.org>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

Quoting Vinod Koul (2019-06-07 03:12:34)
> diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> new file mode 100644
> index 000000000000..1cbc884444c9
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sm8150.c
> +static const struct parent_map gcc_parent_map_0[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_GPLL0_OUT_MAIN, 1 },
> +       { P_GPLL0_OUT_EVEN, 6 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const char * const gcc_parent_names_0[] =3D {

We have a new way of specifying clk parents now. Can you use that
instead of using strings everywhere?

> +       "bi_tcxo",
> +       "gpll0",
> +       "gpll0_out_even",
> +       "core_bi_pll_test_se",
