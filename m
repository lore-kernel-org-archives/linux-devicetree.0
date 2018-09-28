From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 2/2] clk: qcom: Add lpass clock controller driver for SDM845
Date: Fri, 28 Sep 2018 11:51:09 -0700
Message-ID: <153816066933.119890.2976485722156069351@swboyd.mtv.corp.google.com>
References: <1537266338-18661-1-git-send-email-tdas@codeaurora.org>
 <1537266338-18661-3-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537266338-18661-3-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Taniya Das (2018-09-18 03:25:38)
> @@ -3469,6 +3495,8 @@ enum {
>         [GCC_QSPI_CORE_CLK_SRC] =3D &gcc_qspi_core_clk_src.clkr,
>         [GCC_QSPI_CORE_CLK] =3D &gcc_qspi_core_clk.clkr,
>         [GCC_QSPI_CNOC_PERIPH_AHB_CLK] =3D &gcc_qspi_cnoc_periph_ahb_clk.=
clkr,
> +       [GCC_LPASS_Q6_AXI_CLK] =3D NULL,
> +       [GCC_LPASS_SWAY_CLK] =3D NULL,
>  };
>  =

>  static const struct qcom_reset_map gcc_sdm845_resets[] =3D {
> @@ -3583,6 +3611,13 @@ static int gcc_sdm845_probe(struct platform_device=
 *pdev)
>         if (ret)
>                 return ret;
>  =

> +       if (of_property_read_bool(pdev->dev.of_node, "qcom,lpass-protecte=
d")) {

Shouldn't this be negated? So that we only add the clks when lpass isn't
protected?

> +               gcc_sdm845_clocks[GCC_LPASS_Q6_AXI_CLK] =3D
> +                       &gcc_lpass_q6_axi_clk.clkr;
> +               gcc_sdm845_clocks[GCC_LPASS_SWAY_CLK] =3D
> +                       &gcc_lpass_sway_clk.clkr;
> +       }
> +
>         return qcom_cc_really_probe(pdev, &gcc_sdm845_desc, regmap);
