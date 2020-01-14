Return-Path: <SRS0=kXJJ=3D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B7CC33C9E
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 18:15:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 495D224658
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 18:15:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLDNbZ5u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728670AbgANSP2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jan 2020 13:15:28 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42882 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbgANSP2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jan 2020 13:15:28 -0500
Received: by mail-wr1-f67.google.com with SMTP id q6so13118545wro.9;
        Tue, 14 Jan 2020 10:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0P5glpoJdpBF0YSe5lgoVaYsIcQxbSvG8r8CUEJDp1s=;
        b=iLDNbZ5ukUSPVmBRFK82mQFW0l7rdwdOHDpE/ogQ58S0r93xmYGgTDo6IkaoMijE5M
         Goh5OWRfiai3JwDZgNmFwNVyw/9rtGGIwY0nNc2zkJs1iTyAyYTul/rvbF+1MC2TiAna
         jChEnlb1eUACfPtcLaNDxhbs0X5xl2zfVFH9koMHF4qHSd/5wQzKjZVOXEZBtGaqYsHz
         e/AMUM+dlSOkkeMaOZv4c60nWWIO++Lc0V0aSO9oa91JoEWg3ao9Iqz4XHZGGn+pQZO0
         mVAGFKHI5fvg8QwMoqCrqwOr6x4La1vp1HS97pPzNTlQl/a/Fj0oKwXwnr37PTqgjHlG
         cFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0P5glpoJdpBF0YSe5lgoVaYsIcQxbSvG8r8CUEJDp1s=;
        b=rMM6YwCfPl+1mTzSWchwXrp425+z6DfxFjaDHqsymYY4v2BmtZo8iKrHkHplIv80FM
         Zcuz1LrM6ljQ0FdFP/5uah686um0E+29bJzC6k9aRuUAOPzq+ToKIcu7pgD73FJ6/Vh9
         pyb8dz8qIU5ovY/EzFg4ubTT4GMRje3WOh6JWwojBnxdpR7njqMyIbZLWaKSCSuE3xkA
         p8qYp+R5amPgblhvHDniUaXaWPRrcArgWHWQZEZMf0wtKd2ZK+RB0rmppeMz5Ou4rvug
         KhKhqnoNfpc6XT2vZ7EnsEoAjcRAzlg+qn6sHUc/2R7LzwjEl+rPC47rXCfocDesn1Og
         cOGA==
X-Gm-Message-State: APjAAAWyaSiUjXAse4rWC+vLIuVQhuoqreTrb7j4+vp2HmUcU9oN3LCB
        MknIL5WakDozKlJ6hO8qTVI=
X-Google-Smtp-Source: APXvYqyT1DPFbckt54VA8UADUndMRcNwH2HnT8rQuoDO4clfOw2MNvvElIYe/H+2R6MSRZmHfddFxQ==
X-Received: by 2002:adf:fd07:: with SMTP id e7mr26157430wrr.21.1579025726306;
        Tue, 14 Jan 2020 10:15:26 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id c4sm19616870wml.7.2020.01.14.10.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 10:15:25 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: firmware: Convert Tegra186 BPMP bindings to json-schema
Date:   Tue, 14 Jan 2020 19:15:18 +0100
Message-Id: <20200114181519.3402385-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the Tegra186 BPMP bindings from the old free-form text format to
a json-schema and fix things up so that existing device trees properly
validate.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../firmware/nvidia,tegra186-bpmp.txt         | 107 ---------
 .../firmware/nvidia,tegra186-bpmp.yaml        | 209 ++++++++++++++++++
 2 files changed, 209 insertions(+), 107 deletions(-)
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
index 000000000000..dabf1c1aec2f
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
@@ -0,0 +1,209 @@
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
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      The phandle of the IOMMU and the IOMMU specifier. See ../iommu/iommu.txt
+      for details.
+
+  mboxes:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      The phandle of the mailbox controller and the mailbox specifier. See
+      ../mailbox/mailbox.txt and ../mailbox/nvidia,tegra186-hsp.txt for
+      details.
+
+  shmem:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: List of phandles for the TX and RX shared memory areas used
+      for interprocess communication between the CPU and the BPMP.
+
+      The shared memory area for the IPC TX and RX between CPU and BPMP are
+      predefined and work on top of sysram, which is an SRAM inside the chip.
+
+      See ../sram/sram.yaml for the bindings.
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
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: The bus ID of the I2C controller.
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
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/mailbox/tegra186-hsp.h>
+
+    hsp_top0: hsp@3c00000 {
+        compatible = "nvidia,tegra186-hsp";
+        reg = <0x03c00000 0xa0000>;
+        interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "doorbell";
+        #mbox-cells = <2>;
+    };
+
+    sysram@30000000 {
+        compatible = "nvidia,tegra186-sysram", "mmio-sram";
+        reg = <0x30000000 0x50000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x30000000 0x50000>;
+
+        cpu_bpmp_tx: shmem@4e000 {
+            compatible = "nvidia,tegra186-bpmp-shmem";
+            reg = <0x4e000 0x1000>;
+            label = "cpu-bpmp-tx";
+            pool;
+        };
+
+        cpu_bpmp_rx: shmem@4f000 {
+            compatible = "nvidia,tegra186-bpmp-shmem";
+            reg = <0x4f000 0x1000>;
+            label = "cpu-bpmp-rx";
+            pool;
+        };
+    };
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

