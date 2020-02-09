Return-Path: <SRS0=ahG+=35=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755CBC35250
	for <linux-devicetree@archiver.kernel.org>; Sun,  9 Feb 2020 08:19:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 340FE20708
	for <linux-devicetree@archiver.kernel.org>; Sun,  9 Feb 2020 08:19:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbgBIITh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 9 Feb 2020 03:19:37 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:40086 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgBIITh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 9 Feb 2020 03:19:37 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 399B12001E;
        Sun,  9 Feb 2020 09:19:32 +0100 (CET)
Date:   Sun, 9 Feb 2020 09:19:31 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Joe Perches <joe@perches.com>
Cc:     devicetree@vger.kernel.org
Subject: checkpatch - "DT binding docs and includes should be a separate
 patch"
Message-ID: <20200209081931.GA5321@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=kj9zAlcOel0A:10 a=8b9GpE9nAAAA:8 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8
        a=e5mUnYsNAAAA:8 a=gEfo2CItAAAA:8 a=FZVGO2bn5EAImVMducEA:9
        a=s0oLJFj4ud2Gux5_:21 a=k4I27A6zooosrjfF:21 a=CjuIK1q_8ugA:10
        a=T3LWEMljR5ZiDmsYVIUa:22 a=AjGcO6oz07-iQ99wixmX:22
        a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
        a=sptkURWiP4Gy88Gu7hUp:22 a=pHzHmUro8NiASowvMSCR:22
        a=Ew2E2A-JSTLzCXPT_086:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Joe.

The following warnings triggers on the patch below:

c55d0a554843 (HEAD -> drm-misc-next) dt-bindings: panel: Convert orisetech,otm8009a to json-schema
-:15: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#15:
deleted file mode 100644

-:18: WARNING:DT_SPLIT_BINDING_PATCH: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.txt

-:43: WARNING:DT_SPLIT_BINDING_PATCH: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.txt

total: 0 errors, 3 warnings, 0 checks, 53 lines checked

1)
yaml files include maintainer information in the file.
I dunno if this replaces/overrules MAINTAINERS - so first warning may be
OK. Also because we delete a file it seems semi relevant.

2)
As the patch only touches files in Documentation/devicetree/bindings the
warning about a separate patch seems wrong.


But the general feedback - in this very special case - is that
checkpatch seems a bit too noisy.

If we as a bonus could get a warning when new yaml files do not
use:
# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
That would be great.

It is recommended but not mandatory to use the combi license for new yaml
files.

I did not try to dive into this myself - in the hope someone more versed
in checkpatch internals (aka you) could improve it.

	Sam

From c55d0a554843f2c4dfb44d0c8a99a1670c32c33d Mon Sep 17 00:00:00 2001
From: Benjamin Gaignard <benjamin.gaignard@st.com>
Date: Thu, 6 Feb 2020 14:33:44 +0100
Subject: [PATCH 3/3] dt-bindings: panel: Convert orisetech,otm8009a to
 json-schema

Convert orisetech,otm8009a to json-schema.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Philippe Cornu <philippe.cornu@st.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200206133344.724-4-benjamin.gaignard@st.com
---
 .../display/panel/orisetech,otm8009a.txt      | 23 --------
 .../display/panel/orisetech,otm8009a.yaml     | 53 +++++++++++++++++++
 2 files changed, 53 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
deleted file mode 100644
index 203b03eefb68..000000000000
--- a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Orise Tech OTM8009A 3.97" 480x800 TFT LCD panel (MIPI-DSI video mode)
-
-The Orise Tech OTM8009A is a 3.97" 480x800 TFT LCD panel connected using
-a MIPI-DSI video interface. Its backlight is managed through the DSI link.
-
-Required properties:
-  - compatible: "orisetech,otm8009a"
-  - reg: the virtual channel number of a DSI peripheral
-
-Optional properties:
-  - reset-gpios: a GPIO spec for the reset pin (active low).
-  - power-supply: phandle of the regulator that provides the supply voltage.
-
-Example:
-&dsi {
-	...
-	panel@0 {
-		compatible = "orisetech,otm8009a";
-		reg = <0>;
-		reset-gpios = <&gpioh 7 GPIO_ACTIVE_LOW>;
-		power-supply = <&v1v8>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
new file mode 100644
index 000000000000..6e6ac995c27b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/orisetech,otm8009a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Orise Tech OTM8009A 3.97" 480x800 TFT LCD panel (MIPI-DSI video mode)
+
+maintainers:
+  - Philippe CORNU <philippe.cornu@st.com>
+
+description: |
+             The Orise Tech OTM8009A is a 3.97" 480x800 TFT LCD panel connected using
+             a MIPI-DSI video interface. Its backlight is managed through the DSI link.
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+
+  compatible:
+    const: orisetech,otm8009a
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  enable-gpios: true
+  port: true
+  power-supply: true
+
+  reset-gpios:
+    maxItems: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    dsi@0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      panel@0 {
+        compatible = "orisetech,otm8009a";
+        reg = <0>;
+        reset-gpios = <&gpiof 15 0>;
+        power-supply = <&v1v8>;
+      };
+    };
+...
+
-- 
2.20.1

