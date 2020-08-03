Return-Path: <SRS0=SgxY=BN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A07C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Aug 2020 05:45:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75462206E2
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Aug 2020 05:45:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbgHCFpL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Aug 2020 01:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728254AbgHCFpH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Aug 2020 01:45:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73E2DC061756
        for <devicetree@vger.kernel.org>; Sun,  2 Aug 2020 22:45:07 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1k2THQ-0005JM-Qp; Mon, 03 Aug 2020 07:45:00 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1k2THL-0005UQ-1o; Mon, 03 Aug 2020 07:44:55 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     andrew@lunn.ch
Cc:     netdev@vger.kernel.org, f.fainelli@gmail.com, davem@davemloft.net,
        kernel@pengutronix.de, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 11/11] dt-bindings: net: dsa: document additional Microchip KSZ8863/8873 switch
Date:   Mon,  3 Aug 2020 07:44:42 +0200
Message-Id: <20200803054442.20089-12-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200803054442.20089-1-m.grzeschik@pengutronix.de>
References: <20200803054442.20089-1-m.grzeschik@pengutronix.de>
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v3: - nothing changes
          - already Acked-by Rob Herring
v1 -> v4: - nothing changes

 Documentation/devicetree/bindings/net/dsa/ksz.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/ksz.txt b/Documentation/devicetree/bindings/net/dsa/ksz.txt
index 95e91e84151c339..a5d71862f53cbcd 100644
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
2.28.0

