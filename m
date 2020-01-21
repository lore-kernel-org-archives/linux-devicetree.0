Return-Path: <SRS0=tTw7=3K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7ADC2D0CE
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 15:43:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F2D5E22314
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 15:43:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729190AbgAUPna (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jan 2020 10:43:30 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49944 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbgAUPna (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Jan 2020 10:43:30 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id E28BA263BC7
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     hjc@rock-chips.com, heiko@sntech.de, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH v3] dt-bindings: convert rockchip-drm.txt to rockchip-drm.yaml
Date:   Tue, 21 Jan 2020 16:43:14 +0100
Message-Id: <20200121154314.3444-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

convert the binding file rockchip-drm.txt to yaml format.
This was tested and verified on ARM and ARM64 with:
make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
the detail of the ARM tests:
export ARCH=arm KBUILD_OUTPUT=../kbuild/arm-test-dtc/ CROSS_COMPILE=arm-linux-gnueabi-
make menuconfig # set rockchip system
make clean
make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml

the detail of the ARM64 tests:
export ARCH=arm64 KBUILD_OUTPUT=../kbuild/arm64-test-dtc/ CROSS_COMPILE=aarch64-linux-gnu-
make menuconfig # set rockchip system
make clean
make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml


Changes since v1:
- fixed worng sign-off
- fixed the path of the $id property to be the path of the yaml file
Changes since v2:
- add a missing ">" sign in maintainers list
- change the licens to GPL-2.0-only
- add "additionalProperties: false"
- change the commit message to conform that it was tested on both ARM and ARM64


 .../display/rockchip/rockchip-drm.txt         | 19 ---------
 .../display/rockchip/rockchip-drm.yaml        | 40 +++++++++++++++++++
 2 files changed, 40 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt b/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt
deleted file mode 100644
index 5707af89319d..000000000000
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-Rockchip DRM master device
-================================
-
-The Rockchip DRM master device is a virtual device needed to list all
-vop devices or other display interface nodes that comprise the
-graphics subsystem.
-
-Required properties:
-- compatible: Should be "rockchip,display-subsystem"
-- ports: Should contain a list of phandles pointing to display interface port
-  of vop devices. vop definitions as defined in
-  Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
-
-example:
-
-display-subsystem {
-	compatible = "rockchip,display-subsystem";
-	ports = <&vopl_out>, <&vopb_out>;
-};
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
new file mode 100644
index 000000000000..ec8ae742d4da
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/rockchip/rockchip-drm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip DRM master device
+
+maintainers:
+  - Sandy Huang <hjc@rock-chips.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+description: |
+  The Rockchip DRM master device is a virtual device needed to list all
+  vop devices or other display interface nodes that comprise the
+  graphics subsystem.
+
+properties:
+  compatible:
+    const: rockchip,display-subsystem
+
+  ports:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      Should contain a list of phandles pointing to display interface port
+      of vop devices. vop definitions as defined in
+      Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
+
+required:
+  - compatible
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    display-subsystem {
+        compatible = "rockchip,display-subsystem";
+        ports = <&vopl_out>, <&vopb_out>;
+    };
-- 
2.17.1

