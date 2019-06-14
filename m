Return-Path: <SRS0=xUMM=UN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:16061 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbfFNHrV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Jun 2019 03:47:21 -0400
From: JC Kuo <jckuo@nvidia.com>
Subject: [PATCH 2/8] clk: tegra: don't enable PLLE HW sequencer at init
Date: Fri, 14 Jun 2019 15:46:50 +0800
Message-ID: <20190614074652.21960-3-jckuo@nvidia.com>
In-Reply-To: <20190614074652.21960-1-jckuo@nvidia.com>
References: <20190614074652.21960-1-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, pdeschrijver@nvidia.com, afrid@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com, JC Kuo <jckuo@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

PLLE hardware power sequencer references PEX/SATA UPHY PLL hardware
power sequencers' output to enable/disable PLLE. PLLE hardware power
sequencer has to be enabled only after PEX/SATA UPHY PLL's sequencers
are enabled.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 1583f5fc992f..e6de65987fd2 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -2469,18 +2469,6 @@ static int clk_plle_tegra210_enable(struct clk_hw *hw)
 	pll_writel(val, PLLE_SS_CTRL, pll);
 	udelay(1);
 
-	val = pll_readl_misc(pll);
-	val &= ~PLLE_MISC_IDDQ_SW_CTRL;
-	pll_writel_misc(val, pll);
-
-	val = pll_readl(pll->params->aux_reg, pll);
-	val |= (PLLE_AUX_USE_LOCKDET | PLLE_AUX_SS_SEQ_INCLUDE);
-	val &= ~(PLLE_AUX_ENABLE_SWCTL | PLLE_AUX_SS_SWCTL);
-	pll_writel(val, pll->params->aux_reg, pll);
-	udelay(1);
-	val |= PLLE_AUX_SEQ_ENABLE;
-	pll_writel(val, pll->params->aux_reg, pll);
-
 out:
 	if (pll->lock)
 		spin_unlock_irqrestore(pll->lock, flags);
-- 
2.17.1
