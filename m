Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E83C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 00:25:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88A71208DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 00:25:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438066AbgE2AZ0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 20:25:26 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:49031 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437929AbgE2AZZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 20:25:25 -0400
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9C344200004;
        Fri, 29 May 2020 00:25:22 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Chuanhong Guo <gch981213@gmail.com>,
        Weijie Gao <weijie.gao@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Mason Yang <masonccyang@mxic.com.tw>,
        Julien Su <juliensu@mxic.com.tw>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v7 01/20] dt-bindings: mtd: Document nand-ecc-placement
Date:   Fri, 29 May 2020 02:24:58 +0200
Message-Id: <20200529002517.3546-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529002517.3546-1-miquel.raynal@bootlin.com>
References: <20200529002517.3546-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This optional property defines where the ECC bytes are expected to be
stored. No value defaults to an unknown location, while these
locations can be explicitly set to OOB or interleaved depending if
the ECC bytes are entirely stored in the OOB area or mixed with
regular data in the main area (also sometimes referred as
"syndrome").

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 .../devicetree/bindings/mtd/nand-controller.yaml       | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index d261b7096c69..4a0798247d2d 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -56,6 +56,16 @@ patternProperties:
           (Linux will handle the calculations). soft_bch is deprecated
           and should be replaced by soft and nand-ecc-algo.
 
+      nand-ecc-placement:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/string
+          - enum: [ oob, interleaved ]
+        description:
+          Location of the ECC bytes. This location is unknown by default
+          but can be explicitly set to "oob", if all ECC bytes are
+          known to be stored in the OOB area, or "interleaved" if ECC
+          bytes will be interleaved with regular data in the main area.
+
       nand-ecc-algo:
         allOf:
           - $ref: /schemas/types.yaml#/definitions/string
-- 
2.20.1

