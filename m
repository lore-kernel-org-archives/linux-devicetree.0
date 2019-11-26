Return-Path: <SRS0=scSd=ZS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9BFC432C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 09:54:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 91AF72075C
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 09:54:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="J1PGJIhy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbfKZJyf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 Nov 2019 04:54:35 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54172 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727397AbfKZJyf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 Nov 2019 04:54:35 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAQ9sQSK125792;
        Tue, 26 Nov 2019 03:54:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574762067;
        bh=iZYF62+IqF0GWydEuUcLGVvt3vdEsHDmf+YVohUaR3U=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=J1PGJIhyy4Iqm7jEAsLrb0KVBvEZ9DzoplV7SZBMdB3+0Gj0TTPuLyJKPcLqfA3ZE
         vs4RLOFlt4GnaLbES+d6VLW0eew3PNProl8ro9T+qk0VIoxkYYzzdaJZOVh2JZhonT
         WN5Tayam3WCT+awX/BGVctfDiiY5C6xtOYn7a7UI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAQ9sQLL086600
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 26 Nov 2019 03:54:26 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 26
 Nov 2019 03:54:25 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 26 Nov 2019 03:54:25 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAQ9sMif046628;
        Tue, 26 Nov 2019 03:54:23 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <bparrot@ti.com>, <subhajit_paul@ti.com>,
        <praneeth@ti.com>, <yamonkar@cadence.com>, <sjakhade@cadence.com>,
        <robh+dt@kernel.org>
Subject: [PATCH 1/5] dt-bindings: display: ti,k2g-dss: Add dt-schema yaml binding
Date:   Tue, 26 Nov 2019 11:54:20 +0200
Message-ID: <07443300166218f78e041ada7ca87d445bdcb842.1574760777.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1574760777.git.jsarha@ti.com>
References: <cover.1574760777.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add dt-schema yaml bindig for K2G DSS, an ultra-light version of TI
Keystone Display SubSystem.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 .../bindings/display/ti/ti,k2g-dss.yaml       | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml

diff --git a/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
new file mode 100644
index 000000000000..2d92dea1c411
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
@@ -0,0 +1,97 @@
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
+    minItems: 5
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
+    minItems: 2
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
+  port@0:
+    type: object
+    description:
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
+  - port@0
+
+additionalProperties: false
+
+examples:
+  - |
+        dss: dss@02540000 {
+                compatible = "ti,k2g-dss";
+                reg =   <0x02540000 0x400>,
+                        <0x02550000 0x1000>,
+                        <0x02557000 0x1000>,
+                        <0x0255a800 0x100>,
+                        <0x0255ac00 0x100>;
+                reg-names = "cfg", "common", "vid1", "ovr1", "vp1";
+                clocks =        <&k2g_clks 0x2 0>,
+                                <&k2g_clks 0x2 1>;
+                clock-names = "fck", "vp1";
+                interrupts = <GIC_SPI 247 IRQ_TYPE_EDGE_RISING>;
+
+                power-domains = <&k2g_pds 0x2>;
+                status = "disabled";
+
+                max-memory-bandwidth = <230000000>;
+                port {
+                        dpi_out: endpoint {
+                                remote-endpoint = <&sii9022_in>;
+                        };
+                };
+        };
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

