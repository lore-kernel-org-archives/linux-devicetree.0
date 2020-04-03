Return-Path: <SRS0=qh1l=5T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D7FC2BA18
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 23:54:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B6D1B2074B
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 23:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585958071;
	bh=xWPdo0pwiFgLstbmepM+ex6HV+SBWJzrXRUBo9IaM5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=z61q9UOLN9VBoNyWk0kbfnb0DN+MLoZ6dg/yCwkG/5rCo5fCTb9pDxTSc/22pJDsk
	 wGYNrP2x5x+ZcQpCQQKvyoIlAaAumjHrmh0NwXn89sxfC1EXNk3EpY+64ZQiYqm+Fz
	 IYx/z3cgc4x4IbU9srQV/cCOXlr88/n315GWvi4U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgDCXyO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Apr 2020 19:54:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:41858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726323AbgDCXyN (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 3 Apr 2020 19:54:13 -0400
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com [70.114.128.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AFE3220BED;
        Fri,  3 Apr 2020 23:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585958053;
        bh=xWPdo0pwiFgLstbmepM+ex6HV+SBWJzrXRUBo9IaM5U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i3XQUGcVTwdpLrp8ZNJTusHAFDbmgPYG2icGi+z6qy8+BLTcGXMIpehNMfYds1eUM
         UTunA12QA6brWp5g14l+8RTmGGIwFIREeLiYq9uZRYe/epoEg6jDqHyCYHTVbp/zeU
         +eQYM3fwnJzIwuF85yppbSzQENDks2F8v+N1dCXE=
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     linux-clk@vger.kernel.org
Cc:     dinguyen@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com
Subject: [PATCHv5 2/5] clk: socfpga: remove clk_ops enable/disable methods
Date:   Fri,  3 Apr 2020 18:54:00 -0500
Message-Id: <20200403235403.13990-3-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403235403.13990-1-dinguyen@kernel.org>
References: <20200403235403.13990-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The enable/disable clock ops are already defined in the standard clock
ops, so we don't need to assign them.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v5: no changes
v4: no changes
v3: no changes
v2: created
---
 drivers/clk/socfpga/clk-pll-a10.c | 2 --
 drivers/clk/socfpga/clk-pll-s10.c | 2 --
 drivers/clk/socfpga/clk-pll.c     | 2 --
 3 files changed, 6 deletions(-)

diff --git a/drivers/clk/socfpga/clk-pll-a10.c b/drivers/clk/socfpga/clk-pll-a10.c
index 3816fc04b274..6d9395106c0c 100644
--- a/drivers/clk/socfpga/clk-pll-a10.c
+++ b/drivers/clk/socfpga/clk-pll-a10.c
@@ -102,8 +102,6 @@ static struct clk * __init __socfpga_pll_init(struct device_node *node,
 	pll_clk->hw.hw.init = &init;
 
 	pll_clk->hw.bit_idx = SOCFPGA_PLL_EXT_ENA;
-	clk_pll_ops.enable = clk_gate_ops.enable;
-	clk_pll_ops.disable = clk_gate_ops.disable;
 
 	clk = clk_register(NULL, &pll_clk->hw.hw);
 	if (WARN_ON(IS_ERR(clk))) {
diff --git a/drivers/clk/socfpga/clk-pll-s10.c b/drivers/clk/socfpga/clk-pll-s10.c
index bcd3f14e9145..9faa80ff3b53 100644
--- a/drivers/clk/socfpga/clk-pll-s10.c
+++ b/drivers/clk/socfpga/clk-pll-s10.c
@@ -138,8 +138,6 @@ struct clk *s10_register_pll(const struct stratix10_pll_clock *clks,
 	pll_clk->hw.hw.init = &init;
 
 	pll_clk->hw.bit_idx = SOCFPGA_PLL_POWER;
-	clk_pll_ops.enable = clk_gate_ops.enable;
-	clk_pll_ops.disable = clk_gate_ops.disable;
 
 	clk = clk_register(NULL, &pll_clk->hw.hw);
 	if (WARN_ON(IS_ERR(clk))) {
diff --git a/drivers/clk/socfpga/clk-pll.c b/drivers/clk/socfpga/clk-pll.c
index dc65cc0fd3bd..a001641b2f42 100644
--- a/drivers/clk/socfpga/clk-pll.c
+++ b/drivers/clk/socfpga/clk-pll.c
@@ -105,8 +105,6 @@ static __init struct clk *__socfpga_pll_init(struct device_node *node,
 	pll_clk->hw.hw.init = &init;
 
 	pll_clk->hw.bit_idx = SOCFPGA_PLL_EXT_ENA;
-	clk_pll_ops.enable = clk_gate_ops.enable;
-	clk_pll_ops.disable = clk_gate_ops.disable;
 
 	clk = clk_register(NULL, &pll_clk->hw.hw);
 	if (WARN_ON(IS_ERR(clk))) {
-- 
2.25.1

