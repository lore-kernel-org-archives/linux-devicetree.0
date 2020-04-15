Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A70AC2BB85
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 16:37:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E95C2064A
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 16:37:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1416171AbgDOQhe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 12:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1416172AbgDOQhd (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Apr 2020 12:37:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4730C061A0F
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 09:37:32 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7] helo=dude.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <bst@pengutronix.de>)
        id 1jOl2S-0007eu-DM; Wed, 15 Apr 2020 18:37:24 +0200
From:   Bastian Krause <bst@pengutronix.de>
To:     linux-rtc@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnaud Ebalard <arno@natisbad.org>,
        Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
        kernel@pengutronix.de, Bastian Krause <bst@pengutronix.de>
Subject: [RESEND PATCH v2 1/3] rtc: ds1307: Enable battery backup on RX8130
Date:   Wed, 15 Apr 2020 18:36:59 +0200
Message-Id: <20200415163701.21989-1-bst@pengutronix.de>
X-Mailer: git-send-email 2.26.0.rc2
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

From: Marek Vasut <marex@denx.de>

The battery backup can be disabled on this RTC, e.g. if populated right
out of production. Force the battery backup bit on to enable it.

Signed-off-by: Marek Vasut <marex@denx.de>
Reviewed-by: Bastian Krause <bst@pengutronix.de>
--
v2: Drop the custom offset, let regmap handle that
---
 drivers/rtc/rtc-ds1307.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 49702942bb08..5f0df60a71d1 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -122,6 +122,8 @@ enum ds_type {
 #define RX8130_REG_FLAG_AF		BIT(3)
 #define RX8130_REG_CONTROL0		0x1e
 #define RX8130_REG_CONTROL0_AIE		BIT(3)
+#define RX8130_REG_CONTROL1		0x1f
+#define RX8130_REG_CONTROL1_INIEN	BIT(4)
 
 #define MCP794XX_REG_CONTROL		0x07
 #	define MCP794XX_BIT_ALM0_EN	0x10
@@ -1875,6 +1877,11 @@ static int ds1307_probe(struct i2c_client *client,
 				     DS1307_REG_HOUR << 4 | 0x08, hour);
 		}
 		break;
+	case rx_8130:
+		/* make sure that the backup battery is enabled */
+		regmap_write(ds1307->regmap, RX8130_REG_CONTROL1,
+			     RX8130_REG_CONTROL1_INIEN);
+		break;
 	default:
 		break;
 	}
-- 
2.26.0.rc2

