Return-Path: <SRS0=7YFh=7B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E592C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 23:25:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BF2420823
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 23:25:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgESXZF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 May 2020 19:25:05 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58434 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728215AbgESXZD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 May 2020 19:25:03 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 23EE92A26CA;
        Wed, 20 May 2020 00:25:01 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-mtd@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v2 3/4] mtd: rawnand: ingenic: Fix the RB gpio active-high property on qi,lb60
Date:   Wed, 20 May 2020 01:24:53 +0200
Message-Id: <20200519232454.374081-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200519232454.374081-1-boris.brezillon@collabora.com>
References: <20200519232454.374081-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The rb-gpios semantics was undocumented and qi,lb60 (along with the
ingenic driver) got it wrong. The active state encodes the NAND ready
state, which is high level. Since there's no signal inverter on this
board, it should be active-high. Let's fix that here for older DTs so
we can re-use the generic nand_gpio_waitrdy() helper, and be consistent
with what other drivers do.

Suggested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v2:
* New patch
---
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index e7bd845fdbf5..e939404e1383 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -184,7 +184,7 @@ static int ingenic_nand_dev_ready(struct nand_chip *chip)
 {
 	struct ingenic_nand *nand = to_ingenic_nand(nand_to_mtd(chip));
 
-	return !gpiod_get_value_cansleep(nand->busy_gpio);
+	return gpiod_get_value_cansleep(nand->busy_gpio);
 }
 
 static void ingenic_nand_ecc_hwctl(struct nand_chip *chip, int mode)
@@ -343,6 +343,18 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 		nand->chip.legacy.dev_ready = ingenic_nand_dev_ready;
 	}
 
+	/*
+	 * The rb-gpios semantics was undocumented and qi,lb60 (along with
+	 * the ingenic driver) got it wrong. The active state encodes the
+	 * NAND ready state, which is high level. Since there's no signal
+	 * inverter on this board, it should be active-high. Let's fix that
+	 * here for older DTs so we can re-use the generic nand_gpio_waitrdy()
+	 * helper, and be consistent with what other drivers do.
+	 */
+	if (of_machine_is_compatible("qi,lb60") &&
+	    gpiod_is_active_low(nand->busy_gpio))
+		gpiod_toggle_active_low(nand->busy_gpio);
+
 	nand->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
 
 	if (IS_ERR(nand->wp_gpio)) {
-- 
2.25.4

