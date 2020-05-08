Return-Path: <SRS0=pmuo=6W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7553DC47247
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 May 2020 15:44:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4ED40206B9
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 May 2020 15:44:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbgEHPoD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 May 2020 11:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728334AbgEHPn7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 May 2020 11:43:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 303EEC05BD0A
        for <devicetree@vger.kernel.org>; Fri,  8 May 2020 08:43:59 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jX5AH-0004qt-4t; Fri, 08 May 2020 17:43:53 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jX5AB-0003Yv-Hd; Fri, 08 May 2020 17:43:47 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     andrew@lunn.ch
Cc:     netdev@vger.kernel.org, f.fainelli@gmail.com, davem@davemloft.net,
        kernel@pengutronix.de, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 5/5] dt-bindings: net: dsa: document additional Microchip KSZ8863/8873 switch
Date:   Fri,  8 May 2020 17:43:43 +0200
Message-Id: <20200508154343.6074-6-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200508154343.6074-1-m.grzeschik@pengutronix.de>
References: <20200508154343.6074-1-m.grzeschik@pengutronix.de>
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
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
v1 -> v3: - nothing changes
          - already Acked-by Rob Herring

 Documentation/devicetree/bindings/net/dsa/ksz.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/ksz.txt b/Documentation/devicetree/bindings/net/dsa/ksz.txt
index 95e91e84151c33..a5d71862f53cbc 100644
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
2.26.2

