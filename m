Return-Path: <SRS0=kUjg=BQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9D6C4361B
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 11:05:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62E18221E2
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 11:05:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="upLcmO6b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728848AbgHFHtY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Aug 2020 03:49:24 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50380 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728788AbgHFHtR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Aug 2020 03:49:17 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0767mspG108586;
        Thu, 6 Aug 2020 02:48:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596700134;
        bh=mQz77AWFdi3UjjdsG0v0lCQYWub3Idv8f0kCXeTCPRY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=upLcmO6b7ZD1XphOY2IwbRdL0avHcY0fbBbtijrfSsypjWM57ZIfYH9oXEC0B+1wa
         3YXwBTHFwl3uKEgzQcwcrM0JrEscxdRxdAwN2km6zk/2Gc6jXv9BM0Ms3ROU34+n++
         nwtV3rTkk+RZaGdeBPS/+eN6i4WnipzlLhpgM7TU=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0767mskP017928
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 6 Aug 2020 02:48:54 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 6 Aug
 2020 02:48:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 6 Aug 2020 02:48:53 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0767mSYs051454;
        Thu, 6 Aug 2020 02:48:49 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC:     Thomas Gleixner <tglx@linutronix.de>, Nishanth Menon <nm@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 05/13] dt-bindings: irqchip: Convert ti,sci-intr bindings to yaml
Date:   Thu, 6 Aug 2020 13:18:18 +0530
Message-ID: <20200806074826.24607-6-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806074826.24607-1-lokeshvutla@ti.com>
References: <20200806074826.24607-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

In order to automate the verification of DT nodes convert
ti,sci-intr.txt ti,sci-intr.yaml.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 .../interrupt-controller/ti,sci-intr.txt      |  83 --------------
 .../interrupt-controller/ti,sci-intr.yaml     | 102 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 103 insertions(+), 84 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
deleted file mode 100644
index c7046f3da201..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
+++ /dev/null
@@ -1,83 +0,0 @@
-Texas Instruments K3 Interrupt Router
-=====================================
-
-The Interrupt Router (INTR) module provides a mechanism to mux M
-interrupt inputs to N interrupt outputs, where all M inputs are selectable
-to be driven per N output. An Interrupt Router can either handle edge triggered
-or level triggered interrupts and that is fixed in hardware.
-
-                                 Interrupt Router
-                             +----------------------+
-                             |  Inputs     Outputs  |
-        +-------+            | +------+    +-----+  |
-        | GPIO  |----------->| | irq0 |    |  0  |  |       Host IRQ
-        +-------+            | +------+    +-----+  |      controller
-                             |    .           .     |      +-------+
-        +-------+            |    .           .     |----->|  IRQ  |
-        | INTA  |----------->|    .           .     |      +-------+
-        +-------+            |    .        +-----+  |
-                             | +------+    |  N  |  |
-                             | | irqM |    +-----+  |
-                             | +------+             |
-                             |                      |
-                             +----------------------+
-
-There is one register per output (MUXCNTL_N) that controls the selection.
-Configuration of these MUXCNTL_N registers is done by a system controller
-(like the Device Memory and Security Controller on K3 AM654 SoC). System
-controller will keep track of the used and unused registers within the Router.
-Driver should request the system controller to get the range of GIC IRQs
-assigned to the requesting hosts. It is the drivers responsibility to keep
-track of Host IRQs.
-
-Communication between the host processor running an OS and the system
-controller happens through a protocol called TI System Control Interface
-(TISCI protocol). For more details refer:
-Documentation/devicetree/bindings/arm/keystone/ti,sci.txt
-
-TISCI Interrupt Router Node:
-----------------------------
-Required Properties:
-- compatible:		Must be "ti,sci-intr".
-- ti,intr-trigger-type:	Should be one of the following:
-			1: If intr supports edge triggered interrupts.
-			4: If intr supports level triggered interrupts.
-- interrupt-controller:	Identifies the node as an interrupt controller
-- #interrupt-cells:	Specifies the number of cells needed to encode an
-			interrupt source. The value should be 1.
-			First cell should contain interrupt router input number
-			as specified by hardware.
-- ti,sci:		Phandle to TI-SCI compatible System controller node.
-- ti,sci-dev-id:	TISCI device id of interrupt controller.
-- ti,interrupt-ranges:	Set of triplets containing ranges that convert
-			the INTR output interrupt numbers to parent's
-			interrupt number. Each triplet has following entries:
-			- First entry specifies the base for intr output irq
-			- Second entry specifies the base for parent irqs
-			- Third entry specifies the limit
-
-For more details on TISCI IRQ resource management refer:
-https://downloads.ti.com/tisci/esd/latest/2_tisci_msgs/rm/rm_irq.html
-
-Example:
---------
-The following example demonstrates both interrupt router node and the consumer
-node(main gpio) on the AM654 SoC:
-
-main_gpio_intr: interrupt-controller0 {
-	compatible = "ti,sci-intr";
-	ti,intr-trigger-type = <1>;
-	interrupt-controller;
-	interrupt-parent = <&gic500>;
-	#interrupt-cells = <1>;
-	ti,sci = <&dmsc>;
-	ti,sci-dev-id = <131>;
-	ti,interrupt-ranges = <0 360 32>;
-};
-
-main_gpio0: gpio@600000 {
-	...
-	interrupt-parent = <&main_gpio_intr>;
-	interrupts = <192>, <193>, <194>, <195>, <196>, <197>;
-	...
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
new file mode 100644
index 000000000000..cff6a956afb4
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/ti,sci-intr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 Interrupt Router
+
+maintainers:
+  - Lokesh Vutla <lokeshvutla@ti.com>
+
+allOf:
+  - $ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
+
+description: |
+  The Interrupt Router (INTR) module provides a mechanism to mux M
+  interrupt inputs to N interrupt outputs, where all M inputs are selectable
+  to be driven per N output. An Interrupt Router can either handle edge
+  triggered or level triggered interrupts and that is fixed in hardware.
+
+                                   Interrupt Router
+                               +----------------------+
+                               |  Inputs     Outputs  |
+          +-------+            | +------+    +-----+  |
+          | GPIO  |----------->| | irq0 |    |  0  |  |       Host IRQ
+          +-------+            | +------+    +-----+  |      controller
+                               |    .           .     |      +-------+
+          +-------+            |    .           .     |----->|  IRQ  |
+          | INTA  |----------->|    .           .     |      +-------+
+          +-------+            |    .        +-----+  |
+                               | +------+    |  N  |  |
+                               | | irqM |    +-----+  |
+                               | +------+             |
+                               |                      |
+                               +----------------------+
+
+  There is one register per output (MUXCNTL_N) that controls the selection.
+  Configuration of these MUXCNTL_N registers is done by a system controller
+  (like the Device Memory and Security Controller on K3 AM654 SoC). System
+  controller will keep track of the used and unused registers within the Router.
+  Driver should request the system controller to get the range of GIC IRQs
+  assigned to the requesting hosts. It is the drivers responsibility to keep
+  track of Host IRQs.
+
+  Communication between the host processor running an OS and the system
+  controller happens through a protocol called TI System Control Interface
+  (TISCI protocol).
+
+properties:
+  compatible:
+    const: ti,sci-intr
+
+  ti,intr-trigger-type:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 4]
+    description: |
+      Should be one of the following.
+        1 = If intr supports edge triggered interrupts.
+        4 = If intr supports level triggered interrupts.
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+    description: |
+      The 1st cell should contain interrupt router input hw number.
+
+  ti,interrupt-ranges:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description: |
+      Interrupt ranges that converts the INTR output hw irq numbers
+      to parents's input interrupt numbers.
+    items:
+      items:
+        - description: |
+            "output_irq" specifies the base for intr output irq
+        - description: |
+            "parent's input irq" specifies the base for parent irq
+        - description: |
+            "limit" specifies the limit for translation
+
+required:
+  - compatible
+  - ti,intr-trigger-type
+  - interrupt-controller
+  - '#interrupt-cells'
+  - ti,sci
+  - ti,sci-dev-id
+  - ti,interrupt-ranges
+
+examples:
+  - |
+    main_gpio_intr: interrupt-controller0 {
+        compatible = "ti,sci-intr";
+        ti,intr-trigger-type = <1>;
+        interrupt-controller;
+        interrupt-parent = <&gic500>;
+        #interrupt-cells = <1>;
+        ti,sci = <&dmsc>;
+        ti,sci-dev-id = <131>;
+        ti,interrupt-ranges = <0 360 32>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0fdb9a7c5ffd..58d4740b0a9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16992,7 +16992,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/arm/keystone/ti,sci.txt
 F:	Documentation/devicetree/bindings/clock/ti,sci-clk.txt
 F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
-F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
+F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
 F:	Documentation/devicetree/bindings/reset/ti,sci-reset.txt
 F:	Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
 F:	drivers/clk/keystone/sci-clk.c
-- 
2.27.0

