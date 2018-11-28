From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v10 3/3] clk: qcom: Add lpass clock controller driver for SDM845
Date: Wed, 28 Nov 2018 13:10:41 -0800
Message-ID: <154343944180.88331.8662440760190505722@swboyd.mtv.corp.google.com>
References: <1542873221-13693-1-git-send-email-tdas@codeaurora.org>
 <1542873221-13693-4-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542873221-13693-4-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Taniya Das (2018-11-21 23:53:41)
> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
> index f133b7f..ba8ff99 100644
> --- a/drivers/clk/qcom/gcc-sdm845.c
> +++ b/drivers/clk/qcom/gcc-sdm845.c
> @@ -3153,6 +3153,34 @@ enum {
>         },
>  };
> =

> +static struct clk_branch gcc_lpass_q6_axi_clk =3D {
> +       .halt_reg =3D 0x47000,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0x47000,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_lpass_q6_axi_clk",
> +                       .flags =3D CLK_IS_CRITICAL,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_lpass_sway_clk =3D {
> +       .halt_reg =3D 0x47008,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0x47008,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_lpass_sway_clk",
> +                       .flags =3D CLK_IS_CRITICAL,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
>  static struct gdsc pcie_0_gdsc =3D {
>         .gdscr =3D 0x6b004,
>         .pd =3D {
> @@ -3453,6 +3481,8 @@ enum {
>         [GCC_QSPI_CORE_CLK_SRC] =3D &gcc_qspi_core_clk_src.clkr,
>         [GCC_QSPI_CORE_CLK] =3D &gcc_qspi_core_clk.clkr,
>         [GCC_QSPI_CNOC_PERIPH_AHB_CLK] =3D &gcc_qspi_cnoc_periph_ahb_clk.=
clkr,
> +       [GCC_LPASS_Q6_AXI_CLK] =3D &gcc_lpass_q6_axi_clk.clkr,
> +       [GCC_LPASS_SWAY_CLK] =3D &gcc_lpass_sway_clk.clkr,

I have one single idea to avoid the integration nightmare with dts
needing another update for this on platforms where these can't be
touched. It's not perfect, but we can throw these clks and usage of the
clks behind an #ifdef CONFIG_SDM_LPASSCC_845 and then let the dts parts
match up with the clk driver parts in linux-next. After everything is
merged together, someone can turn on the knobs for LPASS clk controller
and make sure they have the right dts bits to mark them as protected.
