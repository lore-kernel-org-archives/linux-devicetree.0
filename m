Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4A7C433F2
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 05:18:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 091822177B
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 05:18:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mY893MC0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgG1FSW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 01:18:22 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33718 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbgG1FSW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jul 2020 01:18:22 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06S5IE0e042283;
        Tue, 28 Jul 2020 00:18:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595913494;
        bh=W5xZYI6vyxJqUD1ck4+P3MLqytBntNZ5CKNCidc/Ux8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=mY893MC0ENbZ9LPSqKYCaFJtsOdFgV4gboyZPcUPk2KQu4kQBNRTSyOiJh+me4TWJ
         dLSo79NnXYpfYhgtSr+0FvQL2LGhbh+76tFq4gYFmPRls+g4y8q+FhTroigUWHc2ci
         cxKC7h2A9HlJAvLvX1Ho7paOl2qu+mFPqZjXx2gs=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06S5IEmb073501
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 Jul 2020 00:18:14 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 28
 Jul 2020 00:18:14 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 28 Jul 2020 00:18:14 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06S5Hat2005947;
        Tue, 28 Jul 2020 00:18:10 -0500
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
Subject: [PATCH v5 08/10] dt-bindings: irqchip: Convert ti,sci-inta bindings to yaml
Date:   Tue, 28 Jul 2020 10:47:33 +0530
Message-ID: <20200728051735.6187-9-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728051735.6187-1-lokeshvutla@ti.com>
References: <20200728051735.6187-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

In order to automate the verification of DT nodes convert
ti,sci-inta.txt ti,sci-inta.yaml.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 .../interrupt-controller/ti,sci-inta.txt      | 66 -------------
 .../interrupt-controller/ti,sci-inta.yaml     | 98 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 99 insertions(+), 67 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
deleted file mode 100644
index b14abec580a2..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
+++ /dev/null
@@ -1,66 +0,0 @@
-Texas Instruments K3 Interrupt Aggregator
-=========================================
-
-The Interrupt Aggregator (INTA) provides a centralized machine
-which handles the termination of system events to that they can
-be coherently processed by the host(s) in the system. A maximum
-of 64 events can be mapped to a single interrupt.
-
-
-                              Interrupt Aggregator
-                     +-----------------------------------------+
-                     |      Intmap            VINT             |
-                     | +--------------+  +------------+        |
-            m ------>| | vint  | bit  |  | 0 |.....|63| vint0  |
-               .     | +--------------+  +------------+        |       +------+
-               .     |         .               .               |       | HOST |
-Globalevents  ------>|         .               .               |------>| IRQ  |
-               .     |         .               .               |       | CTRL |
-               .     |         .               .               |       +------+
-            n ------>| +--------------+  +------------+        |
-                     | | vint  | bit  |  | 0 |.....|63| vintx  |
-                     | +--------------+  +------------+        |
-                     |                                         |
-                     +-----------------------------------------+
-
-Configuration of these Intmap registers that maps global events to vint is done
-by a system controller (like the Device Memory and Security Controller on K3
-AM654 SoC). Driver should request the system controller to get the range
-of global events and vints assigned to the requesting host. Management
-of these requested resources should be handled by driver and requests
-system controller to map specific global event to vint, bit pair.
-
-Communication between the host processor running an OS and the system
-controller happens through a protocol called TI System Control Interface
-(TISCI protocol). For more details refer:
-Documentation/devicetree/bindings/arm/keystone/ti,sci.txt
-
-TISCI Interrupt Aggregator Node:
--------------------------------
-- compatible:		Must be "ti,sci-inta".
-- reg:			Should contain registers location and length.
-- interrupt-controller:	Identifies the node as an interrupt controller
-- msi-controller:	Identifies the node as an MSI controller.
-- interrupt-parent:	phandle of irq parent.
-- ti,sci:		Phandle to TI-SCI compatible System controller node.
-- ti,sci-dev-id:	TISCI device id of interrupt controller.
-- ti,interrupt-ranges:	Set of triplets containing ranges that convert
-			the INTA output interrupt numbers to parent's
-			interrupt number. Each triplet has following entries:
-			- First entry specifies the base for vint
-			- Second entry specifies the base for parent irqs
-			- Third entry specifies the limit
-
-
-Example:
---------
-main_udmass_inta: interrupt-controller@33d00000 {
-	compatible = "ti,sci-inta";
-	reg = <0x0 0x33d00000 0x0 0x100000>;
-	interrupt-controller;
-	msi-controller;
-	interrupt-parent = <&main_navss_intr>;
-	ti,sci = <&dmsc>;
-	ti,sci-dev-id = <179>;
-	ti,interrupt-ranges = <0 0 256>;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml
new file mode 100644
index 000000000000..c7cd05656a3e
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/ti,sci-inta.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 Interrupt Aggregator
+
+maintainers:
+  - Lokesh Vutla <lokeshvutla@ti.com>
+
+allOf:
+  - $ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
+
+description: |
+  The Interrupt Aggregator (INTA) provides a centralized machine
+  which handles the termination of system events to that they can
+  be coherently processed by the host(s) in the system. A maximum
+  of 64 events can be mapped to a single interrupt.
+
+                                Interrupt Aggregator
+                       +-----------------------------------------+
+                       |      Intmap            VINT             |
+                       | +--------------+  +------------+        |
+              m ------>| | vint  | bit  |  | 0 |.....|63| vint0  |
+                 .     | +--------------+  +------------+        |      +------+
+                 .     |         .               .               |      | HOST |
+  Globalevents  ------>|         .               .               |----->| IRQ  |
+                 .     |         .               .               |      | CTRL |
+                 .     |         .               .               |      +------+
+              n ------>| +--------------+  +------------+        |
+                       | | vint  | bit  |  | 0 |.....|63| vintx  |
+                       | +--------------+  +------------+        |
+                       |                                         |
+                       +-----------------------------------------+
+
+  Configuration of these Intmap registers that maps global events to vint is
+  done by a system controller (like the Device Memory and Security Controller
+  on AM654 SoC). Driver should request the system controller to get the range
+  of global events and vints assigned to the requesting host. Management
+  of these requested resources should be handled by driver and requests
+  system controller to map specific global event to vint, bit pair.
+
+  Communication between the host processor running an OS and the system
+  controller happens through a protocol called TI System Control Interface
+  (TISCI protocol).
+
+properties:
+  compatible:
+    const: ti,sci-inta
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  msi-controller: true
+
+  ti,interrupt-ranges:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description: |
+      Interrupt ranges that converts the INTA output hw irq numbers
+      to parents's input interrupt numbers.
+    items:
+      items:
+        - description: |
+            "output_irq" specifies the base for inta output irq
+        - description: |
+            "parent's input irq" specifies the base for parent irq
+        - description: |
+            "limit" specifies the limit for translation
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - msi-controller
+  - ti,sci
+  - ti,sci-dev-id
+  - ti,interrupt-ranges
+
+examples:
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        main_udmass_inta: msi-controller@33d00000 {
+            compatible = "ti,sci-inta";
+            reg = <0x0 0x33d00000 0x0 0x100000>;
+            interrupt-controller;
+            msi-controller;
+            interrupt-parent = <&main_navss_intr>;
+            ti,sci = <&dmsc>;
+            ti,sci-dev-id = <179>;
+            ti,interrupt-ranges = <0 0 256>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index bc88886c05c6..759318d41faf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16918,7 +16918,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/arm/keystone/ti,k3-sci-common.yaml
 F:	Documentation/devicetree/bindings/arm/keystone/ti,sci.txt
 F:	Documentation/devicetree/bindings/clock/ti,sci-clk.txt
-F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
+F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
 F:	Documentation/devicetree/bindings/reset/ti,sci-reset.txt
 F:	Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
-- 
2.27.0

