Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C645C3815B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 16:37:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A0A4206F9
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 16:37:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1416169AbgDOQhd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 12:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1416171AbgDOQhc (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Apr 2020 12:37:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38815C061A0E
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 09:37:32 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7] helo=dude.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <bst@pengutronix.de>)
        id 1jOl2S-0007eu-G5; Wed, 15 Apr 2020 18:37:24 +0200
From:   Bastian Krause <bst@pengutronix.de>
To:     linux-rtc@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnaud Ebalard <arno@natisbad.org>,
        Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
        kernel@pengutronix.de, Bastian Krause <bst@pengutronix.de>
Subject: [PATCH 3/3] rtc: ds1307: make backup battery chargeable optionally
Date:   Wed, 15 Apr 2020 18:37:01 +0200
Message-Id: <20200415163701.21989-3-bst@pengutronix.de>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200415163701.21989-1-bst@pengutronix.de>
References: <20200415163701.21989-1-bst@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

RX8130_REG_CONTROL1_CHGEN decides whether the battery or the
supercap should be charged or not. Introduce a new dt binding for that.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
 drivers/rtc/rtc-ds1307.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 5f0df60a71d1..451708402c3e 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -124,6 +124,7 @@ enum ds_type {
 #define RX8130_REG_CONTROL0_AIE		BIT(3)
 #define RX8130_REG_CONTROL1		0x1f
 #define RX8130_REG_CONTROL1_INIEN	BIT(4)
+#define RX8130_REG_CONTROL1_CHGEN	BIT(5)
 
 #define MCP794XX_REG_CONTROL		0x07
 #	define MCP794XX_BIT_ALM0_EN	0x10
@@ -1708,6 +1709,7 @@ static int ds1307_probe(struct i2c_client *client,
 	const struct chip_desc	*chip;
 	bool			want_irq;
 	bool			ds1307_can_wakeup_device = false;
+	bool			enable_bb_charging = false;
 	unsigned char		regs[8];
 	struct ds1307_platform_data *pdata = dev_get_platdata(&client->dev);
 	u8			trickle_charger_setup = 0;
@@ -1774,6 +1776,9 @@ static int ds1307_probe(struct i2c_client *client,
 	if (chip->alarm && of_property_read_bool(client->dev.of_node,
 						 "wakeup-source"))
 		ds1307_can_wakeup_device = true;
+
+	enable_bb_charging = of_property_read_bool(client->dev.of_node,
+						   "aux-voltage-chargeable");
 #endif
 
 	switch (ds1307->type) {
@@ -1879,8 +1884,13 @@ static int ds1307_probe(struct i2c_client *client,
 		break;
 	case rx_8130:
 		/* make sure that the backup battery is enabled */
-		regmap_write(ds1307->regmap, RX8130_REG_CONTROL1,
-			     RX8130_REG_CONTROL1_INIEN);
+		regs[0] = RX8130_REG_CONTROL1_INIEN;
+
+		/* set chargeable flag */
+		if (enable_bb_charging)
+			regs[0] |= RX8130_REG_CONTROL1_CHGEN;
+
+		regmap_write(ds1307->regmap, RX8130_REG_CONTROL1, regs[0]);
 		break;
 	default:
 		break;
-- 
2.26.0.rc2

