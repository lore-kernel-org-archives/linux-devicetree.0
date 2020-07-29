Return-Path: <SRS0=UHbD=BI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA017C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 08:04:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D46312084D
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 08:04:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727964AbgG2IEp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jul 2020 04:04:45 -0400
Received: from inva021.nxp.com ([92.121.34.21]:52518 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727846AbgG2IEp (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 29 Jul 2020 04:04:45 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3C368200E84;
        Wed, 29 Jul 2020 10:04:43 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 99435200E83;
        Wed, 29 Jul 2020 10:04:38 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id D147240302;
        Wed, 29 Jul 2020 10:04:32 +0200 (CEST)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v7 02/11] dt-bindings: clock: imx-lpcg: add support to parse clocks from device tree
Date:   Wed, 29 Jul 2020 16:00:09 +0800
Message-Id: <1596009618-25516-3-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

MX8QM and MX8QXP LPCG Clocks are mostly the same except they may reside
in different subsystems across CPUs and also vary a bit on the availability.

Same as SCU clock, we want to move the clock definition into device tree
which can fully decouple the dependency of Clock ID definition from device
tree and make us be able to write a fully generic lpcg clock driver.

And we can also use the existence of clock nodes in device tree to address
the device and clock availability differences across different SoCs.

Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v6->v7:
 * No other changes except converting to json schema based on the former reviewed
   patches due to the lagecy binding file was removed in latests kernel.
   Because the format is different now, i removed the former R-b
   and A-b tags and request a new review.
   See original patch here:
   https://patchwork.kernel.org/patch/11439079/
v4->v6:
 * no changes
v3->v4:
 * change bit-offset property to clock-indices
 * use constant macro to define clock indinces
 * drop hw-autogate property which is still not used by drivers
v2->v3:
 * no changes
v1->v2:
 * Update example
 * Add power domain property
---
 .../bindings/clock/imx8qxp-lpcg.yaml          | 79 ++++++++++++++-----
 include/dt-bindings/clock/imx8-lpcg.h         | 14 ++++
 2 files changed, 74 insertions(+), 19 deletions(-)
 create mode 100644 include/dt-bindings/clock/imx8-lpcg.h

diff --git a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml
index 33f3010f48c3..e709e530e17a 100644
--- a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml
@@ -21,27 +21,58 @@ description: |
 
   The clock consumer should specify the desired clock by having the clock
   ID in its "clocks" phandle cell. See the full list of clock IDs from:
-  include/dt-bindings/clock/imx8-clock.h
+  include/dt-bindings/clock/imx8-lpcg.h
 
 properties:
   compatible:
-    enum:
-      - fsl,imx8qxp-lpcg-adma
-      - fsl,imx8qxp-lpcg-conn
-      - fsl,imx8qxp-lpcg-dc
-      - fsl,imx8qxp-lpcg-dsp
-      - fsl,imx8qxp-lpcg-gpu
-      - fsl,imx8qxp-lpcg-hsio
-      - fsl,imx8qxp-lpcg-img
-      - fsl,imx8qxp-lpcg-lsio
-      - fsl,imx8qxp-lpcg-vpu
-
+    oneOf:
+      - const: fsl,imx8qxp-lpcg
+      - items:
+          - enum:
+            - fsl,imx8qm-lpcg
+          - const: fsl,imx8qxp-lpcg
+      - enum:
+        - fsl,imx8qxp-lpcg-adma
+        - fsl,imx8qxp-lpcg-conn
+        - fsl,imx8qxp-lpcg-dc
+        - fsl,imx8qxp-lpcg-dsp
+        - fsl,imx8qxp-lpcg-gpu
+        - fsl,imx8qxp-lpcg-hsio
+        - fsl,imx8qxp-lpcg-img
+        - fsl,imx8qxp-lpcg-lsio
+        - fsl,imx8qxp-lpcg-vpu
+        deprecated: true
   reg:
     maxItems: 1
 
   '#clock-cells':
     const: 1
 
+  clocks:
+    description: |
+      Input parent clocks phandle array for each clock
+    minItems: 1
+    maxItems: 8
+
+  clock-indices:
+    description: |
+      An integer array indicating the bit offset for each clock.
+      Refer to <include/dt-bindings/clock/imx8-lpcg.h> for the
+      supported LPCG clock indices.
+    minItems: 1
+    maxItems: 8
+
+  clock-output-names:
+    description: |
+      Shall be the corresponding names of the outputs.
+      NOTE this property must be specified in the same order
+      as the clock-indices property.
+    minItems: 1
+    maxItems: 8
+
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -51,23 +82,33 @@ additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/clock/imx8-clock.h>
+    #include <dt-bindings/clock/imx8-lpcg.h>
     #include <dt-bindings/firmware/imx/rsrc.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-    clock-controller@5b200000 {
-        compatible = "fsl,imx8qxp-lpcg-conn";
-        reg = <0x5b200000 0xb0000>;
+    sdhc0_lpcg: clock-controller@5b200000 {
+        compatible = "fsl,imx8qxp-lpcg";
+        reg = <0x5b200000 0x10000>;
         #clock-cells = <1>;
+        clocks = <&sdhc0_clk IMX_SC_PM_CLK_PER>,
+                 <&conn_ipg_clk>,
+                 <&conn_axi_clk>;
+        clock-indices = <IMX_LPCG_CLK_0>,
+                        <IMX_LPCG_CLK_4>,
+                        <IMX_LPCG_CLK_5>;
+        clock-output-names = "sdhc0_lpcg_per_clk",
+                             "sdhc0_lpcg_ipg_clk",
+                             "sdhc0_lpcg_ahb_clk";
+        power-domains = <&pd IMX_SC_R_SDHC_0>;
     };
 
     mmc@5b010000 {
         compatible = "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
         interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
         reg = <0x5b010000 0x10000>;
-        clocks = <&conn_lpcg IMX_CONN_LPCG_SDHC0_IPG_CLK>,
-                 <&conn_lpcg IMX_CONN_LPCG_SDHC0_PER_CLK>,
-                 <&conn_lpcg IMX_CONN_LPCG_SDHC0_HCLK>;
+        clocks = <&sdhc0_lpcg IMX_LPCG_CLK_4>,
+                 <&sdhc0_lpcg IMX_LPCG_CLK_0>,
+                 <&sdhc0_lpcg IMX_LPCG_CLK_5>;
         clock-names = "ipg", "per", "ahb";
         power-domains = <&pd IMX_SC_R_SDHC_0>;
     };
diff --git a/include/dt-bindings/clock/imx8-lpcg.h b/include/dt-bindings/clock/imx8-lpcg.h
new file mode 100644
index 000000000000..d202715652c3
--- /dev/null
+++ b/include/dt-bindings/clock/imx8-lpcg.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2019-2020 NXP
+ *   Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+#define IMX_LPCG_CLK_0	0
+#define IMX_LPCG_CLK_1	4
+#define IMX_LPCG_CLK_2	8
+#define IMX_LPCG_CLK_3	12
+#define IMX_LPCG_CLK_4	16
+#define IMX_LPCG_CLK_5	20
+#define IMX_LPCG_CLK_6	24
+#define IMX_LPCG_CLK_7	28
-- 
2.23.0

