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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44801C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B4E02081A
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kX6eAJlW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbgFLOTd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbgFLOTd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:19:33 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C913BC03E96F;
        Fri, 12 Jun 2020 07:19:32 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id j198so9295534wmj.0;
        Fri, 12 Jun 2020 07:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+nrUj8b6gujktlapi/NVyUor7WQfYI7CQJmKMWGD84U=;
        b=kX6eAJlW3+KKflNNmu4EgQCZ8Ma07Ix3uIAGhdSXlb/86k0sN67s/akwsPA0mHEUEc
         KB+YAcUQsJ1IfWevg5lEx2a9MLdGDWGCfSpF5P4kU9tYN8a3SYkIJRZT2qTHWhmjXe4U
         g/JgDWfdqxe8n6+WU5WDvXJ/pqvinmV677a1DXRanOZvIFf7YUlu/8hBHeMNndCP8McT
         OV5ciL9KiIaWWFJ66DwTsP0cTdc5IXk6jfXRJwwi7NaNWPtR6hCZri0aI3jdLw/o2FPZ
         72nBUT0siJpoScOgonUGxVUCBS1BT0EeIfCY7MjQqZlvjj6VVnnarApvZwtMpKilCr4z
         MNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+nrUj8b6gujktlapi/NVyUor7WQfYI7CQJmKMWGD84U=;
        b=oTLBd2K0oeL/n4zi+gDbwQuU3D79HTlfX2htIEvnSDw/X6qzaJVSGWMB2DVdoI86jE
         w4d32f1HkH+sswjiKPc5CfJdYJ4E+uMX9xBJYqAf+Wyvm/m7WgbAvsXfPm/Mbz01adkZ
         DEQOwsjqvkNlbe2H1a52Jz/3NXUfC9k5+BRZKuVt9bJpB7gSovitExcL5cvpZpFxSgFt
         NABUNhUenVM3f20O8Ef7EExBVNX/qWfjRa+KnY6Fk/S5gzkpXjGi8j4ialRR2ZLh+bPc
         XgTQxqgp8HdRJII2owmkjQsRlWnr9OMz9h3XAhvee/V1hgwTlFTolvlTGPgwM7Qemp6e
         cAfQ==
X-Gm-Message-State: AOAM5302M3ZID8U2enKvM1QHSMwdDKRU0JkcorLx+isPBgBeEzc6CVei
        xv+zvMzumCjK5lBmLISutsU=
X-Google-Smtp-Source: ABdhPJzgk/0kI0ASS0Z0Jr16viz6mudMS+RuYlpquTFGdZ5jk9+Yk+u8t948x0kX5urf/d+1YkffKw==
X-Received: by 2002:a1c:6a01:: with SMTP id f1mr13336388wmc.52.1591971570960;
        Fri, 12 Jun 2020 07:19:30 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f11sm9793569wrm.13.2020.06.12.07.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 11/38] dt-bindings: mmc: tegra: Convert to json-schema
Date:   Fri, 12 Jun 2020 16:18:36 +0200
Message-Id: <20200612141903.2391044-12-thierry.reding@gmail.com>
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

Convert the NVIDIA Tegra SDHCI bindings from the free-form text format
to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/mmc/nvidia,tegra20-sdhci.txt     | 117 --------
 .../bindings/mmc/nvidia,tegra20-sdhci.yaml    | 270 ++++++++++++++++++
 2 files changed, 270 insertions(+), 117 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml

diff --git a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt
deleted file mode 100644
index 2cf3affa1be7..000000000000
--- a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt
+++ /dev/null
@@ -1,117 +0,0 @@
-* NVIDIA Tegra Secure Digital Host Controller
-
-This controller on Tegra family SoCs provides an interface for MMC, SD,
-and SDIO types of memory cards.
-
-This file documents differences between the core properties described
-by mmc.txt and the properties used by the sdhci-tegra driver.
-
-Required properties:
-- compatible : should be one of:
-  - "nvidia,tegra20-sdhci": for Tegra20
-  - "nvidia,tegra30-sdhci": for Tegra30
-  - "nvidia,tegra114-sdhci": for Tegra114
-  - "nvidia,tegra124-sdhci": for Tegra124 and Tegra132
-  - "nvidia,tegra210-sdhci": for Tegra210
-  - "nvidia,tegra186-sdhci": for Tegra186
-  - "nvidia,tegra194-sdhci": for Tegra194
-- clocks : Must contain one entry, for the module clock.
-  See ../clocks/clock-bindings.txt for details.
-- resets : Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names : Must include the following entries:
-  - sdhci
-
-Optional properties:
-- power-gpios : Specify GPIOs for power control
-
-Example:
-
-sdhci@c8000200 {
-	compatible = "nvidia,tegra20-sdhci";
-	reg = <0xc8000200 0x200>;
-	interrupts = <47>;
-	clocks = <&tegra_car 14>;
-	resets = <&tegra_car 14>;
-	reset-names = "sdhci";
-	cd-gpios = <&gpio 69 0>; /* gpio PI5 */
-	wp-gpios = <&gpio 57 0>; /* gpio PH1 */
-	power-gpios = <&gpio 155 0>; /* gpio PT3 */
-	bus-width = <8>;
-};
-
-Optional properties for Tegra210, Tegra186 and Tegra194:
-- pinctrl-names, pinctrl-0, pinctrl-1 : Specify pad voltage
-  configurations. Valid pinctrl-names are "sdmmc-3v3" and "sdmmc-1v8"
-  for controllers supporting multiple voltage levels. The order of names
-  should correspond to the pin configuration states in pinctrl-0 and
-  pinctrl-1.
-- pinctrl-names : "sdmmc-3v3-drv" and "sdmmc-1v8-drv" are applicable for
-  Tegra210 where pad config registers are in the pinmux register domain
-  for pull-up-strength and pull-down-strength values configuration when
-  using pads at 3V3 and 1V8 levels.
-- nvidia,only-1-8-v : The presence of this property indicates that the
-  controller operates at a 1.8 V fixed I/O voltage.
-- nvidia,pad-autocal-pull-up-offset-3v3,
-  nvidia,pad-autocal-pull-down-offset-3v3 : Specify drive strength
-  calibration offsets for 3.3 V signaling modes.
-- nvidia,pad-autocal-pull-up-offset-1v8,
-  nvidia,pad-autocal-pull-down-offset-1v8 : Specify drive strength
-  calibration offsets for 1.8 V signaling modes.
-- nvidia,pad-autocal-pull-up-offset-3v3-timeout,
-  nvidia,pad-autocal-pull-down-offset-3v3-timeout : Specify drive
-  strength used as a fallback in case the automatic calibration times
-  out on a 3.3 V signaling mode.
-- nvidia,pad-autocal-pull-up-offset-1v8-timeout,
-  nvidia,pad-autocal-pull-down-offset-1v8-timeout : Specify drive
-  strength used as a fallback in case the automatic calibration times
-  out on a 1.8 V signaling mode.
-- nvidia,pad-autocal-pull-up-offset-sdr104,
-  nvidia,pad-autocal-pull-down-offset-sdr104 : Specify drive strength
-  calibration offsets for SDR104 mode.
-- nvidia,pad-autocal-pull-up-offset-hs400,
-  nvidia,pad-autocal-pull-down-offset-hs400 : Specify drive strength
-  calibration offsets for HS400 mode.
-- nvidia,default-tap : Specify the default inbound sampling clock
-  trimmer value for non-tunable modes.
-- nvidia,default-trim : Specify the default outbound clock trimmer
-  value.
-- nvidia,dqs-trim : Specify DQS trim value for HS400 timing
-
-  Notes on the pad calibration pull up and pulldown offset values:
-    - The property values are drive codes which are programmed into the
-      PD_OFFSET and PU_OFFSET sections of the
-      SDHCI_TEGRA_AUTO_CAL_CONFIG register.
-    - A higher value corresponds to higher drive strength. Please refer
-      to the reference manual of the SoC for correct values.
-    - The SDR104 and HS400 timing specific values are used in
-      corresponding modes if specified.
-
-  Notes on tap and trim values:
-    - The values are used for compensating trace length differences
-      by adjusting the sampling point.
-    - The values are programmed to the Vendor Clock Control Register.
-      Please refer to the reference manual of the SoC for correct
-      values.
-    - The DQS trim values are only used on controllers which support
-      HS400 timing. Only SDMMC4 on Tegra210 and Tegra 186 supports
-      HS400.
-
-Example:
-sdhci@700b0000 {
-	compatible = "nvidia,tegra210-sdhci", "nvidia,tegra124-sdhci";
-	reg = <0x0 0x700b0000 0x0 0x200>;
-	interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&tegra_car TEGRA210_CLK_SDMMC1>;
-	clock-names = "sdhci";
-	resets = <&tegra_car 14>;
-	reset-names = "sdhci";
-	pinctrl-names = "sdmmc-3v3", "sdmmc-1v8";
-	pinctrl-0 = <&sdmmc1_3v3>;
-	pinctrl-1 = <&sdmmc1_1v8>;
-	nvidia,pad-autocal-pull-up-offset-3v3 = <0x00>;
-	nvidia,pad-autocal-pull-down-offset-3v3 = <0x7d>;
-	nvidia,pad-autocal-pull-up-offset-1v8 = <0x7b>;
-	nvidia,pad-autocal-pull-down-offset-1v8 = <0x7b>;
-	status = "disabled";
-};
diff --git a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
new file mode 100644
index 000000000000..7652c2c1ff35
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
@@ -0,0 +1,270 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/nvidia,tegra20-sdhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Secure Digital Host Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  This controller on Tegra family SoCs provides an interface for MMC, SD, and
+  SDIO types of memory cards.
+
+  This file documents differences between the core properties described by
+  mmc-controller.yaml and the properties for the Tegra SDHCI controller.
+
+properties:
+  # required properties
+  compatible:
+    oneOf:
+      - description: NVIDIA Tegra20
+        const: nvidia,tegra20-sdhci
+
+      - description: NVIDIA Tegra30
+        const: nvidia,tegra30-sdhci
+
+      - description: NVIDIA Tegra114
+        const: nvidia,tegra114-sdhci
+
+      - description: NVIDIA Tegra124
+        const: nvidia,tegra124-sdhci
+
+      - description: NVIDIA Tegra132
+        items:
+          - const: nvidia,tegra132-sdhci
+          - const: nvidia,tegra124-sdhci
+
+      - description: NVIDIA Tegra210
+        const: nvidia,tegra210-sdhci
+
+      - description: NVIDIA Tegra186
+        const: nvidia,tegra186-sdhci
+
+      - description: NVIDIA Tegra194
+        const: nvidia,tegra194-sdhci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  assigned-clocks:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  assigned-clock-parents:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  assigned-clock-rates:
+    $ref: "/schemas/types.yaml#/definitions/uint32-array"
+
+  clocks:
+    items:
+      - description: module clock
+
+  clock-names:
+    items:
+      - const: sdhci
+
+  resets:
+    items:
+      - description: module reset
+
+  reset-names:
+    items:
+      - const: sdhci
+
+  # optional properties
+  power-gpios:
+    description: specify GPIOs for power control
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  iommus:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  nvidia,default-tap:
+    description: Specify the default inbound sampling clock trimmer value for
+      non-tunable modes.
+
+      The values are used for compensating trace length differences by
+      adjusting the sampling point. The values are programmed to the Vendor
+      Clock Control Register. Please refer to the reference manual of the SoC
+      for correct values.
+
+      The DQS trim values are only used on controllers which support HS400
+      timing. Only SDMMC4 on Tegra210 and Tegra186 supports HS400.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,default-trim:
+    description: Specify the default outbound clock trimmer value.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,dqs-trim:
+    description: Specify DQS trim value for HS400 timing.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-down-offset-1v8:
+    description: Specify drive strength calibration offsets for 1.8 V
+      signaling modes.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-down-offset-1v8-timeout:
+    description: Specify drive strength used as a fallback in case the
+      automatic calibration times out on a 1.8 V signaling mode.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-down-offset-3v3:
+    description: Specify drive strength calibration offsets for 3.3 V
+      signaling modes.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-down-offset-3v3-timeout:
+    description: Specify drive strength used as a fallback in case the
+      automatic calibration times out on a 3.3 V signaling mode.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-down-offset-sdr104:
+    description: Specify drive strength calibration offsets for SDR104 mode.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-down-offset-hs400:
+    description: Specify drive strength calibration offsets for HS400 mode.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  nvidia,pad-autocal-pull-up-offset-1v8:
+    description: Specify drive strength calibration offsets for 1.8 V
+      signaling modes.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-up-offset-1v8-timeout:
+    description: Specify drive strength used as a fallback in case the
+      automatic calibration times out on a 1.8 V signaling mode.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-up-offset-3v3:
+    description: Specify drive strength calibration offsets for 3.3 V
+      signaling modes.
+
+      The property values are drive codes which are programmed into the
+      PD_OFFSET and PU_OFFSET sections of the SDHCI_TEGRA_AUTO_CAL_CONFIG
+      register. A higher value corresponds to higher drive strength. Please
+      refer to the reference manual of the SoC for correct values. The SDR104
+      and HS400 timing specific values are used in corresponding modes if
+      specified.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-up-offset-3v3-timeout:
+    description: Specify drive strength used as a fallback in case the
+      automatic calibration times out on a 3.3 V signaling mode.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-up-offset-sdr104:
+    description: Specify drive strength calibration offsets for SDR104 mode.
+    $ref: "/schemas/types.yaml#definitions/uint32"
+
+  nvidia,pad-autocal-pull-up-offset-hs400:
+    description: Specify drive strength calibration offsets for HS400 mode.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  nvidia,only-1-8v:
+    description: The presence of this property indicates that the controller
+      operates at a 1.8 V fixed I/O voltage.
+    $ref: "/schemas/types.yaml#/definitions/flag"
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
+allOf:
+  - $ref: "mmc-controller.yaml"
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra210-sdhci
+    then:
+      properties:
+        pinctrl-names:
+          oneOf:
+            - items:
+                - const: sdmmc-3v3
+                  description: pad configuration for 3.3 V
+                - const: sdmmc-1v8
+                  description: pad configuration for 1.8 V
+                - const: sdmmc-3v3-drv
+                  description: pull-up/down configuration for 3.3 V
+                - const: sdmmc-1v8-drv
+                  description: pull-up/down configuration for 1.8 V
+            - items:
+                - const: sdmmc-3v3-drv
+                  description: pull-up/down configuration for 3.3 V
+                - const: sdmmc-1v8-drv
+                  description: pull-up/down configuration for 1.8 V
+            - items:
+                - const: sdmmc-1v8-drv
+                  description: pull-up/down configuration for 1.8 V
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra186-sdhci
+              - nvidia,tegra194-sdhci
+    then:
+      properties:
+        pinctrl-names:
+          items:
+            - const: sdmmc-3v3
+              description: pad configuration for 3.3 V
+            - const: sdmmc-1v8
+              description: pad configuration for 1.8 V
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    sdhci@c8000200 {
+        compatible = "nvidia,tegra20-sdhci";
+        reg = <0xc8000200 0x200>;
+        interrupts = <47>;
+        clocks = <&tegra_car 14>;
+        resets = <&tegra_car 14>;
+        reset-names = "sdhci";
+        cd-gpios = <&gpio 69 0>; /* gpio PI5 */
+        wp-gpios = <&gpio 57 0>; /* gpio PH1 */
+        power-gpios = <&gpio 155 0>; /* gpio PT3 */
+        bus-width = <8>;
+    };
+
+  - |
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    sdhci@700b0000 {
+        compatible = "nvidia,tegra210-sdhci";
+        reg = <0x0 0x700b0000 0x0 0x200>;
+        interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA210_CLK_SDMMC1>;
+        clock-names = "sdhci";
+        resets = <&tegra_car 14>;
+        reset-names = "sdhci";
+        pinctrl-names = "sdmmc-3v3", "sdmmc-1v8";
+        pinctrl-0 = <&sdmmc1_3v3>;
+        pinctrl-1 = <&sdmmc1_1v8>;
+        nvidia,pad-autocal-pull-up-offset-3v3 = <0x00>;
+        nvidia,pad-autocal-pull-down-offset-3v3 = <0x7d>;
+        nvidia,pad-autocal-pull-up-offset-1v8 = <0x7b>;
+        nvidia,pad-autocal-pull-down-offset-1v8 = <0x7b>;
+        status = "disabled";
+    };
-- 
2.24.1

