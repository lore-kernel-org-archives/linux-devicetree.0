From: Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH v5 1/7] clk: msm8996-gcc: Mark halt check as no-op for USB/PCIE pipe_clk
Date: Thu,  3 May 2018 02:36:08 +0530
Message-ID: <1525295174-15995-2-git-send-email-mgautam@codeaurora.org>
References: <1525295174-15995-1-git-send-email-mgautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525295174-15995-1-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, robh@kernel.org, sboyd@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dianders@chromium.org, evgreen@chromium.org, Vivek Gautam <vivek.gautam@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The USB and PCIE pipe clocks are sourced from external clocks
inside the QMP USB/PCIE PHYs. Enabling or disabling of PIPE RCG
clocks is dependent on PHY initialization sequence hence
update halt_check to BRANCH_HALT_SKIP for these clocks so
that clock status bit is not polled when enabling or disabling
the clocks. It allows to simplify PHY client driver code which
is both user and source of the pipe_clk and avoid error logging
related status check on clk_disable/enable.

Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 3d64529..b73e7f1 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -1418,6 +1418,7 @@ enum {
 
 static struct clk_branch gcc_usb3_phy_pipe_clk = {
 	.halt_reg = 0x50004,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x50004,
 		.enable_mask = BIT(0),
@@ -2472,6 +2473,7 @@ enum {
 
 static struct clk_branch gcc_pcie_0_pipe_clk = {
 	.halt_reg = 0x6b018,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x6b018,
 		.enable_mask = BIT(0),
@@ -2547,6 +2549,7 @@ enum {
 
 static struct clk_branch gcc_pcie_1_pipe_clk = {
 	.halt_reg = 0x6d018,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x6d018,
 		.enable_mask = BIT(0),
@@ -2622,6 +2625,7 @@ enum {
 
 static struct clk_branch gcc_pcie_2_pipe_clk = {
 	.halt_reg = 0x6e018,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x6e018,
 		.enable_mask = BIT(0),
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
