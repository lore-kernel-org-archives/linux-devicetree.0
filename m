Return-Path: <SRS0=Fzrg=42=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CD9C10F25
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 19:43:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8FAB12465A
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 19:43:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgCITna (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Mar 2020 15:43:30 -0400
Received: from v6.sk ([167.172.42.174]:34624 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726197AbgCITn3 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 9 Mar 2020 15:43:29 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id C6D5561304;
        Mon,  9 Mar 2020 19:43:27 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 07/17] clk: mmp2: Check for MMP3
Date:   Mon,  9 Mar 2020 20:42:44 +0100
Message-Id: <20200309194254.29009-8-lkundrak@v3.sk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200309194254.29009-1-lkundrak@v3.sk>
References: <20200309194254.29009-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The MMP3's are similar enough to MMP2, but there are differencies, such
are more clocks available on the newer model. We want to tell which
platform are we on.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/clk/mmp/clk-of-mmp2.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/mmp/clk-of-mmp2.c b/drivers/clk/mmp/clk-of-mmp2.c
index 251d8d0e78abb..7594a8280b93a 100644
--- a/drivers/clk/mmp/clk-of-mmp2.c
+++ b/drivers/clk/mmp/clk-of-mmp2.c
@@ -62,8 +62,14 @@
 #define MPMU_UART_PLL	0x14
 #define MPMU_PLL2_CR	0x34
 
+enum mmp2_clk_model {
+	CLK_MODEL_MMP2,
+	CLK_MODEL_MMP3,
+};
+
 struct mmp2_clk_unit {
 	struct mmp_clk_unit unit;
+	enum mmp2_clk_model model;
 	void __iomem *mpmu_base;
 	void __iomem *apmu_base;
 	void __iomem *apbc_base;
@@ -326,6 +332,11 @@ static void __init mmp2_clk_init(struct device_node *np)
 	if (!pxa_unit)
 		return;
 
+	if (of_device_is_compatible(np, "marvell,mmp3-clock"))
+		pxa_unit->model = CLK_MODEL_MMP3;
+	else
+		pxa_unit->model = CLK_MODEL_MMP2;
+
 	pxa_unit->mpmu_base = of_iomap(np, 0);
 	if (!pxa_unit->mpmu_base) {
 		pr_err("failed to map mpmu registers\n");
@@ -365,3 +376,4 @@ static void __init mmp2_clk_init(struct device_node *np)
 }
 
 CLK_OF_DECLARE(mmp2_clk, "marvell,mmp2-clock", mmp2_clk_init);
+CLK_OF_DECLARE(mmp3_clk, "marvell,mmp3-clock", mmp2_clk_init);
-- 
2.25.1

