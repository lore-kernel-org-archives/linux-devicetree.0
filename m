Return-Path: <SRS0=kxJ0=ZX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D18C432C0
	for <linux-devicetree@archiver.kernel.org>; Sun,  1 Dec 2019 13:49:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 91F66206E4
	for <linux-devicetree@archiver.kernel.org>; Sun,  1 Dec 2019 13:49:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AP8lqIl6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbfLANtm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 1 Dec 2019 08:49:42 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55888 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbfLANtm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 1 Dec 2019 08:49:42 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB1DnaHp039061;
        Sun, 1 Dec 2019 07:49:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575208176;
        bh=iZYF62+IqF0GWydEuUcLGVvt3vdEsHDmf+YVohUaR3U=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=AP8lqIl6gZVlrUQ6DoMEPpwMSGoPeqZqygOHYIiRPTzPG/efPL9t5BkY1Qih00++J
         WOdvoJDmxykpCgYRh4549vyGtvZvcc+1azEBejInEyIVlAU5LSnI3p4oh1H3mlovnk
         f0cJ8Fim2BYpnflv/dthsn9yMSN5fp9clIeW6DUc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB1DnaoX072759
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 1 Dec 2019 07:49:36 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sun, 1 Dec
 2019 07:49:35 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sun, 1 Dec 2019 07:49:35 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB1DnW5Z111790;
        Sun, 1 Dec 2019 07:49:32 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <bparrot@ti.com>, <subhajit_paul@ti.com>,
        <praneeth@ti.com>, <yamonkar@cadence.com>, <sjakhade@cadence.com>,
        <robh+dt@kernel.org>
Subject: [PATCH v2 1/5] dt-bindings: display: ti,k2g-dss: Add dt-schema yaml binding
Date:   Sun, 1 Dec 2019 15:49:29 +0200
Message-ID: <802bf3af8f5109b22bf615d92bca14f076d25de5.1575203210.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575203210.git.jsarha@ti.com>
References: <cover.1575203210.git.jsarha@ti.com>
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

