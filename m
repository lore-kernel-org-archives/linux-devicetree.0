Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAE2C5DF61
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 11:00:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B3832087E
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 11:00:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbfKGLA5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 06:00:57 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55293 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388133AbfKGLA4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 06:00:56 -0500
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1iSfX1-0004bX-2C; Thu, 07 Nov 2019 12:00:51 +0100
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1iSfX0-0003fe-6L; Thu, 07 Nov 2019 12:00:50 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     netdev@vger.kernel.org
Cc:     Tristram.Ha@microchip.com, UNGLinuxDriver@microchip.com,
        kernel@pengutronix.de, devicetree@vger.kernel.org
Subject: [PATCH v1 4/4] dt-bindings: net: dsa: document additional Microchip KSZ8863/8873 switch
Date:   Thu,  7 Nov 2019 12:00:30 +0100
Message-Id: <20191107110030.25199-5-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191107110030.25199-1-m.grzeschik@pengutronix.de>
References: <20191107110030.25199-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

It is a 3-Port 10/100 Ethernet Switch. One CPU-Port and two
Switch-Ports.

Cc: devicetree@vger.kernel.org
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 Documentation/devicetree/bindings/net/dsa/ksz.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/ksz.txt b/Documentation/devicetree/bindings/net/dsa/ksz.txt
index 95e91e84151c3..a5d71862f53cb 100644
--- a/Documentation/devicetree/bindings/net/dsa/ksz.txt
+++ b/Documentation/devicetree/bindings/net/dsa/ksz.txt
@@ -8,6 +8,8 @@ Required properties:
   - "microchip,ksz8765"
   - "microchip,ksz8794"
   - "microchip,ksz8795"
+  - "microchip,ksz8863"
+  - "microchip,ksz8873"
   - "microchip,ksz9477"
   - "microchip,ksz9897"
   - "microchip,ksz9896"
-- 
2.24.0.rc1

