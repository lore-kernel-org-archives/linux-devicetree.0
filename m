Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC98C35655
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 12:11:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D414207FD
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 12:11:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgBUMLw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 07:11:52 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:41996 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726909AbgBUMLv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Feb 2020 07:11:51 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id 5QBo2200M5USYZQ01QBo1q; Fri, 21 Feb 2020 13:11:48 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j579o-0001zN-F8; Fri, 21 Feb 2020 13:11:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j579o-00087C-Da; Fri, 21 Feb 2020 13:11:48 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: reset: rcar-rst: Convert to json-schema
Date:   Fri, 21 Feb 2020 13:11:46 +0100
Message-Id: <20200221121146.31153-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Convert the Renesas R-Car Reset Controller Device Tree binding
documentation to json-schema.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/reset/renesas,rst.txt | 48 ---------------
 .../bindings/reset/renesas,rst.yaml           | 61 +++++++++++++++++++
 2 files changed, 61 insertions(+), 48 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reset/renesas,rst.txt
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rst.yaml

diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.txt b/Documentation/devicetree/bindings/reset/renesas,rst.txt
deleted file mode 100644
index de7f06ccd003da9f..0000000000000000
--- a/Documentation/devicetree/bindings/reset/renesas,rst.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-DT bindings for the Renesas R-Car and RZ/G Reset Controllers
-
-The R-Car and RZ/G Reset Controllers provide reset control, and implement the
-following functions:
-  - Latching of the levels on mode pins when PRESET# is negated,
-  - Mode monitoring register,
-  - Reset control of peripheral devices (on R-Car Gen1),
-  - Watchdog timer (on R-Car Gen1),
-  - Register-based reset control and boot address registers for the various CPU
-    cores (on R-Car Gen2 and Gen3, and on RZ/G).
-
-
-Required properties:
-  - compatible: Should be
-		  - "renesas,<soctype>-reset-wdt" for R-Car Gen1,
-		  - "renesas,<soctype>-rst" for R-Car Gen2 and Gen3, and RZ/G
-		Examples with soctypes are:
-		  - "renesas,r8a7743-rst" (RZ/G1M)
-		  - "renesas,r8a7744-rst" (RZ/G1N)
-		  - "renesas,r8a7745-rst" (RZ/G1E)
-		  - "renesas,r8a77470-rst" (RZ/G1C)
-		  - "renesas,r8a774a1-rst" (RZ/G2M)
-		  - "renesas,r8a774b1-rst" (RZ/G2N)
-		  - "renesas,r8a774c0-rst" (RZ/G2E)
-		  - "renesas,r8a7778-reset-wdt" (R-Car M1A)
-		  - "renesas,r8a7779-reset-wdt" (R-Car H1)
-		  - "renesas,r8a7790-rst" (R-Car H2)
-		  - "renesas,r8a7791-rst" (R-Car M2-W)
-		  - "renesas,r8a7792-rst" (R-Car V2H
-		  - "renesas,r8a7793-rst" (R-Car M2-N)
-		  - "renesas,r8a7794-rst" (R-Car E2)
-		  - "renesas,r8a7795-rst" (R-Car H3)
-		  - "renesas,r8a7796-rst" (R-Car M3-W)
-		  - "renesas,r8a77961-rst" (R-Car M3-W+)
-		  - "renesas,r8a77965-rst" (R-Car M3-N)
-		  - "renesas,r8a77970-rst" (R-Car V3M)
-		  - "renesas,r8a77980-rst" (R-Car V3H)
-		  - "renesas,r8a77990-rst" (R-Car E3)
-		  - "renesas,r8a77995-rst" (R-Car D3)
-  - reg: Address start and address range for the device.
-
-
-Example:
-
-	rst: reset-controller@e6160000 {
-		compatible = "renesas,r8a7795-rst";
-		reg = <0 0xe6160000 0 0x0200>;
-	};
diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.yaml b/Documentation/devicetree/bindings/reset/renesas,rst.yaml
new file mode 100644
index 0000000000000000..5819eebfca064dff
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/renesas,rst.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/reset/renesas,rst.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: DT bindings for the Renesas R-Car and RZ/G Reset Controller
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+  - Magnus Damm <magnus.damm@gmail.com>
+
+description: |
+  The R-Car and RZ/G Reset Controllers provide reset control, and implement the
+  following functions:
+    - Latching of the levels on mode pins when PRESET# is negated,
+    - Mode monitoring register,
+    - Reset control of peripheral devices (on R-Car Gen1),
+    - Watchdog timer (on R-Car Gen1),
+    - Register-based reset control and boot address registers for the various
+      CPU cores (on R-Car Gen2 and Gen3, and on RZ/G).
+
+properties:
+  compatible:
+    enum:
+      - renesas,r8a7743-rst       # RZ/G1M
+      - renesas,r8a7744-rst       # RZ/G1N
+      - renesas,r8a7745-rst       # RZ/G1E
+      - renesas,r8a77470-rst      # RZ/G1C
+      - renesas,r8a774a1-rst      # RZ/G2M
+      - renesas,r8a774b1-rst      # RZ/G2N
+      - renesas,r8a774c0-rst      # RZ/G2E
+      - renesas,r8a7778-reset-wdt # R-Car M1A
+      - renesas,r8a7779-reset-wdt # R-Car H1
+      - renesas,r8a7790-rst       # R-Car H2
+      - renesas,r8a7791-rst       # R-Car M2-W
+      - renesas,r8a7792-rst       # R-Car V2H
+      - renesas,r8a7793-rst       # R-Car M2-N
+      - renesas,r8a7794-rst       # R-Car E2
+      - renesas,r8a7795-rst       # R-Car H3
+      - renesas,r8a7796-rst       # R-Car M3-W
+      - renesas,r8a77961-rst      # R-Car M3-W+
+      - renesas,r8a77965-rst      # R-Car M3-N
+      - renesas,r8a77970-rst      # R-Car V3M
+      - renesas,r8a77980-rst      # R-Car V3H
+      - renesas,r8a77990-rst      # R-Car E3
+      - renesas,r8a77995-rst      # R-Car D3
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    rst: reset-controller@e6160000 {
+            compatible = "renesas,r8a7795-rst";
+            reg = <0xe6160000 0x0200>;
+    };
-- 
2.17.1

