From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v9 2/2] clk: qcom: Add lpass clock controller driver for SDM845
Date: Wed, 21 Nov 2018 11:07:36 -0800
Message-ID: <154282725690.88331.797718066164707366@swboyd.mtv.corp.google.com>
References: <1541814256-23254-1-git-send-email-tdas@codeaurora.org>
 <1541814256-23254-3-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541814256-23254-3-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Taniya Das (2018-11-09 17:44:16)
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

Sigh, more coordination with sdm845 mtp problems here due to the
clks being protected by firmware. I guess I can just merge this and the
mtp dts bits will land in Andy's tree during the same merge window? Or I
may need to take the dts bits for this into clk tree so that the broken
time is only between two commits.

>  };
> =

>  static const struct qcom_reset_map gcc_sdm845_resets[] =3D {
> diff --git a/drivers/clk/qcom/lpasscc-sdm845.c b/drivers/clk/qcom/lpasscc=
-sdm845.c
> new file mode 100644
> index 0000000..2ef7f2a
> --- /dev/null
> +++ b/drivers/clk/qcom/lpasscc-sdm845.c
> @@ -0,0 +1,192 @@
[...]
> +
> +static const struct of_device_id lpass_cc_sdm845_match_table[] =3D {
> +       { .compatible =3D "qcom,sdm845-lpasscc" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, lpass_cc_sdm845_match_table);

Move this down to the before the driver structure please.

> +
> +static int lpass_cc_sdm845_probe(struct platform_device *pdev)
> +{
> +       const struct qcom_cc_desc *desc;
> +       int ret;
> +
> +       lpass_regmap_config.name =3D "cc";
> +       desc =3D &lpass_cc_sdm845_desc;
> +
> +       ret =3D lpass_clocks_sdm845_probe(pdev, 0, desc);
> +       if (ret)
> +               return ret;
> +
> +       lpass_regmap_config.name =3D "qdsp6ss";
> +       desc =3D &lpass_qdsp6ss_sdm845_desc;
> +
> +       return lpass_clocks_sdm845_probe(pdev, 1, desc);
> +}
> +
> +static struct platform_driver lpass_cc_sdm845_driver =3D {
> +       .probe          =3D lpass_cc_sdm845_probe,
> +       .driver         =3D {
> +               .name   =3D "sdm845-lpasscc",
> +               .of_match_table =3D lpass_cc_sdm845_match_table,
> +       },
> +};
> +
> +static int __init lpass_cc_sdm845_init(void)
> +{
> +       return platform_driver_register(&lpass_cc_sdm845_driver);
> +}
> +subsys_initcall(lpass_cc_sdm845_init);
> +
> +static void __exit lpass_cc_sdm845_exit(void)
> +{
> +       platform_driver_unregister(&lpass_cc_sdm845_driver);
> +}
> +module_exit(lpass_cc_sdm845_exit);
> +
> +MODULE_LICENSE("GPL v2");

MODULE_DESCRIPTION?
