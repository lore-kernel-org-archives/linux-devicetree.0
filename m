Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5DBC43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 09:13:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FE382077B
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 09:13:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbfLIJNt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 04:13:49 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:34523 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbfLIJNs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 04:13:48 -0500
Received: from localhost (lfbn-1-1480-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: kamel.bouhara@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id E434920000E;
        Mon,  9 Dec 2019 09:13:44 +0000 (UTC)
From:   Kamel Bouhara <kamel.bouhara@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        devicetree@vger.kernel.org,
        Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: at91: Document Kizboxmini and Smartkiz boards binding
Date:   Mon,  9 Dec 2019 10:13:38 +0100
Message-Id: <20191209091339.32593-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.24.0
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

Changes in v4
=============
	- Fix missing "-" before items list

Changes in v5
=============
	- s/at91-kizboxmini_common.dtsi/at91-kizboxmini-common.dtsi/
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 6dd8be401673..8d50915330e8 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -35,6 +35,16 @@ properties:
               - atmel,at91sam9x60
           - const: atmel,at91sam9

+      - items:
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
2.24.0

