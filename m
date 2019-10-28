Return-Path: <SRS0=uucL=YV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF811CA9EC2
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 06:07:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE5E5222CD
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 06:07:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731781AbfJ1GHd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 28 Oct 2019 02:07:33 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:6876 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731788AbfJ1GHd (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 28 Oct 2019 02:07:33 -0400
X-IronPort-AV: E=Sophos;i="5.68,238,1569250800"; 
   d="scan'208";a="29966532"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 28 Oct 2019 15:07:31 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 24C1641715B9;
        Mon, 28 Oct 2019 15:07:31 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, geert+renesas@glider.be
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 4/4] clk: renesas: rcar-usb2-clock-sel: Add reset_control
Date:   Mon, 28 Oct 2019 15:07:30 +0900
Message-Id: <1572242850-9073-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572242850-9073-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1572242850-9073-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This hardware needs to deassert resets of both host and peripheral.
So, this patch adds reset control.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/clk/renesas/Kconfig               |  1 +
 drivers/clk/renesas/rcar-usb2-clock-sel.c | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index be03bb7..a76d05af 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -156,6 +156,7 @@ config CLK_RCAR_GEN3_CPG
 config CLK_RCAR_USB2_CLOCK_SEL
 	bool "Renesas R-Car USB2 clock selector support"
 	depends on ARCH_RENESAS || COMPILE_TEST
+	select RESET_CONTROLLER
 	help
 	  This is a driver for R-Car USB2 clock selector
 
diff --git a/drivers/clk/renesas/rcar-usb2-clock-sel.c b/drivers/clk/renesas/rcar-usb2-clock-sel.c
index 4096506..1cdcc8f 100644
--- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
+++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c
@@ -19,6 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 
 #define USB20_CLKSET0		0x00
@@ -36,6 +37,7 @@ struct usb2_clock_sel_priv {
 	void __iomem *base;
 	struct clk_hw hw;
 	struct clk_bulk_data clks[CLK_NUM];
+	struct reset_control *rsts;
 	bool extal;
 	bool xtal;
 };
@@ -63,10 +65,16 @@ static int usb2_clock_sel_enable(struct clk_hw *hw)
 	struct usb2_clock_sel_priv *priv = to_priv(hw);
 	int ret;
 
-	ret = clk_bulk_prepare_enable(CLK_NUM, priv->clks);
+	ret = reset_control_deassert(priv->rsts);
 	if (ret)
 		return ret;
 
+	ret = clk_bulk_prepare_enable(CLK_NUM, priv->clks);
+	if (ret) {
+		reset_control_assert(priv->rsts);
+		return ret;
+	}
+
 	usb2_clock_sel_enable_extal_only(priv);
 
 	return 0;
@@ -79,6 +87,7 @@ static void usb2_clock_sel_disable(struct clk_hw *hw)
 	usb2_clock_sel_disable_extal_only(priv);
 
 	clk_bulk_disable_unprepare(CLK_NUM, priv->clks);
+	reset_control_assert(priv->rsts);
 }
 
 /*
@@ -154,6 +163,10 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->clks[CLK_INDEX_HS_USB].clk))
 		return PTR_ERR(priv->clks[CLK_INDEX_HS_USB].clk);
 
+	priv->rsts = devm_reset_control_array_get(dev, true, false);
+	if (IS_ERR(priv->rsts))
+		return PTR_ERR(priv->rsts);
+
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
-- 
2.7.4

