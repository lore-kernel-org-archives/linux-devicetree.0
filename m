Return-Path: <SRS0=2gCm=5I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBAB3C54FCE
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 09:33:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB08D2074D
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 09:33:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbgCWJdK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Mar 2020 05:33:10 -0400
Received: from mx.socionext.com ([202.248.49.38]:5757 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727695AbgCWJdJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 23 Mar 2020 05:33:09 -0400
Received: from unknown (HELO kinkan-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 23 Mar 2020 18:33:08 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by kinkan-ex.css.socionext.com (Postfix) with ESMTP id 9CE87180BCB;
        Mon, 23 Mar 2020 18:33:08 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Mon, 23 Mar 2020 18:33:08 +0900
Received: from plum.e01.socionext.com (unknown [10.213.132.32])
        by kinkan.css.socionext.com (Postfix) with ESMTP id 2A4301A12AD;
        Mon, 23 Mar 2020 18:33:08 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH v3 1/6] dt-bindings: dma: uniphier-xdmac: Consolidate register region description
Date:   Mon, 23 Mar 2020 18:32:45 +0900
Message-Id: <1584955970-8162-2-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584955970-8162-1-git-send-email-hayashi.kunihiko@socionext.com>
References: <1584955970-8162-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The extension register region isn't currently referred from the driver, so
this consolidates the extension register region description into the base
register region, and spreads the region size in example.

Fixes: b9fb56b6ba8a ("dt-bindings: dmaengine: Add UniPhier external DMA controller bindings")
Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 Documentation/devicetree/bindings/dma/socionext,uniphier-xdmac.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/socionext,uniphier-xdmac.yaml b/Documentation/devicetree/bindings/dma/socionext,uniphier-xdmac.yaml
index 86cfb59..830cd88 100644
--- a/Documentation/devicetree/bindings/dma/socionext,uniphier-xdmac.yaml
+++ b/Documentation/devicetree/bindings/dma/socionext,uniphier-xdmac.yaml
@@ -23,8 +23,7 @@ properties:
 
   reg:
     items:
-      - description: XDMAC base register region (offset and length)
-      - description: XDMAC extension register region (offset and length)
+      - description: XDMAC register region (offset and length)
 
   interrupts:
     maxItems: 1
@@ -54,7 +53,7 @@ examples:
   - |
     xdmac: dma-controller@5fc10000 {
         compatible = "socionext,uniphier-xdmac";
-        reg = <0x5fc10000 0x1000>, <0x5fc20000 0x800>;
+        reg = <0x5fc10000 0x5100>;
         interrupts = <0 188 4>;
         #dma-cells = <2>;
         dma-channels = <16>;
-- 
2.7.4

