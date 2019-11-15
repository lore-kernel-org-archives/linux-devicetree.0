Return-Path: <SRS0=ud5f=ZH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7933C43141
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 16:08:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A1C12053B
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 16:08:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727658AbfKOQIa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 Nov 2019 11:08:30 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47169 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727564AbfKOQIa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 Nov 2019 11:08:30 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iVe90-0002S5-MC; Fri, 15 Nov 2019 17:08:22 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iVe8y-00047D-6K; Fri, 15 Nov 2019 17:08:20 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     robh+dt@kernel.org, KCHSU0@nuvoton.com, broonie@kernel.org,
        thomas.fehrenbacher@siedle.de
Cc:     kernel@pengutronix.de, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: ASoC: add nau8812 documentation
Date:   Fri, 15 Nov 2019 17:08:17 +0100
Message-Id: <20191115160819.15557-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191115160819.15557-1-m.felsch@pengutronix.de>
References: <20191115160819.15557-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add dt-bindings for the nau8812 device.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 Documentation/devicetree/bindings/sound/nau8810.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/nau8810.txt b/Documentation/devicetree/bindings/sound/nau8810.txt
index 05830e477acd..ddb007a43e68 100644
--- a/Documentation/devicetree/bindings/sound/nau8810.txt
+++ b/Documentation/devicetree/bindings/sound/nau8810.txt
@@ -4,7 +4,7 @@ This device supports I2C only.
 
 Required properties:
 
-  - compatible : "nuvoton,nau8810"
+  - compatible : "nuvoton,nau8810" or "nuvoton,nau8812"
 
   - reg : the I2C address of the device.
 
-- 
2.20.1

