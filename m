Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A9DC352A4
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 09:27:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8EA96214DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 09:27:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="llFDLP5P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgBJJ1d (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 04:27:33 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45095 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbgBJJ1d (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 04:27:33 -0500
Received: by mail-lj1-f195.google.com with SMTP id f25so6254165ljg.12
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 01:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kFLmtO0qC4EaVwrrh7e6Vy7NDWK/PC6a9SN2FOBadcg=;
        b=llFDLP5PXba6ytakgS+GATLFcR2XiettUpM9VuIsmtRN1KDHgz7FiuqPhhN55QFqPo
         ZNoaSbCkrNCtyK5rVmiGGoo0G9rtk+VeBzYPYCEAENyAvRUCtgH3h31Q9VLefU2VHhXx
         PTpYphtDHVz9LBNJi/zayDaz/TOJbRhAUHatni0uTEkM2we0Yn/rqLX7Xw1o8yvBCY0h
         kh7jwwSIKowH5nr3a5wR5QgjYQgHEt/H+eZtYVszOxERRW/rzvp5DDCu1Zfv8q4XgKYn
         VEcKWp+pU7cQGpSNimPaWyPq77bgsPSCc1We167QrVR7DxsHijMSub5zgj5zfwE2+kuI
         vjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kFLmtO0qC4EaVwrrh7e6Vy7NDWK/PC6a9SN2FOBadcg=;
        b=jq8QvROcmiUyPv7i7jwCGm1R0Dl3sLCiMfU5Ivoxq9P8E7p6+7UXZrJdHmRHkhxDAQ
         f61ETeyEyqTpnp9x7y3S3V2HMhC1P115CdndGmseBUvLwWUqtpVUaH2uLk52HgGNfm94
         MSiT5CLrNVvVapiLuAKfBFFznjnmNxzSsvsIFb3zCNHiuIgh0Z88o4qJLXxMf7le4zzV
         3vDli6Y5y9QjGo1o1umCdZcCg7EjfBis4YHWTavgEufsf9z+HbMbNo8XDQc8DA4zLTs/
         9pYaNT6E4hwiVfOMY6rgaTNST1RFdn9PM4Mje609OdzG26C6U9zQWk6Ugwr3lKpNPUq8
         fiLw==
X-Gm-Message-State: APjAAAVR1FgmVuX9VG7cRMLM+D5U+u+2hF4vnbmjLEzandGzjG5Bgnm0
        pQpvt0GeXaXg9fNxBl0NGW7JPiizx7U=
X-Google-Smtp-Source: APXvYqyU75R1YbtpR14fLyyJdEq9Jb+9J2i6jY+AOWmEwmycd6oAX99ys9OUonkjlzRZ46ED4WhDKw==
X-Received: by 2002:a2e:7812:: with SMTP id t18mr302226ljc.289.1581326849944;
        Mon, 10 Feb 2020 01:27:29 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id d9sm5989882lja.73.2020.02.10.01.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 01:27:29 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/7] dt-bindings: arm: Add Integrator YAML schema
Date:   Mon, 10 Feb 2020 10:27:09 +0100
Message-Id: <20200210092713.279105-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200210092713.279105-1-linus.walleij@linaro.org>
References: <20200210092713.279105-1-linus.walleij@linaro.org>
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
 .../bindings/arm/arm,integrator.yaml          | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,integrator.yaml

diff --git a/Documentation/devicetree/bindings/arm/arm,integrator.yaml b/Documentation/devicetree/bindings/arm/arm,integrator.yaml
new file mode 100644
index 000000000000..39aa3e31f934
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,integrator.yaml
@@ -0,0 +1,85 @@
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
+  syscon:
+    description: All Integrator boards must provide a system controller as a
+      node in the root of the device tree.
+    type: object
+    properties:
+      compatible:
+        oneOf:
+          - items:
+            - const: arm,integrator-ap-syscon
+            - const: syscon
+          - items:
+            - const: arm,integrator-cp-syscon
+            - const: syscon
+          - items:
+            - const: arm,integrator-sp-syscon
+            - const: syscon
+    required:
+      - compatible
+      - reg
+
+patternProperties:
+  "^core-module@[0-9a-f]+$":
+    type: object
+    description: the root node in the Integrator platforms must contain
+      a core module child node. They are always at physical address
+      0x10000000 in all the Integrator variants.
+    properties:
+      compatible:
+        contains:
+          const: arm,core-module-integrator
+        description: this node is the core module node, it can be compatible
+          with syscon and simple-bus as well
+
+    required:
+      - compatible
+      - reg
+
+required:
+  - compatible
+  - syscon
+  - core-module@10000000
+
+...
-- 
2.23.0

