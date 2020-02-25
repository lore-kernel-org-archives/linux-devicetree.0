Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A8FC35DF5
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 08:46:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D4A7321556
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 08:46:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KC3uMZlA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729468AbgBYIqq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 03:46:46 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35314 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729833AbgBYIqq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 03:46:46 -0500
Received: by mail-lj1-f196.google.com with SMTP id q8so13082979ljb.2
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 00:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nNO8GJv1hLizdRXyJZlevP6hX+1iXNRVF6va0VRun+Q=;
        b=KC3uMZlA4HzC2PL1Lc9kk2K80ugdEpNIZWqjvaP3C5sZfqy0mwUop+q2qWqQEHyTZj
         hCx6YZQfuISHe/ggH/3KT0xkJ3DyCrzo6WKWSpA93Z4zI3UQgC2Xvc44H/0pCKyIjhUt
         ThC4awyt7b67lzpWrxdG+r6nAJaMDT4iz7rWIewbTO7j1yLVBieqnN1oIf4UXnuj6XE2
         2N+KCqDZVKhurcyve1wQYt+/jVzyGfm0Owpmr34QiwRpCNs4BRTDJrNhnGZ/qh0xXGsY
         UWEa8bzy9jgymjVXgDOytCvSxIb9MX4ie771qWWJJqalmlKk+5PPTsHNifb+FC3+sJsd
         jEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nNO8GJv1hLizdRXyJZlevP6hX+1iXNRVF6va0VRun+Q=;
        b=WA1DM0GpkPQl9ej1P7Pjkc6cNYh3zKdIGXn468vMnxrERGC2W35htMYZmlEDmIfLo1
         G/vZFJ17zx3s6PeTwwp1j9jAX2Yuk88WLWRw8YoYf4joYIJ7V76Rbwnar/2kHkgGqtuI
         jQj5jLLor/M2C7XmTKzDI1oZ+0Zrj3FhkPmLR8JdKf0n56sIJY5lp7uC/S3cX8Q5GVeK
         Q8grOQZryHaqtTHPvPbtaM5H5m8JXMNz9RzNJLSgxHNSyX1P5+4d7zQ7Kz9yXPO43ngX
         FR8bF9+nVBcUsXYMsuahj+TnrrKaLcxm2BXiggqy9bhHXpUmvWH5fidwndjBHBWlcNVM
         G2Kw==
X-Gm-Message-State: APjAAAXKKFBE9FUJEy0Xq3GRZyBdHEQZEUxpVJAbKXqLSdNSTOI0yBkg
        tHsgWLERCXxMQukpt2xvs7neLQ==
X-Google-Smtp-Source: APXvYqz7T6ZyytEEzYn7klrRA8CbhlrntjLlUXLPLPoUsOer1l0hKR/TDFlnySybtJb9fmUe9d517A==
X-Received: by 2002:a2e:7812:: with SMTP id t18mr34598683ljc.289.1582620403548;
        Tue, 25 Feb 2020 00:46:43 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id e8sm8957251ljb.45.2020.02.25.00.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 00:46:42 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 3/5 v2] dt-bindings: arm: Add RealView YAML schema
Date:   Tue, 25 Feb 2020 09:46:25 +0100
Message-Id: <20200225084627.24825-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200225084627.24825-1-linus.walleij@linaro.org>
References: <20200225084627.24825-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This implements the top-level schema for the ARM RealView
platforms.

Cc: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- No changes
---
 .../devicetree/bindings/arm/arm,realview.yaml | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,realview.yaml

diff --git a/Documentation/devicetree/bindings/arm/arm,realview.yaml b/Documentation/devicetree/bindings/arm/arm,realview.yaml
new file mode 100644
index 000000000000..d6e85d198afe
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,realview.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,realview.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM RealView Boards Device Tree Bindings
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |+
+  The ARM RealView series of reference designs were built to explore the ARM
+  11, Cortex A-8 and Cortex A-9 CPUs. This included new features compared to
+  the earlier CPUs such as TrustZone and multicore (MPCore).
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: ARM RealView Emulation Baseboard (HBI-0140) was created
+          as a generic platform to test different FPGA designs, and has
+          pluggable CPU modules, see ARM DUI 0303E.
+        items:
+          - const: arm,realview-eb
+      - description: ARM RealView Platform Baseboard for ARM1176JZF-S
+          (HBI-0147) was created as a development board to test ARM TrustZone,
+          CoreSight and Intelligent Energy Management (IEM) see ARM DUI 0425F.
+        items:
+          - const: arm,realview-pb1176
+      - description: ARM RealView Platform Baseboard for ARM 11 MPCore
+          (HBI-0159, HBI-0175 and HBI-0176) was created to showcase
+          multiprocessing with ARM11 using MPCore using symmetric
+          multiprocessing (SMP). See ARM DUI 0351E.
+        items:
+          - const: arm,realview-pb11mp
+      - description: ARM RealView Platform Baseboard for Cortex-A8 (HBI-0178,
+          HBI-0176 and HBI-0175) was the first reference platform for the
+          Cortex CPU family, including a Cortex-A8 test chip.
+        items:
+          - const: arm,realview-pba8
+      - description: ARM RealView Platform Baseboard Explore for Cortex-A9
+          (HBI-0182 and HBI-0183) was the reference platform for the Cortex-A9
+          CPU.
+        items:
+          - const: arm,realview-pbx
+
+  soc:
+    description: All RealView boards must provide a soc node in the root of the
+      device tree, representing the System-on-Chip since these test chips are
+      rather complex.
+    type: object
+    properties:
+      compatible:
+        oneOf:
+          - items:
+            - const: arm,realview-eb-soc
+            - const: simple-bus
+          - items:
+            - const: arm,realview-pb1176-soc
+            - const: simple-bus
+          - items:
+            - const: arm,realview-pb11mp-soc
+            - const: simple-bus
+          - items:
+            - const: arm,realview-pba8-soc
+            - const: simple-bus
+          - items:
+            - const: arm,realview-pbx-soc
+            - const: simple-bus
+
+    patternProperties:
+      "^.*syscon@[0-9a-f]+$":
+        type: object
+        description: All RealView boards must provide a syscon system controller
+          node inside the soc node.
+        properties:
+          compatible:
+            oneOf:
+              - items:
+                - const: arm,realview-eb11mp-revb-syscon
+                - const: arm,realview-eb-syscon
+                - const: syscon
+                - const: simple-mfd
+              - items:
+                - const: arm,realview-eb11mp-revc-syscon
+                - const: arm,realview-eb-syscon
+                - const: syscon
+                - const: simple-mfd
+              - items:
+                - const: arm,realview-eb-syscon
+                - const: syscon
+                - const: simple-mfd
+              - items:
+                - const: arm,realview-pb1176-syscon
+                - const: syscon
+                - const: simple-mfd
+              - items:
+                - const: arm,realview-pb11mp-syscon
+                - const: syscon
+                - const: simple-mfd
+              - items:
+                - const: arm,realview-pba8-syscon
+                - const: syscon
+                - const: simple-mfd
+              - items:
+                - const: arm,realview-pbx-syscon
+                - const: syscon
+                - const: simple-mfd
+
+        required:
+          - compatible
+          - reg
+
+    required:
+      - compatible
+
+required:
+  - compatible
+  - soc
+
+...
-- 
2.24.1

