Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F70BC35DF5
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 08:46:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 359DA218AC
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 08:46:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NP+H95Zj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729873AbgBYIqj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 03:46:39 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41787 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729833AbgBYIqj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 03:46:39 -0500
Received: by mail-lf1-f66.google.com with SMTP id y17so6004034lfe.8
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 00:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ubg6olmJMqdVTpYL65E40hx7xy57FQo+rprVmqlOQCs=;
        b=NP+H95ZjUTnZZ5meLfPETMlsmHirOBmKcWM8Vd1G9JfIj5PGlUscOMOLtBr7YwYO7h
         9wij/TqPWW4W+uupPTFxRZu95hmKsTMbzIVo1Sew9z5IsRIuWIfzMiE6NUsMraHJGMPp
         J36Ih30V6fuip4P1ikPSVl1L1rbsJFmdz24i7u3sCUvEkY4k0TN9tWq8yHqab4ohjw5x
         lnBD62d+smENtpjy1QOiSaJz0azx1GnY6iIRbUaAszRSxb3h7adadCR1enbymt36IYvK
         W+MUdS+Eo201pEFkp0CAq1f+uQLkRGIfdI+dPL/2z5uJcgNlyexocT1UKIQu49NPxaX0
         pn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ubg6olmJMqdVTpYL65E40hx7xy57FQo+rprVmqlOQCs=;
        b=cNrwPQxVi+nFmO2HVFfsOSn4t1pIBOwQwTqXLguq88CvHq23EODZ7lG/cMa48YaQMt
         XIv+UDQTXyaRT2xw+343gbnNfvgqk62qqnaR9sntzhE1phpakoutKJ98jlKia3npeAEx
         +BoEPijgmXh894p6KuLdEyCSP6lCypIVsviws/63UUWJUMwg6KpHTQwJ5UrIKaRPbDAZ
         gf6GloRD4YwYsm/nBb+NJgH4V9QqYBB0ouo9fQkGRBiTT+9wis/KkPdcBRpa1Mtaipf3
         B127ztgjj/9KKSMLO+EDDL+ls45HiD/P9nJ0nP7CzxBLaxud3/uoIEU8oSlwY1cakVC4
         z80w==
X-Gm-Message-State: APjAAAX92Qr2E8QKOr41skvhmrbDav5iIQKmWyDoIcrFsIkoN7DCh7d4
        26anzN/r2WWaieUKoiOc0bmr5Q==
X-Google-Smtp-Source: APXvYqySuaR/AekCRD9dArqqwZ9xYvTiuFqEHUQngyC/i1rlF79FIA0LgVS9cHAsVgGKBrNVtGvsSA==
X-Received: by 2002:a05:6512:3189:: with SMTP id i9mr11242585lfe.60.1582620397267;
        Tue, 25 Feb 2020 00:46:37 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id e8sm8957251ljb.45.2020.02.25.00.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 00:46:36 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 1/5 v2] dt-bindings: arm: Add Integrator YAML schema
Date:   Tue, 25 Feb 2020 09:46:23 +0100
Message-Id: <20200225084627.24825-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This implements the top-level schema for the ARM Integrator
platforms.

Cc: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Collapse the compatible three items with two const in each to an
  enum with three possible values and a const syscon
- Add reg with maxItems: 1 for syscon
- Add reg as a required property of syscon
- Make syscon a patternProperty and make sure it has a unit address
- Add reg with maxItems: 1 for the core module
- Require core module to be @10000000 and have all three compatibles.
---
 .../bindings/arm/arm,integrator.yaml          | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,integrator.yaml

diff --git a/Documentation/devicetree/bindings/arm/arm,integrator.yaml b/Documentation/devicetree/bindings/arm/arm,integrator.yaml
new file mode 100644
index 000000000000..2690491c1294
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,integrator.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,integrator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Integrator Boards Device Tree Bindings
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |+
+  These were the first ARM platforms officially supported by ARM Ltd.
+  They are ARMv4, ARMv5 and ARMv6-capable using different core tiles,
+  so the system is modular and can host a variety of CPU tiles called
+  "core tiles" and referred to in the device tree as "core modules".
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: ARM Integrator Application Platform, this board has a PCI
+          host and several PCI slots, as well as a number of slots for logical
+          expansion modules, it is referred to as an "ASIC Development
+          Motherboard" and is extended with custom FPGA and is intended for
+          rapid prototyping. See ARM DUI 0098B. This board can physically come
+          pre-packaged in a PC Tower form factor called Integrator/PP1 or a
+          special metal fixture called Integrator/PP2, see ARM DUI 0169A.
+        items:
+          - const: arm,integrator-ap
+      - description: ARM Integrator Compact Platform (HBI-0086), this board has
+          a compact form factor and mainly consists of the bare minimum
+          peripherals to make use of the core module. See ARM DUI 0159B.
+        items:
+          - const: arm,integrator-cp
+      - description: ARM Integrator Standard Development Board (SDB) Platform,
+          this board is a PCI-based board conforming to the Microsoft SDB
+          (HARP) specification. See ARM DUI 0099A.
+        items:
+          - const: arm,integrator-sp
+
+  core-module@10000000:
+    type: object
+    description: the root node in the Integrator platforms must contain
+      a core module child node. They are always at physical address
+      0x10000000 in all the Integrator variants.
+    properties:
+      compatible:
+        items:
+          - const: arm,core-module-integrator
+          - const: syscon
+          - const: simple-mfd
+      reg:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+
+patternProperties:
+  "^syscon@[0-9a-f]+$":
+    description: All Integrator boards must provide a system controller as a
+      node in the root of the device tree.
+    type: object
+    properties:
+      compatible:
+        items:
+          - enum:
+            - arm,integrator-ap-syscon
+            - arm,integrator-cp-syscon
+            - arm,integrator-sp-syscon
+          - const: syscon
+      reg:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+
+
+required:
+  - compatible
+  - syscon
+  - core-module@10000000
+
+...
-- 
2.24.1

