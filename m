From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] clk: qcom: smd-rpm: Add msm8974 clocks
Date: Fri, 18 Nov 2016 08:32:45 -0800
Message-ID: <20161118163244.GG28340@tuxbot>
References: <1479192844-1281-1-git-send-email-bjorn.andersson@linaro.org>
 <3c57fe94-e6b3-d884-9c80-aa26e5ef9fde@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3c57fe94-e6b3-d884-9c80-aa26e5ef9fde@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 17 Nov 07:53 PST 2016, Georgi Djakov wrote:

> On 11/15/2016 08:54 AM, Bjorn Andersson wrote:
> >This adds all RPM based clocks for msm8974 except cxo and gfx3d_clk_src.
> >
> >Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >---
> > .../devicetree/bindings/clock/qcom,rpmcc.txt       |  1 +
> > drivers/clk/qcom/clk-smd-rpm.c                     | 71 ++++++++++++++++++++++
> > include/dt-bindings/clock/qcom,rpmcc.h             | 40 +++++++++++-
> > 3 files changed, 110 insertions(+), 2 deletions(-)
> >
> >diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> >index 87d3714b956a..a7235e9e1c97 100644
> >--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> >+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> >@@ -11,6 +11,7 @@ Required properties :
> >                compatible "qcom,rpmcc" should be also included.
> >
> > 			"qcom,rpmcc-msm8916", "qcom,rpmcc"
> >+			"qcom,rpmcc-msm8974", "qcom,rpmcc"
> > 			"qcom,rpmcc-apq8064", "qcom,rpmcc"
> >
> > - #clock-cells : shall contain 1
> >diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> >index a27013dbc0aa..b8fcac6f2f87 100644
> >--- a/drivers/clk/qcom/clk-smd-rpm.c
> >+++ b/drivers/clk/qcom/clk-smd-rpm.c
> >@@ -462,8 +462,79 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8916 = {
> > 	.num_clks = ARRAY_SIZE(msm8916_clks),
> > };
> >
> >+/* msm8974 */
> >+DEFINE_CLK_SMD_RPM(msm8974, pnoc_clk, pnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
> >+DEFINE_CLK_SMD_RPM(msm8974, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
> >+DEFINE_CLK_SMD_RPM(msm8974, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
> >+DEFINE_CLK_SMD_RPM(msm8974, mmssnoc_ahb_clk, mmssnoc_ahb_a_clk, QCOM_SMD_RPM_BUS_CLK, 3);
> >+DEFINE_CLK_SMD_RPM(msm8974, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
> >+DEFINE_CLK_SMD_RPM(msm8974, gfx3d_clk_src, gfx3d_a_clk_src, QCOM_SMD_RPM_MEM_CLK, 1);
> >+DEFINE_CLK_SMD_RPM(msm8974, ocmemgx_clk, ocmemgx_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
> >+DEFINE_CLK_SMD_RPM_QDSS(msm8974, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
> >+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_d0, cxo_d0_a, 1);
> >+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_d1, cxo_d1_a, 2);
> >+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_a0, cxo_a0_a, 4);
> >+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_a1, cxo_a1_a, 5);
> >+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_a2, cxo_a2_a, 6);
> >+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, diff_a_clk, 7);
> >+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, div_a_clk1, 11);
> >+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, div_a_clk2, 12);
> >+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d0_pin, cxo_d0_a_pin, 1);
> >+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d1_pin, cxo_d1_a_pin, 2);
> >+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a0_pin, cxo_a0_a_pin, 4);
> >+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1_pin, cxo_a1_a_pin, 5);
> >+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2_pin, cxo_a2_a_pin, 6);
> >+
> >+static struct clk_smd_rpm *msm8974_clks[] = {
> >+	[RPM_SMD_PNOC_CLK]		= &msm8974_pnoc_clk,
> >+	[RPM_SMD_PNOC_A_CLK]		= &msm8974_pnoc_a_clk,
> >+	[RPM_SMD_SNOC_CLK]		= &msm8974_snoc_clk,
> >+	[RPM_SMD_SNOC_A_CLK]		= &msm8974_snoc_a_clk,
> >+	[RPM_SMD_CNOC_CLK]		= &msm8974_cnoc_clk,
> >+	[RPM_SMD_CNOC_A_CLK]		= &msm8974_cnoc_a_clk,
> >+	[RPM_SMD_MMSSNOC_AHB_CLK]	= &msm8974_mmssnoc_ahb_clk,
> >+	[RPM_SMD_MMSSNOC_AHB_A_CLK]	= &msm8974_mmssnoc_ahb_a_clk,
> >+	[RPM_SMD_BIMC_CLK]		= &msm8974_bimc_clk,
> >+	[RPM_SMD_BIMC_A_CLK]		= &msm8974_bimc_a_clk,
> >+	[RPM_SMD_OCMEMGX_CLK]		= &msm8974_ocmemgx_clk,
> >+	[RPM_SMD_OCMEMGX_A_CLK]		= &msm8974_ocmemgx_a_clk,
> >+	[RPM_SMD_QDSS_CLK]		= &msm8974_qdss_clk,
> >+	[RPM_SMD_QDSS_A_CLK]		= &msm8974_qdss_a_clk,
> >+	[RPM_SMD_CXO_D0]			= &msm8974_cxo_d0,
> >+	[RPM_SMD_CXO_D0_A]		= &msm8974_cxo_d0_a,
> >+	[RPM_SMD_CXO_D1]			= &msm8974_cxo_d1,
> >+	[RPM_SMD_CXO_D1_A]		= &msm8974_cxo_d1_a,
> >+	[RPM_SMD_CXO_A0]			= &msm8974_cxo_a0,
> >+	[RPM_SMD_CXO_A0_A]		= &msm8974_cxo_a0_a,
> >+	[RPM_SMD_CXO_A1]			= &msm8974_cxo_a1,
> >+	[RPM_SMD_CXO_A1_A]		= &msm8974_cxo_a1_a,
> >+	[RPM_SMD_CXO_A2]			= &msm8974_cxo_a2,
> 
> There are some extra tabs above. Otherwise looks fine:
> Tested-by: Georgi Djakov <georgi.djakov@linaro.org>
> 

Doesn't look like I can blame this on the tools...I'll send an update.
Thanks for taking a look!

Regards,
Bjorn
