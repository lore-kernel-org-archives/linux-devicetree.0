Return-Path: <SRS0=Wk2R=75=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A30AC433E2
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 20:24:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF64D207DD
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 20:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592339063;
	bh=rxSgWs8m8zTECLJO0qoOOytZOjZTG5r08M3Vu0rbJtc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=HMQf8C3SfBnB/DdgL2HOrSOJD1b8Hr3sELjvP2zr1/q1dv4dSwJV8ZLabqoaUD3un
	 oN4pK9YvW3hFcUzXnJcO4oXeeInyZQhWXqhViW9hgIr0r+E+vFpUtZm09Gwxc8qicn
	 Lgd0JuUZPSQ+4ozwNdgzV1oQsxloNU5d6kxCtcZo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731339AbgFPUYX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 16 Jun 2020 16:24:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:34396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726428AbgFPUYX (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 16 Jun 2020 16:24:23 -0400
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com [70.114.128.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A8462098B;
        Tue, 16 Jun 2020 20:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592339062;
        bh=rxSgWs8m8zTECLJO0qoOOytZOjZTG5r08M3Vu0rbJtc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ihniAd5FFq3TB5eefSkcKHrmVdR1n4hbjEho3prhnk4rMFRNMCi0HR7FFJqAVYekQ
         +24ysdwskr7Q4ejIGRM26rRqmlem7ISmdZsZl/zZhjAV3f5yMnIgzTm4UDGDMmibcl
         r3a9qoy4/W1DRnIiKSh4UjBfJ5yhztTjc5vzr1oE=
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     linux-clk@vger.kernel.org
Cc:     dinguyen@kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Subject: [PATCH 2/3] clk: socfpga: agilex: add nand_x_clk and nand_ecc_clk
Date:   Tue, 16 Jun 2020 15:24:16 -0500
Message-Id: <20200616202417.14376-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616202417.14376-1-dinguyen@kernel.org>
References: <20200616202417.14376-1-dinguyen@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

And the nand_x_clk and nand_ecc_clk. Make the nand_x_clk be the main
clock that is feeding the NAND IP and correct it's parent to be the
l4_mp_clk.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/clk/socfpga/clk-agilex.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/socfpga/clk-agilex.c b/drivers/clk/socfpga/clk-agilex.c
index 699527f7e764..1b2e0ad01b24 100644
--- a/drivers/clk/socfpga/clk-agilex.c
+++ b/drivers/clk/socfpga/clk-agilex.c
@@ -294,8 +294,12 @@ static const struct stratix10_gate_clock agilex_gate_clks[] = {
 	  8, 0, 0, 0, 0, 0, 0},
 	{ AGILEX_SPI_M_CLK, "spi_m_clk", "l4_mp_clk", NULL, 1, 0, 0x7C,
 	  9, 0, 0, 0, 0, 0, 0},
-	{ AGILEX_NAND_CLK, "nand_clk", "l4_main_clk", NULL, 1, 0, 0x7C,
+	{ AGILEX_NAND_X_CLK, "nand_x_clk", "l4_mp_clk", NULL, 1, 0, 0x7C,
 	  10, 0, 0, 0, 0, 0, 0},
+	{ AGILEX_NAND_CLK, "nand_clk", "nand_x_clk", NULL, 1, 0, 0x7C,
+	  10, 0, 0, 0, 0, 0, 4},
+	{ AGILEX_NAND_ECC_CLK, "nand_ecc_clk", "nand_x_clk", NULL, 1, 0, 0x7C,
+	  10, 0, 0, 0, 0, 0, 4},
 };
 
 static int agilex_clk_register_c_perip(const struct stratix10_perip_c_clock *clks,
-- 
2.17.1

