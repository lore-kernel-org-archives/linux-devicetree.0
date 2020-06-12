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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 141F9C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFF0D206C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFcBLRda"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbgFLOT5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgFLOT5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:19:57 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9252C03E96F;
        Fri, 12 Jun 2020 07:19:56 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e1so9938452wrt.5;
        Fri, 12 Jun 2020 07:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=59TKrhoAKKemILd9HpFc8Bt3Km9GPJE3SLj59fQ5KxQ=;
        b=HFcBLRdaPtus/S/YidYK7CZE/qfS9lt+viHr18u1N5VAMpZhqUAQ0C7I9WtguwKF7p
         kslPYrAeU6bkADWHfHnbWDly/iJ8Q4vKvmPG+aVbPkxxUk2PqB6+aEoDC+RfKp9jLmFX
         yOPLyxIztO5wTO3iPkgL5z4PNNnftSuz3RWQi1PArbsacnHsTudHjkGeikf/dd3lz3rV
         tFwiHWJNym6mlZDVSkJtDI6xXS3Ws4TNuODR1t1yLz38FBG+8BluCMk/usel1t8VMqYO
         u8KACmc2c0CLyrJPpkaHII4CrWe1nFtwRS4UItP1OsYZVhD2uihy0vtbIwlXu7bOpGPZ
         U0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=59TKrhoAKKemILd9HpFc8Bt3Km9GPJE3SLj59fQ5KxQ=;
        b=b7akBoMOPc6PT8Rk2BQrUaNiihmFcKHWSsSA1c7m8EyxyOAa8gcdFx0et0/8DilMbN
         +pTi83ygO1qXOuP0HUlFmn65KF6AGAJQG6ZQ7sFBjcSq1wMPpKTBdUrl3sZb6+c9wQfA
         LWYfr7ew+k/x/8Twd6BH+1Je1NCIlySnnswlb4TLPbhOgn2+xlDzZ/Fuc+8p5rJGy1o9
         R17cjyrkDkNx10o0HEwqYWUgWkgUFVxeYEFZz38/1xm9kw3Qotw/zx2dIEKiGFMKZ3Jf
         4axrhvfRTsiXW0lQKnrBxp3e5rJJ26ITZOMLWfsouQx7dhQOQU1aBlZ6hLkk57ciL3qO
         Cbwg==
X-Gm-Message-State: AOAM533rQLkUKJy3nQ8YjYsyh2xqs0qj93TUd7Pm5sJ1AcZFBXUw8UH3
        GdWaF1wBp0qXpba2HVGIE0E=
X-Google-Smtp-Source: ABdhPJySRQVG9zve5PRV4sBlwqNeraxOgyhR5TgxJqeBBXFAMnObQ6ZDy32o3lCAwqm00TF6Lo36Og==
X-Received: by 2002:a5d:4bc5:: with SMTP id l5mr15507549wrt.104.1591971595243;
        Fri, 12 Jun 2020 07:19:55 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id s2sm2736753wmh.15.2020.06.12.07.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:54 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 23/38] dt-bindings: gpio: tegra186: Convert to json-schema
Date:   Fri, 12 Jun 2020 16:18:48 +0200
Message-Id: <20200612141903.2391044-24-thierry.reding@gmail.com>
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

Convert the Tegra186 GPIO controller device tree bindings from free-form
text format to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/gpio/nvidia,tegra186-gpio.txt    | 165 --------------
 .../bindings/gpio/nvidia,tegra186-gpio.yaml   | 215 ++++++++++++++++++
 2 files changed, 215 insertions(+), 165 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
deleted file mode 100644
index adff16c71d21..000000000000
--- a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
+++ /dev/null
@@ -1,165 +0,0 @@
-NVIDIA Tegra186 GPIO controllers
-
-Tegra186 contains two GPIO controllers; a main controller and an "AON"
-controller. This binding document applies to both controllers. The register
-layouts for the controllers share many similarities, but also some significant
-differences. Hence, this document describes closely related but different
-bindings and compatible values.
-
-The Tegra186 GPIO controller allows software to set the IO direction of, and
-read/write the value of, numerous GPIO signals. Routing of GPIO signals to
-package balls is under the control of a separate pin controller HW block. Two
-major sets of registers exist:
-
-a) Security registers, which allow configuration of allowed access to the GPIO
-register set. These registers exist in a single contiguous block of physical
-address space. The size of this block, and the security features available,
-varies between the different GPIO controllers.
-
-Access to this set of registers is not necessary in all circumstances. Code
-that wishes to configure access to the GPIO registers needs access to these
-registers to do so. Code which simply wishes to read or write GPIO data does not
-need access to these registers.
-
-b) GPIO registers, which allow manipulation of the GPIO signals. In some GPIO
-controllers, these registers are exposed via multiple "physical aliases" in
-address space, each of which access the same underlying state. See the hardware
-documentation for rationale. Any particular GPIO client is expected to access
-just one of these physical aliases.
-
-Tegra HW documentation describes a unified naming convention for all GPIOs
-implemented by the SoC. Each GPIO is assigned to a port, and a port may control
-a number of GPIOs. Thus, each GPIO is named according to an alphabetical port
-name and an integer GPIO name within the port. For example, GPIO_PA0, GPIO_PN6,
-or GPIO_PCC3.
-
-The number of ports implemented by each GPIO controller varies. The number of
-implemented GPIOs within each port varies. GPIO registers within a controller
-are grouped and laid out according to the port they affect.
-
-The mapping from port name to the GPIO controller that implements that port, and
-the mapping from port name to register offset within a controller, are both
-extremely non-linear. The header file <dt-bindings/gpio/tegra186-gpio.h>
-describes the port-level mapping. In that file, the naming convention for ports
-matches the HW documentation. The values chosen for the names are alphabetically
-sorted within a particular controller. Drivers need to map between the DT GPIO
-IDs and HW register offsets using a lookup table.
-
-Each GPIO controller can generate a number of interrupt signals. Each signal
-represents the aggregate status for all GPIOs within a set of ports. Thus, the
-number of interrupt signals generated by a controller varies as a rough function
-of the number of ports it implements. Note that the HW documentation refers to
-both the overall controller HW module and the sets-of-ports as "controllers".
-
-Each GPIO controller in fact generates multiple interrupts signals for each set
-of ports. Each GPIO may be configured to feed into a specific one of the
-interrupt signals generated by a set-of-ports. The intent is for each generated
-signal to be routed to a different CPU, thus allowing different CPUs to each
-handle subsets of the interrupts within a port. The status of each of these
-per-port-set signals is reported via a separate register. Thus, a driver needs
-to know which status register to observe. This binding currently defines no
-configuration mechanism for this. By default, drivers should use register
-GPIO_${port}_INTERRUPT_STATUS_G1_0. Future revisions to the binding could
-define a property to configure this.
-
-Required properties:
-- compatible
-    Array of strings.
-    One of:
-    - "nvidia,tegra186-gpio".
-    - "nvidia,tegra186-gpio-aon".
-    - "nvidia,tegra194-gpio".
-    - "nvidia,tegra194-gpio-aon".
-- reg-names
-    Array of strings.
-    Contains a list of names for the register spaces described by the reg
-    property. May contain the following entries, in any order:
-    - "gpio": Mandatory. GPIO control registers. This may cover either:
-        a) The single physical alias that this OS should use.
-        b) All physical aliases that exist in the controller. This is
-           appropriate when the OS is responsible for managing assignment of
-           the physical aliases.
-    - "security": Optional. Security configuration registers.
-    Users of this binding MUST look up entries in the reg property by name,
-    using this reg-names property to do so.
-- reg
-    Array of (physical base address, length) tuples.
-    Must contain one entry per entry in the reg-names property, in a matching
-    order.
-- interrupts
-    Array of interrupt specifiers.
-    The interrupt outputs from the HW block, one per set of ports, in the
-    order the HW manual describes them. The number of entries required varies
-    depending on compatible value:
-    - "nvidia,tegra186-gpio": 6 entries.
-    - "nvidia,tegra186-gpio-aon": 1 entry.
-    - "nvidia,tegra194-gpio": 6 entries.
-    - "nvidia,tegra194-gpio-aon": 1 entry.
-- gpio-controller
-    Boolean.
-    Marks the device node as a GPIO controller/provider.
-- #gpio-cells
-    Single-cell integer.
-    Must be <2>.
-    Indicates how many cells are used in a consumer's GPIO specifier.
-    In the specifier:
-    - The first cell is the pin number.
-        See <dt-bindings/gpio/tegra186-gpio.h>.
-    - The second cell contains flags:
-        - Bit 0 specifies polarity
-            - 0: Active-high (normal).
-            - 1: Active-low (inverted).
-- interrupt-controller
-    Boolean.
-    Marks the device node as an interrupt controller/provider.
-- #interrupt-cells
-    Single-cell integer.
-    Must be <2>.
-    Indicates how many cells are used in a consumer's interrupt specifier.
-    In the specifier:
-    - The first cell is the GPIO number.
-        See <dt-bindings/gpio/tegra186-gpio.h>.
-    - The second cell is contains flags:
-        - Bits [3:0] indicate trigger type and level:
-            - 1: Low-to-high edge triggered.
-            - 2: High-to-low edge triggered.
-            - 4: Active high level-sensitive.
-            - 8: Active low level-sensitive.
-            Valid combinations are 1, 2, 3, 4, 8.
-
-Example:
-
-#include <dt-bindings/interrupt-controller/irq.h>
-
-gpio@2200000 {
-	compatible = "nvidia,tegra186-gpio";
-	reg-names = "security", "gpio";
-	reg =
-		<0x0 0x2200000 0x0 0x10000>,
-		<0x0 0x2210000 0x0 0x10000>;
-	interrupts =
-		<0 47 IRQ_TYPE_LEVEL_HIGH>,
-		<0 50 IRQ_TYPE_LEVEL_HIGH>,
-		<0 53 IRQ_TYPE_LEVEL_HIGH>,
-		<0 56 IRQ_TYPE_LEVEL_HIGH>,
-		<0 59 IRQ_TYPE_LEVEL_HIGH>,
-		<0 180 IRQ_TYPE_LEVEL_HIGH>;
-	gpio-controller;
-	#gpio-cells = <2>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-};
-
-gpio@c2f0000 {
-	compatible = "nvidia,tegra186-gpio-aon";
-	reg-names = "security", "gpio";
-	reg =
-		<0x0 0xc2f0000 0x0 0x1000>,
-		<0x0 0xc2f1000 0x0 0x1000>;
-	interrupts =
-		<0 60 IRQ_TYPE_LEVEL_HIGH>;
-	gpio-controller;
-	#gpio-cells = <2>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-};
diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
new file mode 100644
index 000000000000..94cf164c9abf
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
@@ -0,0 +1,215 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/nvidia,tegra186-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra GPIO Controller (Tegra186 and later)
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  Tegra186 contains two GPIO controllers; a main controller and an "AON"
+  controller. This binding document applies to both controllers. The register
+  layouts for the controllers share many similarities, but also some
+  significant differences. Hence, this document describes closely related but
+  different bindings and compatible values.
+
+  The Tegra186 GPIO controller allows software to set the IO direction of,
+  and read/write the value of, numerous GPIO signals. Routing of GPIO signals
+  to package balls is under the control of a separate pin controller hardware
+  block. Two major sets of registers exist:
+
+    a) Security registers, which allow configuration of allowed access to the
+       GPIO register set. These registers exist in a single contiguous block
+       of physical address space. The size of this block, and the security
+       features available, varies between the different GPIO controllers.
+
+       Access to this set of registers is not necessary in all circumstances.
+       Code that wishes to configure access to the GPIO registers needs access
+       to these registers to do so. Code which simply wishes to read or write
+       GPIO data does not need access to these registers.
+
+    b) GPIO registers, which allow manipulation of the GPIO signals. In some
+       GPIO controllers, these registers are exposed via multiple "physical
+       aliases" in address space, each of which access the same underlying
+       state. See the hardware documentation for rationale. Any particular
+       GPIO client is expected to access just one of these physical aliases.
+
+    Tegra HW documentation describes a unified naming convention for all GPIOs
+    implemented by the SoC. Each GPIO is assigned to a port, and a port may
+    control a number of GPIOs. Thus, each GPIO is named according to an
+    alphabetical port name and an integer GPIO name within the port. For
+    example, GPIO_PA0, GPIO_PN6, or GPIO_PCC3.
+
+    The number of ports implemented by each GPIO controller varies. The number
+    of implemented GPIOs within each port varies. GPIO registers within a
+    controller are grouped and laid out according to the port they affect.
+
+    The mapping from port name to the GPIO controller that implements that
+    port, and the mapping from port name to register offset within a
+    controller, are both extremely non-linear. The header file
+    <dt-bindings/gpio/tegra186-gpio.h> describes the port-level mapping. In
+    that file, the naming convention for ports matches the HW documentation.
+    The values chosen for the names are alphabetically sorted within a
+    particular controller. Drivers need to map between the DT GPIO IDs and HW
+    register offsets using a lookup table.
+
+    Each GPIO controller can generate a number of interrupt signals. Each
+    signal represents the aggregate status for all GPIOs within a set of
+    ports. Thus, the number of interrupt signals generated by a controller
+    varies as a rough function of the number of ports it implements. Note
+    that the HW documentation refers to both the overall controller HW
+    module and the sets-of-ports as "controllers".
+
+    Each GPIO controller in fact generates multiple interrupts signals for
+    each set of ports. Each GPIO may be configured to feed into a specific
+    one of the interrupt signals generated by a set-of-ports. The intent is
+    for each generated signal to be routed to a different CPU, thus allowing
+    different CPUs to each handle subsets of the interrupts within a port.
+    The status of each of these per-port-set signals is reported via a
+    separate register. Thus, a driver needs to know which status register to
+    observe. This binding currently defines no configuration mechanism for
+    this. By default, drivers should use register
+    GPIO_${port}_INTERRUPT_STATUS_G1_0. Future revisions to the binding could
+    define a property to configure this.
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra186-gpio
+      - nvidia,tegra186-gpio-aon
+      - nvidia,tegra194-gpio
+      - nvidia,tegra194-gpio-aon
+
+  reg-names:
+    items:
+      - const: security
+      - const: gpio
+    minItems: 1
+    maxItems: 2
+
+  reg:
+    items:
+      - description: |
+          GPIO control registers. This may cover either:
+
+            a) The single physical alias that this OS should use.
+            b) All physical aliases that exist in the controller. This is
+               appropriate when the OS is responsible for managing assignment
+               of the physical aliases.
+      - description: Security configuration registers.
+    minItems: 1
+    maxItems: 2
+
+  interrupts:
+    description: The interrupt outputs from the HW block, one per set of
+      ports, in the order the HW manual describes them. The number of entries
+      required varies depending on compatible value.
+
+  gpio-controller:
+    description: Marks the device node as a GPIO controller/provider.
+    type: boolean
+
+  "#gpio-cells":
+    description: |
+      Indicates how many cells are used in a consumer's GPIO specifier. In the
+      specifier:
+
+        - The first cell is the pin number.
+          See <dt-bindings/gpio/tegra186-gpio.h>.
+        - The second cell contains flags:
+          - Bit 0 specifies polarity
+            - 0: Active-high (normal).
+            - 1: Active-low (inverted).
+    const: 2
+
+  interrupt-controller:
+    description: Marks the device node as an interrupt controller/provider.
+    type: boolean
+
+  "#interrupt-cells":
+    description: |
+      Indicates how many cells are used in a consumer's interrupt specifier.
+      In the specifier:
+
+        - The first cell is the GPIO number.
+          See <dt-bindings/gpio/tegra186-gpio.h>.
+        - The second cell is contains flags:
+          - Bits [3:0] indicate trigger type and level:
+            - 1: Low-to-high edge triggered.
+            - 2: High-to-low edge triggered.
+            - 4: Active high level-sensitive.
+            - 8: Active low level-sensitive.
+
+            Valid combinations are 1, 2, 3, 4, 8.
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra186-gpio
+              - nvidia,tegra194-gpio
+    then:
+      properties:
+        interrupts:
+          minItems: 6
+          maxItems: 6
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra186-gpio-aon
+              - nvidia,tegra194-gpio-aon
+    then:
+      properties:
+        interrupts:
+          minItems: 1
+          maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    gpio@2200000 {
+        compatible = "nvidia,tegra186-gpio";
+        reg-names = "security", "gpio";
+        reg = <0x0 0x2200000 0x0 0x10000>,
+              <0x0 0x2210000 0x0 0x10000>;
+        interrupts = <0 47 IRQ_TYPE_LEVEL_HIGH>,
+                     <0 50 IRQ_TYPE_LEVEL_HIGH>,
+                     <0 53 IRQ_TYPE_LEVEL_HIGH>,
+                     <0 56 IRQ_TYPE_LEVEL_HIGH>,
+                     <0 59 IRQ_TYPE_LEVEL_HIGH>,
+                     <0 180 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
+
+    gpio@c2f0000 {
+        compatible = "nvidia,tegra186-gpio-aon";
+        reg-names = "security", "gpio";
+        reg = <0x0 0xc2f0000 0x0 0x1000>,
+              <0x0 0xc2f1000 0x0 0x1000>;
+        interrupts = <0 60 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
-- 
2.24.1

