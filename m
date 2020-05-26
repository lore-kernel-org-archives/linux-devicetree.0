Return-Path: <SRS0=q8LW=7I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C96FC433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 19:56:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6236A207D8
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 19:56:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390258AbgEZT4z (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 May 2020 15:56:55 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:51285 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390336AbgEZT4y (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 May 2020 15:56:54 -0400
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 9D96FC0006;
        Tue, 26 May 2020 19:56:52 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RESEND v5 15/21] dt-bindings: mtd: Deprecate hw_syndrome from the ECC modes
Date:   Tue, 26 May 2020 21:56:27 +0200
Message-Id: <20200526195633.11543-16-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200526195633.11543-1-miquel.raynal@bootlin.com>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This mode should not be used anymore, it is actually a mix between a
mode and a placement.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/nand-controller.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index 35512f2c66fa..a35ff8227427 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -49,12 +49,14 @@ patternProperties:
       nand-ecc-mode:
         allOf:
           - $ref: /schemas/types.yaml#/definitions/string
-          - enum: [ none, soft, hw, hw_syndrome, on-die ]
+          - enum: [ none, soft, hw, on-die ]
         description:
           Desired ECC engine, either hardware (most of the time
           embedded in the NAND controller) or software correction
           (Linux will handle the calculations). soft_bch is deprecated
           and should be replaced by soft and nand-ecc-algo.
+	  hw_syndrome is deprecated and should be
+          replaced by hw and nand-ecc-placement.
 
       nand-ecc-placement:
         allOf:
-- 
2.20.1

