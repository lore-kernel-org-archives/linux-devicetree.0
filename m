Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C7AC352A4
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 09:27:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B4A4F21739
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 09:27:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l7uQesG6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbgBJJ1h (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 04:27:37 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46217 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbgBJJ1h (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 04:27:37 -0500
Received: by mail-lf1-f68.google.com with SMTP id z26so3622185lfg.13
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 01:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BjsYE7IwesPMmpyoWDFFmaPCx/RAfe1hi/tzhTSvSdg=;
        b=l7uQesG6M28SqAQiPO0DR6OQH5YRu7JpfAa5/C+Bk02mHPFeXFB/4gQTiDc7CRf/JV
         Co6nbjws7QBm14CGymRUqxWdw3lFnD4GnIy0rupegH1pA9zo3ozlcc6oSlwom2RfeSXs
         PDbFDZLY2BQZsvo3+CgcCsUNd84ZLKER1LT6p23rK5XFr9xea/dkN/pa42w3dnOqD//Z
         QBBvlMkh2pl8te1B3vaW39HaeLxo2XaU+Uz92E/su7EoD9iPrWpSanYtAWVo5C5r1Q/f
         BCl9QezSH6nMBCoQKIt5mSQzG996FDRJY6ew2/88xak5v9jzgT/cDdsT/nRmfR4rupBz
         faTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BjsYE7IwesPMmpyoWDFFmaPCx/RAfe1hi/tzhTSvSdg=;
        b=Fp4sSloppeOI6MaPdK+P6JQWLXKyvTbUsYEbrf2mC+7iWfPe5MSwG8tbwIUTG/R8S+
         azxg2uFUPJXcWHYGYbAeedHLzEoLwbOri1ixgxztmhXjKkf/zK5fBj7Wi//IDeG2039r
         XsCFmEsNsmgghSvuc4IlJRlRMbJLN/+QTOTPoMrkFiSmmnegznQA/wGa4vKoN0x9GN3Q
         gGhU/qARPjwsBX6L8waftngjN0CwDaUS7vz3ij6WLaT+/NVnd0gZNL5e6d2JyFg7wlV7
         dzMSwRkg+aIpzW5d0Ia8CYEr9u5RaKEss9y4SMmuO1fFNSKzDE+yfNBGGDSwoIGICSyp
         k9Ow==
X-Gm-Message-State: APjAAAVdMvmTGB5bp8tjqhzQLfE0fzFaZG0utnWv6jQutsQK56wGYi8L
        qE1bvMepkv9h/1jjKQ/yrmvQ9x7ZhnE=
X-Google-Smtp-Source: APXvYqxZpnyyWZKheyuaFsm0KonLKcLW4pxi4HBtcPnzMpiGrdOf5lVgPrYFRID8AvhcdlKw6rauYw==
X-Received: by 2002:a19:c3ce:: with SMTP id t197mr286769lff.174.1581326853563;
        Mon, 10 Feb 2020 01:27:33 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id d9sm5989882lja.73.2020.02.10.01.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 01:27:33 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 5/7] dt-bindings: arm: Add RealView YAML schema
Date:   Mon, 10 Feb 2020 10:27:11 +0100
Message-Id: <20200210092713.279105-6-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200210092713.279105-1-linus.walleij@linaro.org>
References: <20200210092713.279105-1-linus.walleij@linaro.org>
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
2.23.0

