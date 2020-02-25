Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015BBC35DF5
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 08:46:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C3CFB21556
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 08:46:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tc2wyHca"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729602AbgBYIqs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 03:46:48 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45450 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729268AbgBYIqs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 03:46:48 -0500
Received: by mail-lf1-f68.google.com with SMTP id z5so9082447lfd.12
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 00:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ji5ThX1t7zzSi29cg8ZAEzsh1rFQY4uar1iBKcM01lk=;
        b=tc2wyHcaW9HgxrHD+5mKGYsnJJiEMtxe7k2tX6v6Z0G/QY/wwK157cj8eE7gRxksc8
         b6rl4xdft0pcJrSciea0zho+7luhU5i9W/aVNtH8fBmw3OZ6B5ebBQR5Y3eGUSAc7QmD
         WWPgMDOLwR34qBFw2SsLCENbXHRUjM176jRBhmbvs7/p7F9mkASDhGPLhr/QkDt46zZ7
         zpooL6DFNfwoLY0JYXCBYKMLdtvFfe8I3Vu9VAyXVu1faiIX7lZJwPP0ceF8kHwOb9wE
         MQulTudOo2kcMpcKr/Azr06upFCV+/Ir2xt5gpPwIh6orRbtievZrCKa7JzuwMgdePht
         SdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ji5ThX1t7zzSi29cg8ZAEzsh1rFQY4uar1iBKcM01lk=;
        b=W0NKzekLrH5tAZiTJGIG7NaQTiZ6sb6nSLq/7h/K865FJBz0jo5jZBWGnvw+5AnTFi
         juxVrSjYdAu//KkgtdEvmJxbgdXtDGAa7ki6pMq1HeyzX/t3ICEW3XV/HVGWVrOnmttW
         CmS4XRlA75Dvxw+2+IwLcBNclLqXBT79G8g04wBpKi28mtnu0tp4Y2a+J1edUrvWynJI
         r93vBqvnKK3CcPr69Q5JPdwXvIVknGV3k7IY9cEzLwHLv6Ob6yHD5R+5gP3f4ZDH+I6g
         hujbNvORO0Lp8znomkksmvgKGmPRTIyPTnTfPTH6tSbHO78C44fxloTC2SPiFvZfrI3m
         iWAw==
X-Gm-Message-State: APjAAAV8fNmmzOS1fux2rPlfrtrPMoCVv2xyg6q3zCBCP4z2uP2ed5uY
        3NKDYRkuV49h0b4wbnEGFvhtwg==
X-Google-Smtp-Source: APXvYqwJIv7Veg9B5qtlSLgtK3Re7toEBcp6K8WmBbeHtlK15HjWnSP85FSbL3Eb8qhklAno6LctdQ==
X-Received: by 2002:a19:691e:: with SMTP id e30mr11085671lfc.104.1582620405159;
        Tue, 25 Feb 2020 00:46:45 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id e8sm8957251ljb.45.2020.02.25.00.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 00:46:44 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 4/5 v2] dt-bindings: arm: Add Versatile Express and Juno YAML schema
Date:   Tue, 25 Feb 2020 09:46:26 +0100
Message-Id: <20200225084627.24825-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200225084627.24825-1-linus.walleij@linaro.org>
References: <20200225084627.24825-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This implements the top-level schema for the ARM Versatile
Express and Juno platforms.

Cc: Sudeep Holla <sudeep.holla@arm.com>
Acked-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Add missing platforms: VE RTSM, FVP, foundation model
- Properly define the arm,vexpress,site arm,vexpress,position
  and arm,vexpress,dcc attributes. Maybe these are not the most
  elegant bindings but they are used so we need to contain it
  properly.
- Add a patternProperty for the SMB (Static Memory Bus) which
  was only described in text in the Vexpress bindings. It is a
  "simple-bus" so just reference the existing bindings.
- Define the layout of the "motherboard" node sometimes but
  not always found below the SMB node, using two address-cells
  with one for chipselect.
- Make the arm,hbi property required on the ARMv7 variants.
---
 .../bindings/arm/arm,vexpress-juno.yaml       | 212 ++++++++++++++++++
 1 file changed, 212 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml

diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
new file mode 100644
index 000000000000..0aa21e86a873
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
@@ -0,0 +1,212 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,vexpress-juno.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Versatile Express and Juno Boards Device Tree Bindings
+
+maintainers:
+  - Sudeep Holla <sudeep.holla@arm.com>
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |+
+  ARM's Versatile Express platform were built as reference designs for exploring
+  multicore Cortex-A class systems. The Versatile Express family contains both
+  32 bit (Aarch32) and 64 bit (Aarch64) systems.
+
+  The board consist of a motherboard and one or more daughterboards (tiles). The
+  motherboard provides a set of peripherals. Processor and RAM "live" on the
+  tiles.
+
+  The motherboard and each core tile should be described by a separate Device
+  Tree source file, with the tile's description including the motherboard file
+  using an include directive. As the motherboard can be initialized in one of
+  two different configurations ("memory maps"), care must be taken to include
+  the correct one.
+
+  When a new generation of boards were introduced under the name "Juno", these
+  shared to many common characteristics with the Versatile Express that the
+  "arm,vexpress" compatible was retained in the root node, and these are
+  included in this binding schema as well.
+
+  The root node indicates the CPU SoC on the core tile, and this
+  is a daughterboard to the main motherboard. The name used in the compatible
+  string shall match the name given in the core tile's technical reference
+  manual, followed by "arm,vexpress" as an additional compatible value. If
+  further subvariants are released of the core tile, even more fine-granular
+  compatible strings with up to three compatible strings are used.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: CoreTile Express A9x4 (V2P-CA9) has 4 Cortex A9 CPU cores
+          in MPCore configuration in a test chip on the core tile. See ARM
+          DUI 0448I. This was the first Versatile Express platform.
+        items:
+          - const: arm,vexpress,v2p-ca9
+          - const: arm,vexpress
+      - description: CoreTile Express A5x2 (V2P-CA5s) has 2 Cortex A5 CPU cores
+          in a test chip on the core tile. It is intended to evaluate NEON, FPU
+          and Jazelle support in the Cortex A5 family. See ARM DUI 0541C.
+        items:
+          - const: arm,vexpress,v2p-ca5s
+          - const: arm,vexpress
+      - description: Coretile Express A15x2 (V2P-CA15) has 2 Cortex A15 CPU
+          cores in a MPCore configuration in a test chip on the core tile. See
+          ARM DUI 0604F.
+        items:
+          - const: arm,vexpress,v2p-ca15
+          - const: arm,vexpress
+      - description: CoreTile Express A15x4 (V2P-CA15, HBI-0237A) has 4 Cortex
+          A15 CPU cores in a test chip on the core tile. This is the first test
+          chip called "TC1".
+        items:
+          - const: arm,vexpress,v2p-ca15,tc1
+          - const: arm,vexpress,v2p-ca15
+          - const: arm,vexpress
+      - description: Coretile Express A15x2 A7x3 (V2P-CA15_A7) has 2 Cortex A15
+          CPU cores and 3 Cortex A7 cores in a big.LITTLE MPCore configuration
+          in a test chip on the core tile. See ARM DDI 0503I.
+        items:
+          - const: arm,vexpress,v2p-ca15_a7
+          - const: arm,vexpress
+      - description: LogicTile Express 20MG (V2F-1XV7) has 2 Cortex A53 CPU
+          cores in a test chip on the core tile. See ARM DDI 0498D.
+        items:
+          - const: arm,vexpress,v2f-1xv7,ca53x2
+          - const: arm,vexpress,v2f-1xv7
+          - const: arm,vexpress
+      - description: Arm Versatile Express Juno "r0" (the first Juno board,
+          V2M-Juno) was introduced as a vehicle for evaluating big.LITTLE on
+          AArch64 CPU cores. It has 2 Cortex A57 CPU cores and 4 Cortex A53
+          cores in a big.LITTLE configuration. It also features the MALI T624
+          GPU. See ARM document 100113_0000_07_en.
+        items:
+          - const: arm,juno
+          - const: arm,vexpress
+      - description: Arm Versatile Express Juno r1 Development Platform
+          (V2M-Juno r1) was introduced mainly aimed at development of PCIe
+          based systems. Juno r1 also has support for AXI masters placed on
+          the TLX connectors to join the coherency domain. Otherwise it is the
+          same configuration as Juno r0. See ARM document 100122_0100_06_en.
+        items:
+          - const: arm,juno-r1
+          - const: arm,juno
+          - const: arm,vexpress
+      - description: Arm Versatile Express Juno r2 Development Platform
+          (V2M-Juno r2). It has the same feature set as Juno r0 and r1. See
+          ARM document 100114_0200_04_en.
+        items:
+          - const: arm,juno-r2
+          - const: arm,juno
+          - const: arm,vexpress
+      - description: Arm AEMv8a Versatile Express Real-Time System Model
+          (VE RTSM) is a programmers view of the Versatile Express with Arm
+          v8A hardware. See ARM DUI 0575D.
+        items:
+          - const: arm,rtsm_ve,aemv8a
+          - const: arm,vexpress
+      - description: Arm FVP (Fixed Virtual Platform) base model revision C
+          See ARM Document 100964_1190_00_en.
+        items:
+          - const: arm,fvp-base-revc
+          - const: arm,vexpress
+      - description: Arm Foundation model for Aarch64
+        items:
+          - const: arm,foundation-aarch64
+          - const: arm,vexpress
+
+  arm,hbi:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description: This indicates the ARM HBI (Hardware Board ID), this is
+      ARM's unique board model ID, visible on the PCB's silkscreen.
+
+  arm,vexpress,site:
+    description: As Versatile Express can be configured in number of physically
+      different setups, the device tree should describe platform topology.
+      For this reason the root node and main motherboard node must define this
+      property, describing the physical location of the children nodes.
+      0 means motherboard site, while 1 and 2 are daughterboard sites, and
+      0xf means "sisterboard" which is the site containing the main CPU tile.
+    allOf:
+      - $ref: '/schemas/types.yaml#/definitions/uint32'
+      - minimum: 0
+      - maximum: 15
+
+  arm,vexpress,position:
+    description: When daughterboards are stacked on one site, their position
+      in the stack be be described this attribute.
+    allOf:
+      - $ref: '/schemas/types.yaml#/definitions/uint32'
+      - minimum: 0
+      - maximum: 3
+
+  arm,vexpress,dcc:
+    description: When describing tiles consisting of more than one DCC, its
+      number can be specified with this attribute.
+    allOf:
+      - $ref: '/schemas/types.yaml#/definitions/uint32'
+      - minimum: 0
+      - maximum: 3
+
+patternProperties:
+  "^smb@[0-9a-f]+$":
+    description: Static Memory Bus (SMB) node, if this exists it describes
+      the connection between the motherboard and any tiles.
+    type: object
+
+    properties:
+      compatible:
+        $ref: '/schemas/simple-bus.yaml'
+      motherboard:
+        type: object
+        description: The motherboard description provides a single "motherboard"
+          node using 2 address cells corresponding to the Static Memory Bus
+          used between the motherboard and the tile. The first cell defines the
+          Chip Select (CS) line number, the second cell address offset within
+          the CS. All interrupt lines between the motherboard and the tile
+          are active high and are described using single cell.
+        properties:
+          "#address-cells":
+            const: 2
+          "#size-cells":
+            const: 1
+          compatible:
+            oneOf:
+              - items:
+                - const: arm,vexpress,v2m-p1
+                - const: simple-bus
+              - items:
+                - const: arm,vexpress,v2p-p1
+                - const: simple-bus
+          arm,v2m-memory-map:
+            description: This describes the memory map type.
+            allOf:
+              - $ref: '/schemas/types.yaml#/definitions/string'
+              - enum:
+                - rs1
+                - rs2
+        required:
+          - compatible
+    required:
+      - compatible
+
+allOf:
+  - if:
+     properties:
+       compatible:
+         contains:
+           enum:
+             - arm,vexpress,v2p-ca9
+             - arm,vexpress,v2p-ca5s
+             - arm,vexpress,v2p-ca15
+             - arm,vexpress,v2p-ca15_a7
+             - arm,vexpress,v2f-1xv7,ca53x2
+    then:
+      required:
+        - arm,hbi
+
+...
-- 
2.24.1

