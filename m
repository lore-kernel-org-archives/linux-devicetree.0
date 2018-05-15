From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: qcom: Add some missing gcc clks for msm8996
Date: Tue, 15 May 2018 11:05:44 -0700
Message-ID: <152640754443.34267.2752714761157535255@swboyd.mtv.corp.google.com>
References: <20180418000926.4998-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180418000926.4998-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Rajendra Nayak <rnayak@codeaurora.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2018-04-17 17:09:26)
> @@ -3350,6 +3522,7 @@ static struct clk_regmap *gcc_msm8996_clocks[] =3D {
>         [GCC_AGGRE0_CNOC_AHB_CLK] =3D &gcc_aggre0_cnoc_ahb_clk.clkr,
>         [GCC_SMMU_AGGRE0_AXI_CLK] =3D &gcc_smmu_aggre0_axi_clk.clkr,
>         [GCC_SMMU_AGGRE0_AHB_CLK] =3D &gcc_smmu_aggre0_ahb_clk.clkr,
> +       [GCC_AGGRE1_PNOC_AHB_CLK] =3D &gcc_aggre1_pnoc_ahb_clk.clkr,
>         [GCC_AGGRE2_UFS_AXI_CLK] =3D &gcc_aggre2_ufs_axi_clk.clkr,
>         [GCC_AGGRE2_USB3_AXI_CLK] =3D &gcc_aggre2_usb3_axi_clk.clkr,
>         [GCC_QSPI_AHB_CLK] =3D &gcc_qspi_ahb_clk.clkr,
> @@ -3360,6 +3533,19 @@ static struct clk_regmap *gcc_msm8996_clocks[] =3D=
 {
>         [GCC_PCIE_CLKREF_CLK] =3D &gcc_pcie_clkref_clk.clkr,
>         [GCC_RX2_USB2_CLKREF_CLK] =3D &gcc_rx2_usb2_clkref_clk.clkr,
>         [GCC_RX1_USB2_CLKREF_CLK] =3D &gcc_rx1_usb2_clkref_clk.clkr,
> +       [GCC_HLOS1_VOTE_LPASS_CORE_SMMU_CLK] =3D
> +                                       &hlos1_vote_lpass_core_smmu_clk.c=
lkr,

drivers/clk/qcom/gcc-msm8996.c:3512:10: warning: Initializer entry defined =
twice
drivers/clk/qcom/gcc-msm8996.c:3536:10: also defined here

Resend please, or at least let me know what to do here. It looks like
the one you sent has the parent chain setup properly so that the bus
rcgs are in the chain of clks, while the one that is already there
doesn't have the chain setup.
