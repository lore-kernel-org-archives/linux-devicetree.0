Return-Path: <SRS0=/QBj=55=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B2C1C2BA19
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Apr 2020 10:30:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FAE420737
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Apr 2020 10:30:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgDMKa6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Apr 2020 06:30:58 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57114 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727806AbgDMKa6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Apr 2020 06:30:58 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 0C2862A008C
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     heiko@sntech.de, srinivas.kandagatla@linaro.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     kernel@collabora.com
Subject: [PATCH] dt-bindings: nvmem: Convert rockchip-efuse bindings to yaml
Date:   Mon, 13 Apr 2020 12:30:47 +0200
Message-Id: <20200413103047.26437-1-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Convert the existing rockchip-efuse binding to json-schema. No changes
were done to the binding except for small changes in the documentation
strings.

This deletes the rockchip-efuse.txt binding and replaces it with
rockchip-efuse.yaml.

Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
---
 .../bindings/nvmem/rockchip-efuse.txt         | 54 --------------
 .../bindings/nvmem/rockchip-efuse.yaml        | 70 +++++++++++++++++++
 2 files changed, 70 insertions(+), 54 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
 create mode 100644 Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
deleted file mode 100644
index 265bdb7dc8aa..000000000000
--- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
+++ /dev/null
@@ -1,54 +0,0 @@
-= Rockchip eFuse device tree bindings =
-
-Required properties:
-- compatible: Should be one of the following.
-  - "rockchip,rk3066a-efuse" - for RK3066a SoCs.
-  - "rockchip,rk3188-efuse" - for RK3188 SoCs.
-  - "rockchip,rk3228-efuse" - for RK3228 SoCs.
-  - "rockchip,rk3288-efuse" - for RK3288 SoCs.
-  - "rockchip,rk3328-efuse" - for RK3328 SoCs.
-  - "rockchip,rk3368-efuse" - for RK3368 SoCs.
-  - "rockchip,rk3399-efuse" - for RK3399 SoCs.
-- reg: Should contain the registers location and exact eFuse size
-- clocks: Should be the clock id of eFuse
-- clock-names: Should be "pclk_efuse"
-
-Optional properties:
-- rockchip,efuse-size: Should be exact eFuse size in byte, the eFuse
-  size in property <reg> will be invalid if define this property.
-
-Deprecated properties:
-- compatible: "rockchip,rockchip-efuse"
-  Old efuse compatible value compatible to rk3066a, rk3188 and rk3288
-  efuses
-
-= Data cells =
-Are child nodes of eFuse, bindings of which as described in
-bindings/nvmem/nvmem.txt
-
-Example:
-
-	efuse: efuse@ffb40000 {
-		compatible = "rockchip,rk3288-efuse";
-		reg = <0xffb40000 0x20>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		clocks = <&cru PCLK_EFUSE256>;
-		clock-names = "pclk_efuse";
-
-		/* Data cells */
-		cpu_leakage: cpu_leakage {
-			reg = <0x17 0x1>;
-		};
-	};
-
-= Data consumers =
-Are device nodes which consume nvmem data cells.
-
-Example:
-
-	cpu_leakage {
-		...
-		nvmem-cells = <&cpu_leakage>;
-		nvmem-cell-names = "cpu_leakage";
-	};
diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
new file mode 100644
index 000000000000..3ae00b0b23bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/rockchip-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip eFuse device tree bindings
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+allOf:
+  - $ref: "nvmem.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3066a-efuse
+      - rockchip,rk3188-efuse
+      - rockchip,rk3228-efuse
+      - rockchip,rk3288-efuse
+      - rockchip,rk3328-efuse
+      - rockchip,rk3368-efuse
+      - rockchip,rk3399-efuse
+
+      # Deprecated: old compatible value for rk3066a, rk3188 and rk3288
+      - rockchip,rockchip-efuse
+
+  reg:
+    description:
+      Registers location and eFuse size.
+    maxItems: 1
+
+  clocks:
+    description:
+      eFuse clock id.
+    maxItems: 1
+
+  clock-names:
+    const: pclk_efuse
+
+  rockchip,efuse-size:
+    description:
+      eFuse size in bytes. The eFuse size in property <reg> will be invalid if
+      this property is defined.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3288-cru.h>
+    efuse: efuse@ffb40000 {
+            compatible = "rockchip,rk3288-efuse";
+            reg = <0xffb40000 0x20>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            clocks = <&cru PCLK_EFUSE256>;
+            clock-names = "pclk_efuse";
+
+            /* Data cells */
+            cpu_leakage: cpu_leakage@17 {
+                    reg = <0x17 0x1>;
+            };
+    };
+...
-- 
2.18.0

