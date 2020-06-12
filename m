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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C87C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E175F2067B
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlFryN6Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgFLOT3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:19:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgFLOT2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:19:28 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80737C03E96F;
        Fri, 12 Jun 2020 07:19:28 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id p5so9895497wrw.9;
        Fri, 12 Jun 2020 07:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gCEbLxlG02oUvo7DfPzs1kgj1lesgK2l2UeknrfvZsM=;
        b=nlFryN6ZR8y5N0UoUJJ/I3cU327tfgZib8Mb/C3w+w4Dvzg520rGHRVD7IO13bAp8h
         jlLcu1ZX8vjL8ngVikx9+nzUHF6rNKYvNJiUDOv9vSa+zCjjyQpa17jgVSaGhEHxYXur
         Z11VWoErDydqCRjZPMf3lLp25dN8nC2cOCneeF/Cy1kWpyDJnSxnbZJSKy7J9gm3w3dj
         9UyBbeaM4akSru+VrdMY5hrGK93l/gsXre9cBGkprFGmcMvR8TpDaQxM6bweaYe/xeRY
         H5ctH6gebkT7HoVhw98/p7C/CtYCEYv7k7MQO9HD56a7dnR1L1u7X+RDbaOdYUkpPYqc
         rdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gCEbLxlG02oUvo7DfPzs1kgj1lesgK2l2UeknrfvZsM=;
        b=kePLa+WqfYFnBNlyN6JCLmnXCs74wF5oyb08HIPhlG7TS7iXNiebFASOVQ0WYincVK
         KlNLbcH9om5HZ/R+6pJ9JzvS0JsfuGwcgovwRYZJzDk31BD3hxln5OdgVy0aMmtAT9aZ
         ocPrs4RI6KZ+RDr4antbmqjmsN2gx6otYWGAg9cUVTh1el4dI6oGqGzLyriJO0VLxq0b
         C3AoTpTUAFhbLVOz9JYdQqXqVuVB90kcQYhTdJKVYkAY7dNftu7AbFDuk5+H8qcLC3F+
         fLrVAwoyA+eUfHMv0303ZaBNKbvwGLJiaOPruJqLwsJM3ypuBVIl+bx7iPooLjpBBG9o
         o8tg==
X-Gm-Message-State: AOAM532od23ObKsjU+eAgWXRG8XSwQQu52Gdwl9ezvx5m6+arq4HQAGS
        exy4W/W0qbJEjkgq4MxWYt0ObPKH
X-Google-Smtp-Source: ABdhPJwPsX5Xc4lVIhBC2HtqCuYiMVvW3sezFHwhLzydTxg38e+u3wEscxoHOOb2VUB0IvIb8xkhxg==
X-Received: by 2002:adf:b34e:: with SMTP id k14mr15337855wrd.109.1591971567125;
        Fri, 12 Jun 2020 07:19:27 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d2sm10598183wrs.95.2020.06.12.07.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:26 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 09/38] dt-bindings: gpu: tegra: Convert to json-schema
Date:   Fri, 12 Jun 2020 16:18:34 +0200
Message-Id: <20200612141903.2391044-10-thierry.reding@gmail.com>
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

Convert the NVIDIA Tegra GPU bindings from the previous free-form text
format to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/gpu/nvidia,gk20a.txt  |  90 ---------
 .../devicetree/bindings/gpu/nvidia,gk20a.yaml | 189 ++++++++++++++++++
 2 files changed, 189 insertions(+), 90 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
 create mode 100644 Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml

diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
deleted file mode 100644
index f32bbba4d3bc..000000000000
--- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
+++ /dev/null
@@ -1,90 +0,0 @@
-NVIDIA Tegra Graphics Processing Units
-
-Required properties:
-- compatible: "nvidia,<gpu>"
-  Currently recognized values:
-  - nvidia,gk20a
-  - nvidia,gm20b
-  - nvidia,gp10b
-- reg: Physical base address and length of the controller's registers.
-  Must contain two entries:
-  - first entry for bar0
-  - second entry for bar1
-- interrupts: Must contain an entry for each entry in interrupt-names.
-  See ../interrupt-controller/interrupts.txt for details.
-- interrupt-names: Must include the following entries:
-  - stall
-  - nonstall
-- vdd-supply: regulator for supply voltage. Only required for GPUs not using
-  power domains.
-- clocks: Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names: Must include the following entries:
-  - gpu
-  - pwr
-If the compatible string is "nvidia,gm20b", then the following clock
-is also required:
-  - ref
-- resets: Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names: Must include the following entries:
-  - gpu
-- power-domains: GPUs that make use of power domains can define this property
-  instead of vdd-supply. Currently "nvidia,gp10b" makes use of this.
-
-Optional properties:
-- iommus: A reference to the IOMMU. See ../iommu/iommu.txt for details.
-
-Example for GK20A:
-
-	gpu@57000000 {
-		compatible = "nvidia,gk20a";
-		reg = <0x0 0x57000000 0x0 0x01000000>,
-		      <0x0 0x58000000 0x0 0x01000000>;
-		interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "stall", "nonstall";
-		vdd-supply = <&vdd_gpu>;
-		clocks = <&tegra_car TEGRA124_CLK_GPU>,
-			 <&tegra_car TEGRA124_CLK_PLL_P_OUT5>;
-		clock-names = "gpu", "pwr";
-		resets = <&tegra_car 184>;
-		reset-names = "gpu";
-		iommus = <&mc TEGRA_SWGROUP_GPU>;
-	};
-
-Example for GM20B:
-
-	gpu@57000000 {
-		compatible = "nvidia,gm20b";
-		reg = <0x0 0x57000000 0x0 0x01000000>,
-		      <0x0 0x58000000 0x0 0x01000000>;
-		interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "stall", "nonstall";
-		clocks = <&tegra_car TEGRA210_CLK_GPU>,
-			 <&tegra_car TEGRA210_CLK_PLL_P_OUT5>,
-			 <&tegra_car TEGRA210_CLK_PLL_G_REF>;
-		clock-names = "gpu", "pwr", "ref";
-		resets = <&tegra_car 184>;
-		reset-names = "gpu";
-		iommus = <&mc TEGRA_SWGROUP_GPU>;
-	};
-
-Example for GP10B:
-
-	gpu@17000000 {
-		compatible = "nvidia,gp10b";
-		reg = <0x0 0x17000000 0x0 0x1000000>,
-		      <0x0 0x18000000 0x0 0x1000000>;
-		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH
-			      GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "stall", "nonstall";
-		clocks = <&bpmp TEGRA186_CLK_GPCCLK>,
-			 <&bpmp TEGRA186_CLK_GPU>;
-		clock-names = "gpu", "pwr";
-		resets = <&bpmp TEGRA186_RESET_GPU>;
-		reset-names = "gpu";
-		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_GPU>;
-		iommus = <&smmu TEGRA186_SID_GPU>;
-	};
diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
new file mode 100644
index 000000000000..726ef39b2221
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
@@ -0,0 +1,189 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/nvidia,gk20a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Graphics Processing Units
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nvidia,gk20a
+          - nvidia,gm20b
+          - nvidia,gp10b
+
+  reg:
+    items:
+      - description: base address and size for BAR0
+      - description: base address and size for BAR1
+
+  interrupts:
+    items:
+      - description: stalling interrupt
+      - description: non-stalling interrupt
+
+  interrupt-names:
+    items:
+      - const: stall
+      - const: nonstall
+
+  clocks:
+    minItems: 2
+    maxItems: 3
+    items:
+      - description: GPU clock
+      - description: PWR clock
+      - description: REF clock
+
+  clock-names:
+    minItems: 2
+    maxItems: 3
+    items:
+      - const: gpu
+      - const: pwr
+      - const: ref
+
+  resets:
+    items:
+      - description: GPU reset
+
+  reset-names:
+    minItems: 1
+    maxItems: 1
+    items:
+      - const: gpu
+
+  power-domains:
+    description: GPUs that make use of power domains can define this property
+      instead of vdd-supply. Currently "nvidia,gp10b" makes use of this.
+
+  vdd-supply:
+    description: GPU power supply.
+
+  iommus:
+    description: The phandle of the IOMMU and the IOMMU specifier. See
+      ../iommu/iommu.txt for details.
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,gm20b
+    then:
+      required:
+        - vdd-supply
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,gm20b
+    then:
+      properties:
+        clock-names:
+          minItems: 3
+
+      required:
+        - vdd-supply
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,gp10b
+    then:
+      required:
+        - power-domains
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra124-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/tegra124-mc.h>
+
+    gpu@57000000 {
+        compatible = "nvidia,gk20a";
+        reg = <0x0 0x57000000 0x0 0x01000000>,
+              <0x0 0x58000000 0x0 0x01000000>;
+        interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "stall", "nonstall";
+        vdd-supply = <&vdd_gpu>;
+        clocks = <&tegra_car TEGRA124_CLK_GPU>,
+                 <&tegra_car TEGRA124_CLK_PLL_P_OUT5>;
+        clock-names = "gpu", "pwr";
+        resets = <&tegra_car 184>;
+        reset-names = "gpu";
+        iommus = <&mc TEGRA_SWGROUP_GPU>;
+    };
+
+  - |
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    /*
+     * XXX can't include this because it conflicts with the tegra124-mc.h
+     * include from the Tegra124 example above.
+     */
+    /*
+    #include <dt-bindings/memory/tegra210-mc.h>
+    */
+
+    gpu@57000000 {
+        compatible = "nvidia,gm20b";
+        reg = <0x0 0x57000000 0x0 0x01000000>,
+              <0x0 0x58000000 0x0 0x01000000>;
+        interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "stall", "nonstall";
+        vdd-supply = <&vdd_gpu>;
+        clocks = <&tegra_car TEGRA210_CLK_GPU>,
+                 <&tegra_car TEGRA210_CLK_PLL_P_OUT5>,
+                 <&tegra_car TEGRA210_CLK_PLL_G_REF>;
+        clock-names = "gpu", "pwr", "ref";
+        resets = <&tegra_car 184>;
+        reset-names = "gpu";
+        iommus = <&mc TEGRA_SWGROUP_GPU>;
+    };
+
+  - |
+    #include <dt-bindings/clock/tegra186-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/tegra186-mc.h>
+    #include <dt-bindings/power/tegra186-powergate.h>
+    #include <dt-bindings/reset/tegra186-reset.h>
+
+    gpu@17000000 {
+        compatible = "nvidia,gp10b";
+        reg = <0x0 0x17000000 0x0 0x1000000>,
+              <0x0 0x18000000 0x0 0x1000000>;
+        interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "stall", "nonstall";
+        clocks = <&bpmp TEGRA186_CLK_GPCCLK>,
+                 <&bpmp TEGRA186_CLK_GPU>;
+        clock-names = "gpu", "pwr";
+        resets = <&bpmp TEGRA186_RESET_GPU>;
+        reset-names = "gpu";
+        power-domains = <&bpmp TEGRA186_POWER_DOMAIN_GPU>;
+        iommus = <&smmu TEGRA186_SID_GPU>;
+    };
-- 
2.24.1

