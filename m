From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 11/11] clk: qcom: ipq8074: add misc resets for PCIE and NSS
Date: Wed, 13 Dec 2017 19:55:42 +0530
Message-ID: <1513175142-3702-12-git-send-email-absahu@codeaurora.org>
References: <1513175142-3702-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1513175142-3702-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

PCIE and NSS has MISC reset register in which single register has
multiple reset bit. The patch adds these resets with its
corresponding reset bits.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq8074.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index 3aad6bc..0462f4a 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -4653,6 +4653,48 @@ enum {
 	[GCC_APC0_VOLTAGE_DROOP_DETECTOR_BCR] = { 0x78000, 0 },
 	[GCC_APC1_VOLTAGE_DROOP_DETECTOR_BCR] = { 0x79000, 0 },
 	[GCC_SMMU_CATS_BCR] = { 0x7c000, 0 },
+	[GCC_UBI0_AXI_ARES] = { 0x68010, 0 },
+	[GCC_UBI0_AHB_ARES] = { 0x68010, 1 },
+	[GCC_UBI0_NC_AXI_ARES] = { 0x68010, 2 },
+	[GCC_UBI0_DBG_ARES] = { 0x68010, 3 },
+	[GCC_UBI0_CORE_CLAMP_ENABLE] = { 0x68010, 4 },
+	[GCC_UBI0_CLKRST_CLAMP_ENABLE] = { 0x68010, 5 },
+	[GCC_UBI1_AXI_ARES] = { 0x68010, 8 },
+	[GCC_UBI1_AHB_ARES] = { 0x68010, 9 },
+	[GCC_UBI1_NC_AXI_ARES] = { 0x68010, 10 },
+	[GCC_UBI1_DBG_ARES] = { 0x68010, 11 },
+	[GCC_UBI1_CORE_CLAMP_ENABLE] = { 0x68010, 12 },
+	[GCC_UBI1_CLKRST_CLAMP_ENABLE] = { 0x68010, 13 },
+	[GCC_NSS_CFG_ARES] = { 0x68010, 16 },
+	[GCC_NSS_IMEM_ARES] = { 0x68010, 17 },
+	[GCC_NSS_NOC_ARES] = { 0x68010, 18 },
+	[GCC_NSS_CRYPTO_ARES] = { 0x68010, 19 },
+	[GCC_NSS_CSR_ARES] = { 0x68010, 20 },
+	[GCC_NSS_CE_APB_ARES] = { 0x68010, 21 },
+	[GCC_NSS_CE_AXI_ARES] = { 0x68010, 22 },
+	[GCC_NSSNOC_CE_APB_ARES] = { 0x68010, 23 },
+	[GCC_NSSNOC_CE_AXI_ARES] = { 0x68010, 24 },
+	[GCC_NSSNOC_UBI0_AHB_ARES] = { 0x68010, 25 },
+	[GCC_NSSNOC_UBI1_AHB_ARES] = { 0x68010, 26 },
+	[GCC_NSSNOC_SNOC_ARES] = { 0x68010, 27 },
+	[GCC_NSSNOC_CRYPTO_ARES] = { 0x68010, 28 },
+	[GCC_NSSNOC_ATB_ARES] = { 0x68010, 29 },
+	[GCC_NSSNOC_QOSGEN_REF_ARES] = { 0x68010, 30 },
+	[GCC_NSSNOC_TIMEOUT_REF_ARES] = { 0x68010, 31 },
+	[GCC_PCIE0_PIPE_ARES] = { 0x75040, 0 },
+	[GCC_PCIE0_SLEEP_ARES] = { 0x75040, 1 },
+	[GCC_PCIE0_CORE_STICKY_ARES] = { 0x75040, 2 },
+	[GCC_PCIE0_AXI_MASTER_ARES] = { 0x75040, 3 },
+	[GCC_PCIE0_AXI_SLAVE_ARES] = { 0x75040, 4 },
+	[GCC_PCIE0_AHB_ARES] = { 0x75040, 5 },
+	[GCC_PCIE0_AXI_MASTER_STICKY_ARES] = { 0x75040, 6 },
+	[GCC_PCIE1_PIPE_ARES] = { 0x76040, 0 },
+	[GCC_PCIE1_SLEEP_ARES] = { 0x76040, 1 },
+	[GCC_PCIE1_CORE_STICKY_ARES] = { 0x76040, 2 },
+	[GCC_PCIE1_AXI_MASTER_ARES] = { 0x76040, 3 },
+	[GCC_PCIE1_AXI_SLAVE_ARES] = { 0x76040, 4 },
+	[GCC_PCIE1_AHB_ARES] = { 0x76040, 5 },
+	[GCC_PCIE1_AXI_MASTER_STICKY_ARES] = { 0x76040, 6 },
 };
 
 static const struct of_device_id gcc_ipq8074_match_table[] = {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
