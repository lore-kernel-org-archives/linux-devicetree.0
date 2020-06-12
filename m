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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5B5C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB98E20792
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEEkA23l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgFLOUV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgFLOUU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:20:20 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B48FEC03E96F;
        Fri, 12 Jun 2020 07:20:20 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id u13so8337200wml.1;
        Fri, 12 Jun 2020 07:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ae6DAEuQu0iWYpSDlGYW/NfenUrbN0uatgqjoThzENA=;
        b=lEEkA23lj5XGCS0MndzXbHsUID7gZwiH9W7inRrA03tK7F//LSOCf5lZv3FsCP6ztv
         qZuqaFmK8WkAIn8ylvU7QHr12vIbbXPvLMxNYWUAwFzsgyFQ4+Jt4ruoPlZw2qEV/tXU
         5JVM5H/6nvcHALa2gwuhdCdKspc/Q41/i8sZ3Pb/OPA2GDpFGyKF1tGWBX0hA/0VJTG+
         /RvMa9BNnQUahhAfd/PZzJ6Jl9HBRjEO7YIrK0l6GC+0lZ4j/IBoZDHlh0Sfz5sRgzqA
         AYpQ5UfWaWStqiGauCNvnuL2eAObUCYsDbJobdahcv/NS2crKWSWOWbFnYI/DXXpzjMP
         p+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ae6DAEuQu0iWYpSDlGYW/NfenUrbN0uatgqjoThzENA=;
        b=U9xhdAtN7akFd7Qs+UHGLxvBYgtF3pcUl2kTKNJVFkMDMg0qiL4Ne2zgrIkd4QxdLt
         1kQkNA5K/8akJi0gRyLihP6a0S6RqUE5b+6C3lsbWGmBMFYMVdWlusSJorAWofCAjvCJ
         DQa3ON/4Ba38dsBN61oDjpJ1kD7D+WBFKyDMNC0Wsi5gZvQLd6KR1E7NQj7ttcDaQiJ6
         qG9F5xF+qSm+yK+plF9rW3FLmFDKee7LipO2zZzrTi6PhJb3ROD9thZW3OsDDgKNOpCE
         zEF6YjVTFCfBqeqLbGg6yGwEVvrY+DRSwBkhmWJRtPUOibHs0tTp2j2//eCijolzl9jo
         ru0g==
X-Gm-Message-State: AOAM530AiF1JjS/iO/HlnvNZLORh/2ju1qUcRY3N289tITfc8dXk5m3g
        43K4Ea07qyPCMzB0LHl9z/o=
X-Google-Smtp-Source: ABdhPJxrbpEqm+V5rIMZVU6anZQ/6uhHdMSaeMFTQqkBOCARjSbTzUonZSzBIJwWy8r9JF2kIBvdnw==
X-Received: by 2002:a1c:28c5:: with SMTP id o188mr13123546wmo.62.1591971619487;
        Fri, 12 Jun 2020 07:20:19 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g18sm9770659wme.17.2020.06.12.07.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:20:18 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 35/38] dt-bindings: memory: Update Tegra210 EMC bindings
Date:   Fri, 12 Jun 2020 16:19:00 +0200
Message-Id: <20200612141903.2391044-36-thierry.reding@gmail.com>
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

The Tegra210 EMC is a cooling device because it can throttle the EMC
frequency if the chip gets too hot. The device tree node therefore needs
to contain the "#cooling-cells" property. Furthermore, multiple reserved
memory regions can now be attached to the EMC device tree node, and the
new memory-region-names property can be used to differentiate between
them.

While at it, update the example to make it more fully-featured.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../nvidia,tegra210-emc.yaml                  | 34 ++++++++++++++-----
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
index 49ab09252e52..4e8f659f1a7c 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
@@ -34,16 +34,25 @@ properties:
       - description: EMC general interrupt
 
   memory-region:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description:
-      phandle to a reserved memory region describing the table of EMC
-      frequencies trained by the firmware
+    description: List of phandles to reserved memory regions describing the
+      nominal and derated tables of EMC frequencies trained by the firmware.
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  memory-region-names:
+    $ref: "/schemas/types.yaml#/definitions/string-array"
+    items:
+      - const: nominal
+      - const: derated
 
   nvidia,memory-controller:
-    $ref: /schemas/types.yaml#/definitions/phandle
+    $ref: "/schemas/types.yaml#/definitions/phandle"
     description:
       phandle of the memory controller node
 
+  "#cooling-cells":
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    const: 2
+
 required:
   - compatible
   - reg
@@ -51,7 +60,10 @@ required:
   - clock-names
   - nvidia,memory-controller
 
-additionalProperties: false
+dependencies:
+  memory-region-names: [ memory-region ]
+
+unevaluatedProperties: false
 
 examples:
   - |
@@ -63,10 +75,15 @@ examples:
         #size-cells = <1>;
         ranges;
 
-        emc_table: emc-table@83400000 {
+        nominal: emc-table@83400000 {
             compatible = "nvidia,tegra210-emc-table";
             reg = <0x83400000 0x10000>;
         };
+
+        derated: emc-table@83410000 {
+            compatible = "nvidia,tegar210-emc-table";
+            reg = <0x83410000 0x10000>;
+        };
     };
 
     external-memory-controller@7001b000 {
@@ -77,6 +94,7 @@ examples:
         clocks = <&tegra_car TEGRA210_CLK_EMC>;
         clock-names = "emc";
         interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
-        memory-region = <&emc_table>;
+        memory-region-names = "nominal", "derated";
+        memory-region = <&nominal>, <&derated>;
         nvidia,memory-controller = <&mc>;
     };
-- 
2.24.1

