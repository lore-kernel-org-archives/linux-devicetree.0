Return-Path: <SRS0=kxJ0=ZX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E38C432C3
	for <linux-devicetree@archiver.kernel.org>; Sun,  1 Dec 2019 13:49:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89A5A206E4
	for <linux-devicetree@archiver.kernel.org>; Sun,  1 Dec 2019 13:49:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wh0glziJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbfLANto (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 1 Dec 2019 08:49:44 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53064 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbfLANto (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 1 Dec 2019 08:49:44 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB1Dnc2A016265;
        Sun, 1 Dec 2019 07:49:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575208178;
        bh=pUi7eFA5fQV+ZfC8P4wsmQMB0SvMAESj7mgDXEnyv5M=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=wh0glziJTclIRriljhjoS0H6palvx4en8gnRJrpn+FahcktbxeMr+YoM7vgMsrGit
         UqyBSbeldRDpy/iUvVlDUov2uXeTpUon9vKbhzBkH/rI3EOb1wljgU3M2PyuMZ0/KS
         TYhSGVORY+lDxGFKMPVf37lfL7lPMG3dJWuqmhLw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB1Dncda068104
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 1 Dec 2019 07:49:38 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sun, 1 Dec
 2019 07:49:37 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sun, 1 Dec 2019 07:49:37 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB1DnW5a111790;
        Sun, 1 Dec 2019 07:49:35 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <bparrot@ti.com>, <subhajit_paul@ti.com>,
        <praneeth@ti.com>, <yamonkar@cadence.com>, <sjakhade@cadence.com>,
        <robh+dt@kernel.org>
Subject: [PATCH v2 2/5] dt-bindings: display: ti,am65x-dss: Add dt-schema yaml binding
Date:   Sun, 1 Dec 2019 15:49:30 +0200
Message-ID: <625fa000c744300b132d376dedf9b7ad83f6f2da.1575203210.git.jsarha@ti.com>
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

Add dt-schema yaml bindig for AM65x DSS, AM65x version TI Keystone
Display SubSystem.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 .../bindings/display/ti/ti,am65x-dss.yaml     | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
new file mode 100644
index 000000000000..6691f5dad383
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/ti/ti,am65x-dss.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Texas Instruments AM65x Display Subsystem
+
+maintainers:
+  - Jyri Sarha <jsarha@ti.com>
+  - Tomi Valkeinen <tomi.valkeinen@ti.com>
+
+description: |
+  The AM65x TI Keystone Display SubSystem with two output ports and
+  two video planes. The first video port supports OLDI and the second
+  supports DPI format. The fist plane is full video plane with all
+  features and the second is a "lite plane" without scaling support.
+
+properties:
+  compatible:
+    const: ti,am65x-dss
+
+  reg:
+    maxItems: 7
+    minItems: 7
+
+  reg-names:
+    items:
+      - const: common
+      - const: vidl1
+      - const: vid
+      - const: ovr1
+      - const: ovr2
+      - const: vp1
+      - const: vp2
+
+  clocks:
+    maxItems: 3
+    minItems: 3
+
+  clock-names:
+    items:
+      - const: fck
+      - const: vp1
+      - const: vp2
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
+      The DSS OLDI output port node form video port 1
+
+  port@1:
+    type: object
+    description:
+      The DSS DPI output port node from video port 2
+
+  ti,am65x-oldi-io-ctrl:
+    maxItems: 1
+    description:
+      $ref: "/schemas/types.yaml#/definitions/phandle-array"
+      phandle to syscon device node mapping OLDI IO_CTRL registers.
+      The mapped range should point to OLDI_DAT0_IO_CTRL, map it and
+      following OLDI_DAT1_IO_CTRL, OLDI_DAT2_IO_CTRL, OLDI_DAT3_IO_CTRL,
+      and OLDI_CLK_IO_CTRL registers. This property is needed for OLDI
+      interface to work.
+
+  max-memory-bandwidth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Input memory (from main memory to dispc) bandwidth limit in
+      bytes per second
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+       dss: dss@04a00000 {
+                compatible = "ti,am65x-dss";
+                reg =   <0x0 0x04a00000 0x0 0x1000>, /* common */
+                        <0x0 0x04a02000 0x0 0x1000>, /* vidl1 */
+                        <0x0 0x04a06000 0x0 0x1000>, /* vid */
+                        <0x0 0x04a07000 0x0 0x1000>, /* ovr1 */
+                        <0x0 0x04a08000 0x0 0x1000>, /* ovr2 */
+                        <0x0 0x04a0a000 0x0 0x1000>, /* vp1 */
+                        <0x0 0x04a0b000 0x0 0x1000>; /* vp2 */
+                reg-names = "common", "vidl1", "vid",
+                        "ovr1", "ovr2", "vp1", "vp2";
+
+                ti,am65x-oldi-io-ctrl = <&dss_oldi_io_ctrl>;
+
+                power-domains = <&k3_pds 67 TI_SCI_PD_EXCLUSIVE>;
+
+                clocks =        <&k3_clks 67 1>,
+                                <&k3_clks 216 1>,
+                                <&k3_clks 67 2>;
+                clock-names = "fck", "vp1", "vp2";
+
+                interrupts = <GIC_SPI 166 IRQ_TYPE_EDGE_RISING>;
+
+                status = "disabled";
+
+                port@0 {
+                        reg = <0>;
+
+                        oldi_out0: endpoint {
+                                remote-endpoint = <&lcd_in0>;
+                        };
+                };
+        };
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

