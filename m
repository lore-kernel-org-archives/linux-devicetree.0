Return-Path: <SRS0=az0Z=AC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223B8C433E7
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 00:48:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5D7824768
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 00:48:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VQfojGw1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729081AbgFUAsI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 20 Jun 2020 20:48:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60982 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729071AbgFUAsH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 20 Jun 2020 20:48:07 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 909CE594;
        Sun, 21 Jun 2020 02:48:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592700483;
        bh=YMtD6wOIip3YKV0hcQV51wfPJsDU/xc/A1PPGNL2Eaw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VQfojGw1++imUeWLxcqx0bQj7dW/CviLjAKiWfQhxUSVm/FoJBgKi3Ucg2FGyM2Go
         kqIsJVvzIp22p5WQp/XuIgxcJ4h7OpklchZRtDI+D7O5r7AnWXct/aKEK1WOp4v1qL
         SNtTEoIySoGVwCo/Mkawz17DuPtoqx8Gz4bMxNpU=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 3/8] dt-bindings: media: renesas,fcp: Add resets and iommus properties
Date:   Sun, 21 Jun 2020 03:47:29 +0300
Message-Id: <20200621004734.28602-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The resets and iommus properties are used in DT sources in the kernel
tree. Document them, and make resets mandatory. The iommus property is
optional as not all platforms wire the FCP to a functional IOMMU.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/media/renesas,fcp.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index eeca7e255420..b6cf2958e6c9 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -31,14 +31,21 @@ properties:
   clocks:
     maxItems: 1
 
+  iommus:
+    maxItems: 1
+
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - clocks
   - power-domains
+  - resets
 
 additionalProperties: false
 
@@ -53,5 +60,7 @@ examples:
         reg = <0xfea2f000 0x200>;
         clocks = <&cpg CPG_MOD 602>;
         power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+        resets = <&cpg 602>;
+        iommus = <&ipmmu_vi0 9>;
     };
 ...
-- 
Regards,

Laurent Pinchart

