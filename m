From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2] clk: qcom: smd-rpmcc: Add msm8974 clocks
Date: Fri, 18 Nov 2016 08:33:25 -0800
Message-ID: <1479486805-21853-1-git-send-email-bjorn.andersson@linaro.org>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
List-Id: devicetree@vger.kernel.org

This adds all RPM based clocks for msm8974, except cxo and
gfx3d_clk_src.

Tested-by: Georgi Djakov <georgi.djakov@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Fixed the screwed up indentation

 .../devicetree/bindings/clock/qcom,rpmcc.txt       |  1 +
 drivers/clk/qcom/clk-smd-rpm.c                     | 71 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc.h             | 40 +++++++++++-
 3 files changed, 110 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index 87d3714b956a..a7235e9e1c97 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -11,6 +11,7 @@ Required properties :
                compatible "qcom,rpmcc" should be also included.
 
 			"qcom,rpmcc-msm8916", "qcom,rpmcc"
+			"qcom,rpmcc-msm8974", "qcom,rpmcc"
 			"qcom,rpmcc-apq8064", "qcom,rpmcc"
 
 - #clock-cells : shall contain 1
diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index a27013dbc0aa..c1c1e7b5be64 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -462,8 +462,79 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8916 = {
 	.num_clks = ARRAY_SIZE(msm8916_clks),
 };
 
+/* msm8974 */
+DEFINE_CLK_SMD_RPM(msm8974, pnoc_clk, pnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8974, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8974, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM(msm8974, mmssnoc_ahb_clk, mmssnoc_ahb_a_clk, QCOM_SMD_RPM_BUS_CLK, 3);
+DEFINE_CLK_SMD_RPM(msm8974, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8974, gfx3d_clk_src, gfx3d_a_clk_src, QCOM_SMD_RPM_MEM_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8974, ocmemgx_clk, ocmemgx_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
+DEFINE_CLK_SMD_RPM_QDSS(msm8974, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_d0, cxo_d0_a, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_d1, cxo_d1_a, 2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_a0, cxo_a0_a, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_a1, cxo_a1_a, 5);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, cxo_a2, cxo_a2_a, 6);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, diff_a_clk, 7);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, div_a_clk1, 11);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, div_a_clk2, 12);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d0_pin, cxo_d0_a_pin, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d1_pin, cxo_d1_a_pin, 2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a0_pin, cxo_a0_a_pin, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1_pin, cxo_a1_a_pin, 5);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2_pin, cxo_a2_a_pin, 6);
+
+static struct clk_smd_rpm *msm8974_clks[] = {
+	[RPM_SMD_PNOC_CLK]		= &msm8974_pnoc_clk,
+	[RPM_SMD_PNOC_A_CLK]		= &msm8974_pnoc_a_clk,
+	[RPM_SMD_SNOC_CLK]		= &msm8974_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK]		= &msm8974_snoc_a_clk,
+	[RPM_SMD_CNOC_CLK]		= &msm8974_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK]		= &msm8974_cnoc_a_clk,
+	[RPM_SMD_MMSSNOC_AHB_CLK]	= &msm8974_mmssnoc_ahb_clk,
+	[RPM_SMD_MMSSNOC_AHB_A_CLK]	= &msm8974_mmssnoc_ahb_a_clk,
+	[RPM_SMD_BIMC_CLK]		= &msm8974_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK]		= &msm8974_bimc_a_clk,
+	[RPM_SMD_OCMEMGX_CLK]		= &msm8974_ocmemgx_clk,
+	[RPM_SMD_OCMEMGX_A_CLK]		= &msm8974_ocmemgx_a_clk,
+	[RPM_SMD_QDSS_CLK]		= &msm8974_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK]		= &msm8974_qdss_a_clk,
+	[RPM_SMD_CXO_D0]		= &msm8974_cxo_d0,
+	[RPM_SMD_CXO_D0_A]		= &msm8974_cxo_d0_a,
+	[RPM_SMD_CXO_D1]		= &msm8974_cxo_d1,
+	[RPM_SMD_CXO_D1_A]		= &msm8974_cxo_d1_a,
+	[RPM_SMD_CXO_A0]		= &msm8974_cxo_a0,
+	[RPM_SMD_CXO_A0_A]		= &msm8974_cxo_a0_a,
+	[RPM_SMD_CXO_A1]		= &msm8974_cxo_a1,
+	[RPM_SMD_CXO_A1_A]		= &msm8974_cxo_a1_a,
+	[RPM_SMD_CXO_A2]		= &msm8974_cxo_a2,
+	[RPM_SMD_CXO_A2_A]		= &msm8974_cxo_a2_a,
+	[RPM_SMD_DIFF_CLK]		= &msm8974_diff_clk,
+	[RPM_SMD_DIFF_A_CLK]		= &msm8974_diff_a_clk,
+	[RPM_SMD_DIV_CLK1]		= &msm8974_div_clk1,
+	[RPM_SMD_DIV_A_CLK1]		= &msm8974_div_a_clk1,
+	[RPM_SMD_DIV_CLK2]		= &msm8974_div_clk2,
+	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_a_clk2,
+	[RPM_SMD_CXO_D0_PIN]		= &msm8974_cxo_d0_pin,
+	[RPM_SMD_CXO_D0_A_PIN]		= &msm8974_cxo_d0_a_pin,
+	[RPM_SMD_CXO_D1_PIN]		= &msm8974_cxo_d1_pin,
+	[RPM_SMD_CXO_D1_A_PIN]		= &msm8974_cxo_d1_a_pin,
+	[RPM_SMD_CXO_A0_PIN]		= &msm8974_cxo_a0_pin,
+	[RPM_SMD_CXO_A0_A_PIN]		= &msm8974_cxo_a0_a_pin,
+	[RPM_SMD_CXO_A1_PIN]		= &msm8974_cxo_a1_pin,
+	[RPM_SMD_CXO_A1_A_PIN]		= &msm8974_cxo_a1_a_pin,
+	[RPM_SMD_CXO_A2_PIN]		= &msm8974_cxo_a2_pin,
+	[RPM_SMD_CXO_A2_A_PIN]		= &msm8974_cxo_a2_a_pin,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_msm8974 = {
+	.clks = msm8974_clks,
+	.num_clks = ARRAY_SIZE(msm8974_clks),
+};
 static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
+	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpm_smd_clk_match_table);
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
index 5924cdb71336..96b63c00249e 100644
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -14,7 +14,7 @@
 #ifndef _DT_BINDINGS_CLK_MSM_RPMCC_H
 #define _DT_BINDINGS_CLK_MSM_RPMCC_H
 
-/* apq8064 */
+/* RPM clocks */
 #define RPM_PXO_CLK				0
 #define RPM_PXO_A_CLK				1
 #define RPM_CXO_CLK				2
@@ -38,7 +38,7 @@
 #define RPM_SFPB_CLK				20
 #define RPM_SFPB_A_CLK				21
 
-/* msm8916 */
+/* SMD RPM clocks */
 #define RPM_SMD_XO_CLK_SRC				0
 #define RPM_SMD_XO_A_CLK_SRC			1
 #define RPM_SMD_PCNOC_CLK				2
@@ -65,5 +65,41 @@
 #define RPM_SMD_RF_CLK1_A_PIN			23
 #define RPM_SMD_RF_CLK2_PIN				24
 #define RPM_SMD_RF_CLK2_A_PIN			25
+#define RPM_SMD_PNOC_CLK			26
+#define RPM_SMD_PNOC_A_CLK			27
+#define RPM_SMD_CNOC_CLK			28
+#define RPM_SMD_CNOC_A_CLK			29
+#define RPM_SMD_MMSSNOC_AHB_CLK			30
+#define RPM_SMD_MMSSNOC_AHB_A_CLK		31
+#define RPM_SMD_GFX3D_CLK_SRC			32
+#define RPM_SMD_GFX3D_A_CLK_SRC			33
+#define RPM_SMD_OCMEMGX_CLK			34
+#define RPM_SMD_OCMEMGX_A_CLK			35
+#define RPM_SMD_CXO_D0				36
+#define RPM_SMD_CXO_D0_A			37
+#define RPM_SMD_CXO_D1				38
+#define RPM_SMD_CXO_D1_A			39
+#define RPM_SMD_CXO_A0				40
+#define RPM_SMD_CXO_A0_A			41
+#define RPM_SMD_CXO_A1				42
+#define RPM_SMD_CXO_A1_A			43
+#define RPM_SMD_CXO_A2				44
+#define RPM_SMD_CXO_A2_A			45
+#define RPM_SMD_DIV_CLK1			46
+#define RPM_SMD_DIV_A_CLK1			47
+#define RPM_SMD_DIV_CLK2			48
+#define RPM_SMD_DIV_A_CLK2			49
+#define RPM_SMD_DIFF_CLK			50
+#define RPM_SMD_DIFF_A_CLK			51
+#define RPM_SMD_CXO_D0_PIN			52
+#define RPM_SMD_CXO_D0_A_PIN			53
+#define RPM_SMD_CXO_D1_PIN			54
+#define RPM_SMD_CXO_D1_A_PIN			55
+#define RPM_SMD_CXO_A0_PIN			56
+#define RPM_SMD_CXO_A0_A_PIN			57
+#define RPM_SMD_CXO_A1_PIN			58
+#define RPM_SMD_CXO_A1_A_PIN			59
+#define RPM_SMD_CXO_A2_PIN			60
+#define RPM_SMD_CXO_A2_A_PIN			61
 
 #endif
-- 
2.5.0

