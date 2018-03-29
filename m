From: Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH v4 1/7] clk: msm8996-gcc: change halt check for USB/PCIE pipe_clk
Date: Thu, 29 Mar 2018 16:34:20 +0530
Message-ID: <1522321466-21755-2-git-send-email-mgautam@codeaurora.org>
References: <1522321466-21755-1-git-send-email-mgautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522321466-21755-1-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, robh@kernel.org, sboyd@codeaurora.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, vivek.gautam@codeaurora.org, evgreen@chromium.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

The USB and PCIE pipe clocks are sourced from external clocks
inside the QMP USB/PCIE PHYs. Enabling or disabling of PIPE RCG
clocks is dependent on PHY initialization sequence hence
update halt_check to BRANCH_HALT_DELAY for these clocks so
that clock status bit is not polled when enabling or disabling
the clocks. It allows to simplify PHY client driver code which
is both user and source of the pipe_clk and avoid error logging
related status check on clk_disable/enable.

Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 5d74512..336d12d 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -1418,6 +1418,7 @@ enum {
 
 static struct clk_branch gcc_usb3_phy_pipe_clk = {
 	.halt_reg = 0x50004,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x50004,
 		.enable_mask = BIT(0),
@@ -2472,6 +2473,7 @@ enum {
 
 static struct clk_branch gcc_pcie_0_pipe_clk = {
 	.halt_reg = 0x6b018,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x6b018,
 		.enable_mask = BIT(0),
@@ -2547,6 +2549,7 @@ enum {
 
 static struct clk_branch gcc_pcie_1_pipe_clk = {
 	.halt_reg = 0x6d018,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x6d018,
 		.enable_mask = BIT(0),
@@ -2622,6 +2625,7 @@ enum {
 
 static struct clk_branch gcc_pcie_2_pipe_clk = {
 	.halt_reg = 0x6e018,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x6e018,
 		.enable_mask = BIT(0),
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
