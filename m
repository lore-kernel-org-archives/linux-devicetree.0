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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF7FC433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2418E20835
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qCV1o/dl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgFLOTT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgFLOTT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:19:19 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10BEEC03E96F;
        Fri, 12 Jun 2020 07:19:18 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h5so9938849wrc.7;
        Fri, 12 Jun 2020 07:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nfLkJjIWFw8zyF5Ftj/WE+a97fqdfAoUD13TIRhm4QI=;
        b=qCV1o/dld/S12TSpsT8hgCtPu02soSI80hcXpJ5Bh3kEgeJFDxldwyPR3S8agtZ93H
         y52dGdwYUXhXqiyP6Q3iGuWd4U/KhP1opcSxwQFOMYoRK7l0yASTpDg854EinQGj+3UW
         pnVQF2ON0p5Wx74ggdLGVIMVgAQ/hqiWsyIgLPJxrL1vQdVItsqWCyQQKhkn9rb+rWtS
         RreEK444EqdrichUxTc9GGzI6VGErhmsxCHvwoznMuxKmZkwxbgJWjUTe6t6Sv9M7YL1
         dc7Fp2SMcoB1MoYKCwcUgiWdw0DkP8thfI8cufH6e0luu6VwkfhH+j+hGAYE+4j6UgC+
         uZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nfLkJjIWFw8zyF5Ftj/WE+a97fqdfAoUD13TIRhm4QI=;
        b=Bd9DeHsomBL7W/E1U87wbGnvhCHdm5E0UkyW8Xz2hfsoBWRe3Xheuwl50aZ9FRAgTf
         LeAjU95CeqykERwBBtOvapQlQK5KMtHtcBOPgEJykiiiiQFQbjPCiKVAGQ3/n09GA0t9
         IaVIK/kSYH1EduLhXz+MB0Vd8A/7aJwNc5DWzltco68k7s3DjfnBZ+do/ALM2kwCGUy0
         FWmvaeufHfdCh09XZR49eShJpY81UOs3/fsCq9H3KL4qYkvFpy/Pzrdvl8zcedJpdVlR
         wyOn0PGTMSqeeytisowzDYBOtBP2wrvjSXFW3fcT5esxRqGRATaQVbBi8cbIyjUfu0QS
         YB+g==
X-Gm-Message-State: AOAM530ds/AYTWd1xv+b51NBW4ygMpAq0gov4GBKqjbnPnBMB5/YB/bp
        YzGlGwP5GyORK0TlDnpA4kpXfYDg
X-Google-Smtp-Source: ABdhPJyvbE5AE8Jvd13v7h/bqnBUwzUkEiaRrUwz9el4eg32si+em3fn+Xx+T0kJNRQUG+NHrjZ3Lg==
X-Received: by 2002:adf:c385:: with SMTP id p5mr15569660wrf.409.1591971556625;
        Fri, 12 Jun 2020 07:19:16 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c81sm9579319wmd.42.2020.06.12.07.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:15 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 04/38] dt-bindings: firmware: Convert Tegra186 BPMP bindings to json-schema
Date:   Fri, 12 Jun 2020 16:18:29 +0200
Message-Id: <20200612141903.2391044-5-thierry.reding@gmail.com>
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

Convert the Tegra186 BPMP bindings from the free-form text format to a
json-schema and fix things up so that existing device trees properly
validate.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../firmware/nvidia,tegra186-bpmp.txt         | 107 -----------
 .../firmware/nvidia,tegra186-bpmp.yaml        | 180 ++++++++++++++++++
 2 files changed, 180 insertions(+), 107 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
 create mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml

diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
deleted file mode 100644
index e44a13bc06ed..000000000000
--- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
+++ /dev/null
@@ -1,107 +0,0 @@
-NVIDIA Tegra Boot and Power Management Processor (BPMP)
-
-The BPMP is a specific processor in Tegra chip, which is designed for
-booting process handling and offloading the power management, clock
-management, and reset control tasks from the CPU. The binding document
-defines the resources that would be used by the BPMP firmware driver,
-which can create the interprocessor communication (IPC) between the CPU
-and BPMP.
-
-Required properties:
-- compatible
-    Array of strings
-    One of:
-    - "nvidia,tegra186-bpmp"
-- mboxes : The phandle of mailbox controller and the mailbox specifier.
-- shmem : List of the phandle of the TX and RX shared memory area that
-	  the IPC between CPU and BPMP is based on.
-- #clock-cells : Should be 1.
-- #power-domain-cells : Should be 1.
-- #reset-cells : Should be 1.
-
-This node is a mailbox consumer. See the following files for details of
-the mailbox subsystem, and the specifiers implemented by the relevant
-provider(s):
-
-- .../mailbox/mailbox.txt
-- .../mailbox/nvidia,tegra186-hsp.txt
-
-This node is a clock, power domain, and reset provider. See the following
-files for general documentation of those features, and the specifiers
-implemented by this node:
-
-- .../clock/clock-bindings.txt
-- <dt-bindings/clock/tegra186-clock.h>
-- ../power/power-domain.yaml
-- <dt-bindings/power/tegra186-powergate.h>
-- .../reset/reset.txt
-- <dt-bindings/reset/tegra186-reset.h>
-
-The BPMP implements some services which must be represented by separate nodes.
-For example, it can provide access to certain I2C controllers, and the I2C
-bindings represent each I2C controller as a device tree node. Such nodes should
-be nested directly inside the main BPMP node.
-
-Software can determine whether a child node of the BPMP node represents a device
-by checking for a compatible property. Any node with a compatible property
-represents a device that can be instantiated. Nodes without a compatible
-property may be used to provide configuration information regarding the BPMP
-itself, although no such configuration nodes are currently defined by this
-binding.
-
-The BPMP firmware defines no single global name-/numbering-space for such
-services. Put another way, the numbering scheme for I2C buses is distinct from
-the numbering scheme for any other service the BPMP may provide (e.g. a future
-hypothetical SPI bus service). As such, child device nodes will have no reg
-property, and the BPMP node will have no #address-cells or #size-cells property.
-
-The shared memory bindings for BPMP
------------------------------------
-
-The shared memory area for the IPC TX and RX between CPU and BPMP are
-predefined and work on top of sysram, which is an SRAM inside the chip.
-
-See ".../sram/sram.txt" for the bindings.
-
-Example:
-
-hsp_top0: hsp@3c00000 {
-	...
-	#mbox-cells = <2>;
-};
-
-sysram@30000000 {
-	compatible = "nvidia,tegra186-sysram", "mmio-sram";
-	reg = <0x0 0x30000000 0x0 0x50000>;
-	#address-cells = <2>;
-	#size-cells = <2>;
-	ranges = <0 0x0 0x0 0x30000000 0x0 0x50000>;
-
-	cpu_bpmp_tx: shmem@4e000 {
-		compatible = "nvidia,tegra186-bpmp-shmem";
-		reg = <0x0 0x4e000 0x0 0x1000>;
-		label = "cpu-bpmp-tx";
-		pool;
-	};
-
-	cpu_bpmp_rx: shmem@4f000 {
-		compatible = "nvidia,tegra186-bpmp-shmem";
-		reg = <0x0 0x4f000 0x0 0x1000>;
-		label = "cpu-bpmp-rx";
-		pool;
-	};
-};
-
-bpmp {
-	compatible = "nvidia,tegra186-bpmp";
-	mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_BPMP>;
-	shmem = <&cpu_bpmp_tx &cpu_bpmp_rx>;
-	#clock-cells = <1>;
-	#power-domain-cells = <1>;
-	#reset-cells = <1>;
-
-	i2c {
-		compatible = "...";
-		...
-	};
-};
diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
new file mode 100644
index 000000000000..0e4d51ba7aa1
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
@@ -0,0 +1,180 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/nvidia,tegra186-bpmp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra186 (and later) Boot and Power Management Processor (BPMP)
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  The BPMP is a specific processor in Tegra chip, which is designed for
+  booting process handling and offloading the power management, clock
+  management, and reset control tasks from the CPU. The binding document
+  defines the resources that would be used by the BPMP firmware driver,
+  which can create the interprocessor communication (IPC) between the
+  CPU and BPMP.
+
+  The BPMP implements some services which must be represented by separate
+  nodes. For example, it can provide access to certain I2C controllers, and
+  the I2C bindings represent each I2C controller as a device tree node. Such
+  nodes should be nested directly inside the main BPMP node.
+
+  Software can determine whether a child node of the BPMP node represents a
+  device by checking for a compatible property. Any node with a compatible
+  property represents a device that can be instantiated. Nodes without a
+  compatible property may be used to provide configuration information
+  regarding the BPMP itself, although no such configuration nodes are
+  currently defined by this binding.
+
+  The BPMP firmware defines no single global name-/numbering-space for such
+  services. Put another way, the numbering scheme for I2C buses is distinct
+  from the numbering scheme for any other service the BPMP may provide (e.g.
+  a future hypothetical SPI bus service). As such, child device nodes will
+  have no "reg" property, and the BPMP node will have no "#address-cells" or
+  "#size-cells" property.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nvidia,tegra186-bpmp
+
+  iommus:
+    description: |
+      The phandle of the IOMMU and the IOMMU specifier. See ../iommu/iommu.txt
+      for details.
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  mboxes:
+    description: |
+      The phandle of the mailbox controller and the mailbox specifier. See
+      ../mailbox/mailbox.txt and ../mailbox/nvidia,tegra186-hsp.txt for
+      details.
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  shmem:
+    description: |
+      List of phandles for the TX and RX shared memory areas used for
+      interprocess communication between the CPU and the BPMP.
+
+      The shared memory area for the IPC TX and RX between CPU and BPMP are
+      predefined and work on top of sysram, which is an SRAM inside the chip.
+
+      See ../sram/sram.yaml for the bindings.
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  "#clock-cells":
+    const: 1
+
+  "#power-domain-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  i2c:
+    type: object
+    description: |
+      The BPMP can provide serialized access to I2C controllers that have
+      been assigned to it.
+
+    properties:
+      compatible:
+        items:
+          - enum:
+              - nvidia,tegra186-bpmp-i2c
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      nvidia,bpmp-bus-id:
+        description: The bus ID of the I2C controller.
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+
+    required:
+      - compatible
+      - "#address-cells"
+      - "#size-cells"
+      - nvidia,bpmp-bus-id
+
+    patternProperties:
+      "^.*@[0-9a-f]+$":
+        type: object
+        description: I2C slave
+        properties:
+          reg:
+            maxItems: 1
+            description: I2C address of the slave
+
+        required:
+          - reg
+
+    additionalProperties: false
+
+  thermal:
+    type: object
+    description:
+      The BPMP provides functionality that exposes system temperature sensors
+      and which can be used to trigger a system shutdown if the temperature
+      for a given zone exceeds the specified thresholds.
+
+    properties:
+      compatible:
+        items:
+          - enum:
+              - nvidia,tegra186-bpmp-thermal
+
+      "#thermal-sensor-cells":
+        description: The ID of the thermal zone.
+        const: 1
+
+    required:
+      - compatible
+      - "#thermal-sensor-cells"
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - mboxes
+  - shmem
+  - "#clock-cells"
+  - "#power-domain-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/mailbox/tegra186-hsp.h>
+    #include <dt-bindings/memory/tegra186-mc.h>
+
+    bpmp {
+        compatible = "nvidia,tegra186-bpmp";
+        iommus = <&smmu TEGRA186_SID_BPMP>;
+        mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_BPMP>;
+        shmem = <&cpu_bpmp_tx &cpu_bpmp_rx>;
+        #clock-cells = <1>;
+        #power-domain-cells = <1>;
+        #reset-cells = <1>;
+
+        i2c {
+            compatible = "nvidia,tegra186-bpmp-i2c";
+            nvidia,bpmp-bus-id = <5>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            status = "disabled";
+        };
+
+        thermal {
+            compatible = "nvidia,tegra186-bpmp-thermal";
+            #thermal-sensor-cells = <1>;
+        };
+    };
-- 
2.24.1

