Return-Path: <SRS0=az0Z=AC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BEFC433F2
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 00:48:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87B672477B
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 00:48:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qtB3Ee6X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729097AbgFUAsL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 20 Jun 2020 20:48:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60972 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729087AbgFUAsJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 20 Jun 2020 20:48:09 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32E2C532;
        Sun, 21 Jun 2020 02:48:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592700485;
        bh=x1qwEsYa9TpzZ3jxVEYrdT2VvcD4ES6ffAolj8MmeqY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qtB3Ee6X9zOTt21KJnwGgigCzH01hRSJbIYTM4AvS/tF/q959RIj35J+IZeJ83Niy
         84UMJY4wsaMf9HjfCZEopuKS4FLfquurxgaW95MxLxJCdADqyiMOIyqmJMNYa0+J3j
         czBaBHCSHRdDueax1IseNyH5Ob9sTAL3+UqyYJ9c=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 6/8] dt-bindings: media: renesas,fdp1: Add resets property
Date:   Sun, 21 Jun 2020 03:47:32 +0300
Message-Id: <20200621004734.28602-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The resets property is used in DT sources in the kernel tree. Document
it and make it mandatory.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes since v1:

- Fix typo in commit message
---
 Documentation/devicetree/bindings/media/renesas,fdp1.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fdp1.yaml b/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
index 39184bd21a27..2a27a7296fea 100644
--- a/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
@@ -32,6 +32,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   renesas,fcp:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -44,6 +47,7 @@ required:
   - interrupts
   - clocks
   - power-domains
+  - resets
 
 additionalProperties: false
 
@@ -59,6 +63,7 @@ examples:
         interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&cpg CPG_MOD 119>;
         power-domains = <&sysc R8A7795_PD_A3VP>;
+        resets = <&cpg 119>;
         renesas,fcp = <&fcpf0>;
     };
 ...
-- 
Regards,

Laurent Pinchart

