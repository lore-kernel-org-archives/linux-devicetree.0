From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v1 1/4] clk: qcom: smd: Add XO clock for MSM8998
Date: Wed, 30 Jan 2019 09:35:44 -0700
Message-ID: <1548866144-30265-1-git-send-email-jhugo@codeaurora.org>
References: <1548866102-30224-1-git-send-email-jhugo@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548866102-30224-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, mturquette@baylibre.com, sboyd@kernel.org
Cc: marc.w.gonzalez@free.fr, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The XO clock generally feeds into other clock controllers as the parent
for a lot of clock generators.

Fixes: 6131dc81211c (clk: qcom: smd: Add support for MSM8998 rpm clocks)
Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 22dd42a..5b1d718 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -656,6 +656,8 @@ static int clk_smd_rpm_enable_scaling(struct qcom_smd_rpm *rpm)
 };
 
 /* msm8998 */
+DEFINE_CLK_SMD_RPM_BRANCH(msm8998, xo_clk_src, xo_a_clk_src,
+			  QCOM_SMD_RPM_MISC_CLK, 0, 19200000);
 DEFINE_CLK_SMD_RPM(msm8998, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
 DEFINE_CLK_SMD_RPM(msm8998, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
 DEFINE_CLK_SMD_RPM(msm8998, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
@@ -678,6 +680,8 @@ static int clk_smd_rpm_enable_scaling(struct qcom_smd_rpm *rpm)
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, rf_clk3, rf_clk3_a, 6);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3_pin, rf_clk3_a_pin, 6);
 static struct clk_smd_rpm *msm8998_clks[] = {
+	[RPM_SMD_XO_CLK_SRC] = &msm8998_xo_clk_src,
+	[RPM_SMD_XO_A_CLK_SRC] = &msm8998_xo_a_clk_src,
 	[RPM_SMD_SNOC_CLK] = &msm8998_snoc_clk,
 	[RPM_SMD_SNOC_A_CLK] = &msm8998_snoc_a_clk,
 	[RPM_SMD_CNOC_CLK] = &msm8998_cnoc_clk,
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
