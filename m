Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA91C18E5A
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 08:58:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E2A1C2464B
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 08:58:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728736AbgCKI63 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 04:58:29 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:44274 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728678AbgCKI63 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Mar 2020 04:58:29 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 11 Mar 2020 14:28:23 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
  by ironmsg02-blr.qualcomm.com with ESMTP; 11 Mar 2020 14:28:10 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
        id 5B4B62749; Wed, 11 Mar 2020 14:28:09 +0530 (IST)
From:   Harigovindan P <harigovi@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Harigovindan P <harigovi@codeaurora.org>, robdclark@gmail.com,
        seanpaul@chromium.org, sean@poorly.run
Subject: [PATCH v6 1/2] dt-bindings: display: add visionox rm69299 panel variant
Date:   Wed, 11 Mar 2020 14:28:06 +0530
Message-Id: <20200311085807.21984-2-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311085807.21984-1-harigovi@codeaurora.org>
References: <20200311085807.21984-1-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add bindings for visionox rm69299 panel.

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
---

Changes in v2:
	- Removed unwanted properties from description.
	- Creating source files without execute permissions(Rob Herring).
Changes in v3:
	- Changing txt file into yaml
Changes in v4:
	- Updating license identifier.
	- Moving yaml file inside panel directory.
	- Removing pinctrl entries.
	- Adding documentation for reset-gpios.
Changes in v5:
	- No changes. Updated 2/2 Patch.
Changes in v6:
	- Removing patternProperties.
	- Added " |" after description.
	- Setting port and reset-gpios to true.
	- Removing @ae94000 for dsi node.

 .../display/panel/visionox,rm69299.yaml       | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
new file mode 100644
index 000000000000..18854cc7d99e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/visionox,rm69299.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Visionox model RM69299 Panels Device Tree Bindings.
+
+maintainers:
+ - Harigovindan P <harigovi@codeaurora.org>
+
+description: |
+ This binding is for display panels using a Visionox RM692999 panel.
+
+allOf:
+ - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: visionox,rm69299-1080p-display
+
+  reg:
+    maxItems: 1
+
+  vdda-supply:
+    description: |
+      Phandle of the regulator that provides the vdda supply voltage.
+
+  vdd3p3-supply:
+    description: |
+      Phandle of the regulator that provides the vdd3p3 supply voltage.
+
+  ports:
+    type: object
+    description: |
+      A node containing DSI input & output port nodes with endpoint
+      definitions as documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+      Documentation/devicetree/bindings/graph.txt
+      properties:
+        port: true
+
+  reset-gpios: true
+
+required:
+  - compatible
+  - reg
+  - vdda-supply
+  - vdd3p3-supply
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+- |
+    dsi {
+        panel@0 {
+            compatible = "visionox,rm69299-1080p-display";
+
+            vdda-supply = <&src_pp1800_l8c>;
+            vdd3p3-supply = <&src_pp2800_l18a>;
+
+            reset-gpios = <&pm6150l_gpio 3 0>;
+            ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    port@0 {
+                            reg = <0>;
+                            panel0_in: endpoint {
+                                remote-endpoint = <&dsi0_out>;
+                            };
+                    };
+            };
+        };
+    };
+...
+
-- 
2.25.1

