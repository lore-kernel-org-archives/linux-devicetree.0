Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2618C2D0D2
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 08:23:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8512F2465E
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 08:23:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Oq7g6zyI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbfLSIX7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 03:23:59 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:53706 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfLSIX7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 03:23:59 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBJ8NQ3T036225;
        Thu, 19 Dec 2019 02:23:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576743806;
        bh=4SdVxjR+zOM6VA8t/16WqwKT6bljtLTGX5bR3GE62pE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Oq7g6zyIZZckXEI1APgeRQJaYzjlnFkpxPQ1BiN9t+HhM94OBsVrYg9rmDFJPHkqt
         tJoIVfIjh1DxJBMJGk5ZkpWJg4sK7ZGYeHjFy/LChnGvQMSHEsAMg3uXC6acScen3b
         fmtmNFyKgCTw0yOG6pFIeO/RUSkE/fFwcO0fDqqU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBJ8NQcL086477
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Dec 2019 02:23:26 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Dec 2019 02:23:25 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Dec 2019 02:23:25 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBJ8NJI5095098;
        Thu, 19 Dec 2019 02:23:23 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <bparrot@ti.com>, <subhajit_paul@ti.com>,
        <praneeth@ti.com>, <yamonkar@cadence.com>, <sjakhade@cadence.com>,
        <sam@ravnborg.org>, <robh+dt@kernel.org>, <maxime@cerno.tech>
Subject: [PATCH v4 1/5] dt-bindings: display: ti,k2g-dss: Add dt-schema yaml binding
Date:   Thu, 19 Dec 2019 10:23:15 +0200
Message-ID: <f50bdabe4ef9c57b516620d826875d81586722a1.1576704528.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1576704528.git.jsarha@ti.com>
References: <cover.1576704528.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add dt-schema yaml bindig for K2G DSS, an ultra-light version of TI
Keystone Display SubSystem.

Version history:

v2: no change

v3: - Add ports node
    - Add includes to dts example
    - reindent dts example

v4: - Add descriptions to reg and clocks properties
    - Remove minItems when its value is the same as maxItems value
    - Remove ports node

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 .../bindings/display/ti/ti,k2g-dss.yaml       | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml

diff --git a/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
new file mode 100644
index 000000000000..17d27ed84bc0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/ti/ti,k2g-dss.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Texas Instruments K2G Display Subsystem
+
+maintainers:
+  - Jyri Sarha <jsarha@ti.com>
+  - Tomi Valkeinen <tomi.valkeinen@ti.com>
+
+description: |
+  The K2G DSS is an ultra-light version of TI Keystone Display
+  SubSystem. It has only one output port and video plane. The
+  output is DPI.
+
+properties:
+  compatible:
+    const: ti,k2g-dss
+
+  reg:
+    maxItems: 5
+    description: |
+      Addresses to each DSS memory region described in the SoC's TRM.
+      The reg-names refer to memory regions as follows:
+      reg-names: Region Name in TRM:  Description:
+      cfg        DSSUL_0_CFG          DSS top level
+      common     DISPC_COMMON         DISPC common
+      vid1       DISPC_VID1           VID1 video plane
+      ovr1       DISPC_OVR1           OVR1 overlay manager for vp1
+      vp1        DISPC_VP1            VP1 video port 1
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: common
+      - const: vid1
+      - const: ovr1
+      - const: vp1
+
+  clocks:
+    maxItems: 2
+    description:
+      phandles to clock nodes for DSS functional clock (fck) and video
+      port 1 pixel clock (vp1).
+
+  clock-names:
+    items:
+      - const: fck
+      - const: vp1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+    description: phandle to the associated power domain
+
+  port:
+    type: object
+    description:
+      Port as described in Documentation/devictree/bindings/graph.txt.
+      The DSS DPI output port node
+
+  max-memory-bandwidth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Input memory (from main memory to dispc) bandwidth limit in
+      bytes per second
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    dss: dss@02540000 {
+            compatible = "ti,k2g-dss";
+            reg =   <0x02540000 0x400>,
+                    <0x02550000 0x1000>,
+                    <0x02557000 0x1000>,
+                    <0x0255a800 0x100>,
+                    <0x0255ac00 0x100>;
+            reg-names = "cfg", "common", "vid1", "ovr1", "vp1";
+            clocks =        <&k2g_clks 0x2 0>,
+                            <&k2g_clks 0x2 1>;
+            clock-names = "fck", "vp1";
+            interrupts = <GIC_SPI 247 IRQ_TYPE_EDGE_RISING>;
+
+            power-domains = <&k2g_pds 0x2>;
+
+            max-memory-bandwidth = <230000000>;
+            ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    port@0 {
+                            dpi_out: endpoint {
+                                    remote-endpoint = <&sii9022_in>;
+                            };
+                    };
+            };
+    };
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

