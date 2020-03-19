Return-Path: <SRS0=Rh3i=5E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A10C4332D
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 05:57:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 26F6D20732
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 05:57:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgCSF47 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Mar 2020 01:56:59 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:32973 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgCSF47 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Mar 2020 01:56:59 -0400
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1jEoAh-0000dx-EG; Thu, 19 Mar 2020 06:56:47 +0100
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1jEoAZ-0001zL-Q8; Thu, 19 Mar 2020 06:56:39 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 1/5] dt-bindings: vendor-prefixes: Add an entry for Protonic Holland
Date:   Thu, 19 Mar 2020 06:56:32 +0100
Message-Id: <20200319055636.7573-2-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200319055636.7573-1-o.rempel@pengutronix.de>
References: <20200319055636.7573-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add "prt" entry for Protonic Holland: https://www.protonic.nl/en/

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9e67944bec9c..a0d3214187a5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -775,6 +775,8 @@ patternProperties:
     description: Primux Trading, S.L.
   "^probox2,.*":
     description: PROBOX2 (by W2COMP Co., Ltd.)
+  "^prt,.*":
+    description: Protonic Holland
   "^pulsedlight,.*":
     description: PulsedLight, Inc
   "^purism,.*":
-- 
2.25.1

