Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABED5C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C69F2081A
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/OVzo8r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgFLOU2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:20:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgFLOU1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:20:27 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78323C03E96F;
        Fri, 12 Jun 2020 07:20:26 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id p5so9898750wrw.9;
        Fri, 12 Jun 2020 07:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jEblzHqXG0PiyjZlhQC9lr2hTzAJz0nty/o1pAmsRO4=;
        b=A/OVzo8rYg13I/WtADx2Blk9+OHnfjF/YI6ViT04x9ewHsF7SgDuwI2mIIh0Toj0Ya
         XfcEanizrjhUSXJ5JeLGKhF18fDPgt8e4a9xWzFtESVvgvIbsD3bTIboQgJZemzxmPN4
         lL0TAgcOL0NTGuRzUgaL9to3fyNSrsQvyKyDp6HWbzIu5v2Fxt3FZBsiZ05OZgZLtAtx
         xcSqEFrGl9bJkjA/W107k2ZX0AJtbS9+5Ka0mCAnxVAh077XqZE97dG8139SAvlL12Iv
         mHKmltHwmNrU1z4FteyvcszglBDqrVxXKohFm0m7hSnbL2l68EfT6QMMDz6TeTNMJ/vl
         KLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jEblzHqXG0PiyjZlhQC9lr2hTzAJz0nty/o1pAmsRO4=;
        b=Ra9jeYTKKI9RwtNRNU3qT2Ubshnunz9CB9f6WJ2he02DGegPsziNVPDnC/aVMX1wC3
         XdwowQXUByKLIO6VtQrwblRKqhWLi+e3FL/fQyc3MGlabUol4h6RGJkArkPxuZvFQEqj
         5v3TzztNRc9A5uqQINttMXR4nPOb14bIQH/7cDmW3ZwrLOIWr+tICeagxQtr6OxcOX0x
         PwthYVX9TovQLVZaEyi+d0hVGFOVkTpX2nP/dH7NG1gNR5pM6K/6OGTqhyjRHMIJgt22
         GKpbjHxDbFT4QlyYU/vT+Ddy0tJUnEg16XXdeMtvTdZ75I83QkcUcILibLSt+tyjLhcr
         mhYw==
X-Gm-Message-State: AOAM5320VyTESnWGMk6fgnLxdKo/eZLrpeS/SBdmz7TmgAfoCvTlhMWd
        zUWa+iJ+cfVlcgiVfKRTwVsUyo7A
X-Google-Smtp-Source: ABdhPJwhHJ9QfE5kJTjTSNQeEjkX6Bgvs9kR5W5jMwB1ZEO22ncL6dVH0kvosM3pNpR3hhCFKJwGsQ==
X-Received: by 2002:a5d:4f09:: with SMTP id c9mr15020614wru.3.1591971625220;
        Fri, 12 Jun 2020 07:20:25 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id n1sm10163494wrp.10.2020.06.12.07.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:20:24 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 38/38] dt-bindings: serial: Document Tegra-specific properties
Date:   Fri, 12 Jun 2020 16:19:03 +0200
Message-Id: <20200612141903.2391044-39-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200612141903.2391044-1-thierry.reding@gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Tegra the UART is described using additional properties, such as
clock-names, reset-names, dmas and dma-names. Document them in the
bindings so that Tegra device trees are properly validated.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/serial/8250.yaml      | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index c1d4c196f005..9c8fad27c3f3 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -28,6 +28,32 @@ allOf:
           const: 2
       required:
         - reg-shift
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-uart
+    then:
+      properties:
+        clock-names:
+          $ref: "/schemas/types.yaml#/definitions/string-array"
+          items:
+            - const: serial
+
+        dmas:
+          $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+        dma-names:
+          $ref: "/schemas/types.yaml#/definitions/string-array"
+          items:
+            - const: rx
+            - const: tx
+
+        reset-names:
+          $ref: "/schemas/types.yaml#/definitions/string-array"
+          items:
+            - const: serial
   - if:
       not:
         properties:
-- 
2.24.1

