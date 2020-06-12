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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA908C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B1CA2067B
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g02TafCC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgFLOTl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbgFLOTk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:19:40 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F587C03E96F;
        Fri, 12 Jun 2020 07:19:40 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id l11so9939682wru.0;
        Fri, 12 Jun 2020 07:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LNbea/2DnJIRBTvvJT/BbgIJ3P+ID5t9wSPTu5RUL5E=;
        b=g02TafCCFSU+dL7XjBqlirLEV4dKWkDdupkuYzBVJHmX5ksY46ALG4A7v5ZqwtLex6
         bv6SxcPfWD1Sr4aBTKubhFzNCybY9Kq0ympLiGxPwX08lZamMTZrR+dIxHojwrh0C//D
         2SiCwjEFm4wllWCytb1j8+PiU5m9zxaFhREllOneWMzMfYVoSM6QfV/l8NF9i7z81TUd
         ix4hb4JHtzcM2lxfiTYS+DoST4+GXIlhPreCtbzFDSC4mhmB/pLQRWO/K2YK0d5fUbJW
         7fMtr2bedXFefQxFNYYAXLYL9ZHdrL0uZS6UnjikS37/A3PBSPD/9sZd+7ERQ/MFIJ2n
         K9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LNbea/2DnJIRBTvvJT/BbgIJ3P+ID5t9wSPTu5RUL5E=;
        b=ihyY1W/c3ebHWOG7HxhkU4oM/NMFm/KZ5MVyEZe90cIl0xzRJoYoNdxawq0sr8pdDN
         tfX0MDEZeCYTi1rB7lUDQJaRWYEZNdzF+rhZRaOLrBt9hW5rNRrhE0dqswBAHYJqB/2X
         r9y7VUe5AjnR23E3JNzjSDlilGaJG61a5lS8dWXQpeqc7bvCOBTMX78oDJrXqnR6AY2d
         GzvdS5+yScbI5RMOpTVT7u4j/Gv2CD2RRZW2nEMtT84g3qIYIEg3smIa5v0EVTj+q3ac
         S/vr2DrmXbmQSi+2RDOclkkvjk9MQjNQ17lJfzz/j72yT+TFRnkIASjgKcT4n3xPRsmS
         JZug==
X-Gm-Message-State: AOAM531o9dGYtXbk6cHOnQbgfL4by1M6UjYdBQmBTBetBU5p1IXM58x4
        aUZkI6LNR3QWwZmQS/oSjjI=
X-Google-Smtp-Source: ABdhPJxBAAuwl+C4X94b7zggGcCxuQPJYuCr4RK/9moexWnShX4qUj9n8vRoxtrUqvPXq8YksTcDRw==
X-Received: by 2002:a5d:6b8c:: with SMTP id n12mr15283613wrx.61.1591971579354;
        Fri, 12 Jun 2020 07:19:39 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id y17sm10587432wrn.12.2020.06.12.07.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:38 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 15/38] dt-bindings: sound: tegra: hda: Convert to json-schema
Date:   Fri, 12 Jun 2020 16:18:40 +0200
Message-Id: <20200612141903.2391044-16-thierry.reding@gmail.com>
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

Convert the Tegra HDA controller bindings from the free-form text format
to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/sound/nvidia,tegra30-hda.txt     |  35 -----
 .../bindings/sound/nvidia,tegra30-hda.yaml    | 128 ++++++++++++++++++
 2 files changed, 128 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
deleted file mode 100644
index 21cd310963b1..000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-NVIDIA Tegra30 HDA controller
-
-Required properties:
-- compatible : For Tegra30, must contain "nvidia,tegra30-hda".  Otherwise,
-  must contain '"nvidia,<chip>-hda", "nvidia,tegra30-hda"', where <chip> is
-  tegra114, tegra124, or tegra132.
-- reg : Should contain the HDA registers location and length.
-- interrupts : The interrupt from the HDA controller.
-- clocks : Must contain an entry for each required entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries: hda, hda2hdmi, hda2codec_2x
-- resets : Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names : Must include the following entries: hda, hda2hdmi, hda2codec_2x
-
-Optional properties:
-- nvidia,model : The user-visible name of this sound complex. Since the property
-  is optional, legacy boards can use default name provided in hda driver.
-
-Example:
-
-hda@70030000 {
-	compatible = "nvidia,tegra124-hda", "nvidia,tegra30-hda";
-	reg = <0x0 0x70030000 0x0 0x10000>;
-	interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&tegra_car TEGRA124_CLK_HDA>,
-		 <&tegra_car TEGRA124_CLK_HDA2HDMI>,
-		 <&tegra_car TEGRA124_CLK_HDA2CODEC_2X>;
-	clock-names = "hda", "hda2hdmi", "hda2codec_2x";
-	resets = <&tegra_car 125>, /* hda */
-		 <&tegra_car 128>, /* hda2hdmi */
-		 <&tegra_car 111>; /* hda2codec_2x */
-	reset-names = "hda", "hda2hdmi", "hda2codec_2x";
-	nvidia,model = "jetson-tk1-hda";
-};
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
new file mode 100644
index 000000000000..ea8e39934945
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra30 HDA controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@nvidia.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    oneOf:
+      - description: NVIDIA Tegra30
+        const: nvidia,tegra30-hda
+
+      - description: NVIDIA Tegra114
+        items:
+          - const: nvidia,tegra114-hda
+          - const: nvidia,tegra30-hda
+
+      - description: NVIDIA Tegra124
+        items:
+          - const: nvidia,tegra124-hda
+          - const: nvidia,tegra30-hda
+
+      - description: NVIDIA Tegra132
+        items:
+          - const: nvidia,tegra132-hda
+          - const: nvidia,tegra124-hda
+          - const: nvidia,tegra30-hda
+
+      - description: NVIDIA Tegra210
+        items:
+          - const: nvidia,tegra210-hda
+          - const: nvidia,tegra30-hda
+
+      - description: NVIDIA Tegra186
+        items:
+          - const: nvidia,tegra186-hda
+          - const: nvidia,tegra30-hda
+
+      - description: NVIDIA Tegra194
+        items:
+          - const: nvidia,tegra194-hda
+          - const: nvidia,tegra30-hda
+
+  reg:
+    description: base address and size of the register region for the HDA
+      controller
+
+  interrupts:
+    description: interrupt from the HDA controller
+
+  clocks:
+    items:
+      - description: The main HDA controller clock
+      - description: The clock for the logic feeding data from HDA to HDMI.
+      - description: The clock for the logic feeding data from HDA to codec.
+
+  clock-names:
+    contains:
+      enum:
+        - hda
+        - hda2hdmi
+        - hda2codec_2x
+
+  resets:
+    items:
+      - description: Reset for the HDA controller.
+      - description: Reset for the HDA to HDMI logic.
+      - description: Reset for the HDA to codec logic.
+
+  reset-names:
+    contains:
+      enum:
+        - hda
+        - hda2hdmi
+        - hda2codec_2x
+
+  power-domains:
+    description: A list of PM domain specifiers that reference each
+      power-domain used by the xHCI controller. This list must comprise
+      of a specifier for the XUSBA and XUSBC power-domains. See
+      ../power/power_domain.txt and ../arm/tegra/nvidia,tegra20-pmc.txt
+      for details.
+
+  iommus:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  nvidia,model:
+    description: The user-visible name of this sound complex. Since the
+      property is optional, legacy boards can use default name provided in HDA
+      driver.
+    $ref: "/schemas/types.yaml#/definitions/string"
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/tegra124-car.h>
+
+    hda@70030000 {
+        compatible = "nvidia,tegra124-hda", "nvidia,tegra30-hda";
+        reg = <0x0 0x70030000 0x0 0x10000>;
+        interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA124_CLK_HDA>,
+                 <&tegra_car TEGRA124_CLK_HDA2HDMI>,
+                 <&tegra_car TEGRA124_CLK_HDA2CODEC_2X>;
+        clock-names = "hda", "hda2hdmi", "hda2codec_2x";
+        resets = <&tegra_car 125>, /* hda */
+                 <&tegra_car 128>, /* hda2hdmi */
+                 <&tegra_car 111>; /* hda2codec_2x */
+        reset-names = "hda", "hda2hdmi", "hda2codec_2x";
+        nvidia,model = "jetson-tk1-hda";
+    };
-- 
2.24.1

