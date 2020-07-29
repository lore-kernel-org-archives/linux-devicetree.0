Return-Path: <SRS0=UHbD=BI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6A2C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 16:46:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 049B820809
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 16:46:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgG2QqP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jul 2020 12:46:15 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:59234 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgG2QqP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jul 2020 12:46:15 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4BGzvS491cz1s20C;
        Wed, 29 Jul 2020 18:46:12 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4BGzvS2f48z1qy69;
        Wed, 29 Jul 2020 18:46:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id wGjvX93e6URd; Wed, 29 Jul 2020 18:46:10 +0200 (CEST)
X-Auth-Info: 6fR0FsF5RKpzSH9hRcMNKukhQj42etZHobiis8zCYw4=
Received: from desktop.lan (ip-86-49-101-166.net.upcbroadband.cz [86.49.101.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed, 29 Jul 2020 18:46:10 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     dri-devel@lists.freedesktop.org
Cc:     Marek Vasut <marex@denx.de>, Eric Anholt <eric@anholt.net>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org
Subject: [PATCH V2 1/2] dt-bindings: Add DT bindings for Toshiba TC358762 DSI-to-DPI bridge
Date:   Wed, 29 Jul 2020 18:45:53 +0200
Message-Id: <20200729164554.114735-1-marex@denx.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add DT bindings for Toshiba TC358762 DSI-to-DPI bridge, this
one is used in the Raspberry Pi 7" touchscreen display unit.

Signed-off-by: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Eric Anholt <eric@anholt.net>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
---
V2: Fix dt_binding_check errors
---
 .../display/bridge/toshiba,tc358762.yaml      | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml
new file mode 100644
index 000000000000..6cd4c0d86c13
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/toshiba,tc358762.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC358762 MIPI DSI to MIPI DPI bridge
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+description: |
+  The TC358762 is bridge device which converts MIPI DSI to MIPI DPI.
+
+properties:
+  compatible:
+    enum:
+      - toshiba,tc358762
+
+  reg:
+    maxItems: 1
+    description: virtual channel number of a DSI peripheral
+
+  vddc-supply:
+    description: Regulator for 1.2V internal core power.
+
+  ports:
+    type: object
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        type: object
+        additionalProperties: false
+
+        description: |
+          Video port for MIPI DSI input
+
+        properties:
+          reg:
+            const: 0
+
+        patternProperties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint: true
+
+        required:
+          - reg
+
+      port@1:
+        type: object
+        additionalProperties: false
+
+        description: |
+          Video port for MIPI DPI output (panel or connector).
+
+        properties:
+          reg:
+            const: 1
+
+        patternProperties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint: true
+
+        required:
+          - reg
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - vddc-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c1 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      bridge@0 {
+        reg = <0>;
+        compatible = "toshiba,tc358762";
+        vddc-supply = <&vcc_1v2_reg>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+            bridge_in: endpoint {
+              remote-endpoint = <&dsi_out>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+            bridge_out: endpoint {
+              remote-endpoint = <&panel_in>;
+            };
+          };
+        };
+      };
+    };
-- 
2.27.0

