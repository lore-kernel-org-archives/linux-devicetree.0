Return-Path: <SRS0=SgxY=BN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75271C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Aug 2020 05:45:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52491206E9
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Aug 2020 05:45:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728226AbgHCFpH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Aug 2020 01:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728253AbgHCFpG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Aug 2020 01:45:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D8DC06174A
        for <devicetree@vger.kernel.org>; Sun,  2 Aug 2020 22:45:06 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1k2THQ-0005J4-Gg; Mon, 03 Aug 2020 07:45:00 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1k2THK-0005Tz-Tc; Mon, 03 Aug 2020 07:44:54 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     andrew@lunn.ch
Cc:     netdev@vger.kernel.org, f.fainelli@gmail.com, davem@davemloft.net,
        kernel@pengutronix.de, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 02/11] dt-bindings: net: mdio-gpio: add compatible for microchip,mdio-smi0
Date:   Mon,  3 Aug 2020 07:44:33 +0200
Message-Id: <20200803054442.20089-3-m.grzeschik@pengutronix.de>
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

Microchip SMI0 Mode is a special mode, where the MDIO Read/Write
commands are part of the PHY Address and the OP Code is always 0. We add
the compatible for this special mode of the bitbanged mdio driver.

Cc: devicetree@vger.kernel.org
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: - patch not present
v2 -> v3: - first patch
v3 -> v4: - no changes

 Documentation/devicetree/bindings/net/mdio-gpio.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/mdio-gpio.txt b/Documentation/devicetree/bindings/net/mdio-gpio.txt
index 8dbcf8295c6c9ce..4d91a36c5cf5031 100644
--- a/Documentation/devicetree/bindings/net/mdio-gpio.txt
+++ b/Documentation/devicetree/bindings/net/mdio-gpio.txt
@@ -2,6 +2,7 @@ MDIO on GPIOs
 
 Currently defined compatibles:
 - virtual,gpio-mdio
+- microchip,mdio-smi0
 
 MDC and MDIO lines connected to GPIO controllers are listed in the
 gpios property as described in section VIII.1 in the following order:
-- 
2.28.0

