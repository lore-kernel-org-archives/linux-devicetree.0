Return-Path: <SRS0=r6ca=Y6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B6EC5DF62
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 08:36:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F15D2084D
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 08:36:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729818AbfKFIgs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 Nov 2019 03:36:48 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:48609 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730088AbfKFIgr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 Nov 2019 03:36:47 -0500
X-Originating-IP: 92.137.17.54
Received: from localhost (alyon-657-1-975-54.w92-137.abo.wanadoo.fr [92.137.17.54])
        (Authenticated sender: kamel.bouhara@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5709F24000F;
        Wed,  6 Nov 2019 08:36:45 +0000 (UTC)
From:   Kamel Bouhara <kamel.bouhara@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: at91: Document Kizboxmini and Smartkiz boards binding
Date:   Wed,  6 Nov 2019 09:36:42 +0100
Message-Id: <20191106083643.1995-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Document devicetree's bindings for the Overkiz's Kizbox Mini and
Smartkiz boards, based on a SAM9G25 Atmel SoC.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
Changes in v2
=============
	- Added Kizboxmini Base board documentation
	- Merged Smartkiz documentation as it is also a sam9g25 based
	board

Changes in v3
=============
	- Made a single items list with all the sam9g25 based boards and
	put description into a comment.
	- Fixed duplicated item in enum list and checked with 'make
	dt_binding_check'
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 6dd8be401673..e4140e94864d 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -35,6 +35,16 @@ properties:
               - atmel,at91sam9x60
           - const: atmel,at91sam9

+        items:
+          - enum:
+                - overkiz,kizboxmini-base # Overkiz kizbox Mini Base Board
+                - overkiz,kizboxmini-mb   # Overkiz kizbox Mini Mother Board
+                - overkiz,kizboxmini-rd   # Overkiz kizbox Mini RailDIN
+                - overkiz,smartkiz        # Overkiz SmartKiz Board
+          - const: atmel,at91sam9g25
+          - const: atmel,at91sam9x5
+          - const: atmel,at91sam9
+
       - items:
           - enum:
               - atmel,at91sam9g15
--
2.24.0.rc1

