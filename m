Return-Path: <SRS0=2Ix+=4H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3386EC34050
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 10:33:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EEF55208E4
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 10:33:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DKye0DfM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgBSKdh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Feb 2020 05:33:37 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44195 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbgBSKdh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Feb 2020 05:33:37 -0500
Received: by mail-lf1-f65.google.com with SMTP id v201so16974695lfa.11
        for <devicetree@vger.kernel.org>; Wed, 19 Feb 2020 02:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8kM6yAjqFnjM2jY93znWn+MLnERhaKTbgaKW8bWHEG8=;
        b=DKye0DfMFHQmJOZBIz1dhGFA7Mh+DnGVOXFXV9HLeWxnnJMpKJz8XFePaio7piVXFT
         ZgLPLT1P1Vn/4DzJi0XPvyZl0W2wQVNbQ3+rWI43H/moP4hsXDBLc0Z/jcj3YyMCy7Do
         nc5pMcVQRcg2L4vKMzLfz4FfzR8hekvSlxL0HfEQjLQWj2sqMS08XB8ljBV1lwvuSxCF
         XqgSYdKraUhuSG+kLkTHIo3jmwfdlTH70uHGsoryZuOZQwyoHag5O5OuOjK/PC7/pDDQ
         TXXlBJRcqhZcSn9YZMJadDlQ0rM96yhaWow6JqZcNHXgn7E0vyfx3+dRhoI+QVSz4rEf
         gBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8kM6yAjqFnjM2jY93znWn+MLnERhaKTbgaKW8bWHEG8=;
        b=QxL9F8I9DrpoEX1mjup8HklVBcGf9GxsZbmq7/Nzt3ZoNGHpO1f8dClkS4MECLCPVe
         KoPA3Wt3Z2rHly9qp2OBsUifputmZdjk1KWJdri2AWbyU3j8cDn27OrvKCW2dfZORuHo
         9zZPEQCds7CHurgUcbkr3mxKhrfH80yqhJwZQz5Gy9fScMSnxlllYGLihE9Qt89fqwRK
         ZTQQ2JQwU7CqPWaXoWQ/oryfXGEjZjP2AAaiTRsDcdD5xcLBznouciKNps+XWm6TJjBa
         WVGPdrfZjHx0+Ep0XYb3MH8pUtvbQUxaQAoKwAIARjW4MKIs7z/ZFV9OHEFhyOC4yBV3
         kBrg==
X-Gm-Message-State: APjAAAVzelDy2vUJiK6sRkAlXXQb83y0G1I/jfgnGxnr2jWkVIrB7G+h
        BOGo9kQ4nebYZQaa1T5KzI9bLA==
X-Google-Smtp-Source: APXvYqzmGHk1eQe6yjfLiJ9M1zJqD+0yMFRge0HAtOBEV4wFDVaXGHcYb6aZtIGQot3A9opzPHqMig==
X-Received: by 2002:ac2:4a89:: with SMTP id l9mr12838966lfp.121.1582108414630;
        Wed, 19 Feb 2020 02:33:34 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id k12sm1003316lfc.33.2020.02.19.02.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 02:33:33 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH 1/3 v3] dt-bindings: clock: Create YAML schema for ICST clocks
Date:   Wed, 19 Feb 2020 11:33:24 +0100
Message-Id: <20200219103326.81120-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The ICST clocks used in the ARM Integrator, Versatile and
RealView platforms are updated to use YAML schema, and two
new ICST clocks used by the Integrator IM-PD1 logical module
are added in the process.

Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Actually merge in the fix fixing the literal |
ChangeLog v1->v2:
- Add a literal | to preserve formatting in the bindings
- Collect Rob's review tag
---
 .../bindings/clock/arm,syscon-icst.yaml       | 103 ++++++++++++++++++
 .../bindings/clock/arm-integrator.txt         |  34 ------
 .../bindings/clock/arm-syscon-icst.txt        |  70 ------------
 3 files changed, 103 insertions(+), 104 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/arm-integrator.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/arm-syscon-icst.txt

diff --git a/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
new file mode 100644
index 000000000000..c5e43e6c9834
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/arm,syscon-icst.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM System Conctroller ICST Clocks
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description: |
+  The ICS525 and ICS307 oscillators are produced by Integrated
+  Devices Technology (IDT). ARM integrated these oscillators deeply into their
+  reference designs by adding special control registers that manage such
+  oscillators to their system controllers.
+
+  The various ARM system controllers contain logic to serialize and initialize
+  an ICST clock request after a write to the 32 bit register at an offset
+  into the system controller. Furthermore, to even be able to alter one of
+  these frequencies, the system controller must first be unlocked by
+  writing a special token to another offset in the system controller.
+
+  Some ARM hardware contain special versions of the serial interface that only
+  connects the low 8 bits of the VDW (missing one bit), hardwires RDW to
+  different values and sometimes also hardwire the output divider. They
+  therefore have special compatible strings as per this table (the OD value is
+  the value on the pins, not the resulting output divider).
+
+  In the core modules and logic tiles, the ICST is a configurable clock fed
+  from a 24 MHz clock on the motherboard (usually the main crystal) used for
+  generating e.g. video clocks. It is located on the core module and there is
+  only one of these. This clock node must be a subnode of the core module.
+
+  Hardware variant         RDW     OD          VDW
+
+  Integrator/AP            22      1           Bit 8 0, rest variable
+  integratorap-cm
+
+  Integrator/AP            46      3           Bit 8 0, rest variable
+  integratorap-sys
+
+  Integrator/AP            22 or   1           17 or (33 or 25 MHz)
+  integratorap-pci         14      1           14
+
+  Integrator/CP            22      variable    Bit 8 0, rest variable
+  integratorcp-cm-core
+
+  Integrator/CP            22      variable    Bit 8 0, rest variable
+  integratorcp-cm-mem
+
+  The ICST oscillator must be provided inside a system controller node.
+
+properties:
+  "#clock-cells":
+    const: 0
+
+  compatible:
+    enum:
+      - arm,syscon-icst525
+      - arm,syscon-icst307
+      - arm,syscon-icst525-integratorap-cm
+      - arm,syscon-icst525-integratorap-sys
+      - arm,syscon-icst525-integratorap-pci
+      - arm,syscon-icst525-integratorcp-cm-core
+      - arm,syscon-icst525-integratorcp-cm-mem
+      - arm,integrator-cm-auxosc
+      - arm,versatile-cm-auxosc
+      - arm,impd-vco1
+      - arm,impd-vco2
+
+  clocks:
+    description: Parent clock for the ICST VCO
+    maxItems: 1
+
+  clock-output-names:
+    maxItems: 1
+
+  lock-offset:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description: Offset to the unlocking register for the oscillator
+
+  vco-offset:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description: Offset to the VCO register for the oscillator
+
+required:
+  - "#clock-cells"
+  - compatible
+  - clocks
+
+examples:
+  - |
+    vco1: clock@00 {
+      compatible = "arm,impd1-vco1";
+      #clock-cells = <0>;
+      lock-offset = <0x08>;
+      vco-offset = <0x00>;
+      clocks = <&sysclk>;
+      clock-output-names = "IM-PD1-VCO1";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/clock/arm-integrator.txt b/Documentation/devicetree/bindings/clock/arm-integrator.txt
deleted file mode 100644
index 11f5f95f571b..000000000000
--- a/Documentation/devicetree/bindings/clock/arm-integrator.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-Clock bindings for ARM Integrator and Versatile Core Module clocks
-
-Auxiliary Oscillator Clock
-
-This is a configurable clock fed from a 24 MHz chrystal,
-used for generating e.g. video clocks. It is located on the
-core module and there is only one of these.
-
-This clock node *must* be a subnode of the core module, since
-it obtains the base address for it's address range from its
-parent node.
-
-
-Required properties:
-- compatible: must be "arm,integrator-cm-auxosc" or "arm,versatile-cm-auxosc"
-- #clock-cells: must be <0>
-
-Optional properties:
-- clocks: parent clock(s)
-
-Example:
-
-core-module@10000000 {
-	xtal24mhz: xtal24mhz@24M {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-		clock-frequency = <24000000>;
-	};
-	auxosc: cm_aux_osc@25M {
-		#clock-cells = <0>;
-		compatible = "arm,integrator-cm-auxosc";
-		clocks = <&xtal24mhz>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt b/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt
deleted file mode 100644
index 4cd81742038f..000000000000
--- a/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt
+++ /dev/null
@@ -1,70 +0,0 @@
-ARM System Controller ICST clocks
-
-The ICS525 and ICS307 oscillators are produced by Integrated Devices
-Technology (IDT). ARM integrated these oscillators deeply into their
-reference designs by adding special control registers that manage such
-oscillators to their system controllers.
-
-The various ARM system controllers contain logic to serialize and initialize
-an ICST clock request after a write to the 32 bit register at an offset
-into the system controller. Furthermore, to even be able to alter one of
-these frequencies, the system controller must first be unlocked by
-writing a special token to another offset in the system controller.
-
-Some ARM hardware contain special versions of the serial interface that only
-connects the low 8 bits of the VDW (missing one bit), hardwires RDW to
-different values and sometimes also hardwire the output divider. They
-therefore have special compatible strings as per this table (the OD value is
-the value on the pins, not the resulting output divider):
-
-Hardware variant:        RDW     OD          VDW
-
-Integrator/AP            22      1           Bit 8 0, rest variable
-integratorap-cm
-
-Integrator/AP            46      3           Bit 8 0, rest variable
-integratorap-sys
-
-Integrator/AP            22 or   1           17 or (33 or 25 MHz)
-integratorap-pci         14      1           14
-
-Integrator/CP            22      variable    Bit 8 0, rest variable
-integratorcp-cm-core
-
-Integrator/CP            22      variable    Bit 8 0, rest variable
-integratorcp-cm-mem
-
-The ICST oscillator must be provided inside a system controller node.
-
-Required properties:
-- compatible: must be one of
-  "arm,syscon-icst525"
-  "arm,syscon-icst307"
-  "arm,syscon-icst525-integratorap-cm"
-  "arm,syscon-icst525-integratorap-sys"
-  "arm,syscon-icst525-integratorap-pci"
-  "arm,syscon-icst525-integratorcp-cm-core"
-  "arm,syscon-icst525-integratorcp-cm-mem"
-- lock-offset: the offset address into the system controller where the
-  unlocking register is located
-- vco-offset: the offset address into the system controller where the
-  ICST control register is located (even 32 bit address)
-- #clock-cells: must be <0>
-- clocks: parent clock, since the ICST needs a parent clock to derive its
-  frequency from, this attribute is compulsory.
-
-Example:
-
-syscon: syscon@10000000 {
-	compatible = "syscon";
-	reg = <0x10000000 0x1000>;
-
-	oscclk0: osc0@c {
-		compatible = "arm,syscon-icst307";
-		#clock-cells = <0>;
-		lock-offset = <0x20>;
-		vco-offset = <0x0c>;
-		clocks = <&xtal24mhz>;
-	};
-	(...)
-};
-- 
2.24.1

