Return-Path: <SRS0=fjOU=5C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2394BC5ACBF
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 09:41:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F0DF82071C
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 09:41:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbgCQJlm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Mar 2020 05:41:42 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:57205 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727281AbgCQJlY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Mar 2020 05:41:24 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jE8ix-0004Q9-2M; Tue, 17 Mar 2020 10:41:23 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jE8iw-00049T-FW; Tue, 17 Mar 2020 10:41:22 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dhaval Shah <dshah@xilinx.com>, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 4/6] dt-bindings: soc: xlnx: extract xlnx,vcu-settings to separate binding
Date:   Tue, 17 Mar 2020 10:41:13 +0100
Message-Id: <20200317094115.15896-5-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200317094115.15896-1-m.tretter@pengutronix.de>
References: <20200317094115.15896-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The xlnx,vcu binding comprises two adjacent register banks:

The first register bank ("vcu_slcr") contains registers for setting the
clocks of the vcu and controlling the performance monitors. The second
bank ("logicoreip") contains the configuration settings of the video codec
unit, which are set before synthesizing the bitstream.

Drivers that drive the actual video codec unit need to to read the
registers from the logicoreip register bank for configuring the vcu
firmware.

As logicoreip is a too generic name for this register bank, use
"vcu-settings" as a binding name, because the register bank basically
provides the configuration settings of the VCU.

Therefore, add the vcu-settings binding to provide a syscon interface
for other drivers to read these registers.

The alternative would have been to merge the two register banks of the
xlnx,vcu binding into one register bank and make xlnx,vcu provide a
syscon interface, but that would lead to more incompatibility than
making second register bank of xlnx,vcu optional.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../soc/xilinx/xlnx,vcu-settings.yaml         | 45 +++++++++++++++++++
 .../bindings/soc/xilinx/xlnx,vcu.txt          |  9 +---
 2 files changed, 47 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml b/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml
new file mode 100644
index 000000000000..a38ab180854e
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/xilinx/xlnx,vcu-settings.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx VCU Settings
+
+maintainers:
+  - Michael Tretter <kernel@pengutronix.de>
+
+# Custom select to avoid matching all nodes with 'syscon'
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - xlnx,vcu-settings
+  required:
+    - compatible
+
+
+description: |
+  The Xilinx VCU Settings provides information about the configuration of the
+  video codec unit.
+
+properties:
+  compatible:
+    items:
+      - const: xlnx,vcu-settings
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    xlnx_vcu: vcu@a0041000 {
+          compatible = "xlnx,vcu-settings", "syscon";
+          reg = <0x0 0xa0041000 0x0 0x1000>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt b/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt
index 6786d6715df0..2417b13ba468 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt
+++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt
@@ -12,10 +12,7 @@ Required properties:
 - compatible: shall be one of:
 	"xlnx,vcu"
 	"xlnx,vcu-logicoreip-1.0"
-- reg, reg-names: There are two sets of registers need to provide.
-	1. vcu slcr
-	2. Logicore
-	reg-names should contain name for the each register sequence.
+- reg : The base offset and size of the VCU_PL_SLCR register space.
 - clocks: phandle for aclk and pll_ref clocksource
 - clock-names: The identification string, "aclk", is always required for
    the axi clock. "pll_ref" is required for pll.
@@ -23,9 +20,7 @@ Example:
 
 	xlnx_vcu: vcu@a0040000 {
 		compatible = "xlnx,vcu-logicoreip-1.0";
-		reg = <0x0 0xa0040000 0x0 0x1000>,
-			 <0x0 0xa0041000 0x0 0x1000>;
-		reg-names = "vcu_slcr", "logicore";
+		reg = <0x0 0xa0040000 0x0 0x1000>;
 		clocks = <&si570_1>, <&clkc 71>;
 		clock-names = "pll_ref", "aclk";
 	};
-- 
2.20.1

