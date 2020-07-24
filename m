Return-Path: <SRS0=+aE9=BD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5163C433E5
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 14:19:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA91420771
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 14:19:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="y0p7YFOE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgGXOTS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jul 2020 10:19:18 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:52836 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbgGXOTS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 Jul 2020 10:19:18 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06OEJ9EI085824;
        Fri, 24 Jul 2020 09:19:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595600349;
        bh=ySDOgR+TRieaajREoJWBAXU3/FvT7EVF5medEHHe87E=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=y0p7YFOEP44zJ+fqREszCqvKhTt3su6KfPzRTLHVK06aUWUn7dmctpr4R1VDxMHgs
         pQjeryNlHZmZ6jwOOhhe4MN7Y7KI8GP9TKphGjUucSgs6zqvNIqPiEivvOsD9YLhSM
         XXfdp8pRd8kniK7GI+5jVbBlFryg0PL42686lsMk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06OEJ9C6021764
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Jul 2020 09:19:09 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 24
 Jul 2020 09:19:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 24 Jul 2020 09:19:09 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06OEIiXt016316;
        Fri, 24 Jul 2020 09:19:05 -0500
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
        Suman Anna <s-anna@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v3 5/9] dt-bindings: irqchip: Convert ti,sci-intr bindings to yaml
Date:   Fri, 24 Jul 2020 19:48:33 +0530
Message-ID: <20200724141837.4542-6-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200724141837.4542-1-lokeshvutla@ti.com>
References: <20200724141837.4542-1-lokeshvutla@ti.com>
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
index 8b56b2de1c73..000000000000
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
-http://downloads.ti.com/tisci/esd/latest/2_tisci_msgs/rm/rm_irq.html
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
index 000000000000..f7a3e51a5212
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
+      - items:
+          items:
+            - description: |
+                "output_irq" specifies the base for intr output irq
+            - description: |
+                "parent's input irq" specifies the base for parent irq
+            - description: |
+                "limit" specifies the limit for translation
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
index ba3474e1ce6a..28a8eba81d2b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16908,7 +16908,7 @@ F:	Documentation/devicetree/bindings/arm/keystone/ti,k3-sci-common.yaml
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

