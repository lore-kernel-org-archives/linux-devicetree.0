Return-Path: <SRS0=9zIi=6I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05705C2BA1A
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 11:26:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEDC620736
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 11:26:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgDXL0z (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Apr 2020 07:26:55 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39036 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgDXL0z (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 Apr 2020 07:26:55 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id A48262A1FC7
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     devicetree@vger.kernel.org
Cc:     kernel@collabora.com, dri-devel@lists.freedesktop.org,
        robh+dt@kernel.org, ykk@rock-chips.com
Subject: [PATCH] dt-bindings: display: analogix_dp.txt: convert to yaml
Date:   Fri, 24 Apr 2020 13:26:34 +0200
Message-Id: <20200424112634.20863-1-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This converts the DT binding for the Analogix DP bridge used in
the Exynos 5 and Rockchip RK3288/RK3399 SoCs to yaml.

Changes from the original binding:
- phy and phy-names aren't defined as 'required' (rk3399-evb.dts doesn't
  define them)

Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
---
This binding is meant to be used in conjunction with
Documentation/bindings/display/rockchip/analogix_dp-rockchip.txt
and
Documentation/bindings/display/exynos/exynos_dp.txt

I was careful to define the bindings to be flexible enough for both
cases, since the properties might be slightly different depending
on the SoC.

Tested with
make dt_binding_check ARCH=arm64 DT_SCHEMA_FILES=<...analogix_dp.yaml>
make dtbs_check ARCH=arm64 DT_SCHEMA_FILES=<...analogix_dp.yaml>

 .../bindings/display/bridge/analogix_dp.txt   |  51 --------
 .../bindings/display/bridge/analogix_dp.yaml  | 120 ++++++++++++++++++
 2 files changed, 120 insertions(+), 51 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix_dp.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
deleted file mode 100644
index 027d76c27a41..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
+++ /dev/null
@@ -1,51 +0,0 @@
-Analogix Display Port bridge bindings
-
-Required properties for dp-controller:
-	-compatible:
-		platform specific such as:
-		 * "samsung,exynos5-dp"
-		 * "rockchip,rk3288-dp"
-		 * "rockchip,rk3399-edp"
-	-reg:
-		physical base address of the controller and length
-		of memory mapped region.
-	-interrupts:
-		interrupt combiner values.
-	-clocks:
-		from common clock binding: handle to dp clock.
-	-clock-names:
-		from common clock binding: Shall be "dp".
-	-phys:
-		from general PHY binding: the phandle for the PHY device.
-	-phy-names:
-		from general PHY binding: Should be "dp".
-
-Optional properties for dp-controller:
-	-force-hpd:
-		Indicate driver need force hpd when hpd detect failed, this
-		is used for some eDP screen which don't have hpd signal.
-	-hpd-gpios:
-		Hotplug detect GPIO.
-		Indicates which GPIO should be used for hotplug detection
-	-port@[X]: SoC specific port nodes with endpoint definitions as defined
-		in Documentation/devicetree/bindings/media/video-interfaces.txt,
-		please refer to the SoC specific binding document:
-		* Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
-		* Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
-
-[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
--------------------------------------------------------------------------------
-
-Example:
-
-	dp-controller {
-		compatible = "samsung,exynos5-dp";
-		reg = <0x145b0000 0x10000>;
-		interrupts = <10 3>;
-		interrupt-parent = <&combiner>;
-		clocks = <&clock 342>;
-		clock-names = "dp";
-
-		phys = <&dp_phy>;
-		phy-names = "dp";
-	};
diff --git a/Documentation/devicetree/bindings/display/bridge/analogix_dp.yaml b/Documentation/devicetree/bindings/display/bridge/analogix_dp.yaml
new file mode 100644
index 000000000000..a29a79d92c4b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/analogix_dp.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/analogix_dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analogix Display Port bridge bindings
+
+maintainers:
+  - Yakir Yang <ykk@rock-chips.com>
+
+description: |
+  The Samsung Exynos eDP and Rockchip RK3288 eDP controllers share the
+  same IP. This binding describes the nodes and properties that are
+  common to both SoCs.
+
+  Please, read this together with
+  Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
+  and
+  Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos5-dp
+      - rockchip,rk3288-dp
+      - rockchip,rk3399-edp
+
+  reg:
+    maxItems: 1
+    description:
+      Physical base address of the controller and length of memory
+      mapped region.
+
+  interrupts:
+    maxItems: 1
+    description: Interrupt combiner values.
+
+  clocks:
+    description: Phandles to dp clocks.
+
+  clock-names:
+    minItems: 1
+    maxItems: 3
+    additionalItems: true
+    items:
+      - const: dp
+    description: Must define at least "dp".
+
+  phys:
+    maxItems: 1
+    description: Phandle for the PHY device.
+
+  phy-names:
+    const: dp
+
+  force-hpd: true
+
+  hpd-gpios:
+    maxItems: 1
+    description:
+      Hotplug Detect GPIO. Indicates which GPIO should be used for
+      hotplug detection.
+
+  ports:
+    type: object
+    description: |
+      A node containing SoC-specific port nodes with endpoint
+      definitions as documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+
+      Please, refer to
+      Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
+      and
+      Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
+      for SoC-specific information about port and endpoint definitions.
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
+
+        properties:
+          reg:
+            const: 0
+
+      port@1:
+        type: object
+
+        properties:
+          reg:
+            const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    dp: dp-controller@145b0000 {
+        compatible = "samsung,exynos5-dp";
+        reg = <0x145b0000 0x10000>;
+        interrupts = <10 3>;
+        interrupt-parent = <&combiner>;
+        clocks = <&clock 342>;
+        clock-names = "dp";
+
+        phys = <&dp_phy>;
+        phy-names = "dp";
+    };
+
+...
-- 
2.18.0

