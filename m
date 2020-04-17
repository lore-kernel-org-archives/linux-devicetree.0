Return-Path: <SRS0=b/Hz=6B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A74C352BE
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 07:05:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C22BF21D94
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 07:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728604AbgDQHFf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Apr 2020 03:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728570AbgDQHFe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Apr 2020 03:05:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E688C061A10
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2020 00:05:34 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jPL45-0008Nq-3p; Fri, 17 Apr 2020 09:05:29 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jPL44-00033H-Ep; Fri, 17 Apr 2020 09:05:28 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Rohit Visavalia <rohit.visavalia@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dhaval Shah <dshah@xilinx.com>, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v3 3/6] soc: xilinx: vcu: implement clock provider for output clocks
Date:   Fri, 17 Apr 2020 09:05:23 +0200
Message-Id: <20200417070526.7178-4-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200417070526.7178-1-m.tretter@pengutronix.de>
References: <20200417070526.7178-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The VCU System-Level Control uses an internal PLL to drive the core and
MCU clock for the allegro encoder and decoder based on an external PL
clock.

In order be able to ensure that the clocks are enabled and to get their
rate from other drivers, the module must implement a clock provider and
register the clocks at the common clock framework. Other drivers are
then able to access the clock via devicetree bindings.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog:

v2 -> v3:
- drop unused xvcu_reset function

v1 -> v2:
- unregister registered clocks when removing the driver
---
 drivers/soc/xilinx/Kconfig    |  2 +-
 drivers/soc/xilinx/xlnx_vcu.c | 64 +++++++++++++++++++++++++++++++++--
 2 files changed, 63 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/xilinx/Kconfig b/drivers/soc/xilinx/Kconfig
index 223f1f9d0922..331f124902e8 100644
--- a/drivers/soc/xilinx/Kconfig
+++ b/drivers/soc/xilinx/Kconfig
@@ -3,7 +3,7 @@ menu "Xilinx SoC drivers"
 
 config XILINX_VCU
 	tristate "Xilinx VCU logicoreIP Init"
-	depends on HAS_IOMEM
+	depends on HAS_IOMEM && COMMON_CLK
 	help
 	  Provides the driver to enable and disable the isolation between the
 	  processing system and programmable logic part by using the logicoreIP
diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
index dcd8e7824b06..03bf252737aa 100644
--- a/drivers/soc/xilinx/xlnx_vcu.c
+++ b/drivers/soc/xilinx/xlnx_vcu.c
@@ -7,6 +7,7 @@
  * Contacts   Dhaval Shah <dshah@xilinx.com>
  */
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/io.h>
@@ -14,6 +15,8 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 
+#include <dt-bindings/clock/xlnx-vcu.h>
+
 /* Address map for different registers implemented in the VCU LogiCORE IP. */
 #define VCU_ECODER_ENABLE		0x00
 #define VCU_DECODER_ENABLE		0x04
@@ -108,7 +111,9 @@ struct xvcu_device {
 	struct clk *aclk;
 	void __iomem *logicore_reg_ba;
 	void __iomem *vcu_slcr_ba;
+	struct clk_onecell_data clk_data;
 	u32 coreclk;
+	u32 mcuclk;
 };
 
 /**
@@ -375,10 +380,10 @@ static int xvcu_set_vcu_pll_info(struct xvcu_device *xvcu)
 	}
 
 	xvcu->coreclk = pll_clk / divisor_core;
-	mcuclk = pll_clk / divisor_mcu;
+	xvcu->mcuclk = pll_clk / divisor_mcu;
 	dev_dbg(xvcu->dev, "Actual Ref clock freq is %uHz\n", refclk);
 	dev_dbg(xvcu->dev, "Actual Core clock freq is %uHz\n", xvcu->coreclk);
-	dev_dbg(xvcu->dev, "Actual Mcu clock freq is %uHz\n", mcuclk);
+	dev_dbg(xvcu->dev, "Actual Mcu clock freq is %uHz\n", xvcu->mcuclk);
 
 	vcu_pll_ctrl &= ~(VCU_PLL_CTRL_FBDIV_MASK << VCU_PLL_CTRL_FBDIV_SHIFT);
 	vcu_pll_ctrl |= (found->fbdiv & VCU_PLL_CTRL_FBDIV_MASK) <<
@@ -485,6 +490,51 @@ static int xvcu_set_pll(struct xvcu_device *xvcu)
 	return -ETIMEDOUT;
 }
 
+static int xvcu_register_clock_provider(struct xvcu_device *xvcu)
+{
+	struct device *dev = xvcu->dev;
+	const char *parent_name = __clk_get_name(xvcu->pll_ref);
+	struct clk_onecell_data *data = &xvcu->clk_data;
+	struct clk **clks;
+	size_t num_clks = CLK_XVCU_MAX;
+
+	clks = devm_kcalloc(dev, num_clks, sizeof(*clks), GFP_KERNEL);
+	if (!clks)
+		return -ENOMEM;
+
+	data->clk_num = num_clks;
+	data->clks = clks;
+
+	clks[CLK_XVCU_ENC_CORE] =
+		clk_register_fixed_rate(dev, "venc_core_clk",
+					parent_name, 0, xvcu->coreclk);
+	clks[CLK_XVCU_ENC_MCU] =
+		clk_register_fixed_rate(dev, "venc_mcu_clk",
+					parent_name, 0, xvcu->mcuclk);
+	clks[CLK_XVCU_DEC_CORE] =
+		clk_register_fixed_rate(dev, "vdec_core_clk",
+					parent_name, 0, xvcu->coreclk);
+	clks[CLK_XVCU_DEC_MCU] =
+		clk_register_fixed_rate(dev, "vdec_mcu_clk",
+					parent_name, 0, xvcu->mcuclk);
+
+	return of_clk_add_provider(dev->of_node, of_clk_src_onecell_get, data);
+}
+
+static void xvcu_unregister_clock_provider(struct xvcu_device *xvcu)
+{
+	struct device *dev = xvcu->dev;
+	struct clk_onecell_data *data = &xvcu->clk_data;
+	struct clk **clks = data->clks;
+
+	of_clk_del_provider(dev->of_node);
+
+	clk_unregister_fixed_rate(clks[CLK_XVCU_DEC_MCU]);
+	clk_unregister_fixed_rate(clks[CLK_XVCU_DEC_CORE]);
+	clk_unregister_fixed_rate(clks[CLK_XVCU_ENC_MCU]);
+	clk_unregister_fixed_rate(clks[CLK_XVCU_ENC_CORE]);
+}
+
 /**
  * xvcu_probe - Probe existence of the logicoreIP
  *			and initialize PLL
@@ -569,10 +619,18 @@ static int xvcu_probe(struct platform_device *pdev)
 		goto error_pll_ref;
 	}
 
+	ret = xvcu_register_clock_provider(xvcu);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register clock provider\n");
+		goto error_clk_provider;
+	}
+
 	dev_set_drvdata(&pdev->dev, xvcu);
 
 	return 0;
 
+error_clk_provider:
+	xvcu_unregister_clock_provider(xvcu);
 error_pll_ref:
 	clk_disable_unprepare(xvcu->pll_ref);
 error_aclk:
@@ -596,6 +654,8 @@ static int xvcu_remove(struct platform_device *pdev)
 	if (!xvcu)
 		return -ENODEV;
 
+	xvcu_unregister_clock_provider(xvcu);
+
 	/* Add the the Gasket isolation and put the VCU in reset. */
 	xvcu_write(xvcu->logicore_reg_ba, VCU_GASKET_INIT, 0);
 
-- 
2.20.1

