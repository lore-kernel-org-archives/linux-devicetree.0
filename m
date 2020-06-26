Return-Path: <SRS0=dlvX=AH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB774C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 07:14:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA9E320768
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 07:14:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgFZHON (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 26 Jun 2020 03:14:13 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:55587 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728145AbgFZHON (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 26 Jun 2020 03:14:13 -0400
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 7C767100008;
        Fri, 26 Jun 2020 07:14:08 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        masonccyang@mxic.com.tw, juliensu@mxic.com.tw,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v11 2/2] dt-bindings: mtd: Document boolean NAND ECC properties
Date:   Fri, 26 Jun 2020 09:13:57 +0200
Message-Id: <20200626071357.21421-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626071357.21421-1-miquel.raynal@bootlin.com>
References: <20200626071357.21421-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Document nand-use-soft-ecc-engine and nand-no-ecc-engine properties.
The former is here to force software correction, the latter prevents
any correction to happen.

These properties (along with nand-ecc-engine) are supposed to be more
accurate than the current nand-ecc-modes wich is very misleading and
very often people think it is mandatory while the core should be
relied upon to decide which correction to handle.

nand-ecc-mode was already inacurate, but it becomes totally
problematic with setups where there are several hardware engines.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/nand-controller.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index 0969d2e6720b..a3750978ebb8 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -68,6 +68,12 @@ patternProperties:
           3/ The ECC engine is external, in this case the phandle should
           reference the specific ECC engine node.
 
+      nand-use-soft-ecc-engine: true
+        description: Use a software ECC engine.
+
+      nand-no-ecc-engine: true
+        description: Do not use any ECC correction.
+
       nand-ecc-placement:
         allOf:
           - $ref: /schemas/types.yaml#/definitions/string
-- 
2.20.1

