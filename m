Return-Path: <SRS0=HSwc=3F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3297EC33CAF
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 23:12:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 025AC207FF
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 23:12:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389622AbgAPXMM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jan 2020 18:12:12 -0500
Received: from foss.arm.com ([217.140.110.172]:34078 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729336AbgAPXMM (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Jan 2020 18:12:12 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA9BF11FB;
        Thu, 16 Jan 2020 15:12:11 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 208A63F68E;
        Thu, 16 Jan 2020 15:12:10 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc:     linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Icenowy Zheng <icenowy@aosc.xyz>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        devicetree@vger.kernel.org
Subject: [PATCH v3 3/3] dt-bindings: spi: sunxi: Document new compatible strings
Date:   Thu, 16 Jan 2020 23:11:48 +0000
Message-Id: <20200116231148.1490-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20200116231148.1490-1-andre.przywara@arm.com>
References: <20200116231148.1490-1-andre.przywara@arm.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The Allwinner H6 SPI controller has advanced features over the H3
version, but remains compatible with it.
Document the usual "specific", "fallback" compatible string pair.
Also add the R40 version while at it.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml      | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index f36c46d236d7..c8ccbc2fd1e3 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -18,9 +18,14 @@ properties:
   "#size-cells": true
 
   compatible:
-    enum:
-      - allwinner,sun6i-a31-spi
-      - allwinner,sun8i-h3-spi
+    oneOf:
+      - const: allwinner,sun6i-a31-spi
+      - const: allwinner,sun8i-h3-spi
+      - items:
+        - enum:
+          - allwinner,sun8i-r40-spi
+          - allwinner,sun50i-h6-spi
+        - const: allwinner,sun8i-h3-spi
 
   reg:
     maxItems: 1
-- 
2.14.5

