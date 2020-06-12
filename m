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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66708C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4170920792
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9aGLM5m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgFLOUC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgFLOUB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:20:01 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408EEC08C5C1;
        Fri, 12 Jun 2020 07:20:01 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id c71so8312140wmd.5;
        Fri, 12 Jun 2020 07:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kvLn4M8+aAsWFD95lUcwx50IshPDg1nLpUjYfKYzjmM=;
        b=d9aGLM5mNVzKLrVCfUZFyqz/O9XQ+xbj6pq15famxMfFbZv+O5DK4CLs0tP4BuB5p/
         z+RdAksQ7VtZsJ+458xDn61e8gr11f/wRDzydI733nIm2ncKXrcmyMgMwiiFDD5BwojO
         BOGtquYQD91JC8HfJVbcZbR3sPrqcH/Y/AvbnrAjStYnZx4W4+jg2lLLhASd0KmIOG7X
         wGnc6PqmIBQ7viMnwqQzWeBXGuabEZ6SEwDx/akpqAu3D3sN/8Nb9zoFWnbuPUlv9S/F
         jA2O/Ti0WCGbd3Wk0/EnNKVsAfiIMRKtDjSRcagyQTATM0DzIargMUcHiK2SLApECk+q
         zrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kvLn4M8+aAsWFD95lUcwx50IshPDg1nLpUjYfKYzjmM=;
        b=m8KIDEVdPjFChIts+k+mCsohCav/njUNYv6T8LVh0bvokVbLNr0iHSKQQWmDjPDGjQ
         2XcULXgLB0PEKYzpJMKjaZuzVyKNKe8mgHmRwmqG3DseqqwOpKRpBSm43Wevvy/5ugvh
         ozwjwRO7eRRSGnxZ6sClnWVeFKGhUhUVdZZrnrGXZtN3oFazvBdh9utzbOg+M+VsU+pn
         fLvZiBFsBKPhMNbLWtirRLDUXY51fnfpi0sJzuTtpX3y6UOvSmOtewMVQevtImdZpu9I
         wnZjpmMUrHetrga7mWU/AINjRmnlzIyvad49HeAiLBgjs+XhPgLRffEjIeb06YNNfo7j
         zU7g==
X-Gm-Message-State: AOAM5329NMGCALto5crKdBpW4KXDf7XTYFo8Bc84B7pdqD2rER1vH3pa
        U/hss8A0Njo2hLGVGssDncg=
X-Google-Smtp-Source: ABdhPJx6raGq2Tq3wjQ+B9PzeD1DiIuZk2HvjWpmiaA/SotTnQdDCxhm7Uj4vrsYyqeFPKJkgRSDHw==
X-Received: by 2002:a1c:4487:: with SMTP id r129mr13379201wma.14.1591971599856;
        Fri, 12 Jun 2020 07:19:59 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id q13sm10354908wrn.84.2020.06.12.07.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:58 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 25/38] dt-bindings: gpio: tegra: Convert to json-schema
Date:   Fri, 12 Jun 2020 16:18:50 +0200
Message-Id: <20200612141903.2391044-26-thierry.reding@gmail.com>
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

Convert the NVIDIA Tegra GPIO controller device tree bindings from
free-form text format to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/gpio/nvidia,tegra20-gpio.txt     |  40 -------
 .../bindings/gpio/nvidia,tegra20-gpio.yaml    | 111 ++++++++++++++++++
 2 files changed, 111 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.txt b/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.txt
deleted file mode 100644
index 023c9526e5f8..000000000000
--- a/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-NVIDIA Tegra GPIO controller
-
-Required properties:
-- compatible : "nvidia,tegra<chip>-gpio"
-- reg : Physical base address and length of the controller's registers.
-- interrupts : The interrupt outputs from the controller. For Tegra20,
-  there should be 7 interrupts specified, and for Tegra30, there should
-  be 8 interrupts specified.
-- #gpio-cells : Should be two. The first cell is the pin number and the
-  second cell is used to specify optional parameters:
-  - bit 0 specifies polarity (0 for normal, 1 for inverted)
-- gpio-controller : Marks the device node as a GPIO controller.
-- #interrupt-cells : Should be 2.
-  The first cell is the GPIO number.
-  The second cell is used to specify flags:
-    bits[3:0] trigger type and level flags:
-      1 = low-to-high edge triggered.
-      2 = high-to-low edge triggered.
-      4 = active high level-sensitive.
-      8 = active low level-sensitive.
-      Valid combinations are 1, 2, 3, 4, 8.
-- interrupt-controller : Marks the device node as an interrupt controller.
-
-Example:
-
-gpio: gpio@6000d000 {
-	compatible = "nvidia,tegra20-gpio";
-	reg = < 0x6000d000 0x1000 >;
-	interrupts = < 0 32 0x04
-		       0 33 0x04
-		       0 34 0x04
-		       0 35 0x04
-		       0 55 0x04
-		       0 87 0x04
-		       0 89 0x04 >;
-	#gpio-cells = <2>;
-	gpio-controller;
-	#interrupt-cells = <2>;
-	interrupt-controller;
-};
diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
new file mode 100644
index 000000000000..b2debdb0caff
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/nvidia,tegra20-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra GPIO Controller (Tegra20 - Tegra210)
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: nvidia,tegra20-gpio
+      - const: nvidia,tegra30-gpio
+      - items:
+          - enum:
+              - nvidia,tegra114-gpio
+              - nvidia,tegra124-gpio
+              - nvidia,tegra210-gpio
+          - const: nvidia,tegra30-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: The interrupt outputs from the controller. For Tegra20,
+      there should be 7 interrupts specified, and for Tegra30, there should
+      be 8 interrupts specified.
+
+  "#gpio-cells":
+    description: The first cell is the pin number and the second cell is used
+      to specify the GPIO polarity (0 = active high, 1 = active low).
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    const: 2
+
+  gpio-controller:
+    description: Marks the device node as a GPIO controller.
+    type: boolean
+
+  "#interrupt-cells":
+    description: |
+      Should be 2. The first cell is the GPIO number. The second cell is
+      used to specify flags:
+
+        bits[3:0] trigger type and level flags:
+          1 = low-to-high edge triggered.
+          2 = high-to-low edge triggered.
+          4 = active high level-sensitive.
+          8 = active low level-sensitive.
+
+      Valid combinations are 1, 2, 3, 4, 8.
+    const: 2
+
+  interrupt-controller:
+    description: Marks the device node as an interrupt controller.
+
+patternProperties:
+  # GPIO hogs; /schemas/gpio/gpio-hog.yaml will match
+  "^gpios(-[a-zA-Z0-9-]+)?$":
+    type: object
+    required:
+      - gpio-hog
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra30-gpio
+    then:
+      properties:
+        interrupts:
+          minItems: 8
+          maxItems: 8
+    else:
+      properties:
+        interrupts:
+          minItems: 7
+          maxItems: 7
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#gpio-cells"
+  - gpio-controller
+  - "#interrupt-cells"
+  - interrupt-controller
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    gpio: gpio@6000d000 {
+        compatible = "nvidia,tegra20-gpio";
+        reg = <0x6000d000 0x1000>;
+        interrupts = <0 32 0x04>,
+                     <0 33 0x04>,
+                     <0 34 0x04>,
+                     <0 35 0x04>,
+                     <0 55 0x04>,
+                     <0 87 0x04>,
+                     <0 89 0x04>;
+        #gpio-cells = <2>;
+        gpio-controller;
+        #interrupt-cells = <2>;
+        interrupt-controller;
+    };
-- 
2.24.1

